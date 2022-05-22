;;; 20_git.el --- git mode configuration
;;; Commentary:
;;; Code:

(use-package magit
  :bind
  ("C-M-g" . magit-status))

(use-package git-gutter-fringe
  :config
  (global-git-gutter-mode))

;;; 20_git.el ends here
