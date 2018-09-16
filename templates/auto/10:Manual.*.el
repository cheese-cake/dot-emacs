(TeX-add-style-hook
 "10:Manual.*"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "$0")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"))
 :latex)

