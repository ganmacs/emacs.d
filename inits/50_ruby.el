;;; 50_ruby-mode.el --- mode configuration
;;; Commentary:
;;; Code:

;; `gem install solargraph'
(use-package ruby-mode
  :mode
  (("\\.rb\\'" . ruby-mode)
   ("\\.rake\\'" . ruby-mode)
   ("\\.arb\\'" . ruby-mode)
   ("\\.env$" . ruby-mode)
   ("Gemfile" . ruby-mode)))

(use-package rhtml-mode
  :mode ("\\.erb$" . rhtml-mode))

;;; 50_ruby-mode.el ends here
