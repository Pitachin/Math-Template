# 笔记模板使用指南

笔记主文件是 **`notes.tex`**（当前仓库的文件名带 s）。它加载
`preamble.tex`、`macros.tex`、`letterfonts.tex`。实际宏文件名是
`macros.tex`，不是 `macro.tex`。作业入口 `assignment.tex` 使用另一套样式。

[笔记模版参考](./notes.pdf)

[作业模版参考](./assignment.pdf)

## 1. 主文件和依赖

```tex
\documentclass[11pt,letterpaper,oneside]{report}
\input{preamble.tex}
\input{macros.tex}
\input{letterfonts.tex}

\title{Analysis --- Lecture Notes}
\author{Your Name}
\date{\today}
\hypersetup{pdftitle={Analysis --- Lecture Notes},pdfauthor={Your Name}}

\begin{document}
\maketitle
\tableofcontents
\clearpage
\chapter{Sequences}
\section{Convergence}
% 在这里写笔记。
\end{document}
```

- `preamble.tex`：宏包、页边距、颜色、目录、定义和定理等彩色框。
- `macros.tex`：范数记号、偏导数、矩阵、解答等快捷命令。
- `letterfonts.tex`：黑板体、花体等字母以及希腊字母快捷命令。

按示例顺序加载即可。`preamble.tex` 用到了 `chapter` 计数器和目录，
因此主文件使用 `report`，不要改为不支持章的 `article`。
不要同时加载 `math-template.sty`，否则会与笔记的命令和环境重名。

修改标题、姓名、日期时，直接编辑主文件的 `\title`、`\author`、
`\date`；同时更新 `\hypersetup` 的 PDF 标题和作者。

## 2. 定义、定理、例子与证明

统一写法：

```tex
\命令[唯一键名]{标题}{正文}
```

方括号中的键名用于引用，可以省略。标题为空时写 `{}`，正文的花括号也必须保留。

```tex
\dfn[convergence]{Convergence}{
A sequence $(a_n)$ converges to $L\in\bbR$ if, for every $\veps>0$,
there exists $N\in\bbN$ such that $n\geq N$ implies $|a_n-L|<\veps$.
}

\thm[unique-limit]{Uniqueness of limits}{
A convergent real sequence has exactly one limit.
}
\begin{proof}
Write the proof here.
\end{proof}

\ex[reciprocal]{Example}{The sequence $1/n$ converges to zero.}
\rmk[notation]{}{We may therefore speak of the limit.}

See Definition~\ref{def:convergence} and Theorem~\ref{th:unique-limit}.
```

| 内容 | 按 section 编号 | 按 chapter 编号 | 引用写法 |
| --- | --- | --- | --- |
| 定义 | `\dfn[key]{标题}{正文}` | `\dfnc[key]{标题}{正文}` | `\ref{def:key}` |
| 定理 | `\thm[key]{标题}{正文}` | `\thmc[key]{标题}{正文}` | `\ref{th:key}` |
| 引理 | `\lem[key]{标题}{正文}` | `\lemc[key]{标题}{正文}` | `\ref{lem:key}` |
| 推论 | `\cor[key]{标题}{正文}` | `\corc[key]{标题}{正文}` | `\ref{th:key}` |
| 例子 | `\ex[key]{标题}{正文}` | `\exc[key]{标题}{正文}` | `\ref{ex:key}` |
| 备注 | `\rmk[key]{标题}{正文}` | `\rmkc[key]{标题}{正文}` | `\ref{rmk:key}` |
| 开放问题 | `\opn[key]{标题}{正文}` | `\opnc[key]{标题}{正文}` | `\ref{def:key}` |

普通命令在每个 section 内编号；带 `c` 的对应命令在每个 chapter 内编号。
各环境有各自的计数器，不共享一个连续编号序列；两套命令的计数器也独立。
例如第一章第一节的第一个 `\thm` 为 1.1.1，第一个 `\thmc` 为 1.1。

前缀来自现有 `preamble.tex`：推论也用 `th:`，开放问题也用 `def:`。
请给每个框使用不同键名，尤其不要在共用前缀的框之间重复键名。
证明用 `proof` 环境，末尾自动显示方块；独立公式末尾可用 `\qedhere`。

其他框：

```tex
\clm[claim-key]{Claim}{Statement.}
\wc[wrong-key]{Wrong concept}{Explain the mistake.}
\nt{A short note.}
\qs[exercise-key]{Exercise}{State the question.}
\begin{solution}
Write the solution here.
\end{solution}
```

`\clm` 按 section 编号，引用前缀为 `th:`；`\wc` 按 chapter 编号，
前缀为 `def:`；`\qs` 全文编号，前缀也是 `def:`。`\nt` 无编号。
`solution` 是笔记的解答框；也可使用 `macros.tex` 中的 `\solve{正文}`
生成带 Solution 标题和结束方块的普通解答。

## 3. 字母和数学宏

以下命令在 `$...$` 或 `\[...\]` 中使用。

