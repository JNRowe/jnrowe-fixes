# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/git/git-4.3.20.ebuild,v 1.16 2009/04/10 04:44:46 darkside Exp $

EAPI="2"

DESCRIPTION="GNU Interactive Tools - increase speed and efficiency of most daily tasks"
HOMEPAGE="http://www.gnu.org/software/gnuit/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3 FDL-1.3"
SLOT="0"
KEYWORDS="x86 amd64 ppc sparc"
IUSE=""

# app-text/texi2html is only needed if any documentation patches are added
# dev-util/git[gtk] installs the gitview tool which collides with this
# package.
DEPEND="!dev-util/git[gtk]"
RDEPEND="${DEPEND}"

src_configure() {
	# The transition option controls whether a "git" wrapper is installed, it is
	# disabled explicitly so we don't need to block on dev-util/git.
	econf --disable-transition || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" htmldir="/usr/share/doc/${PF}/html" install \
		|| die "emake install failed"
	dodoc AUTHORS NEWS PROBLEMS README
}

pkg_postinst() {
	einfo "The 'git' tool this package previously installed is now called 'gitfm'"
	einfo "If you want the 'gitaction' tool to use your preferred desktop"
	einfo "application settings install the 'x11-misc/xdg-utils' package."
}
