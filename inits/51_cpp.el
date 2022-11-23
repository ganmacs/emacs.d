;;; 51_cpp.el --- lsp mode configuration
;;; Commentary:
;;; Code:

(use-package cc-mode
  :mode
  (("\\.cpp\\'" . c++-mode))
  :custom
  (flycheck-clang-language-standard "c++17")
  ;; (add-hook 'before-save-hook
  ;;           #'(lambda ()
  ;;               (interactive)
  ;;               ;; to avoid `lsp-format-buffer' hidering `delete-trailing-whitespace'
  ;;               (when (eq major-mode 'go-mode) (lsp-format-buffer))))
  )

;;; 51_cpp.el ends here
