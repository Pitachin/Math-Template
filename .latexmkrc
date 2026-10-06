# Keep outputs beside the main source for PDF/source navigation.
$pdf_mode = 1;
$out_dir = '.';
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
