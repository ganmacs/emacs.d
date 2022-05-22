;;; 60_go.el --- lsp mode configuration
;;; Commentary:
;;; Code:

(use-package go-mode
  :mode (("\\.go\\'" . go-mode))
  :config
  ;; (add-hook 'before-save-hook
  ;;           #'(lambda ()
  ;;               (interactive)
  ;;               ;; to avoid `lsp-format-buffer' hidering `delete-trailing-whitespace'
  ;;               (when (eq major-mode 'go-mode) (lsp-format-buffer))))
  )

;;; 60_go.el ends here
