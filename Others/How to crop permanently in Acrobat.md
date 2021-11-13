# [How to crop permanently in Acrobat](https://superuser.com/questions/127568/how-to-crop-permanently-in-acrobat)

You can use PdfCpu:

```
pdfcpu crop '0 0 .5 0' in.pdf out.pdf
```

https://pdfcpu.io/core/crop.html

Or if you must use Acrobat:

You can do this with a *Preflight fixup*. It is annoying to set up, but pretty easy to use after that.

1. Tools Print Production Preflight Select single fixups Options Create New Preflight Fixup
2. Name `Permanent crop`
3. Fixup category `Pages`
4. Type of fixup `Set page geometry boxes`
5. Source `MediaBox`
6. Destination `Relative to TrimBox` (meaning "use the dimensions of the TrimBox").
7. OK
8. Fix

