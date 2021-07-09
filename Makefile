# SPDX-License-Identifier: GPL-2.0
#
# Define V=1 for more verbose compilation.

.PHONY: all
all: lucir

%.pcf.gz : %.pcf
	$(QUIET_GZIP)$(GZIP) -9f $^

%.pcf : %.bdf
	$(QUIET_BDFTOPCF)$(BDFTOPCF) -o $@ $^

%.otf : %.bdf
	$(QUIET_BDFTOOTF)$(BDFTOOTF) $^ $@

.PHONY: lucir
lucir:	lucir/lucir-6x11-medium.pcf.gz					\
	lucir/lucir-6x11-bold.pcf.gz					\
	lucir/lucir-6x11-medium.otf					\
	lucir/lucir-6x11-bold.otf

.PHONY: clean
clean:
	$(QUIET_RM)$(RM) -f */*.pcf */*.pcf.gz */*.otf

GZIP := gzip
BDFTOPCF := bdftopcf
BDFTOOTF := tool/bdf-to-otf

V              = @
Q              = $(V:1=)
QUIET_RM       = $(Q:@=@echo    '  RM       '$@;)
QUIET_GZIP     = $(Q:@=@echo    '  GZIP     '$@;)
QUIET_BDFTOPCF = $(Q:@=@echo    '  BDFTOPCF '$@;)
QUIET_BDFTOOTF = $(Q:@=@echo    '  BDFTOOTF '$@;)
