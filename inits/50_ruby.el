;;; 50_ruby-mode.el --- mode configuration
;;; Commentary:
;;; Code:

;; (setq-default flycheck-disabled-checkers '(chef-foodcritic))

;; (defun my/ruby-mode-hook ()
;;   "My ruby mode hook."
;;   (util/append-to-list
;;    'auto-mode-alist '(("Gemfile" . ruby-mode)
;;                       ("\\.thor$" . ruby-mode)
;;                       ("\\.rake$" . ruby-mode)
;;                       ("Guardfile$" . ruby-mode)
;;                       ("\\.env$" . ruby-mode)
;;                       ("\\.cap$" . ruby-mode)))
;;   (setq ruby-insert-encoding-magic-comment nil))

;; (add-hook 'ruby-mode-hook 'my/ruby-mode-hook)

;; ;; rhtml
;; (util/append-to-list
;;  'auto-mode-alist '(("\\.eco$" . rhtml-mode)
;;                     ("\\.jeco$" . rhtml-mode)
;;                     ("\\.erb$" . rhtml-mode)))

;;; 50_ruby-mode.el ends here
