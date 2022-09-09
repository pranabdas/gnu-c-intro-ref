c-manual.tgz: c.texi cpp.texi fp.texi fdl.texi
	mkdir c-manual
	ln Makefile c.texi cpp.texi fp.texi fdl.texi c-manual
	tar czf c-manual.tgz c-manual
	rm -rf c-manual

c.info: c.texi cpp.texi fp.texi fdl.texi
	makeinfo c.texi

c.pdf: c.dvi
	dvipdf c.dvi

c.dvi: c.texi cpp.texi fp.texi fdl.texi
	texi2dvi c.texi

c.doc: c.texi cpp.texi fp.texi fdl.texi
	makeinfo --docbook c.texi
c.html: c.texi cpp.texi fp.texi fdl.texi
	makeinfo --html c.texi
c.txt: c.texi cpp.texi fp.texi fdl.texi
	makeinfo --plaintext c.texi > $@

clean:
	rm -f c-manual.tgz c.dvi c.pdf c c-1 c-2 c.doc c.html c.txt
	rm -f c.aux c.cp c.fn c.ky c.log c.pg c.tmp c.toc c.tp c.vr
