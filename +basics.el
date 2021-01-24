;; projectile
(after! projectile
  (projectile-register-project-type
  'jekyll '(".jekyll-cache")
  :run "bundler exec jekyll serve --drafts")
  (projectile-register-project-type
   'django '("manage.py")
   :run "python manage.py runserver"))

  (setq compilation-read-command nil)

;; (use-package! company-tabnine
;;   :after company
;;   :config
;;   ;; (cl-pushnew 'company-tabnine (default-value 'company-backends)))
;;   (add-to-list 'company-backends #'company-tabnine))

(use-package! company-tng
  :config
  (map! :map company-active-map
        "TAB" nil
        [tab] nil
        "M-n" nil
        "M-p" nil
        "C-j" nil
        "C-k" nil))

(use-package! yasnippet
  :config
  (map! :map yas-keymap
        [tab] nil
        "TAB" nil
        "C-j" 'yas-next-field
        "C-k" 'yas-prev-field))
