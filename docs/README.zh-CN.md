# Math Template 中文说明

课堂笔记的主文件是 **`notes.tex`**，依次加载：

```tex
\input{preamble.tex}
\input{macros.tex}
\input{letterfonts.tex}
```

`preamble.tex` 提供原有彩色定理框、目录和版式；`macros.tex` 提供数学宏；
`letterfonts.tex` 提供 `\bbR`、`\mcF`、`\veps` 等快捷命令。
主文件使用支持 `\chapter` 的 `report` 类。

## 开始记笔记

1. 安装含 pdfLaTeX 和 latexmk 的 TeX 发行版。
2. 在 VS Code 中打开整个项目文件夹，安装 LaTeX Workshop。
3. 打开 `notes.tex`，修改标题、姓名、日期和 PDF 元信息。
4. 在 `\chapter`、`\section` 下替换示例内容。
5. 运行 `latexmk notes.tex`，或使用任务 `Build lecture notes`。

```tex
\dfn[sequence]{Sequence}{A sequence is a function on $\bbN$.}
\thm[unique-limit]{Uniqueness}{A convergent real sequence has one limit.}
\begin{proof}
Write the proof here.
\end{proof}
See Theorem~\ref{th:unique-limit}.
```

框命令格式是 `\命令[唯一键]{标题}{正文}`。`\dfn`、`\thm`、`\lem`、
`\cor`、`\ex`、`\rmk` 按节编号；对应带 `c` 的命令按章编号。
各类框分别计数。完整命令、引用前缀、数学宏和章节拆分方法见
[使用指南](../USAGE.md)。

## 文件与编译

复制笔记到其他文件夹时，一并复制三个 `.tex` 依赖和 `.latexmkrc`。
PDF 和 SyncTeX 在主文件旁边生成。子文件的 `% !TEX root = notes.tex`
应指向实际主文件。现有 `lec.tex` 若接入，需要更新其旧 root 注释。

`assignment.tex` 是独立的作业模板，使用 `math-template.sty`，通过
`latexmk assignment.tex` 编译。不要把作业样式加载到笔记中。

当前编译配置面向英文正文；中文正文需要额外的 CJK 配置。
三个笔记依赖已纳入版本控制。当前仓库也跟踪 PDF；编译辅助文件由 Git 忽略。
提交前用 `git status` 检查文件。来源说明见 [ATTRIBUTION.md](../ATTRIBUTION.md)。
