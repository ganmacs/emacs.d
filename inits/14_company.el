;;; 14_company.el --- company mode configuration
;;; Commentary:
;;; Code:

(use-package company
  :bind
  (("M-/" .  company-complete)
   ("C-M-i" .  company-complete)
   ("s-S" . lsp-format-buffer))
  (:map company-active-map
   ("M-n" . nil)
   ("M-p" . nil)
   ("C-n" . company-select-next)
   ("C-p" . company-select-previous)
   ("C-h" . nil)
   ("M-d" . company-show-doc-buffer)
   ("<RET>" .  company-complete-selection)
   ("<tab>". company-complete-selection)
   ("TAB" . company-complete-selection)
   ("C-m" . company-complete-selection))
  :custom
  (company-selection-wrap-around t)
  (company-minimum-prefix-length 5)
  (company-auto-expand nil)
  (company-idle-delay 3)
  (company-tooltip-align-annotations t)
  (company-dabbrev-ignore-case nil)
  (company-dabbrev-code-ignore-case nil)
  (company-dabbrev-downcase nil)
  (company-frontends '(company-pseudo-tooltip-unless-just-one-frontend
                       company-preview-frontend
                       company-echo-metadata-frontend))
  :config
  (global-company-mode +1)

  (let ((bgc "#333") (color "#729fcf"))
    (set-face-attribute 'company-tooltip nil
                        :foreground color :background bgc)
    (set-face-attribute 'company-tooltip-common nil
                        :foreground "white" :background bgc)
    (set-face-attribute 'company-tooltip-common-selection nil
                        :foreground "white" :background color)
    (set-face-attribute 'company-tooltip-selection nil
                        :foreground bgc :background color)
    (set-face-attribute 'company-preview-common nil
                        :background nil :foreground "lightgrey" :underline nil)
    (set-face-attribute 'company-scrollbar-fg nil
                        :background "orange")
    (set-face-attribute 'company-scrollbar-bg nil
                        :background "gray40")
    (set-face-attribute 'company-tooltip-annotation nil
                        :foreground "red")))

;; (use-package company-dict
;;   :config
;;   (setq company-dict-dir (concat user-emacs-directory "etc/ac-dict"))
;;   (add-to-list ' company-backends 'company-dict))

;; (add-hook 'lsp-managed-mode-hook (lambda () (setq-local company-backends '(company-capf))))

;;; 14_company.el ends here
