(setq piwonka-org-packages
      '(

        org
        org-journal

        ;;; SUPER AGENDA
        ;;; https://github.com/alphapapa/org-super-agenda
        org-super-agenda
        ))

;; List of packages to exclude.
(setq piwonka-org-excluded-packages '())


(defun piwonka-org/post-init-org ()
  "Initialize Piwonka Preferences"

  (use-package org
    :config
    (progn
      (setq wnka/org-path "~/ws/orgmode/src/PiwonkaOrgMode/")
      (setq wnka/org-notes-path "~/ws/orgmode/src/PiwonkaOrgMode/notes/")
      (setq org-agenda-files (mapcar #'(lambda (orgfile) (concat wnka/org-path orgfile)) 
                                     (list
                                      "inbox.org"
                                      "work.org"
                                      "web.org"
                                        ;                                "work.org_archive"
                                      )))


      (setq org-agenda-custom-commands
            '(("n" todo "NEXT") ; Todo items that are marked "NEXT"
                                        ; ("N" todo-tree "NEXT") ; Todo items that are marked "NEXT"
              ))

      (setq org-agenda-sorting-strategy '(time-up priority-down category-up))
      (setq org-agenda-skip-deadline-if-done t)
      (setq org-agenda-skip-scheduled-if-done t)
      (setq org-agenda-window-setup 'current-window)
      (setq org-deadline-warning-days 0)

      (setq org-use-property-inheritance t)

      (setq org-export-section-number-format '((("1" "."))
                                               . " - "))

      (setq org-capture-templates
            '(
              ("t" "Todo" entry (file+headline (lambda () (concat wnka/org-path "inbox.org")) "Inbox")
               "* TODO %?\n  %i\n")
              ("d" "Todo Today" entry (file+headline (lambda () (concat wnka/org-path "inbox.org")) "Inbox")
               "* TODO %?\n  SCHEDULED: %t")
              ("c" "Todo with Clipboard" entry (file+headline (lambda () (concat wnka/org-path "inbox.org")) "Inbox")
               "* TODO %?\n  %c" :empty-lines 1)
              )
            )

      (setq org-log-done 'time)
      (setq org-refile-use-outline-path nil)
      (setq org-agenda-start-on-weekday nil)
      (setq org-refile-targets '(
                                 ("work.org" . (:level . 1)) 
                                 ))
      (setq org-todo-keywords
            '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "CANCELLED(c)")))
      (setq org-use-fast-todo-selection t)
      (setq org-tags-column 90)
      )
    )
  )


(defun piwonka-org/init-org-journal ()
  "Initialize Piwonka Preferences"

  (use-package org-journal
    :config
    (progn
      (setq org-journal-dir "~/ws/orgmode/src/PiwonkaOrgMode/journal/")
      )))


(defun piwonka-org/init-org-super-agenda ()
  "Initialize Piwonka Preferences"
  (use-package org-super-agenda
    :config
    (progn
      (setq org-super-agenda-groups
            '((:auto-outline-path t)))
      (org-super-agenda-mode)
      )
    )
  )

(defun piwonka-org/init-graphviz-dot-mode ()
  "Initialize Piwonka Preferences"
  (use-package graphviz-dot-mode
    :ensure t
    :config
    (setq graphviz-dot-indent-width 4))
  )

