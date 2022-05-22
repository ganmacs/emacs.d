;;; 17_app.el --- yasnippets mode configuration
;;; Commentary:
;;; Code:

(use-package open-junk-file
  :bind ("C-x j" . open-junk-file)
  :custom
  (open-junk-file-find-file-function 'find-file)
  (open-junk-file-format "~/src/Junk/%Y/%m%d-%H%M%S."))

(use-package quickrun
  :init
  (defun my/quickrun ()
    "Exec quickrun."
    (interactive)
    (if (use-region-p)
        (quickrun-region (region-beginning)  (region-end))
      (quickrun)))

  :bind
  ("s-R" . my/quickrun)
  (:map quickrun--mode-map
        ("C-." . quit-window)
        ("C-," . quit-window)
        ("C-g" . quit-window)))

;; (quickrun-add-command "c++/clang++"
;;   '((:exec . ("%c -std=c++14 %o -o %e %s" "%e %a")))
;;   :override t)
