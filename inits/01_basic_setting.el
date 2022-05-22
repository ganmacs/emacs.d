;;; 01_basic_setting.el --- basic configuration
;;; Commentary:
;;; Code:

(require 'cl-lib)

;; Japanese
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")

;; Coding
(custom-set-variables
 '(undo-limit 100000)
 '(undo-strong-limit 130000)
 '(kill-whole-line t) ; Delete whole line when cursor is at begining of line
 '(require-final-newline nil)
 '(indent-tabs-mode nil)                ; Use space instead of tab
 '(tab-width 2)
 '(global-auto-revert-mode 1)
 '(gc-cons-threshold (* gc-cons-threshold 10)))

;; recentf
(custom-set-variables
 '(recentf-auto-cleanup 10)
 '(recentf-max-menu-items 10)
 '(recentf-max-saved-items 2000)
 '(recentf-exclude '(".emacs.d/recentf" ".emacs.d/log"))
 '(recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
 '(recentf-mode t))

;; save history
(custom-set-variables
 '(history-length 500)
 '(history-delete-duplicates t)
 '(savehist-file "~/.emacs.d/log/history")
 '(savehist-mode 1))

;; auto save
(custom-set-variables
 '(delete-auto-save-files t)
 '(auto-save-timeout 600)               ; Default=30sec
 '(auto-save-list-file-prefix "~/.emacs.d/log/auto-save-list/.saves-")
 '(auto-save-file-name-transforms `((".*" ,(expand-file-name "~/.emacs.d/log/backup/") t))))

;; backup
(custom-set-variables
 '(backup-by-copying t)
 '(backup-directory-alist (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/log/backup"))
                                backup-directory-alist))
 '(make-backup-files t))

;; cua
(custom-set-variables
 '(cua-enable-cua-keys nil)
 '(cua-mode t))

;; EOF
(custom-set-variables
 '(indicate-empty-lines t)
 '(indicate-buffer-boundaries 'left))

(setq frame-title-format "%f")          ; %f is fullpath

(if (version<= "26.0.50" emacs-version)
    (global-display-line-numbers-mode)
  (global-linum-mode))

;; Looks
(custom-set-variables
 '(column-number-mode t)
 '(transient-mark-mode t)
 '(display-time-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(scroll-bar-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "") ; Remove messages in intial scratch buffer
 '(ring-bell-function 'ignore)
 '(show-trailing-whitespace t))

;; coursor
(custom-set-variables
 '(blink-cursor-interval 0.5)
 '(blink-cursor-delay 300.0)           ; 5 minitus
 '(blink-cursor-mode 1))

;; scroll
(custom-set-variables
 '(scroll-conservatively 35)
 '(scroll-margin 0)
 '(sescroll-step 1)
 '(mouse-wheel-mode 1))

(util/global-set-key-lambda [wheel-up] (scroll-down 1))
(util/global-set-key-lambda [wheel-down] (scroll-up 1))
(util/global-set-key-lambda [double-wheel-up] (scroll-down 1))
(util/global-set-key-lambda [double-wheel-down] (scroll-up 1))
(util/global-set-key-lambda [triple-wheel-up] (scroll-down 2))
(util/global-set-key-lambda [triple-wheel-down] (scroll-up 2))

(fset 'yes-or-no-p 'y-or-n-p)

;; narrowing
(put 'narrow-to-region 'disabled nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; (fido-vertical-mode +1)

;;; 01_basic_setting.el ends here
