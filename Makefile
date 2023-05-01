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

ATARI := atari/atari-st-system-6x6.fnt					\
	 atari/atari-st-system-8x8.fnt					\
	 atari/atari-st-system-8x16.fnt

.PHONY: atari
atari: atari_otb atari_otf atari_pcf

.PHONY: atari_otb atari_otf atari_pcf
atari_otb: $(ATARI:%.fnt=%.otb)
atari_otf: $(ATARI:%.fnt=%.otf)
atari_pcf: $(ATARI:%.fnt=%.pcf.gz)

LUCIR :=lucir/lucir-6x11-medium.bdf					\
	lucir/lucir-6x11-bold.bdf

.PHONY: lucir
lucir:	$(LUCIR:%.bdf=%.otf)						\
	$(LUCIR:%.bdf=%.otb)						\
	$(LUCIR:%.bdf=%.pcf.gz)

.PHONY: clean
clean:
	$(QUIET_RM)$(RM) -f */*.pcf */*.pcf.gz */*.otb atari/*.otf */*.sfd

GZIP := gzip
BDFTOPCF := bdftopcf
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
QUIET_BDFTOOTB = $(Q:@=@echo    '  BDFTOOTB '$@;)
QUIET_BDFTOSFD = $(Q:@=@echo    '  BDFTOSFD '$@;)
QUIET_SFDTOOTF = $(Q:@=@echo    '  SFDTOOTF '$@;)
