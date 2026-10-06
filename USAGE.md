# Math Template 使用指南 / User Guide

本指南适用于本文件夹中的 `assignment.tex`（数学作业）和 `notes.tex`（课堂笔记），两者共用 `math-template.sty`。

This guide covers `assignment.tex` for mathematics assignments and `notes.tex` for lecture notes. Both use the shared style file `math-template.sty`.

## 1. 准备环境 / Prerequisites

**中文：** 安装包含 `pdflatex` 和 `latexmk` 的 TeX 发行版，例如 MacTeX 或 TeX Live。在终端运行以下命令，确认两个程序都能找到。如果使用 VS Code，请直接打开 **Math Template 文件夹**，并安装项目推荐的 LaTeX Workshop 扩展，以使用文件夹内的编辑器配置。

**English:** Install a TeX distribution containing `pdflatex` and `latexmk`, such as MacTeX or TeX Live. Run these commands in a terminal to check that both programs are available. For VS Code, open the **Math Template folder itself** and install the recommended LaTeX Workshop extension to use the included editor settings.

```sh
pdflatex --version
latexmk -v
```

## 2. 新建文档 / Create a document

**中文：** 写作业时复制 `assignment.tex`，例如命名为 `assignment-02.tex`；记笔记时复制 `notes.tex`，例如命名为 `lecture-01.tex`。建议保留原示例，以便日后复用。以下命令均在 Math Template 文件夹内运行。

**English:** Copy `assignment.tex` to a filename such as `assignment-02.tex` for a new assignment, or copy `notes.tex` to `lecture-01.tex` for new notes. Keep the original examples for reuse. Run the commands below from the Math Template folder.

```sh
cp assignment.tex assignment-02.tex
latexmk assignment-02.tex
```

**中文：** 编译后打开同目录下的 `assignment-02.pdf`。如果把文档移到其他文件夹，请一并复制 `math-template.sty` 和 `.latexmkrc`；如需相同的 VS Code 配置，再复制 `.vscode/` 文件夹。新模板不依赖 `preamble.tex`、`macros.tex` 或 `letterfonts.tex`。

**English:** Open `assignment-02.pdf` in the same directory after compilation. If you move the document to another folder, also copy `math-template.sty` and `.latexmkrc`. Copy `.vscode/` as well if you want the same editor configuration. The new templates do not require `preamble.tex`, `macros.tex`, or `letterfonts.tex`.

## 3. 修改个人与课程信息 / Edit the document details

**中文：** 修改 `.tex` 文件顶部已有命令的花括号内容，不要重复添加同名的 `\newcommand`。学号和 tutorial 留空 `{}` 时不会显示。

**English:** Edit the values inside braces in the existing commands near the top of the `.tex` file. Do not add duplicate `\newcommand` definitions. Leave the student number or tutorial as `{}` to hide those fields.

```tex
\newcommand{\StudentName}{Your Name}
\newcommand{\CourseName}{MAT157 --- Analysis I}
\newcommand{\AssignmentTitle}{Assignment 2}
\newcommand{\DueDate}{October 22, 2026}
\newcommand{\StudentNumber}{}
\newcommand{\TutorialSection}{TUT0101}
```

**中文：** 保留 `\begin{document}` 后面的 `\makeassignmentheader`，它会生成标题和个人信息。笔记模板已通过下面这行把日期标签从 `Due` 改为 `Date`。

**English:** Keep `\makeassignmentheader` after `\begin{document}` to generate the title and student details. The notes template already uses the following line to change the date label from `Due` to `Date`.

```tex
\renewcommand{\DateLabel}{Date}
```

## 4. 添加题目和解答 / Add problems and solutions

**中文：** 在 `\makeassignmentheader` 和 `\end{document}` 之间替换示例题目。`problem` 后的两个参数分别是题目标题和唯一引用键，两个花括号都必须保留；不需要标题时写 `{}`。题号自动生成，解答末尾自动添加结束符号。

**English:** Replace the sample problems between `\makeassignmentheader` and `\end{document}`. The two arguments after `problem` are the title and a unique reference key. Both brace pairs are required; use `{}` for an empty title. Problems are numbered automatically, and solutions receive an automatic QED mark.

```tex
\begin{problem}{Triangle inequality}{triangle}
Show that $\abs{x+y}\leq\abs{x}+\abs{y}$ for $x,y\in\R$.
\end{problem}

\begin{solution}
Write your solution here.
\end{solution}

See Problem~\ref{p:triangle}.
```

