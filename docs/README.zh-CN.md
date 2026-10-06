# Math Template 使用说明

用于数学作业和课堂笔记的 LaTeX 模板。题框、证明、定理和常用符号由
`math-template.sty` 统一管理。

## 开始使用

1. 安装带有 `pdflatex` 和 `latexmk` 的 TeX 发行版，确保终端能找到这两个命令。
2. 在 VS Code 中打开整个项目文件夹，安装推荐的 LaTeX Workshop 扩展。
3. 写作业打开 `assignment.tex`；记笔记打开 `notes.tex`。
4. 修改顶部的姓名、课程、标题和日期。学号、tutorial 留空时不会显示。
5. 保存即可编译，通过命令面板的 `LaTeX Workshop: View LaTeX PDF file` 查看 PDF。

也可以在项目目录运行：

```sh
latexmk assignment.tex
latexmk notes.tex
```

生成的 PDF 位于源文件旁边。新作业可以复制 `assignment.tex` 后改名，
同目录保留 `math-template.sty` 和 `.latexmkrc` 即可。

## 添加题目

```tex
\begin{problem}{Title}{unique-key}
Write the question here.
\end{problem}
\begin{solution}
Write the solution here.
\end{solution}
```

第一个参数是标题，可以留空；第二个参数是唯一引用键。
用 `\ref{p:unique-key}` 引用题号。将多组题目和解答放入
`subproblems` 环境可生成 1(a)、1(b) 编号；不要嵌套分组。

常用符号包括 `\R`、`\N`、`\abs{x}`、`\norm{x}`、`\set{1,2}`、
`\inner{x,y}` 和 `\dd`。带星号的括号命令自动调整大小，如 `\norm*{...}`。

笔记示例展示了定义、定理、命题、备注和证明。
编辑器片段前缀为 `mtproblem`、`mtsol`、`mtthm`、`mtdef`、`mtproof`。

## SyncTeX 与辅助文件

保留 `-synctex=1`，支持 PDF 与源码之间的定位跳转。
SyncTeX 和常见辅助文件仅从 VS Code 文件列表隐藏，并由 Git 忽略；不会在每次
编译后自动删除。PDF 正常显示，但不纳入版本控制。

## 上传 GitHub

在此文件夹运行 `git status --short` 检查准备上传的文件。
原有个人作业、旧笔记、备份和编译产物已列入 `.gitignore`。
以后添加包含个人信息的新文件时，需要另行检查；忽略规则不会自动识别个人信息。

确认后可以创建首次提交：

```sh
git add .
git commit -m "Add math assignment and lecture note templates"
```

在 GitHub 创建空仓库，然后按仓库页面给出的命令添加远程地址并推送。
不要使用 `git add -f` 把已忽略的个人文件强行加入仓库。

项目保留了原模板作者署名；上游许可尚未确认，见
[ATTRIBUTION.md](../ATTRIBUTION.md)，未擅自为原模板添加 MIT 等许可证。

当前示例采用英文正文和 pdfLaTeX。中文正文需要另外配置 CJK 宏包、字体和
对应的编译器；中文说明不意味着模板已配置中文排版。
