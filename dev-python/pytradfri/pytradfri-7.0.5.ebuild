# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="IKEA Tradfri/Tradfri API. Control and observe your lights from Python."
HOMEPAGE="https://github.com/ggravlingen/pytradfri https://pypi.org/project/pytradfri/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="~dev-python/aiocoap-0.4_beta3[${PYTHON_USEDEP}]
	~dev-python/dtlssocket-0.1.11[${PYTHON_USEDEP}]"

DOCS="README.md"

DEPEND="${DEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
	  dev-python/nose[${PYTHON_USEDEP}]
	  dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/coveralls[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		~dev-python/black-20.8_beta1[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
