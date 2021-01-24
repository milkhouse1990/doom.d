

;;; ~/.doom.d/+prog.el -*- lexical-binding: t; -*-

;;(require 'company-tng)
;;(company-tng-configure-default)

;; (use-package! company
;;   :init
;;   (setq company-idle-delay 0))
;; (set-company-backend!
;;   'prog-mode
;;   'company-tabnine 'company-files 'company-yasnippet)

;; (setq +lsp-company-backend
;;       '(company-lsp :with company-tabnine :separate))

;; (require 'company-tng)
;; (use-package! company-tabnine
;;   :config
;; ;;  (company-tng-configure-default)
;;   (setq company-show-numbers t)
;;   (setq company-idle-delay 0)
;;   (setq company-frontend
;;         '(company-tng-frontend)))

;; (add-hook! 'python-mode-hook
;;            (setq python-indent-offset 2))
(setq company-idle-delay 0.1)

(use-package! web-mode
  :config
  (setq web-mode-engines-alist
        '(("django" . "\\.html")))
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

;; python
(use-package! lpy
  :hook ((python-mode . lpy-mode)))
;; (evil-set-initial-state 'python-mode 'emacs)

(use-package! julia-mode
  :config
  (setq julia-indent-offset 2))

(add-hook! 'matlab-mode-hook
  (setq matlab-indent-level 2)
  (add-to-list 'company-backends 'company-dabbrev))

(add-hook! 'sql-mode-hook
  (sqlup-mode))
