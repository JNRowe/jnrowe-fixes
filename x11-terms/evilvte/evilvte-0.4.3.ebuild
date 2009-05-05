# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-terms/evilvte/evilvte-0.4.3.ebuild,v 1.4 2008/11/27 22:04:44 armin76 Exp $

inherit savedconfig toolchain-funcs

DESCRIPTION="VTE based, super lightweight terminal emulator"
HOMEPAGE="http://www.calno.com/evilvte"
SRC_URI="http://www.calno.com/${PN}/${P}.tar.gz"

LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="x11-libs/vte
	>=x11-libs/gtk+-2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_unpack() {
	unpack ${A}
	cd "${S}"

	if [[ -f /etc/${PN}/config.h ]]; then
		cp /etc/${PN}/config.h src/ || die "copying config.h failed."
	else
		restore_config src/config.h
	fi
}

src_compile() {
	./configure --prefix=/usr || die "./configure failed."
	emake OPTFLAGS="${CFLAGS}" CC="$(tc-getCC)" || die "emake failed."
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc Changelog
	save_config src/config.h
}

pkg_postinst() {
	# Thanks busybox!
	echo
	einfo "This ebuild has support for user defined configs"
	einfo "Please read this ebuild for more details and re-emerge as needed"
	einfo "if you want to add or remove functionality for ${PN}"
	echo
	if [[ -f "${ROOT}"/etc/${PN}/config.h ]]; then
		rm "${ROOT}"/etc/${PN}/config.h
		rmdir "${ROOT}"/etc/${PN}
	fi
}
