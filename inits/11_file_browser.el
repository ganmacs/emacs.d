;;; 11_file_browser.el --- file browser
;;; Commentary:
;;; Code:

(use-package vertico
  :config
  (vertico-mode))

(use-package vertico-repeat
  :straight nil
  :after vertico
  :load-path "straight/repos/vertico/extensions/"
  :bind
  ("C-M-/" . vertico-repeat)
  :hook (minibuffer-setup . vertico-repeat-save))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package project
  :straight nil
  :bind
  ("s-l" . project-find-file))

(use-package consult
  :demand t                             ;for custom functions

  :bind
  ("C-;" . consult-buffer)
  ("M-o" . consult-swoop)
  ("M-C-;" . consult-ghq-open)
  ("M-g M-g" . consult-git-grep-region)
  ("M-i" . consult-imenu)
  (:map vertico-map
        ("C-v" . vertico-scroll-up)
        ("M-v" . vertico-scroll-down))

  :custom
  (vertico-count 20)
  (vertico-resize nil)
  (vertico-cycle  t)
  (consult-async-split-style nil)

  :init
  (defun consult-swoop ()
    (interactive)
    (consult-line (get-input-symbol t)))

  (defun consult-git-grep-region ()
    (interactive)
    (consult-git-grep nil (get-input-symbol nil)))

  (defun consult-ghq-open ()
    (interactive)
    (consult-ghq--dired-open
     (consult--read
      (or (consult-ghq--list-candidates)
          (user-error "No ghq repository"))
      :prompt "ghq: "
      :sort t
      :require-match t
      :category 'file)))

  :config
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.2 any)
   consult-buffer consult-project-buffer consult-git-grep
   consult-git-grep-region
   consult-ripgrep consult-grep
   consult-bookmark consult-recent-file consult-xref

   consult--source-bookmark consult--source-recent-file
   consult--source-project-recent-file
   :preview-key (kbd "C-z")))

;;; consult-ghq
(defun consult-ghq--dired-open (dircotry)
  (dired
   (concat
    (util/chomp (shell-command-to-string "ghq root"))
    "/"
    dircotry)))

(defun consult-ghq--list-candidates ()
  (with-temp-buffer
    (unless (zerop (call-process "ghq" nil t nil "list"))
      (error "Failed: ghq list"))
    (let ((paths))
      (goto-char (point-min))
      (while (not (eobp))
        (push
         (buffer-substring-no-properties
          (line-beginning-position) (line-end-position))
         paths)
        (forward-line 1))
      (reverse paths))))

(defun get-input-symbol (at-point)
  (if (use-region-p)
      (let ((val (buffer-substring-no-properties (region-beginning) (region-end))))
        (deactivate-mark)
        val)
    (if at-point (thing-at-point 'symbol) nil)))

;;; 11_file_browser.el
