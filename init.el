;;; init.el --- initialize file
;;; Commentary:
;;; Code:

;; use cleanroom. emacs -q -l ~/path/to/somewhere/init.el
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; straight.el
;; ttps://github.com/radian-software/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file (locate-user-emacs-file "straight/repos/straight.el/bootstrap.el"))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package straight
  ;; Configure use-package to use straight.el by default
  :custom (straight-use-package-by-default t))

(use-package init-loader
  :config
  (init-loader-load (locate-user-emacs-file "inits")))

;; color theme
(setq custom-theme-directory (locate-user-emacs-file "etc/color-theme"))
(load-theme 'sango t)
