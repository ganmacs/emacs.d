;;; 22_flycheck.el --- flycheck mode configuration
;;; Commentary:
;;; Code:

(use-package flycheck
  :config
  (global-flycheck-mode)
  :custom
  (flycheck-indication-mode 'right-fringe))

;; (use-package flycheck-posframe
;;   ;; :ensure t
;;   :after flycheck
;;   :config (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode)
;;   :custom-face
;;   (flycheck-posframe-face ((t (:foreground "#eee" :background "#555"))))
;;   (flycheck-posframe-background-face ((t (:backgroud "#aaa"))))
;;   (flycheck-posframe-border-face ((t (:foreground "#aaa"))))
;;   :custom
;;   (flycheck-posframe-border-width 1))

;; TODO
;; (use-package flymake
;;   :straight nil
;;   :init
;;   (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)
;;   :config
;;   (flymake-mode-on)
;;   :custom
;;   (flymake-fringe-indicator-position 'right-fringe))

;; (symbol-plist :note)
;; (plist-member (symbol-plist :note) 'severity)

;; (setq flymake-severity 2)

;; (use-package flymake-diagnostic-at-point
;;   :after flymake
;;   :config
;;   (add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode))

;;; 22_flycheck.el ends here
