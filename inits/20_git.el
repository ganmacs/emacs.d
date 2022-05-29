;;; 20_git.el --- git mode configuration
;;; Commentary:
;;; Code:

(use-package magit
  :bind
  ("C-M-g" . magit-status))

(use-package git-gutter-fringe
  :config
  (global-git-gutter-mode))

(defun open-github-commit ()
  (interactive)
  (let* ((cmd1 "git blame -l -L %s,+1  %s | cut -d ' ' -f 1")
         (cmd2 "hub browse -- commit/%s")
         (zero "0000000000000000000000000000000000000000")
         (commit-id (shell-command-to-string
                     (format cmd1 (line-number-at-pos) buffer-file-name))))
    (if (string= zero commit-id)
        (message "This line is not commited")
      (shell-command (format cmd2 commit-id)))))

(global-set-key (kbd "M-g o") 'open-github-commit)


;;; 20_git.el ends here
