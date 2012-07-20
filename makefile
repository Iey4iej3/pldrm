all: pldrm.pdf pldrm
clean:
	rm pldrm pldrm.aux pldrm.cc pldrm.dvi pldrm.log pldrm.out pldrm.pdf pldrm.ps pldrm.tex
clear:
	rm pldrm pldrm.aux pldrm.dvi pldrm.log pldrm.out pldrm.ps pldrm.tex
pldrm.cc: pldrm.nw
	notangle -Rpldrm.cc pldrm.nw > pldrm.cc
pldrm: pldrm.cc
pldrm.tex: pldrm.nw
	noweave -delay -x pldrm.nw > pldrm.tex
pldrm.dvi: pldrm.tex
	latex -interaction=batchmode pldrm.tex
	latex -interaction=batchmode pldrm.tex
pldrm.ps: pldrm.dvi
	dvips pldrm.dvi
pldrm.pdf: pldrm.ps
	ps2pdf pldrm.ps
