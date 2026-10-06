# Generate PDFs with pdfLaTeX when latexmk is run without an output option.
$pdf_mode = 1;
$out_dir = '.';
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
$clean_ext = "%R.synctex.gz";
