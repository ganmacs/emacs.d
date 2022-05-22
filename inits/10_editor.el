;;; 10_editor.el --- editor basic
;;; Commentary:
;;; Code:

(use-package expand-region
  :bind
  ("C-@" . er/expand-region))

(use-package multiple-cursors
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  :config
  (setq mc/list-file "~/.emacs.d/log/.mc-lists.el"))

(use-package anzu
  :bind
  ("C-%" . anzu-replace-at-cursor-thing)
  ("M-%" . anzu-query-replace-at-cursor)
  :config
  (global-anzu-mode +1))

(use-package point-undo
  :demand t ; to capture all point history before autoload
  :bind
  ("C-=" . point-undo)
  ("C-\\" . 'point-redo))

(use-package rotate)
(use-package smartrep
  :config
  (smartrep-define-key global-map "C-:"
    '(("t" . 'rotate-window)
      ("T" . 'rotate-layout)
      ("<left>" . (shrink-window-horizontally 1))
      ("<right>" . (shrink-window-horizontally -1))
      ("<up>" . (shrink-window -1))
      ("<down>" . (shrink-window 1)))))

(use-package emacs-surround
  :straight (:host github :repo "ganmacs/emacs-surround")
  :bind
  ("s-w" . emacs-surround)
  :config
  (add-to-list 'emacs-surround-alist '("}" . ("{ " . " }"))))

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(use-package goto-chg
  :bind
  ("M-[" . goto-last-change)
  ("M-]" . goto-last-change-reverse))

(use-package pager
  :bind
  ([up] . pager-row-up)
  ([down] . pager-row-down))

(use-package jumplist
  :straight (:host github :repo "ganmacs/jumplist")
  :bind
  ("s-<" . jumplist-previous)
  ("s->" . jumplist-next)
  :custom
  (jumplist-ex-mode t)
  (jumplist-hook-commands
   '(dired-jump helm-for-files isearch-forward end-of-buffer beginning-of-buffer
                find-file helm-gtags-find-tag helm-imenu)))

(use-package smartparens
  :init
  (require 'smartparens-config)
  (smartparens-global-mode t)

  :bind
  ("s-u" . sp-up-sexp)
  ("s-d" . sp-down-sexp)

  :custom
  (sp-highlight-pair-overlay nil)
  (sp-highlight-wrap-overlay nil)
  (sp-highlight-wrap-tag-overlay nil))

;;; 10_editor.el ends here
