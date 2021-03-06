# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: media-sound/deadbeef-fb/deadbeef-fb-9999.ebuild,v 1 2013/14/11 00:15:35 megabaks Exp $

EAPI=5

inherit eutils git-2

DESCRIPTION="Bookmark Manager plugin for DeaDBeeF audio player"
HOMEPAGE="https://github.com/cboxdoerfer/ddb_bookmark_manager"
EGIT_REPO_URI="https://github.com/cboxdoerfer/ddb_bookmark_manager.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND_COMMON="media-sound/deadbeef"

RDEPEND="${DEPEND_COMMON}"
DEPEND="${DEPEND_COMMON}"

src_install() {
	insinto /usr/$(get_libdir)/deadbeef
	doins ddb_misc_bookmark_manager.so
}
