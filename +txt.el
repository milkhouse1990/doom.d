;;; +txt.el -*- lexical-binding: t; -*-
(setq cdlatex-command-alist
      '(("eq" "Insert display equation" "\$\$?\$\$" cdlatex-position-cursor nil t nil)
        ("mat" "Insert bmatrix env" "\\begin{bmatrix}\n?\n\\end{bmatrix}\n" cdlatex-position-cursor nil t nil))
      cdlatex-math-modify-alist
      '((98 "\\boldsymbol" nil t nil nil)))
