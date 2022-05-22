;;; sango-theme.el --- My awesome color theme
;;; Commentary:
;;; Code:

(deftheme sango
  "Sango color theme inspired by Tango2")

(custom-theme-set-faces
 'sango
 '(default ((t (:background "#020202" :foreground "#eeeeec"))))
 '(cursor ((t (:background "#fce94f"))))
 '(region ((t (:background "#555753"))))
 '(fringe ((t (:background "#151515"))))
 '(mode-line ((t (:foreground "#eeeeec" :background "#555753" :box nil))))
 '(mode-line-inactive ((t (:box nil))))
 '(font-lock-comment-face ((t (:foreground "#888a85"))))
 '(font-lock-doc-face ((t (:foreground "#888a85"))))
 '(font-lock-type-face ((t (:foreground "#8ae234" :bold t))))
 '(font-lock-keyword-face ((t (:foreground "#729fcf"))))
 '(font-lock-function-name-face ((t (:foreground "#fce94f"))))
 '(font-lock-string-face ((t (:foreground "#ad7fa8"))))
 '(font-lock-builtin-face ((t (:foreground "#88B7EA"))))
 '(font-lock-constant-face ((t (:foreground "#8ae234"))))
 '(font-lock-variable-name-face ((t (:foreground "#DCEDFF"))))
 '(font-lock-warning-face ((t (:bold t :foreground "#f92672"))))
 '(comint-highlight-input ((t (:italic t :bold t))))
 '(comint-highlight-prompt ((t (:foreground "#8ae234"))))
 '(isearch ((t (:background "#f57900" :foreground "#2e3436"))))
 '(isearch-lazy-highlight-face ((t (:foreground "#2e3436" :background "#e9b96e"))))
 '(show-paren-match ((t (:foreground "00ff00" :weight semi-bold))))
 '(show-paren-mismatch ((t (:background "#f92672"))))
 '(minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
 '(info-xref ((t (:foreground "#729fcf"))))
 '(info-xref-visited ((t (:foreground "#ad7fa8"))))
 '(hl-line ((t (:background "#151515"))))
 '(trailing-whitespace  ((t (:background "#b14770"))))
 '(dired-directory ((t (:foreground "#729fcf"))))

 ;; '(help-highlight-face . underline)
 ;; '(ibuffer-dired-buffer-face . font-lock-function-name-face)
 ;; '(ibuffer-help-buffer-face . font-lock-comment-face)
 ;; '(ibuffer-hidden-buffer-face . font-lock-warning-face)
 ;; '(ibuffer-occur-match-face . font-lock-warning-face)
 ;; '(ibuffer-read-only-buffer-face . font-lock-type-face)
 ;; '(ibuffer-special-buffer-face . font-lock-keyword-face)
 ;;  '(ibuffer-title-face . font-lock-type-face))
 )

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'sango)

;;; sango-theme.el ends here
