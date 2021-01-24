;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "milkhouse"
      user-mail-address "milkhouse1990@gmail.com")

(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil
      which-key-idle-delay 0.3)

;; autosave
(auto-save-visited-mode 1)
(setq auto-save-visited-interval 1)


(setq projectile-project-search-path
      '("~/repos/" "~/learning/" "~/clone/"))

(after! pdf-view
  (add-hook! 'pdf-view-mode-hook
             (pdf-view-midnight-minor-mode)))
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq python-indent-offset 2)

(load! "+basics.el")
(load! "+prog.el")
(load! "+txt.el")
(load! "+org.el")
(load! "+key.el")
;; (use-package eaf
;;   :load-path "/usr/share/emacs/site-lisp/eaf")

;; avy
(global-set-key (kbd "C-;") 'avy-goto-char)
