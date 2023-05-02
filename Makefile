# SPDX-License-Identifier: GPL-2.0
#
# Define V=1 for more verbose compilation.

.PHONY: all
all: atari lucir

.SECONDARY:	# Retain secondary targets
.SUFFIXES:	# Omit default suffixes

%.pcf.gz : %.pcf
	$(QUIET_GZIP)$(GZIP) -9f $^

%.pcf : %.bdf
	$(QUIET_BDFTOPCF)$(BDFTOPCF) -o $@ $^

%.otf : %.sfd
	$(QUIET_BDFTOOTF)$(SFDTOOTF) $^ $@

%.otb : %.bdf
	$(QUIET_BDFTOOTB)$(BDFTOOTB) $^ $@

%.sfd : %.bdf
	$(QUIET_BDFTOSFD)$(BDFTOSFD) $^ $@

ifeq (1,$(HAVE_FNT))
%.bdf : %.fnt
	$(QUIET_FNTTOBDF)$(FNTTOBDF) $^ $@ tool/bdf-font-atari-st-system

.PHONY: atari_bdf
atari_bdf: $(ATARI:%.fnt=%.bdf)
endif

%.png : %.bdf
	$(QUIET_BDFTOPNG)$(BDFTOPNG) $^ $@

ATARI := atari/atari-st-system-6x6.fnt					\
	 atari/atari-st-system-8x8.fnt					\
	 atari/atari-st-system-8x16.fnt

.PHONY: atari
atari: atari_png atari_otb atari_otf atari_pcf

.PHONY: atari_png atari_otb atari_otf atari_pcf
atari_png: $(ATARI:%.fnt=%.png)
atari_otb: $(ATARI:%.fnt=%.otb)
atari_otf: $(ATARI:%.fnt=%.otf)
atari_pcf: $(ATARI:%.fnt=%.pcf.gz)

LUCIR :=lucir/lucir-6x11-medium.bdf					\
	lucir/lucir-6x11-bold.bdf

.PHONY: lucir
lucir: lucir_png lucir_otb lucir_otf lucir_pcf

.PHONY: lucir_png lucir_otb lucir_otf lucir_pcf
lucir_png: $(LUCIR:%.bdf=%.png)
lucir_otb: $(LUCIR:%.bdf=%.otb)
lucir_otf: $(LUCIR:%.bdf=%.otf)
lucir_pcf: $(LUCIR:%.bdf=%.pcf.gz)

.PHONY: clean
clean:
	$(QUIET_RM)$(RM) -f */*.pcf */*.pcf.gz */*.otb */*.otf */*.png */*.sfd

GZIP := gzip
BDFTOPCF := bdftopcf
BDFTOPNG := tool/bdf-to-png
BDFTOSFD := tool/bdf-to-sfd
BDFTOOTB := tool/bdf-to-otb
SFDTOOTF := tool/sfd-to-otf
FNTTOBDF := tool/fnt-to-bdf

V              = @
Q              = $(V:1=)
QUIET_RM       = $(Q:@=@echo    '  RM       '$@;)
QUIET_GZIP     = $(Q:@=@echo    '  GZIP     '$@;)
QUIET_FNTTOBDF = $(Q:@=@echo    '  FNTTOBDF '$@;)
QUIET_BDFTOPCF = $(Q:@=@echo    '  BDFTOPCF '$@;)
QUIET_BDFTOPNG = $(Q:@=@echo    '  BDFTOPNG '$@;)
QUIET_BDFTOOTB = $(Q:@=@echo    '  BDFTOOTB '$@;)
QUIET_BDFTOSFD = $(Q:@=@echo    '  BDFTOSFD '$@;)
QUIET_SFDTOOTF = $(Q:@=@echo    '  SFDTOOTF '$@;)
