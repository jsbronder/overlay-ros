# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# @ECLASS: ros.eclass
# @MAINTAINER:
# Justin Bronder <jsbronder@gentoo.org>
# @BLURB: Handle common bits of building ROS stacks.
# @DESCRIPTION:
# This eclass is basically a wrapper around the rosbuild utility.  It sets
# up a restricted ros build environment then builds a ROS stack.  Once the
# stack has been built, the eclass will fix the embedded RPATHS and wrap the
# install to the correct location in /opt.

SRC_URI="https://code.ros.org/svn/release/download/stacks/${PN}/${P}/${P}.tar.bz2"
S="${WORKDIR}"/build
RDEPEND="app-admin/chrpath"
ROS_S="${S}"/${PN}

# @ECLASS-VARIABLE: ROS_DESTDIR
# @DESCRIPTION:
# Destination directory within ros distribution.  There should never be a reason
# to modify this unless the ebuild is not building a stack (i.e. ros itself).
ROS_DESTDIR=${ROS_DESTDIR:-stacks/${PN}}

# @ECLASS-VARIABLE: ROS_NEED_STACKS
# @DESCRIPTION:
# Does this stack need to be able to access all of the other ROS stacks?  Set
# to zero if not.
ROS_NEED_STACKS=${ROS_NEED_STACKS:-1}

# @FUNCTION: ros_get_dist
# @RETURN: Echos the name of the current ROS distribution.
ros_get_dist() {
	# This is just the slot for now, but it's wrapped as a function incase we
	# cannot use SLOT in the future.
	echo ${SLOT}
}

# @ECLASS-VARIABLE: ROS_ROOT
# @DESCRIPTION:
# Root location of the ROS install.
ROS_DIST_ROOT=/opt/ros/$(ros_get_dist)


