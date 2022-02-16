# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit systemd

DESCRIPTION="Package to automically restart autossh."
HOMEPAGE="https://localhost/"
S="${WORKDIR}/${P}"
LICENSE="as-is"

SLOT="0"

KEYWORDS="amd64"

src_unpack() {
	mkdir -p "${S}/"
}

src_install() {
	default
	dodir /etc
	cp "${FILESDIR}/"chkrebootrc "${D}"/etc/chkrebootrc

	dobin "${FILESDIR}/"chk_reboot.sh
	systemd_dounit "${FILESDIR}"/chk_autossh_reboot.timer
	systemd_dounit "${FILESDIR}"/chk_reboot.service
}
