;;; 22_flycheck.el --- flycheck mode configuration
;;; Commentary:
;;; Code:

(use-package flycheck
  :config
  (global-flycheck-mode)
  :custom
  (flycheck-indication-mode 'right-fringe))

(use-package flycheck-posframe
  ;; :ensure t
  :after flycheck
  :config (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode)
  :custom-face
  (flycheck-posframe-face ((t (:foreground "#eee" :background "#555"))))
  (flycheck-posframe-background-face ((t (:backgroud "#aaa"))))
  (flycheck-posframe-border-face ((t (:foreground "#aaa"))))
  :custom
  (flycheck-posframe-border-width 1))

;;; 22_flycheck.el ends here
