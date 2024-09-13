# Document Sections

To make larger documents easier to edit and maintain, it is generally a good
practice to split the document contents into separate files for each section,
and include them all in a [main.tex](../main.tex) file. This folder contains all
of the individual document sections, which are included in
[main.tex](../main.tex).

For an most document classes, splitting it into separate sections is a sensible
choice. However, for longer document classes such as a `report` or `book`, it
would be better to split the document into its chapters. In this case, simply
rename this folder to chapters to keep it easy to follow.

## Tree Structure

```bash
 sections
 └─ 01_example_section.tex
```

## File Descriptions

- [01_example_section.tex](./01_example_section.tex) is an example section
  containing some glossary references.
