# Math Template

Lecture notes use the original `preamble.tex`, `macros.tex`, and
`letterfonts.tex` setup. The entry point is **`notes.tex`** (plural).
Assignments use `assignment.tex` with `math-template.sty`.

[中文说明](docs/README.zh-CN.md) · [详细命令指南](USAGE.md)

[Note Template](../Math%20Template/blob/main/notes.pdf)

[Assignment Template](../Math%20Template/blob/main/assignment.pdf)

## Lecture notes

Keep these files together:

```text
notes.tex          Main document: title, contents, chapters, and sections
preamble.tex       Packages, layout, colored boxes, and box commands
macros.tex         Mathematical and solution shortcuts
letterfonts.tex    Letter shortcuts such as \bbR, \mcF, and \veps
.latexmkrc         pdfLaTeX / SyncTeX build configuration
```

The main file loads the dependencies in this order:

```tex
\documentclass[11pt,letterpaper,oneside]{report}
\input{preamble.tex}
\input{macros.tex}
\input{letterfonts.tex}
```

Use `report` or another chapter-capable class: the preamble defines chapter
counters and a chapter-based table of contents. Edit `\title`, `\author`,
`\date`, and PDF metadata in `\hypersetup` in `notes.tex`.

```tex
\chapter{Sequences}
\section{Convergence}
\dfn[convergence]{Convergence}{Write the definition here.}
\thm[unique-limit]{Uniqueness of limits}{Write the statement here.}
\begin{proof}
Write the proof here.
\end{proof}
See Theorem~\ref{th:unique-limit}.
```

The box syntax is `\command[key]{Title}{Body}`. The key is optional; both
brace arguments are required. Commands such as `\dfn`, `\thm`, `\lem`,
`\cor`, `\ex`, and `\rmk` number within sections, with separate counters.
Their `c` variants (`\dfnc`, `\thmc`, etc.) number within chapters.
See [USAGE.md](USAGE.md) for reference prefixes and mathematical shortcuts.

To split a document, put chapter content in a file such as `lecture-01.tex`,
add `% !TEX root = notes.tex` at its top, and use `\include{lecture-01}` in
`notes.tex`. The existing `lec.tex` contains personal lecture content; to use
it, replace the sample chapters with `\include{lec}` and update its root
comment from `analysis_class-note.tex` to your actual main filename.

## Build and preview

Install a TeX distribution containing `pdflatex` and `latexmk`, then run:

```sh
latexmk notes.tex
latexmk assignment.tex
```

PDFs and SyncTeX files are written beside their main source. In VS Code, open
this whole folder and install LaTeX Workshop. Save to build, or run
`Tasks: Run Task` → `Build lecture notes`. Use
`LaTeX Workshop: View LaTeX PDF file` to preview.

For a new notebook, copy `notes.tex` and keep all three dependencies beside it.
Build the new filename; the predefined task still targets `notes.tex`.
The included configuration uses pdfLaTeX for English content; Chinese document
text needs a separately configured CJK-capable setup.

## Assignments

Copy `assignment.tex`, edit its header fields, and use its `problem`,
`solution`, and `subproblems` environments. It loads `math-template.sty`.
Do not load that style into the lecture-note document: it defines overlapping
commands and environments with different syntax.

## Version control

The note dependencies belong in the repository. PDFs are currently tracked;
common compilation intermediates are ignored and kept locally for SyncTeX.
Inspect `git status` before committing. Existing tracked files remain tracked
even if later covered by an ignore rule.

Source and licensing notes: [ATTRIBUTION.md](ATTRIBUTION.md).
