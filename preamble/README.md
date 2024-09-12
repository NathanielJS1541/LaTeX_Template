# Preamble Files

This folder contains any files that are included in the preamble of
[main.tex](../main.tex). The functions of the different files are included in
the [file descriptions section](#file-descriptions).

## Tree Structure

```bash
 preamble
 ├─ authors.tex
 ├─ fancyhdr.tex
 ├─ glossary.tex
 ├─ vc
 ├─ vc-git.awk
 ├─ vc.bat
 ├─ vc.tex
 └─ vc_placeholder.tex
```

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
- [glossary.tex](./glossary.tex) contains all the terminology and acronym
  definitions for the `glossaries-extra` package. It also re-defines some
  commands used by `glossaries-extra` when making links for the glossary, so
  they appear bold and underlined rather than coloured. This is just to allow
  the document to be easier to read when printed, and can be commented out if
  desired.
- [vc](./vc) is a bash script from the
  [vc bundle](https://ctan.org/tex-archive/support/vc), that is used to update
  the [vc.tex](./vc.tex) file with the latest `git` commit information on
  Unix-based systems.
- [vc-git.awk](./vc-git.awk) contains an `awk` script which is used to parse the
  output of `git log` into the `vc.tex` file. This is also taken from the
  [vc bundle](https://ctan.org/tex-archive/support/vc).
- [vc.bat](./vc.bat) is a batch script from the
  [vc bundle](https://ctan.org/tex-archive/support/vc) that is used to update
  the [vc.tex](./vc.tex) file with the latest `git` commit information on
  Windows systems.
- [vc.tex](./vc.tex) contains the information of the latest `git` commit in the
  current repo, which is used in
  [front_matter/document_revision.tex](../front_matter/document_revision.tex).  
  **Note: This will not be present until you have run either `vc` or `vc.bat`.
  It is ignored by `git` since it should only be needed locally.**
- [vc_placeholder.tex](./vc_placeholder.tex) is a placeholder for the
  [vc.tex](./vc.tex) file, to ensure that the document can always be rendered
  even before `vc` or `vc.bat` are run.
