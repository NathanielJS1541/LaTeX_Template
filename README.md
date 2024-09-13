# LaTeX_Template

Versatile and extensible LaTeX document template designed for both PDF rendering
and printing.

This repo can be used as a template for many different LaTeX documents, and has
the following features that can be customised:

- Revision history, using the `vhistory` package.
  - Automatically populates author name(s) and date field on the title page from
    the revision history table.
- Custom margins using the `geometry` package. This also defines the paper size.
- Additional language and regional grammar rule support using the `babel`
  package.
- Driver-independent colour support using the `xcolor` package.
- Hyperlink support and customisation using the `hyperref` package.
- Glossary generation for terminology and acronyms using the `glossaries-extra`
  package.
- Customisable caption formatting using the `caption` package.
- Customisable appendices using the `appendix` package.
- Specify `T1` font encoding for wider character support using the `fontenc`
  package.
- Input encoding specified as `utf8` using the `inputenc` package.
- Underline support using the `ulem` package.
- Access to the title, date and author(s)  throughout the document (even after
  calling `\maketitle`) using the `titling` package.
- Page number specified as "Page X of Y" using the `lastpage` package.
- Image support using the `graphicx` package.
- Support (and sensible default) for a customised header and footer for the main
  document pages using the `fancyhdr` package.
- `FiraSans` and `FiraMono` fonts used by default, or a commented out line to
  use `opensans` if preferred.
