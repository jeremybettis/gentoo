# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit netsurf

DESCRIPTION="C library for decoding BMP and ICO images"
HOMEPAGE="http://www.netsurf-browser.org/projects/"
SRC_URI="https://download.netsurf-browser.org/libs/releases/${P}-src.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
IUSE=""

BDEPEND="
	dev-build/netsurf-buildsystem
	virtual/pkgconfig"

_emake() {
	netsurf_define_makeconf
	emake "${NETSURF_MAKECONF[@]}" COMPONENT_TYPE=lib-shared $@
}

src_compile() {
	_emake
}

src_install() {
	_emake DESTDIR="${D}" install
}
