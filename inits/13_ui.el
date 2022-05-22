;;; 21_ui.el --- looks configuration
;;; Commentary:
;;; Code:

(use-package yascroll
  :custom-face
  (yascroll:thumb-text-area ((t (:background "#777"))))
  (yascroll:thumb-fringe ((t (:background "#777" :foreground "#777"))))
  :config
  (global-yascroll-bar-mode 1))

(use-package posframe)

;; pos-tip doesn't work with my font (Menlo)
;;
;; (use-package pos-tip
;;   :custom
;;   (pos-tip-background-color "#222")
;;   (pos-tip-foreground-color "#ddd"))

(use-package powerline)

(defface powerline-active3
  '((t (:background "#462743" :inherit mode-line-inactive :foreground "#eee")))
  "Powerline face 3."
  :group 'powerline)

(defface powerline-inactive3
  '((t (:background "#190E18" :inherit mode-line-inactive :foreground "#222")))
  "Powerline face 3."
  :group 'powerline)

(defface powerline-active4
  '((t (:background "#eee" :inherit mode-line-inactive :foreground "#462743")))
  "Powerline face 4."
  :group 'powerline)

(defface powerline-inactive4
  '((t (:background "#666" :inherit mode-line-inactive :foreground "#190E18")))
  "Powerline face 4."
  :group 'powerline)

(defface powerline-active5
  '((t (:background "#729fcf" :inherit mode-line-inactive :foreground "#222")))
  "Powerline face 5."
  :group 'powerline)

(defface powerline-inactive5
  '((t (:background "#1B3954" :inherit mode-line-inactive :foreground "gray22")))
  "Powerline face 5."
  :group 'powerline)

(defun my-powerline-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (face3 (if active 'powerline-active3 'powerline-inactive3))
                          (face4 (if active 'powerline-active4 'powerline-inactive4))
                          (face5 (if active 'powerline-active5 'powerline-inactive5))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-major-mode face3 'l)
                                     (powerline-raw " " face3)
                                     (funcall separator-left face3 face4)
                                     (powerline-buffer-id face4 'l)
                                     (powerline-narrow face3 'l)
                                     (funcall separator-left face4 face5)
                                     (powerline-raw "%p" face5 'r)
                                     (powerline-narrow face3 'l)
                                     (funcall separator-left face5 face1)
                                     ))
                          (rhs (list (powerline-vc face1 'r)
                                     (funcall separator-right face1 face4)
                                     (powerline-raw "%4l" face4 'l)
                                     (powerline-raw ":" face4 'l)
                                     (powerline-raw "%3c" face4 'r)
                                     (funcall separator-right face4 face3)
                                     (powerline-raw "%Z%*" face3 'l)
                                     (powerline-raw " " face3)
                                     )))
                     (concat (powerline-render lhs)
                             (powerline-fill face1 (powerline-width rhs))
                             (powerline-render rhs)))))))
(my-powerline-theme)


;;; 21_ui.el ends here
