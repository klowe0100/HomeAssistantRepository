# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="Library to control webOS based LG TV devices."
HOMEPAGE="https://github.com/bendavid/aiopylgtv https://pypi.org/project/aiopylgtv/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.md"

RDEPEND=">=dev-python/websockets-8.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.17.0[${PYTHON_USEDEP}]
	dev-python/sqlitedict[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}