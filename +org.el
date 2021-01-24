(setq org-directory "~/org/")

(setq org-log-done 'time)
(setq org-file-apps
      '(("nes" . "mednafen %s")
        ("nds" . "desmume %s")))

(after! org-capture
  (setq org-refile-targets
        '(("~/org/archive.org" :level . 2))))

(setq org-ref-default-bibliography '("~/refs/lib.bib")
      org-ref-pdf-directory "~/refs/pdfs/"
      ;; org-ref-bibliography-notes "~/refs/notes.org"
      org-ref-notes-directory "~/refs/notes/"
      )
(defvar org-gitbook-output-directory "./build/")
(defun org-export-gitbook ()
  "Export all subtrees that are *not* tagged with :noexport: to
  separate files.
  Subtrees that do not have the :EXPORT_FILE_NAME: property set
  are exported to a filename derived from the headline text."
  (interactive)
  (save-buffer)
  (let ((modifiedp (buffer-modified-p)))
    (save-excursion
      (goto-char (point-min))
      (goto-char (re-search-forward "^*"))
      (set-mark (line-beginning-position))
      (goto-char (point-max))
      (if (and org-gitbook-output-directory (not (file-accessible-directory-p org-gitbook-output-directory)))
          (mkdir org-gitbook-output-directory))
      (org-map-entries
       (lambda ()
         (let ((export-file (org-entry-get (point) "EXPORT_FILE_NAME")))
           (unless export-file
             (org-set-property
              "EXPORT_FILE_NAME"
              (replace-regexp-in-string " " "_" (nth 4 (org-heading-components)))))
           (setq tempfile (org-entry-get (point) "EXPORT_FILE_NAME"))
           (if org-gitbook-output-directory
               (org-set-property
                "EXPORT_FILE_NAME" (concat org-gitbook-output-directory tempfile)))
           (deactivate-mark)
           (org-md-export-to-markdown nil t nil)
           (org-set-property "EXPORT_FILE_NAME" tempfile)
           (set-buffer-modified-p modifiedp)))
       "-noexport" 'region-start-level))))

(defun org-build-gitbook-toc ()
  (save-excursion
    (set-mark (point-min))
    (goto-char (point-max))
    (setq current-export-file "")
    (setq current-toc "")
    (org-map-entries
     (lambda ()
       (let ((export-file (org-entry-get (point) "EXPORT_FILE_NAME"))
             (heading-level (nth 0 (org-heading-components)))
             (heading-name (nth 4 (org-heading-components))))
         (if export-file
             (setq current-export-file export-file))
         (if (> heading-level 1)
             ;; TODO This should just use org's list compilation functions. This is so gross. :|
             (progn
               (setq current-toc (concat current-toc
                                         (format "%s- %s\n"
                                                 (make-string (* (- heading-level 2) 2) ? )
                                                  (concat "["
                                                  heading-name "](" export-file ".md)"))))))))
     "-noexport" 'region))
  current-toc)

(defun org-gitbook-build-toc ()
  (interactive)
  (let ((toc (org-build-gitbook-toc)))
  (with-temp-file "./build/SUMMARY.md" (insert toc))))
