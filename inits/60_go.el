;;; 60_go.el --- lsp mode configuration
;;; Commentary:
;;; Code:

(use-package go-mode
  :mode (("\\.go\\'" . go-mode))
  :config
  (add-hook 'before-save-hook 'lsp-format-buffer)
  ;; (add-hook 'before-save-hook #'lsp-organize-imports t t)
  )

;;; 60_go.el ends here
