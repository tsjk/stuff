# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: media-sound/deadbeef-infobar/deadbeef-infobar-1.3.ebuild,v 1 2012/08/31 00:59:00 megabaks Exp $

EAPI=5

inherit git-2 eutils flag-o-matic

DESCRIPTION="Ogg Opus decoder plugin for DeaDBeeF audio player."
HOMEPAGE="https://bitbucket.org/Lithopsian/deadbeef-opus/overview"
EGIT_REPO_URI="https://bitbucket.org/Lithopsian/deadbeef-opus.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND_COMMON="
	media-sound/deadbeef
	media-libs/opusfile[float,http]
	media-libs/libogg"

RDEPEND="${DEPEND_COMMON}"
DEPEND="${DEPEND_COMMON}"

S="${WORKDIR}/opus-${PV}"

QA_PRESTRIPPED="usr/$(get_libdir)/deadbeef/opus.so"

src_prepare(){
	sed \
		-e 's|-I/usr/local/include/opus||'\
		-e 's|$(CC) $(LDFLAGS) $(OBJECTS) -o $@|$(CC) $(OBJECTS) $(LDFLAGS) -o $@|'\
		-i Makefile

	if use x86;then
		append-cflags -D_FILE_OFFSET_BITS=64
	fi
}

src_install() {
	insinto /usr/$(get_libdir)/deadbeef
	doins opus.so
}
