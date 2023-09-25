# Simple Makefile to build the manual from Git checkout without
# the need to bootstrap the build system.
#
# Copyright (C) 2023 Richard Stallman
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

SOURCES = c.texi cpp.texi fp.texi gpl.texi fdl.texi version.texi

c.info: $(SOURCES)
	makeinfo c.texi

c.pdf: c.dvi
	dvipdf $<

c.dvi: $(SOURCES)
	texi2dvi $<

c.doc: $(SOURCES)
	makeinfo --docbook $< -o $@
c.html: $(SOURCES)
	makeinfo --html --no-split $< -o $@
c.html.d: $(SOURCES)
	makeinfo --html $< -o $@
c.txt: $(SOURCES)
	makeinfo --plaintext $< > $@

clean:
	rm -f c.dvi c.pdf c.info c.info-* c.doc c.txt c.html
	rm -rf c.html.d
	rm -f c.aux c.cp c.fn c.ky c.log c.pg c.tmp c.toc c.tp c.vr
	rm -f c.cps c.fns