| 命令 | 含义 |
| --- | --- |
| `\bbN`, `\bbZ`, `\bbQ`, `\bbR`, `\bbC` | 黑板体数集 |
| `\mcF`, `\mcA` | 花体字母 |
| `\veps`, `\vph`, `\lm` | epsilon、phi、lambda 的快捷写法 |
| `\bs{x}` | 粗体数学符号 |
| `\del{f}{x}` | 一阶偏导数 |
| `\deld{f}{x}` | 展示样式的一阶偏导数 |
| `\mat{a & b \\ c & d}` | 方括号矩阵 |
| `\norm` | 固定的范数记号 `\|\cdot\|` |
| `\inorm` | 固定的无穷范数记号 `\|\cdot\|_\infty` |

注意：这里的 `\norm` **不接收参数**。写某个向量的范数时使用
`\lVert x\rVert` 或 `\left\lVert x\right\rVert`。
绝对值写 `|x|` 或 `\left|x\right|`，集合写 `\{x,y\}`。
作业样式里的 `\abs{x}`、`\norm{x}`、`\R`、`\eps` 不适用于这份笔记的接口。

```tex
\[
  A=\mat{1 & 0 \\ 0 & 1},\qquad
  x\in\bbR,\qquad \del{f}{x}=2x.
\]
```

## 4. 拆分课堂内容

小份笔记可直接写在 `notes.tex` 的 `\chapter`、`\section` 后。
内容较多时，新建 `lecture-01.tex`：

```tex
% !TEX root = notes.tex
\chapter{Sequences}
\section{Convergence}
\dfn[sequence]{Sequence}{A sequence is a function on $\bbN$.}
```

然后在主文件正文中用以下内容替换示例章节：

```tex
\include{lecture-01}
% \include{lecture-02}
```

子文件不放 `\documentclass`、依赖加载和 `\begin{document}`。
`\include` 会另起一页；若想连续排版，可以用 `\input{lecture-01.tex}`。

仓库已有 `lec.tex` 是你的课堂内容。如果要把它接入当前主文件，使用
`\include{lec}`，并把它第一行的旧 root `analysis_class-note.tex`
改为 `notes.tex`。当前示例主文件没有自动纳入这份课堂内容。

新建独立笔记可复制 `notes.tex`。若命名为 `note.tex`，编译命令和
子文件的 root 注释也应改成 `note.tex`。移到其他目录时，必须一起复制
`preamble.tex`、`macros.tex`、`letterfonts.tex` 和 `.latexmkrc`。

## 5. 编译和 VS Code

安装包含 pdfLaTeX 与 latexmk 的 TeX 发行版，在项目目录运行：

```sh
latexmk notes.tex
```

生成 `notes.pdf` 和 `notes.synctex.gz`。latexmk 会按需重复编译目录和引用。
在 VS Code 中打开整个项目文件夹，安装 LaTeX Workshop：

1. 编辑主文件或带正确 root 注释的章节文件，保存时自动编译。
2. `Tasks: Run Task` → `Build lecture notes` 固定编译 `notes.tex`。
3. `LaTeX Workshop: View LaTeX PDF file` 查看 PDF。
4. 笔记代码片段用 `mdef`、`mthm`、`mlem`、`mcor`、`mex`、`mrmk`、
   `mproof`、`mnote`；`mdefc`、`mthmc` 等为按章编号版本。

辅助文件保留在磁盘上，VS Code 隐藏常用辅助文件；SyncTeX 用于 PDF/源码跳转。
当前编译配置适用于英文正文。中文正文需要另配 CJK 宏包、字体和编译器。

## 6. 常见错误

| 问题 | 检查方法 |
| --- | --- |
| 找不到 `preamble.tex` 等文件 | 把三个依赖文件放到主文件旁边 |
| `No counter 'chapter' defined` | 主文件使用 `report` 或支持章的类 |
| `Command ... already defined` | 检查是否重复加载依赖或混入 `math-template.sty` |
| `\R`、`\abs` 等未定义 | 使用笔记的 `\bbR`、`|x|` 等实际接口 |
| 引用出现 `??` | 检查表中的前缀、唯一键名，修复编译错误后重跑 latexmk |
| 编译了错误文件 | 检查子文件的 root 注释和任务的目标文件名 |
| 宏包缺失 | 根据日志中第一个错误安装相应 TeX 宏包 |

## 7. 作业模板

`assignment.tex` 单独加载 `math-template.sty`，保留原有作业用法：

```tex
\begin{problem}{Title}{unique-key}
Write the question here.
\end{problem}
\begin{solution}
Write the solution here.
\end{solution}
```

题号引用用 `\ref{p:unique-key}`。`subproblems` 包住多个题目与解答后生成
1(a)、1(b) 等小题编号。作业的个人信息通过顶部已有的
`\StudentName`、`\CourseName`、`\AssignmentTitle`、`\DueDate` 等命令修改。
编译用 `latexmk assignment.tex`。

笔记的颜色、页边距和框样式在 `preamble.tex` 修改；数学宏在 `macros.tex`
修改；字母快捷命令在 `letterfonts.tex` 修改。作业的样式在 `math-template.sty` 修改。
