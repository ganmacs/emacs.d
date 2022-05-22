;;; 00_util.el --- utility functions and macros for my emacs configurations
;;; Commentary:
;;; Code:

(defmacro util/append-to-list (mode-list modes)
  "Add to MODE-LIST to `add-to-list' with MODES."
  (let ((mode (cl-gensym)))
    `(dolist (,mode ,modes)
       (add-to-list ,mode-list ,mode))))

(defmacro util/add-hook-lambda (hook &rest body)
  "Emit lamada when add HOOK to `add-hook' with BODY."
  `(add-hook ,hook (lambda () ,@body)))

(defmacro util/add-hooks-lambda (hooks &rest body)
  "Emit lamada when add HOOKS to `add-hook' with BODY."
  (let ((hook (cl-gensym)))
    `(dolist (,hook ,hooks)
       (add-hook ,hook (lambda () ,@body)))))

(defmacro util/global-set-key-lambda (keybind &rest body)
  "Emit lamada when add KEYBIND by `global-set-key' with BODY."
  `(global-set-key ,keybind '(lambda () (interactive) ,@body)))

(defun util/chomp (str)
  "STR should string."
  (replace-regexp-in-string "[\n\r]" "" str))

(defun util/git-project? ()
  "Check git project or not."
  (let ((cmd "git rev-parse --is-inside-work-tree"))
    (string= "true"
             (util/chomp (shell-command-to-string cmd)))))

(defun util/git-directory ()
  "Return git repository full path."
  (let ((cmd "git rev-parse --show-toplevel"))
    (if (util/git-project?)
        (format "%s/" (util/chomp (shell-command-to-string cmd))))))

(defsubst util/marked-string ()
  "Return marked string."
  (when (use-region-p)
    (buffer-substring-no-properties (region-beginning) (region-end))))

(defun util/same-ext? (file-path ext)
  "Check same exntion or not."
  (let ((file-ext (file-name-extension file-path)))
    (if file-ext
        (string= (downcase file-ext) ext))))

(defun util/alphabet? (c)
  "Chech c is a-z or not"
  (or (<= ?a c) (>= ?z c)))

;; for osx utility functions

(defun util/execute-on-iterm (command)
  "COMMAND should string."
  (interactive "MCommand: ")
  (do-applescript
   (format "tell application \"iTerm2\"
              activate
              tell current session of current window
                write text \"%s\"
              end tell
            end tell"
           command)))

;;; 00_util.el ends here
