;;; 99_keybinding.el --- keybinding configuration
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-j") 'dabbrev-expand)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-q") 'one-line-comment)
(global-set-key (kbd "C-z") 'zap-to-char) ;; Delete chars until designated char appeared
(global-set-key (kbd "C-x o") #'(lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-x C-h") 'help-command)
(global-set-key (kbd "C-x C-k") 'kill-all-buffers)
(global-set-key (kbd "C-x C-n") 'cycle-spacing)
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)

(global-set-key (kbd "C-S-i") 'indent-buffer)
(global-set-key (kbd "C-S-f") 'next-space)
(global-set-key (kbd "C-S-b") 'previous-space)
(global-set-key (kbd "C-S-s") 'quote-insert-inline)
(global-set-key (kbd "C-S-d") 'double-quote-insert-inline)
(global-set-key (kbd "C-S-c") 'colon-insertion)
(global-set-key (kbd "C-S-t") 'previous-transpose-char)

(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "M-k") 'kill-whole-line)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-a") 'beginning-of-defun)
(global-set-key (kbd "M-j") 'duplicate-line)
(global-set-key (kbd "M-e") 'end-of-defun)
(global-set-key (kbd "M-g g") 'goto-line)

(global-set-key (kbd "s-k") 'kill-sexp)
(global-set-key (kbd "s-h") #'(lambda () (interactive) (kill-sexp -1)))
(global-set-key (kbd "s-n") 'next-buffer)
(global-set-key (kbd "s-p") 'previous-buffer)
(global-set-key (kbd "s-f") 'forward-sexp)
(global-set-key (kbd "s-b") 'backward-sexp)
(global-set-key (kbd "s-0") 'delete-window)
(global-set-key (kbd "s-2") 'split-window-below)
(global-set-key (kbd "s-3") 'split-window-right)
(global-set-key (kbd "s-i") 'global-whitespace-mode)
(global-set-key (kbd "s-m") 'end-line-indent)
(global-set-key (kbd "s-o") 'begin-line-indent)

(global-set-key (kbd "C-M-k") 'kill-this-buffer)

(global-unset-key (kbd "C-x C-c"))
(define-key minibuffer-local-completion-map "\C-w" 'kill-word-at-point)
(global-set-key (kbd "C-x RET u") 'ucs-normalize-NFC-buffer) ;; pdfコピー時の濁点の分離をなおす

(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @Function ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun copy-whole-line (&optional arg)
  "Copy current line."
  (interactive "p")
  (or arg (setq arg 1))
  (if (and (> arg 0) (eobp) (save-excursion (forward-visible-line 0) (eobp)))
      (signal 'end-of-buffer nil))
  (if (and (< arg 0) (bobp) (save-excursion (end-of-visible-line) (bobp)))
      (signal 'beginning-of-buffer nil))
  (unless (eq last-command 'copy-region-as-kill)
    (kill-new "")
    (setq last-command 'copy-region-as-kill))
  (cond ((zerop arg)
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))))
        ((< arg 0)
         (save-excursion
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line (1+ arg))
                                       (unless (bobp) (backward-char))
                                       (point)))))
        (t
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line arg) (point))))))
  (message (substring (car kill-ring-yank-pointer) 0 -1)))

(defun kill-word-at-point ()
  "Delete a word at point."
  (interactive)
  (let ((char (char-to-string (char-after (point)))))
    (cond
     ((string= " " char) (delete-horizontal-space))
     ((string-match "[\t\n -@\[-`{-~]" char) (kill-word 1))
     (t (forward-char) (backward-word) (kill-word 1)))))

(defun kill-all-buffers()
  "Kill all buffer."
  (interactive)
  (yes-or-no-p "kill all buffers? ")
  (dolist (buf (buffer-list))
    (unless (member (buffer-name) '("*scratch*" "*Messages*"))
      (kill-buffer buf))))

(defun forward-to-char (char)
  "Vim like f. Forward until CHAR will appear."
  (let ((point-char (char-after (point))))
    (when (or (= point-char char)
              (and (util/alphabet? char)
                   (= point-char (upcase-initials char))))
      (forward-char))
    (search-forward (char-to-string char) (point-at-eol) nil 1)
    (backward-char)))

(defun backward-to-char (char)
  "Vim liken F. Backword until CHAR will appear."
  (search-backward (char-to-string char) (point-at-bol) nil 1))

(defun add-keys-to-vim-likef (prefix c &optional mode)
  "Define macrow with PREFIX and C for MODE."
  (define-key global-map
    (read-kbd-macro (concat prefix (string c)))
    `(lambda ()
       (interactive)
       (funcall (if (eq ',mode 'word)
                    #'backward-to-char
                  #'forward-to-char) ,c))))

(cl-loop for c from ?0 to ?9 do (add-keys-to-vim-likef "H-" c))
(cl-loop for c from ?a to ?z do (add-keys-to-vim-likef "H-" c))
(cl-loop for c from ?! to ?~ do (add-keys-to-vim-likef "H-" c))
(cl-loop for c from ?0 to ?9 do (add-keys-to-vim-likef "H-C-" c 'word))
(cl-loop for c from ?a to ?z do (add-keys-to-vim-likef "H-C-" c 'word))
(cl-loop for c from ?! to ?~ do (add-keys-to-vim-likef "H-C-" c 'word))

(defvar inline-separator "^\s()[]:;,=.\n{}")

(defun colon-insertion ()
  "Wrap string by quote."
  (interactive)
  (save-excursion
    (skip-chars-backward inline-separator)
    (if (= (char-before (point)) ?\:)
        (delete-backward-char 1)
    (insert ":"))))

(defun quote-insert-inline ()
  "Wrap string by quote."
  (interactive)
  (save-excursion
    (skip-chars-backward inline-separator)
    (insert "'")
    (skip-chars-forward inline-separator)
    (insert "'"))
  )

(defun double-quote-insert-inline ()
  "Wrap string by double quote."
  (interactive)
  (save-excursion
    (skip-chars-backward inline-separator)
    (insert "\"")
    (skip-chars-forward inline-separator)
    (insert "\"")))

(defun next-space ()
  "Move forward until space appear."
  (interactive)
  (search-forward (char-to-string ?\s) nil 1)
  (if (= (char-after (point)) ?\s) (next-space)))

(defun previous-space ()
  "Move backward until space appear."
  (interactive)
  (search-backward (char-to-string ?\s) nil 1)
  (backward-char)
  (if (= (char-after (point)) ?\s) (previous-space)))

(defun one-line-comment ()
  "Toggle a current line to comment or uncomment."
  (interactive)
  (save-excursion
    (beginning-of-line)
    (set-mark (point))
    (end-of-line)
    (comment-or-uncomment-region (region-beginning) (region-end))))

(defun indent-buffer ()
  "Indent current buffer."
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (indent-for-tab-command)))

(defun end-line-indent ()
  "Move end of line and return."
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun begin-line-indent ()
  "Move begingin of line and return."
  (interactive)
  (beginning-of-line)
  (newline-and-indent)
  (forward-line -1)
  (indent-for-tab-command))

(defun previous-transpose-char ()
  "Transpose previous char."
  (interactive)
  (transpose-chars -1)
  (forward-char))

(defun duplicate-line (n)
  (interactive "P")
  (let ((need-comment-line (consp n))
        (begin-point (if mark-active (region-beginning) (point-at-bol)))
        (end-point (if mark-active (region-end) (point-at-bol 2))))
    (save-excursion
      (forward-line)
      (kill-ring-save begin-point end-point)
      (if need-comment-line
          (progn
            (comment-region begin-point end-point)
            (yank))
      (dotimes (i (or n 1))
        (yank))))
    (next-line)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @Advice ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; kill-lineでn行が連結したときにインデントを減らす
(defadvice kill-line (before kill-line-and-fixup activate)
  (when (and (not (bolp)) (eolp))
    (forward-char)
    (fixup-whitespace)
    (backward-char)))

;; 範囲指定していないとき、前の単語を削除
(defadvice kill-region (around kill-word-or-kill-region activate)
  (if (and (called-interactively-p 'interactive) transient-mark-mode (not mark-active))
      (kill-word-at-point)
    ad-do-it))

;; 範囲指定していないとき、1行削除
(defadvice kill-ring-save (around kill-ring-save-or-copy-line-as-kill (beg end) activate)
  (interactive (list (point) (mark)))
  (if (and (called-interactively-p 'any) (not mark-active))
      (copy-whole-line)
    ad-do-it))

(defadvice dired-copy-filename-as-kill (before four-prefix activate)
  (interactive "P")
  (when (eq 4 (prefix-numeric-value (ad-get-arg 0)))
    (ad-set-arg 0 0)))

;;; 選択範囲をisearch
(defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
        (deactivate-mark)
        ad-do-it
        (if (not forward)
            (isearch-repeat-backward)
          (goto-char (mark))
          (isearch-repeat-forward)))
    ad-do-it))

;;; 99_keybinding.el ends here
