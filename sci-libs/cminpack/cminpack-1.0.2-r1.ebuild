# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

DESCRIPTION="C Implementation of the Levenberg-Marquardt algorithm"
HOMEPAGE="http://devernay.free.fr/hacks/cminpack/cminpack.html"
SRC_URI="http://devernay.free.fr/hacks/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/makefile-allow-setting-of-vars-from-environment.patch
	epatch "${FILESDIR}"/makefile-create-dirs-before-installing-files.patch
	epatch "${FILESDIR}"/makefile-install-man-pages.patch
	epatch "${FILESDIR}"/rename-library-to-match-package-name.patch
	epatch "${FILESDIR}"/create-and-install-a-shared-library.patch
	epatch "${FILESDIR}"/cleanup-install-target.patch
	epatch "${FILESDIR}"/makefile-respect-ldflags.patch
}

src_compile() {
	emake PREFIX=/usr
}

src_install() {
	emake PREFIX=/usr DESTDIR="${D}" install
	dodir /usr/$(get_libdir)/pkgconfig
	cat <<-EOF > "${D}"/usr/$(get_libdir)/pkgconfig/${PN}.pc
		Name: CMINPACK
		Description: CMinPack
		Version: ${PV}
		Requires:
		Libs: -lcminpack
		Cflags:
	EOF
}
