# Front Matter Files

This directory contains any files used to define or generate the front matter of
[main.tex](../main.tex). The front matter includes the title, abstract, revision
history, and table of contents. The functions of the different files are
included in the [file descriptions section](#file-descriptions).

## File Descriptions

- [document_revision.tex](./document_revision.tex) contains the revision history
  table.
  - The revision history table defines the authors of the document and the
    contents of the date field. Both of these are displayed as part of the title
    page in [front_matter.tex](./front_matter.tex). To display the author's full
    names, they should be included in [authors.tex](../preamble/authors.tex).
- [front_matter.tex](./front_matter.tex) contains the definitions all of the
  front matter displayed before the main document contents.
  - The title page is generated first.
  - The abstract is displayed directly beneath the title.
  - The [document_revision.tex](./document_revision.tex) is displayed underneath
    the abstract.
  - The table of contents is generated on a new page.