- Reference to the latest `git` commit using the
  [vc bundle](https://ctan.org/tex-archive/support/vc).
  - Placeholder `.tex` file automatically used for users not using the vc
    bundle.

Each of these configurations should be well-documented in the LaTeX files
themselves, and the uses for any separate files are detailed in the
[template structure section](#template-structure).

## Requirements

There are only a few requirements to use this template which I will list here.
As I mainly use Windows, I will include easy install steps using `scoop`, but
will link the project pages so you can figure it out on your own if you use
something else!

### TeX Distribution

It shouldn't come as a surprise that you need a `TeX` distribution to render
`LaTeX` documents... My preference is [MiKTeX](https://miktex.org/). This can be
installed easily using [scoop](https://scoop.sh/):

```pwsh
> scoop bucket add main
> scoop install main/miktex
```

If you aren't on Windows or don't use `scoop`, check your package manager or get
the binary from the [MiKTeX downloads page](https://miktex.org/download).

Pretty much any `TeX` distribution should work fine.

### Perl

The `glossaries-extra` package requires `perl` to run the `\makeglossaries`
command (which in turn calls the `makeglossaries` `perl` script).

This is trivial using [scoop](https://scoop.sh/) again on Windows:

```pwsh
> scoop bucket add main
> scoop install main/perl
```

Your favourite flavour of package manager should make installing
[perl](https://www.perl.org/) similarly easy, or alternatively you can see the
[perl downloads page](https://www.perl.org/get.html) for binary releases.

### Awk or Gawk

`awk` or `gawk` are required to process the output of `git log` in both the
[vc](./preamble/vc) and [vc.bat](./preamble/vc.bat) scripts from the
[vc bundle](https://ctan.org/tex-archive/support/vc).

`gawk` can be installed with [scoop](https://scoop.sh/):

```pwsh
> scoop bucket add main
> scoop install main/gawk
```

And either `awk` or `gawk` should be available from pretty much any package
manager on any system.

## Editor Config

In an attempt to make this template easy to use for everyone, I've added some
settings and extension recommendations for
[VSCode](https://code.visualstudio.com/). These can be found in the
[.vscode](.vscode/) folder.

The settings should be automatically used when opening the workspace in
[VSCode](https://code.visualstudio.com/), and the extensions should appear in
the "Recommended" section of the extensions tab (although you may have other
recommendations there too).

I'll briefly explain the settings and extensions in the next two sections, if
you're not interested you can skip to the
[git hooks](#git-hooks-for-the-vc-bundle) section.

### Recommended Extensions

- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
  provides LaTeX integration and tools in VSCode.
- [Markdown All In One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
  provides some powerful tools for editing markdown files in VSCode, such as a
  preview, table of contents and keyboard shortcuts.
- [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
  provides linting and style checking for markdown files.
- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)
  provides intellisense for paths (*wow... I'd never have guessed...*) in
  VSCode, which makes including files and images in LaTeX documents much easier.
- [Rewrap](https://marketplace.visualstudio.com/items?itemName=stkb.rewrap)
  enforces line length limits in `.tex` files (and more!) in VSCode.
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
  is a code formatter, and in this context is really only used for markdown
  files.
- [file-icons](https://marketplace.visualstudio.com/items?itemName=file-icons.file-icons)
  provides nicer file icons in the explorer tab of VSCode.
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
  provides basic spellchecking in VSCode, which is especially helpful when
  editing LaTeX documents.

## Workspace Settings

I have configured many of the workspace settings to my own liking. Change them
to suit your own needs if you disagree with my choices!

- Tool definitions for LaTeX Workshop. This defines the tools required to build
  the template document with the packages it uses. This is mostly the same as
  the defaults from LaTeX Workshop, but adds `vc` and `makeglossaries` to the
  available tools.  
  **Note: If you use a Unix-based system, you will need to update this tool to
  call `vc` instead of `vc.bat` (after making sure to `chmod +x vc`!)**
- Recipe definitions for LaTeX Workshop. This adds a basic recipe to render the
  document with all of the packages it uses, and a `vc` configuration to call
  the `vc.bat` file from the `vc bundle`.  
  **Note: This includes a call to `makeglossaries` which will cause an error if
  you decide to remove the glossary. If you do make sure to either replace this
  recipe with the default one, or just add the default above it.**
- Rewrap config. This enables automatic text wrapping at column 80 for the
  rewrap extension. This just helps keep the `.md` and `.tex` files readable in
  a single VSCode window with the preview open.
- An editor ruler at column 80, so any lines that exceed the above limit are
  more obvious. Some lines cannot be wrapped, and the ruler just helps highlight
  those lines.
- CSpell language configured to `en-GB` because that's what I speak... Change
  this to suit yourself!
- Custom dictionary entries for the name of every package used in the template,
  so that you're not flooded with warnings about the package names when
  referenced in comments.

## Git Hooks For the VC Bundle

`vc.bat` (or `vc` on Unix systems) needs to be run regularly to update the
`vc.tex` file that contains information about the latest `git` commit. An easy
way to accomplish this is to add a
[git hook](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) to run
`vc.bat` (or `vc`) for you. Specifically, a `post-commit` hook would work best.

I'm still working on a good `git hook` for this template, and will update this
section when I've finished.

If you're really desperate, you can make one fairly easily that just calls
`vc.bat` (or `vc`) after every commit. I'd prefer to make one that is only
called when one of the `.tex` files are updated, though...

## Template Structure

```bash
 LaTeX_Template                  # Repo root.
 ├─ LICENSE                      # MIT License for the template.
 ├─ README.md                    # Main template README (You are here!).
 ├─ main.pdf                     # Rendered .pdf of main.tex.
 ├─ main.tex                     # Main entry point for the .tex document.
 ├─ preamble                     # Folder for files used in the preamble.
 │  ├─ authors.tex               # Defines the document author's names/initials.
 │  ├─ fancyhdr.tex              # Defines the document header and footer.
 │  ├─ glossary.tex              # Glossary entries.
 │  ├─ vc                        # Bash script from the vc bundle.
 │  ├─ vc-git.awk                # .awk file to process vc script outputs.
 │  ├─ vc.bat                    # Batch script from the vc bundle.
 │  └─ vc_placeholder.tex        # Placeholder information for the vc bundle.
 ├─ front_matter                 # Front matter (i.e. title) for the document.
 │  ├─ document_revision.tex     # Document revision and vc history.
 │  └─ front_matter.tex          # Defines the front matter for the document.
 ├─ sections                     # The main sections of the document. *
 |  └─ 01_example_section.tex    # An example document section.
 └─ appendices.tex               # Appendix definitions.

 * If using a report or book instead of an article, consider renaming this to
   chapters.
```

### Subfolder Readmes

Each subfolder contains a README, giving a more detailed explanation of the
files within. These are linked here:

- [preamble](./preamble/README.md)
- [front_matter](./front_matter/README.md)
