# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit cmake-utils

DESCRIPTION="a portable Open Source library to import various well-known 3D model formats in an uniform manner."
HOMEPAGE="http://assimp.sourceforge.net"
SRC_URI="mirror://sourceforge/project/${PN}/${P}/${PN}--${PV}.863-sdk.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}--${PV}.863-sdk"
