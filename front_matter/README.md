# Front Matter Files

This folder contains any files used to define or generate the front matter of
[main.tex](../main.tex). The front matter includes the title, version history,
latest git commit, table of contents, and glossaries. The functions of the
different files are included in the
[file descriptions section](#file-descriptions).

## Tree Structure

```bash
 front_matter
 ├─ document_revision.tex
 └─ front_matter.tex
```

## File Descriptions

- [document_revision.tex](./document_revision.tex) contains both the version
  history table, and a table containing information about the latest `git`
  commit.
  - The version history table defines the authors of the document and the
    contents of the date field. Both of these are displayed as part of the title
    page in [front_matter.tex](./front_matter.tex). To display the author's full
    names, they should be included in [authors.tex](../preamble/authors.tex).
  - The table containing the latest git commit requires
    [vc.bat](../preamble/vc.bat) or [vc](../preamble/vc) to be run at regular
    intervals. Before these scripts are run for the first time, the information
    will all be shown as "N/A".
- [front_matter.tex](./front_matter.tex) contains the definitions all of the
  front matter displayed before the main document contents.
  - The title page is generated first.
  - The [document_revision.tex](./document_revision.tex) is displayed underneath
    the title, including the latest `git` commit information.
  - The table of contents is generated on a new page.
  - The glossaries are generated on a new page.
