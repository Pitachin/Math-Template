# Math Template

A LaTeX starter for mathematics assignments and lecture notes: blue problem
boxes, readable proofs, automatic numbering, and a shared style.

[中文使用说明](docs/README.zh-CN.md)

## Features

- Assignment header with optional student number and tutorial fields.
- Breakable problem boxes and grouped parts such as 2(a), 2(b).
- Solutions and proofs with QED marks; theorem, lemma, proposition, corollary,
  definition, example, and remark environments.
- Common notation for number sets, norms, absolute values, and inner products.
- VS Code build tasks, snippets, and PDF/source navigation through SyncTeX.
- Portable `latexmk` commands without machine-specific paths.

## Quick start

Install a TeX distribution containing **pdfLaTeX** and **latexmk**, such as
TeX Live or MacTeX. Both executables must be on your `PATH`. A minimal installation
may need extra packages; see the dependencies in `math-template.sty`.

From this folder, run:

```sh
latexmk assignment.tex
latexmk notes.tex
```

Open `assignment.pdf` or `notes.pdf` beside the sources. The local `.latexmkrc`
selects pdfLaTeX and enables SyncTeX. Latexmk repeats compilation as needed to
resolve references.

## Make it yours

Copy `assignment.tex` to a new filename in the same folder, edit the fields at
the top, and replace the sample problems:

```tex
\newcommand{\StudentName}{Your Name}
\newcommand{\CourseName}{MATH 101}
\newcommand{\AssignmentTitle}{Assignment 2}
\newcommand{\DueDate}{October 22, 2026}
\newcommand{\StudentNumber}{}    % Empty = hidden
\newcommand{\TutorialSection}{} % Empty = hidden
```

Build with `latexmk your-filename.tex`. To use the copy in another folder, take
`math-template.sty` and `.latexmkrc` with it. Neither example requires the older
lecture templates or `letterfonts.tex`.

The default is US Letter paper, 11-point text, and one-inch margins. Change
`letterpaper` to `a4paper` for A4. Colours live in the style file as `MathBlue`,
`MathTint`, and `MathMuted`.

## Problems and solutions

```tex
\begin{problem}{Triangle inequality}{triangle}
Show that $\abs{x+y}\leq\abs{x}+\abs{y}$ for $x,y\in\R$.
\end{problem}
\begin{solution}
Write your argument here.
\end{solution}
See Problem~\ref{p:triangle}.
```

Both brace arguments are required. Use `{}` for an empty title and a unique
reference key for every problem. Wrap several problem/solution pairs in
`\begin{subproblems} ... \end{subproblems}` for lettered parts sharing a number.
Do not nest these groups. The next ordinary problem resumes main numbering.
See `assignment.tex` for a complete example.

## Lecture notes

Start with `notes.tex`. It changes the header's `Due` label to `Date` using
`\renewcommand{\DateLabel}{Date}`.

```tex
\begin{theorem}[Uniqueness of limits]\label{thm:unique}
A convergent real sequence has a unique limit.
\end{theorem}
\begin{proof}
Write your proof here.
\end{proof}
```

Numbered theorem environments share one counter throughout the document.
Remarks and proofs are unnumbered.

| Command | Meaning |
| --- | --- |
| `\N`, `\Z`, `\Q`, `\R`, `\C` | Number sets |
| `\abs{x}`, `\norm{x}` | Absolute value, norm |
| `\set{1,2,3}`, `\inner{x,y}` | Set braces, inner product |
| `\norm*{\frac{x}{2}}` | Automatically sized delimiters |
| `\eps`, `\dd` | Epsilon, upright differential |
| `\dist`, `\Span`, `\rank` | Mathematical operators |

## VS Code

Open this repository **as a folder** and install the recommended **LaTeX
Workshop** extension. Save a main `.tex` file to build it. Run
`LaTeX Workshop: View LaTeX PDF file` from the command palette to view the result.
`Tasks: Run Task` also offers builds for the two examples.

SyncTeX remains enabled. Its files and common auxiliary files are hidden in the
Explorer and ignored by Git, but stay on disk for navigation and incremental
builds. Automatic cleanup is disabled. Rebuild if you manually delete SyncTeX.

Snippet prefixes: `mtproblem`, `mtsol`, `mtthm`, `mtdef`, and `mtproof`.

## Repository contents

```text
assignment.tex        Sample assignment with worked solutions
notes.tex             Sample lecture notes
math-template.sty     Shared layout, environments, and notation
.latexmkrc            Build configuration
.vscode/              Settings, build tasks, and snippets
README.md             English guide
docs/README.zh-CN.md  Chinese guide
ATTRIBUTION.md        Source credit and licensing status
```

PDFs and auxiliary files are generated locally and ignored by Git. Existing
personal coursework and legacy sources in the original working directory are
also explicitly ignored; they are not needed to build the examples.

## Troubleshooting

- **Command not found:** check `latexmk -v` and `pdflatex --version`, put the TeX
  binary directory on `PATH`, and restart VS Code.
- **Missing package:** install the named package with your TeX package manager.
  Dependencies include `tcolorbox`, `fancyhdr`, `mathtools`, `microtype`, `lmodern`,
  and `hyperref`; the style file lists all required packages.
- **Undefined references:** run `latexmk` and fix the first compilation error.
- **Chinese document text:** the examples target English text with pdfLaTeX.
  Chinese typesetting requires a CJK-capable setup, such as XeLaTeX with `ctex`,
  and corresponding compiler and font changes.

## Credits

The inherited problem-box implementation credits a supplied assignment template
by **Soham Chatterjee**. See [ATTRIBUTION.md](ATTRIBUTION.md) for provenance and
licensing status.
