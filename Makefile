.DEFAULT_GOAL := all
.PHONY: all docbook epub html init pdf clean

all : pdf epub docbook html

docbook :
		asciidoctor -a toc -b docbook --doctype book ./themodularbook.adoc -D ./output

epub : docbook
		a2x --verbose -f epub -d book ./output/themodularbook.xml -D ./output

html : init
		asciidoctor -a toc -a copycss --doctype book ./themodularbook.adoc -D ./output

init :
		mkdir -p output

pdf : docbook
		a2x --verbose -f pdf -d book ./output/themodularbook.xml -D ./output

clean : 
		rm -rf output