;;; 17_lsp.el --- lsp mode configuration
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :hook
  ((go-mode) . lsp-deferred)
  ((ruby-mode) . lsp-deferred)
  ((rust-mode) . lsp-deferred)

  :bind
  ("s-S" . lsp-format-buffer)

  ;; :hook ((rust-mode . lsp) (java-mode . lsp) (go-mode . lsp-deferred))
  ;; :bind ("C-c h" . lsp-describe-thing-at-point)
  ;; :config
  ;; (setq lsp-rust-server 'rust-analyzer) ; brew install rust-analyzer

  :commands
  (lsp lsp-deferred)
  :custom
  (lsp-keymap-prefix "s-;"))

(use-package lsp-ui
  :custom
  (lsp-ui-sideline-delay 0.5)
  (lsp-ui-doc-enable nil)
  :commands lsp-ui-mode)

;;; 17_lsp.el ends here
