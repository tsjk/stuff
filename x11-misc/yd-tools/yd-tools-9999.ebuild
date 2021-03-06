# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: bar-overlay/x11-misk/yd-tools/yd-tools-9999.ebuild,v 1.1 2015/04/03 12:01:00 brothermechanic Exp $

EAPI=5

inherit git-2

DESCRIPTION="Panel indicator for YandexDisk CLI client for Linux"
HOMEPAGE="https://github.com/slytomcat/yandex-disk-indicator"
EGIT_REPO_URI="https://github.com/slytomcat/yandex-disk-indicator.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="net-misc/yandex-disk"
DEPEND="${RDEPEND}"

#S="${WORKDIR}"/CLD-Icons

src_install() {
	insinto /opt/yd-tools
	doins -r fm-actions icons Yandex.Disk-indicator.desktop Yandex.Disk.desktop ya-setup
	exeinto /opt/yd-tools
	doexe yandexDiskIndicator.py
	dobin build/yd-tools/usr/bin/yandex-disk-indicator
	insinto /usr/share/applications
	doins build/yd-tools/usr/share/applications/*
	insinto /usr/share/glib-2.0/schemas/
	doins apps.yandex-disk-indicator.gschema.xml
	insinto /usr/share/locale/ru/LC_MESSAGES/
	yandex-disk-indicator.mo
}