**中文：** 引用题号时，在键名前加 `p:`，如 `\ref{p:triangle}`。每个题目使用不同的键名。如果解答以独立公式结束，可以在公式最后加 `\qedhere`，让结束符号出现在公式所在行。

**English:** Add `p:` before the key when referencing a problem, as in `\ref{p:triangle}`. Use a different key for each problem. If a solution ends with a displayed equation, add `\qedhere` at the end of the equation to place the QED mark on that line.

### 小题分组 / Grouped parts

**中文：** 用 `subproblems` 包住多组题目与解答，即可生成 `1(a)`、`1(b)` 等编号。如果前面已有第 1 题，该组会编号为 `2(a)`、`2(b)`，后面的普通题接着编号为 3。不要嵌套 `subproblems`。

**English:** Wrap several problem/solution pairs in `subproblems` to produce numbers such as `1(a)` and `1(b)`. If Problem 1 precedes the group, the parts become `2(a)` and `2(b)`, and the next ordinary problem is 3. Do not nest `subproblems` groups.

```tex
\begin{subproblems}
  \begin{problem}{First part}{part-a}
  Write the first question here.
  \end{problem}
  \begin{solution}
  Write the first solution here.
  \end{solution}

  \begin{problem}{Second part}{part-b}
  Write the second question here.
  \end{problem}
  \begin{solution}
  Write the second solution here.
  \end{solution}
\end{subproblems}
```

## 5. 写课堂笔记 / Write lecture notes

**中文：** 从 `notes.tex` 开始，用 `\section{...}` 和 `\subsection{...}` 组织内容。可用环境包括 `theorem`、`lemma`、`proposition`、`corollary`、`definition`、`example`、`remark` 和 `proof`。前六种环境共享一个贯穿全文的编号序列；`remark` 和 `proof` 不编号。

**English:** Start from `notes.tex` and organize content with `\section{...}` and `\subsection{...}`. Available environments are `theorem`, `lemma`, `proposition`, `corollary`, `definition`, `example`, `remark`, and `proof`. The first six share a single numbering sequence throughout the document; remarks and proofs are unnumbered.

```tex
\section{Sequences}

\begin{theorem}[Uniqueness of limits]\label{thm:unique}
A convergent real sequence has a unique limit.
\end{theorem}

\begin{proof}
Write your proof here.
\end{proof}

\begin{remark}
Theorem~\ref{thm:unique} allows us to speak of the limit.
\end{remark}
```

## 6. 常用数学命令 / Common mathematical commands

**中文：** 以下命令用于数学模式，例如 `$...$`（行内公式）或 `\[...\]`（独立公式）。

**English:** Use these commands in math mode, such as `$...$` for inline mathematics or `\[...\]` for displayed equations.

| 命令 / Command | 含义 / Meaning |
| --- | --- |
| `\N`, `\Z`, `\Q`, `\R`, `\C` | 自然数、整数、有理数、实数、复数 / Number sets |
| `\abs{x}` | 绝对值 / Absolute value |
| `\norm{x}` | 范数 / Norm |
| `\set{1,2,3}` | 集合花括号 / Set braces |
| `\inner{x,y}` | 内积 / Inner product |
| `\norm*{\frac{x}{2}}` | 自动调整括号大小 / Automatically sized delimiters |
| `\eps` | Epsilon 符号 / Epsilon symbol |
| `\dd` | 直立微分符号，例如 `\int_0^1 x\dd x` / Upright differential |
| `\dist`, `\Span`, `\rank` | 距离、线性张成、秩 / Mathematical operators |

## 7. 编译与预览 / Build and preview

**中文：** 在模板目录中运行以下命令编译原示例；编译新文档时把文件名换成自己的。项目的 `.latexmkrc` 使用 pdfLaTeX，并启用 SyncTeX。`latexmk` 会根据需要重复编译，以更新交叉引用。

**English:** Run these commands in the template folder to build the original examples, or substitute your own filename. The included `.latexmkrc` uses pdfLaTeX with SyncTeX enabled. `latexmk` repeats compilation as needed to update cross-references.

```sh
latexmk assignment.tex
latexmk notes.tex
```

**中文：** 在使用本项目配置的 VS Code 中，保存 `.tex` 文件会触发编译。打开命令面板，运行 `LaTeX Workshop: View LaTeX PDF file` 查看 PDF。`Tasks: Run Task` 中的 `Build assignment` 和 `Build lecture notes` 分别编译原始的两个示例文件；它们不会自动改为你新建的文件。

