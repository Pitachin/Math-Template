# Personal math template

Start with **template_My_Assignment.tex**. Edit the name, course, assignment title,
and due date at the top, then replace the three sample problem/solution pairs.
Student number and tutorial are optional: empty values hide those fields.

## Build and reuse

```sh
latexmk -pdf template_My_Assignment.tex
```

Open `template_My_Assignment.pdf` to see the result. In your editor, select the
main `.tex` file when building; `.log`, `.aux`, and `.fls` are generated files.

For another assignment, duplicate the main `.tex` file and rename it (for example,
`assignment-02.tex`). Keep **math-template.sty** and **letterfonts.tex** in the same folder, then run
`latexmk -pdf assignment-02.tex`. These three files are all the source files the new
template needs. The local `.latexmkrc` makes PDF output the default for latexmk.

The template uses US Letter paper and one-inch margins. Change `letterpaper` to
`a4paper` in the document class if needed. Colours and layout live in
`math-template.sty`.

## Problems, solutions, and references

The first argument is an optional title; the second is a unique reference key.
Keep both pairs of braces even when the title is empty.

```tex
\begin{problem}{Absolute values}{triangle}
Prove that $\abs{x+y}\leq\abs{x}+\abs{y}$ for all $x,y\in\R$.
\end{problem}

\begin{solution}
Since $-\abs{x}\leq x\leq\abs{x}$ and
$-\abs{y}\leq y\leq\abs{y}$, adding gives
\[
  -(\abs{x}+\abs{y})\leq x+y\leq\abs{x}+\abs{y}.
\]
Therefore $\abs{x+y}\leq\abs{x}+\abs{y}$.
\end{solution}

As shown in Problem~\ref{p:triangle}, ...
```

Copy a problem/solution pair to add more problems. Numbering is automatic.
Use `\newpage` before a problem to start it on a new page. Long problem boxes and
solutions can continue across pages. The original `\solve{...}` syntax also works.

## Math notation

Use these commands inside `$...$`, `\[...\]`, or an equation environment.

| Command | Meaning |
| --- | --- |
| `\N`, `\Z`, `\Q`, `\R`, `\C` | Standard number sets |
| `\abs{x}`, `\norm{x}` | Absolute value and norm |
| `\set{1,2,3}` | Set braces |
| `\inner{x,y}` | Inner product brackets |
| `\eps` | Epsilon |
| `\int_0^1 f(x)\dd x` | Integral with upright differential |
| `\dist`, `\Span`, `\rank` | Upright operator names |
| `\mathscr{F}` | Script lettering |

Use a star for automatic sizing, such as `\norm*{\frac{x}{2}}`.

```tex
\begin{align}
  (x+y)^2 &= x^2+2xy+y^2 \label{eq:square}\\
           &\geq 0.
\end{align}
See equation~\eqref{eq:square}.
```

## Theorems and lecture notes

You can change `\AssignmentTitle` to `Lecture Notes` and add sections. Theorem,
lemma, proposition, corollary, definition, and example share a numbering sequence.
Remarks and proofs are unnumbered. For notes, change `Due:` in the style's header
to `Date:` if preferred.

```tex
\section{Sequences}
\begin{theorem}[Uniqueness of limits]\label{thm:unique}
A convergent real sequence has a unique limit.
\end{theorem}
\begin{proof}
Suppose $a_n\to a$ and $a_n\to b$. Then
$\abs{a-b}\leq\abs{a-a_n}+\abs{a_n-b}\to0$, so $a=b$.
\end{proof}
```

## Files from the downloaded template

The old lecture-notes file (`analysis_class-note.tex`), `preamble.tex`,
`macros.tex`, and `letterfonts.tex` belong to the downloaded template. The personal
template now uses `math-template.sty`; it does not require the missing chapter
files or the old preamble/macros. `letterfonts.tex` is shared for shortcuts such as `\bbR`. Do not load the old preamble/macros
alongside the new style, because some command and environment names overlap.

The problem-box appearance was adapted from the supplied assignment template
by Soham Chatterjee.

## VS Code 编译（笔记和作业）

用 VS Code 打开整个 `NewTest` 文件夹，让 `.vscode/settings.json` 生效。
本项目统一使用 latexmk + pdfLaTeX，保存 `.tex` 时自动编译，PDF 和辅助文件放在主 `.tex` 文件所在目录。
保留辅助文件，方便增量编译、交叉引用和错误定位。

- 写作业：编辑 `template_My_Assignment.tex`，只加载 `math-template` 和 `letterfonts`。
- 记笔记：编辑 `lec.tex`；第一行的 `% !TEX root = analysis_class-note.tex` 指向笔记主文件。
- 编辑公共文件或需要明确指定目标：命令面板运行 `Tasks: Run Task`，选择“编译作业”或“编译笔记”。
- 查看 PDF：在相应主文件中运行 `LaTeX Workshop: View LaTeX PDF file`，显示主文件旁边的同名 PDF。
- 新作业：复制作业主文件并改名，打开新文件保存即可，不要加指向旧作业的 root 注释。
- 新笔记章节：在第一行添加上述 root 注释，并在笔记主文件中用 `\include{文件名}` 引入。

命令行也可以运行 `latexmk template_My_Assignment.tex` 或 `latexmk analysis_class-note.tex`。
如果 VS Code 尚未采用新配置，运行一次 `Developer: Reload Window`。
模板冲突已经修复；之后新写内容的括号、数学环境或命令错误仍需按日志修正。

## 题框编号 1(a)、1(b)、2

`math-template.sty` 提供 `subproblems` 分组。分组内每个 `problem` 自动编号为同一大题的 (a)、(b) 等，分组后的普通 `problem` 自动进入下一大题。解答可以放在各题框之后、分组之内。

```tex
\begin{subproblems}
\begin{problem}{}{p1a}
第一题 a。
\end{problem}
\begin{problem}{}{p1b}
第一题 b。
\end{problem}
\end{subproblems}

\begin{problem}{}{p2}
第二题。
\end{problem}
```

`\ref{p:p1a}` 会显示 `1(a)`；每道题的引用键必须不同。分组不能嵌套。

