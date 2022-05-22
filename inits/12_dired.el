;;; 12_dired.el --- dired configuration
;;; Commentary:
;;; Code:

(use-package dired+)

(use-package dired
  :straight nil

  :bind
  (:map dired-mode-map
        ("C-f" . dired-find-file)
        ("RET" . dired-find-file)
        ("<right>" . dired-find-file)
        ("C-b" .  dired-up-directory)
        ("<left>" . dired-up-directory)
        ("r" . wdired-change-to-wdired-mode)
        ("C-g" . quit-window)
        ("SPC" . dired/do-quicklook)
        ("M-g" . consult-git-grep-region)
        ("C-M-g" . magit-status))

  :custom
  (dired-recursive-copies 'always)
  (dired-recursive-deletes 'always)
  (dired-listing-switches "-alh")
  (ls-lisp-dirs-first t)
  (delete-by-moving-to-trash t)
  (trash-directory "~/.Trash")

  :config
  (when (eq system-type 'darwin)
    (require 'ls-lisp)
    (setq ls-lisp-use-insert-directory-program nil)))

(defun dired/do-quicklook ()    "In dired, preview with Quick Look."
  (interactive)
  (let ((file (dired-get-filename))
        (process (get-process "qlmanage_ps")))
    (if process
        (kill-process process)
      (start-process "qlmanage_ps" nil "qlmanage" "-p" file))))

;;; 12_dired.el ends here