**English:** With this project's VS Code settings, saving a `.tex` file triggers a build. Open the command palette and run `LaTeX Workshop: View LaTeX PDF file` to view the PDF. Under `Tasks: Run Task`, `Build assignment` and `Build lecture notes` build the two original example files; they do not automatically target your new document.

**中文：** 可在 LaTeX 文件中输入 `mtproblem`、`mtsol`、`mtthm`、`mtdef` 或 `mtproof`，从补全列表插入对应代码片段。SyncTeX 支持 PDF 与源码之间的定位。辅助文件在编辑器文件列表中被隐藏，但仍保留在磁盘上；无需每次编译后删除。

**English:** In a LaTeX file, type `mtproblem`, `mtsol`, `mtthm`, `mtdef`, or `mtproof` and select the corresponding snippet from the completion list. SyncTeX supports navigation between the PDF and source. Auxiliary files are hidden in the editor's file list but remain on disk; there is no need to delete them after every build.

## 8. 调整样式 / Customize the appearance

| 修改目标 / Setting | 修改位置 / Where to edit |
| --- | --- |
| 纸张 / Paper size | 将主文件首行的 `letterpaper` 改为 `a4paper` / Replace `letterpaper` with `a4paper` in the main file |
| 字号 / Font size | 修改 `\documentclass[11pt,letterpaper]{article}` 中的 `11pt` / Change `11pt` in the document class options |
| 页边距 / Margins | 修改 `math-template.sty` 中 `geometry` 的 `margin=1in` / Edit the `geometry` margin option |
| 颜色 / Colors | 修改 `math-template.sty` 中的 `MathBlue`、`MathTint`、`MathMuted` / Edit these color definitions |

**中文：** 修改共享的 `.sty` 文件会影响所有使用该文件的文档，重新编译后生效。

**English:** Changes to the shared `.sty` file affect every document using it when rebuilt.

## 9. 常见问题 / Troubleshooting

| 问题 / Problem | 处理方法 / What to do |
| --- | --- |
| 找不到 `latexmk` 或 `pdflatex` / Command not found | 确认 TeX 已安装且其程序目录在 `PATH` 中，随后重启编辑器 / Check the TeX installation and `PATH`, then restart the editor |
| 找不到 `math-template.sty` / Style file not found | 将它放在主 `.tex` 文件所在目录 / Place it beside the main `.tex` file |
| 缺少宏包 / Missing package | 根据日志提示，用 TeX 发行版的包管理器安装缺少的宏包 / Install the package named in the log using your TeX distribution's package manager |
| 引用显示 `??` / Unresolved reference | 检查键名和 `p:` 前缀，再运行 `latexmk`；有编译错误时先修复第一个错误 / Check the key and `p:` prefix, rebuild with `latexmk`, and fix the first compilation error if present |
| PDF 未更新 / PDF did not update | 确认编译的是当前文件，并检查该文件的 `.log` / Check that you built the intended file and inspect its `.log` |
| PDF 与源码无法跳转 / PDF–source navigation fails | 重新编译以生成 `.synctex.gz`，并保留该文件 / Rebuild to regenerate `.synctex.gz` and keep it on disk |

**中文：** 本指南为中英双语，但当前模板的正文配置面向英文和 pdfLaTeX。直接粘贴中文正文可能无法编译；中文排版需要另外配置支持 CJK 的编译器、宏包和字体，并同步调整 `.latexmkrc` 及编辑器编译配置。

**English:** This guide is bilingual, but the current document setup targets English text and pdfLaTeX. Pasting Chinese text into the document may fail to compile. Chinese typesetting requires a CJK-capable compiler, packages, and fonts, with matching changes to `.latexmkrc` and the editor's build configuration.

## 10. 相关文件 / Related files

- [assignment.tex](assignment.tex)：完整作业示例 / Complete assignment example.
- [notes.tex](notes.tex)：完整课堂笔记示例 / Complete lecture-notes example.
- [README.md](README.md)：英文项目介绍 / English project overview.
- [docs/README.zh-CN.md](docs/README.zh-CN.md)：中文项目说明 / Chinese project overview.
- [ATTRIBUTION.md](ATTRIBUTION.md)：来源与许可说明 / Attribution and licensing notes.
