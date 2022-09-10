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
	makeinfo --docbook c.texi -o $@
c.html: c.texi cpp.texi fp.texi fdl.texi
	makeinfo --html c.texi -o $@
c.txt: c.texi cpp.texi fp.texi fdl.texi
	makeinfo --plaintext c.texi > $@

clean:
	rm -f c-manual.tgz c.dvi c.pdf c c-* c.doc c.txt
	rm -rf c.html
	rm -f c.aux c.cp c.fn c.ky c.log c.pg c.tmp c.toc c.tp c.vr
	rm -f c.cps c.fns