# @FUNCTION: ros_fix_rpath
# @USAGE: <file to fix> [Final ROS destination] 
# @DESCRIPTION:
# Fix RPATHs on the given file if any exist.  Replaces each path in the RPATH
# with the output of ros_rpath_fix_function, if any.  Passes both arguments
# to ros_rpath_fix_function unmodified.  By default $2 is as ${ROOT}/${ROS_ROOT}
ros_fix_rpath() {
	local f=${1}
	local ros_root=${2:-${ROOT}${ROS_ROOT}}
	local oIFS
	local rpath
	local rpathlen
	local rpath_new

	chrpath -l ${f} &> /dev/null || return

	rpath=$(chrpath -l ${f})
	rpath=${rpath##*RPATH=}
	rpathlen=${#rpath}

	oIFS=${IFS}
	IFS=":"
	for comp in ${rpath}; do
		if [ -z "${comp}" ]; then
			# Yes this happens, rosplay for instance.
			continue
		fi

		tmp=$(ros_rpath_fix_function ${comp} ${ros_root})
		#TODO:  Only add rpath if it's unique.
		if [ -n "${tmp}" ]; then
			rpath_new=${rpath_new}:${tmp}
		else
			rpath_new=${rpath_new}:${comp}
		fi

	done
	IFS=${oIFS}

	# Remove leading ':'
	rpath_new=${rpath_new:1}

	if [ ${#rpath_new} -gt ${rpathlen} ]; then
		eerror "New rpath longer than original."
		eerror "original: ${rpath}"
		eerror "new: ${rpath_new}"
		die "Cannot fix rpaths"
	fi
	einfo "Fixing rpath on ${f#${S}}"
	chrpath -r ${rpath_new} ${f} || die "Failed to change rpath on ${f}"
}

# @FUNCTION: ros_rpath_fix_function
# @USAGE: <file to fix> <Final ROS destination>
# @DESCRIPTION:
# Parses the given rpath and prints what it should be replaced with.
ros_rpath_fix_function() {
	ros_default_rpath_fix_function $*
}

# @FUNCTION: ros_default_rpath_fix_function
# @USAGE: <file to fix> <Final ROS destination>
# @DESCRIPTION:
# Default rpath fix function.  Removes ${S} and ${WORKDIR} from any path.
ros_default_rpath_fix_function() {
	local comp=${1}
	local ros_root=${2}

	if [ -z "${comp##${S}*}" ]; then
		echo "${ros_root}/${ROS_DESTDIR}/${comp##${ROS_S}/}"
	elif [ -z "${comp##${WORKDIR}/stacks*}" ]; then
		echo "${ros_root}/${comp##${WORKDIR}}"
	fi
}


# @FUNCTION: ros_pkg_setup
# @DESCRIPTION:
# Sets up the environment so that rosbuild will function.
ros_pkg_setup() {
	rosdir=${ROOT}/${ROS_DIST_ROOT}
	export ROS_HOME="${WORKDIR}"/roshome
	export ROS_ROOT=${rosdir}/ros
	export ROS_PACKAGE_PATH="${WORKDIR}"/stacks:"${S}"
	export PATH=${ROS_ROOT}/bin:${PATH}
	export PYTHONPATH=${ROS_ROOT}/core/roslib/src:${PYTHONPATH}
	export ROS_MASTER_URI=${ROS_MASTER_URI:-http://localhost:11311}
	export VERBOSE=1

	# This is nice to have around for debugging.
	cat <<-EOF > ${T}/setup.sh
		rosdir=${ROOT}/${ROS_DISTROOT}
		export ROS_HOME="${WORKDIR}"/roshome
		export ROS_ROOT=${rosdir}/ros
		export ROS_PACKAGE_PATH="${WORKDIR}"/stacks:"${S}"
		export PATH=${ROS_ROOT}/bin:${PATH}
		export PYTHONPATH=${ROS_ROOT}/core/roslib/src:${PYTHONPATH}
		export ROS_MASTER_URI=${ROS_MASTER_URI:-http://localhost:11311}
		export VERBOSE=1
	EOF
}


# @FUNCTION: ros_src_unpack
# @DESCRIPTION:
# Unpacks and moves source to ${ROS_S}.  Also sets up the ros stack symlinks.
# See _ros_make_stack_links()
ros_src_unpack() {
	unpack ${A}
	mkdir -p "${S}" || die
	mv "${WORKDIR}"/${P} "${ROS_S}" || die
	_ros_make_stack_links
}

# @FUNCTION: _ros_make_stack_links
# @DESCRIPTION:
# Creates symlinks to all the stacks that are currently installed on the system
# excluding the stack currently being built.  The symlinks are installed in
# ${WORKDIR}/stacks and the ROS environment will only look for stacks there.
# This forces the current stack to rebuild if it was already installed.
_ros_make_stack_links() {
	local s
	[ ${ROS_NEED_STACKS} -eq 0 ] && return

	mkdir -p "${WORKDIR}"/stacks
	for s in ${ROOT}/${ROS_DIST_ROOT}/stacks/*; do
		[ ! -d "${s}" ] && continue
		[ "$(basename ${s})" == "${PN}" ] && continue
		ln -s "${s}" "${WORKDIR}"/stacks || die
	done
}


# @FUNCTION: _ros_rm_stack_links
# @DESCRIPTION:
# Remove symlinks created by _ros_make_stack_links()
_ros_rm_stack_links() {
	local s
	[ ${ROS_NEED_STACKS} -eq 0 ] && return

	for s in "${WORKDIR}"/stacks/*; do
		[ -h "${s}" ] && rm "${s}"
	done
	rmdir "${WORKDIR}"/stacks || die
}


# @FUNCTION: ros_src_compile
# @DESCRIPTION:
# Wraps calling rosmake.
ros_src_compile() {
	cd "${ROS_S}"
	rosmake \
		--mark-installed \
		--no-rosdep \
		--status-rate=0 \
		${PN} || die
}


# @FUNCTION: ros_default_cleanup_function
# @DESCRIPTION:
# Removes all build directories and cpp files.
ros_default_cleanup_function() {
	local f

	for f in $(find "${ROS_S}" -type d -name 'build'); do
		rm -rf "${f}"
	done

	find "${ROS_S}" -type f -name '*.cpp' -delete
}

# @FUNCTION: ros_cleanup_function
# @DESCRIPTION:
# Called by ros_src_install to cleanup build files before installation.
ros_cleanup_function() {
	ros_default_cleanup_function
}


# @FUNCTION: ros_src_install
# @DESCRIPTION:
# Cleans up the build files.  Fixes rpaths and pkg-config files.  Then
# installs ${ROS_S}.
ros_src_install() {
	local f
	local canon_path="$(readlink -m ${ROOT}/${ROS_DIST_ROOT})"

	_ros_rm_stack_links

	ros_cleanup_function

	find "${ROS_S}" -type f \
		-name 'generated' -exec chmod 0600 {} \;

	for f in $(find "${ROS_S}" -type f -executable); do
		ros_fix_rpath "${f}" "${canon_path}"
	done

	find "${ROS_S}" -type f -name '*.pc' \
		-exec sed -i "s|${S}|${canon_path}/stacks|" {} \;

	dodir ${ROS_DIST_ROOT}/${ROS_DESTDIR}
	cp -pPR "${ROS_S}"/* "${D}"/${ROS_DIST_ROOT}/${ROS_DESTDIR} || die
}

# @FUNCTION: ros_add_pkg_patches
# @USAGE: <ros package name> <patch1> [patch2] ...
# @DESCRIPTION:
# Copies patches to ${ROS_S}/$1/gentoo-patches.  Here as a wrapper because
# this is commonly necessary as many ROS packages are actually downloaded
# during the rosmake phase and then patched.  Note that the package Makefile
# must be modified by the ebuild to look for these patches.
ros_add_pkg_patches() {
	local tname=${1}
	local targ="${ROS_S}"/${tname}/gentoo-patches

	mkdir -p "${targ}"
	shift
	while [ ${#} -gt 0 ]; do
		einfo "Adding patch ${1%.patch} for ${tname}"
		cp "${FILESDIR}"/${1} "${targ}" || die
		shift
	done
}

EXPORT_FUNCTIONS pkg_setup src_unpack src_compile src_install
