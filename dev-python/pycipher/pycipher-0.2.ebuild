# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pycipher/pycipher-0.2.ebuild,v 1.1 2009/02/03 19:55:22 patrick Exp $

inherit python

DESCRIPTION="A Python module that implements several well-known classical
cipher algorithms"
HOMEPAGE="http://pycipher.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.py"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

src_install() {
	insinto $(python_get_sitedir)
	newins "${DISTDIR}/${P}.py" ${PN}.py
}

pkg_postinst() {
	python_mod_optimize $(python_get_sitedir)/${PN}.py
}

pkg_postrm() {
	python_mod_cleanup
}
