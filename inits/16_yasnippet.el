;;; 16_yasnippet.el --- yasnippets mode configuration
;;; Commentary:
;;; Code:

(use-package yasnippet
  :custom
  (yas-snippet-dirs (list (concat user-emacs-directory "etc/snippets")))
  (yas-prompt-functions '(helm-editutil-yas-prompt))
  (yas-global-mode 1)

  :config
  (yas-reload-all))

;;; 16_yasnippet.el ends here
