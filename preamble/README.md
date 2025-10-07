# Preamble Files

This directory contains any files that are included in the preamble of
[main.tex](../main.tex). The functions of the different files are included in
the [file descriptions section](#file-descriptions).

## File Descriptions

- [authors.tex](./authors.tex) contains the command definitions that translate
  the initials, used in the `vhistory` table in
  [front_matter/document_revision.tex](../front_matter/document_revision.tex),
  into the full name listed in the authors section of the document. Without a
  definition for each set of initials here, the initials for the author will be
  displayed instead.
- [fancyhdr.tex](./fancyhdr.tex) contains the definitions for the header and
  footer of the document. There are example comments within the file to add a
  logo or other image in the top left or right of the document, although other
  modifications are trivial.
