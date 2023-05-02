## Atari ST system fonts

The package [`media-fonts/atari-st-system`][media-fonts/atari-st-system]
is available for [Gentoo Linux](https://www.gentoo.org/). The [BDF][bdf] files
were produced from original Atari FNT files using the [Gemini][gemini] `fnt`
tool, and include the complete [Atari ST character set][atari-st-charset] with
the [symbols for legacy computing][legacy-symbols] in [Unicode][unicode] 13.0.
The [X Window System][X] and some font tools unfortunately do not render Unicode
supplementary-[plane][plane] characters properly as of yet, however.
Nonunicode code points are mapped to the [private use area][private-use-area]
at `U+E000`.

The `Makefile` can produce [PCF][pcf] and [OpenType][opentype],
both bitmap (OTB) and scalable (OTF) variants. [XLFD][XLFD] font names and
aliases:

```
atari-st-system-6x6   "-atari-atari st system-medium-r-normal--6-60-72-72-C-60-ISO10646-1"
atari-st-system-8x8   "-atari-atari st system-medium-r-normal--8-80-72-72-C-80-ISO10646-1"
atari-st-system-8x16  "-atari-atari st system-medium-r-normal--16-160-72-72-C-80-ISO10646-1"
```

The Atari ST system fonts rendered as images:

![Atari ST system 6x6](https://raw.githubusercontent.com/frno7/font/main/atari/atari-st-system-6x6.png)

![Atari ST system 8x8](https://raw.githubusercontent.com/frno7/font/main/atari/atari-st-system-8x8.png)

![Atari ST system 8x16](https://raw.githubusercontent.com/frno7/font/main/atari/atari-st-system-8x16.png)

[media-fonts/atari-st-system]: https://github.com/frno7/gentoo.overlay/tree/master/media-fonts/atari-st-system
[bdf]: https://en.wikipedia.org/wiki/Glyph_Bitmap_Distribution_Format
[gemini]: https://github.com/frno7/gemini
[atari-st-charset]: https://en.wikipedia.org/wiki/Atari_ST_character_set
[legacy-symbols]: https://en.wikipedia.org/wiki/Symbols_for_Legacy_Computing
[unicode]: https://en.wikipedia.org/wiki/Unicode
[X]: https://en.wikipedia.org/wiki/X_Window_System
[plane]: https://en.wikipedia.org/wiki/Plane_(Unicode)
[private-use-area]: https://en.wikipedia.org/wiki/Private_Use_Areas
[pcf]: https://en.wikipedia.org/wiki/Portable_Compiled_Format
[opentype]: https://en.wikipedia.org/wiki/OpenType
[XLFD]: https://en.wikipedia.org/wiki/X_logical_font_description
