;;; 02_standard_libray.el --- standard library configuration
;;; Commentary:
;;; Code:

(require 'tramp)
(custom-set-variables
 '(tramp-default-method "ssh")
 '(tramp-persistency-file-name "~/.emacs.d/log/tramp"))

;; Show a directory name when same file name exist in opening buffer
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(require 'filecache)
(file-cache-add-directory-list
 '("~/.emacs.d" "~/.emacs.d/inits"))

(defun file-cache-add-this-file ()
  "Add to file-cache when `kill-buffer'."
  (and buffer-file-name
       (file-exists-p buffer-file-name)
       (file-cache-add-file buffer-file-name)))

(add-hook 'kill-buffer-hook 'file-cache-add-this-file)

;; Detect full witdth white or tab or etc
(require 'whitespace)
(custom-set-faces
 '(whitespace-trailing ((t (:background nil :foreground "DeepPink"))))
 ;; '(whitespace-tab ((t (:background nil :foreground "#adff2f"))))
 '(whitespace-space ((t (:background nil :foreground "GreenYellow"))))
 '(whitespace-empty ((t (:background nil)))))

(custom-set-variables
 '(whitespace-style '(face spaces empty space-mark))
 '(whitespace-space-regexp "\\(\u3000+\\)") ; visualize only full width space
 '(whitespace-display-mappings
   '((space-mark ?\u3000 [?\u25a1])
     (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
 '(global-whitespace-mode 1))

;; Remember cusor point
(require 'saveplace)
(custom-set-variables
 '(save-place t)
 '(save-place-file "~/.emacs.d/log/saved-places"))

(require 'paren)
(show-paren-mode t)
(custom-set-variables
 '(show-paren-delay 0.3)
 '(show-paren-when-point-inside-paren t)
 '(show-paren-when-point-in-periphery t))

;;; 02_standard_libray.el ends here
