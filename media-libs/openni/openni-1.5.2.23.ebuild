# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
inherit eutils java-pkg-2 vcs-snapshot

DESCRIPTION="Library for natural interaction devices (kinect)"
HOMEPAGE="http://www.openni.org/"
SRC_URI="https://github.com/OpenNI/OpenNI/tarball/Stable-${PV} -> ${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="doc"
SLOT="0"

CDEPEND="virtual/libusb:1
	dev-libs/tinyxml[stl]
	media-libs/freeglut
	virtual/jpeg"

DEPEND="${CDEPEND}
	>=virtual/jdk-1.6"

RDEPEND="${CDEPEND}
	>=virtual/jre-1.6"

src_prepare() {
	sed -i \
		"s,^\(\tjavac \),\1$(java-pkg_javac-args) ," \
		"${S}"/Platform/Linux/Build/Common/CommonJavaMakefile || die

	sed -i \
		's,\(CFLAGS += -O.*\),\1 -DTIXML_USE_STL,' \
		"${S}"/Platform/Linux/Build/Common/CommonCppMakefile || die

	# Taken from https://github.com/jspricke/debian-openni
	epatch "${FILESDIR}"/0002-Add-SONAME-to-libraries.patch
	epatch "${FILESDIR}"/0007-Use-system-wide-libjpeg.patch
	epatch "${FILESDIR}"/0008-Use-system-wide-tinyxml.patch
}

src_compile() {
	cd "${S}"/Platform/Linux/Build || die
	emake core || die
}

src_install() {
	local d

	cd "${S}"/Platform/Linux/Bin/*-Release || die
	dobin niLicense niReg
	dolib libOpenNI.so{,.0} \
		libnimCodecs.so{,.0} \
		libnimMockNodes.so{,.0} \
		libnimRecorder.so{,.0}
	java-pkg_dojar org.OpenNI.jar

	cd "${S}" || die
	dodir /usr/include/ni
	insinto /usr/include/ni
	doins $(find Include -maxdepth 1 -type f)

	for d in Linux-x86 Linux-Arm; do
		insinto /usr/include/ni
		doins -r Include/${d}
	done

	dodir /var/lib/ni
	cat <<-EOF > "${D}"/var/lib/ni/modules.xml
	<Modules>
		<Module path="/usr/$(get_libdir)/libnimMockNodes.so.0"/>
		<Module path="/usr/$(get_libdir)/libnimCodecs.so.0"/>
		<Module path="/usr/$(get_libdir)/libnimRecorder.so.0"/>
	</Modules>
	EOF

	doenvd "${FILESDIR}"/25openni
}
