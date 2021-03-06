# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="An API rate limit decorator for Python"
SRC_URI="https://github.com/tomasbasham/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/tomasbasham/ratelimit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DEPEND="
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"

src_prepare() {
	default
	# remove --cov args injection
	rm pytest.ini || die
}

python_test() {
	pytest || die
}
