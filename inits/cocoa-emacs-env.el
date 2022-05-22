;;; cocoa-emacs-env.el --- configuration
;;; Commentary:
;;; Code:

;; Looks

(set-frame-parameter nil 'alpha '(90 . 60))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(add-to-list 'default-frame-alist '(internal-border-width . 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; for global ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq ns-right-command-modifier (quote hyper))
(setq ns-right-option-modifier (quote alt))

(setq file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)

(set-face-attribute 'default nil :family "Menlo" :height 130)
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (font-spec
                   :family "Hiragino Maru Gothic ProN"))
(setq face-font-rescale-alist
      '((".*Hiragino Maru Gothic ProN.*" . 1.0)))

(define-key global-map [ns-drag-file] 'ns-find-file)
(setq ns-pop-up-frames nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; for input ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq default-input-method "MacOSX")
(mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "あ")

(mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `cursor-color "red")
(mac-set-input-method-parameter "com.google.inputmethod.Japanese.Roman" `cursor-color "#fce94f")

;; change laguage to us when emacs start up
(add-hook 'after-init-hook 'mac-change-language-to-us)

;; Change laguage to us when focus on minibuffer
(add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)

;; Change laguage to us when isearch
(add-hook 'isearch-mode-hook 'mac-change-language-to-us)

;; Change laguage to us when focus on window
(add-hook 'focus-in-hook 'mac-change-language-to-us)

(setq ispell-program-name "/usr/local/bin/aspell")

;;; cocoa-emacs-env.el ends here
