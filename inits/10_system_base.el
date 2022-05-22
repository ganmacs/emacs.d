;; ;;; 10_base.el --- base settings
;; ;;; Commentary:
;; ;;; Code:

(use-package exec-path-from-shell
  :defer 3                              ;TODO
  :config
  (exec-path-from-shell-initialize))

(use-package recentf-ext)
