@echo off
REM This is file 'vc.bat' from the vc bundle for TeX.
REM The original file can be found at CTAN:support/vc.
REM This file is Public Domain.

setlocal
REM Parse command line options.
set full=0
set mod=0
:loopParams
if "%1" NEQ "" (
  REM Note the parameter expansion by using %~1 instead of %1. When run from the
  REM LaTeX Workshop recipe in VSCode, this is required as the flags end up with
  REM a set of quotation marks around them.
  if "%~1"=="-f" (set full=1) else if "%~1"=="-m" (set mod=1) else (
    echo usage: vc [-f] [-m]
    exit /b 1
  )
  shift
  goto loopParams
)
REM English locale.
set LC_ALL=C
git --no-pager log -1 HEAD --pretty=format:"Hash: %%H%%nAbrHash: %%h%%nParentHashes: %%P%%nAbrParentHashes: %%p%%nAuthorName: %%an%%nAuthorEmail: %%ae%%nAuthorDate: %%ai%%nCommitterName: %%cn%%nCommitterEmail: %%ce%%nCommitterDate: %%ci%%n" | gawk -v script=log -v full=%full% -f .\preamble\vc-git.awk > .\preamble\vc.tex
if "%mod%"=="1" (
  git status --porcelain=v1 | gawk -v script=status -f .\preamble\vc-git.awk >> .\preamble\vc.tex
)
