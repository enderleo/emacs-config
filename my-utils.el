;;;_#7 my-utils.el
;; ..................

;;;_ , ywb-favorite-window-config ......
;;;###autoload
(defun ywb-favorite-window-config (&optional percent)
  "Split window to proper portion"
  (interactive "P")
  (or percent (setq percent 50))
  (setq percent (/ percent 100.0))
  (let (buf)
    (if (> (length (window-list)) 1)
        (setq buf (window-buffer (next-window))))
    (delete-other-windows)
    (let ((maxwidth (window-width)))
      (split-window-horizontally (round (* maxwidth percent))))
    (if buf (save-selected-window
              (pop-to-buffer buf))))
  (call-interactively 'his-transpose-windows))

;;;_ , .. cygwin ........ w3m ....
(defun ywb-convert-to-cygwin-path (path)
  (concat "file:///cygdrive/" (substring path 0 1) (substring path 2)))
(defun ywb-convert-cygwin-path (path)
  (setq path (substring path 17))
  (concat (substring path 0 1) ":" (substring path 1)))

;;;_ , dired .......
;;;###autoload
(defun ywb-dired-w3m-visit ()
  (interactive)
  (let ((file (dired-get-filename nil t)))
    (w3m-goto-url
     (if (string-match "^[a-zA-Z]:" file)
         (ywb-convert-cygwin-path file)
       (concat "file://" file)))))
;; ..... windows ............ TC ..........
;; ............................... W .
;; ....... Windows .. C-1 W .. Windows ......C-2 W
;; .. Cygwin ....C-3 W .. Windows ......
;;;###autoload
(defun ywb-dired-copy-fullname-as-kill (&optional arg)
  "In dired mode, use key W to get the full name of the file"
  (interactive "P")
  (let (file)
    (setq file (dired-get-filename nil t))
    (or (not arg)
        (cond ((= arg 1)
               (setq file (convert-standard-filename file)))
              ((= arg 2)
               (setq file (ywb-convert-to-cygwin-path file)))
              ((= arg 3)
               (setq file (convert-standard-filename (file-name-directory file))))))
    (if (eq last-command 'kill-region)
        (kill-append file nil)
      (kill-new file))
    (message "%s" file)))
;; .. TC ............. buffer .............
;; ...... buffer ...
(defvar ywb-dired-quickview-buffer nil)
(defun ywb-dired-quickview ()
  (interactive)
  (if (buffer-live-p ywb-dired-quickview-buffer)
      (kill-buffer ywb-dired-quickview-buffer))
  (setq ywb-dired-quickview-buffer
        (find-file-noselect (dired-get-file-for-visit)))
  (display-buffer ywb-dired-quickview-buffer))

;; . tar .. mark ..........................
(defun ywb-dired-compress-dir ()
  (interactive)
  (let ((files (dired-get-marked-files t)))
    (if (and (null (cdr files))
             (string-match "\\.\\(tgz\\|tar\\.gz\\)" (car files)))
        (shell-command (concat "tar -xvf " (car files)))
      (let ((cfile (concat (file-name-nondirectory
                            (if (null (cdr files))
                                (car files)
                              (directory-file-name default-directory))) ".tgz")))
        (setq cfile
              (read-from-minibuffer "Compress file name: " cfile))
        (shell-command (concat "tar -zcvf " cfile " " (mapconcat 'identity files " ")))))
    (revert-buffer)))

;; ........
;;;###autoload
(defun his-match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (let ((prev-char (char-to-string (preceding-char)))
        (next-char (char-to-string (following-char))))
    (cond ((string-match "[[{(<]" next-char) (forward-sexp 1))
          ((string-match "[\]})>]" prev-char) (backward-sexp 1))
          (t (self-insert-command (or arg 1))))))

;;;###autoload
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char:")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
                     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

;; transpose(interchange) two windows
;;;###autoload
(defun his-transpose-windows (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

;; .. major mode...........
(defvar switch-major-mode-last-mode nil)
(make-variable-buffer-local 'switch-major-mode-last-mode)

(defun major-mode-heuristic (symbol)
  (and (fboundp symbol)
       (string-match ".*-mode$" (symbol-name symbol))))

(defun switch-major-mode (mode)
  (interactive
   (let ((fn switch-major-mode-last-mode)
         val)
     (setq val
           (completing-read
            (if fn
                (format "Switch major mode to (default %s): " fn)
              "Switch major mode to: ")
            obarray 'major-mode-heuristic t nil nil (symbol-name fn)))
     (list (intern val))))
  (let ((last-mode major-mode))
    (funcall mode)
    (setq switch-major-mode-last-mode last-mode)))
;; .........
(defun ywb-indent-accoding-to-paren ()
  "Indent the region between paren"
  (interactive)
  (let ((prev-char (char-to-string (preceding-char)))
        (next-char (char-to-string (following-char)))
        (pos (point)))
    (save-excursion
      (cond ((string-match "[[{(<]" next-char)
             (indent-region pos (progn (forward-sexp 1) (point)) nil))
            ((string-match "[\]})>]" prev-char)
             (indent-region (progn (backward-sexp 1) (point)) pos nil))))))

;; ..... vim . dict ...................
;; buffer ..... hippie-expand .. dabbrev-expand ........
;; . ywb-add-dict-word .......... mode ..
;;;###autoload
(defun ywb-add-dict-word (word)
  (interactive (list (let (w)
                       (read-from-minibuffer
                        (format "add word%s: "
                                (if (setq w (current-word))
                                    (concat "(default: " w ")")
                                  ""))))))
  (or (not (string= word "")) (setq word (current-word)))
  (let ((mode (symbol-name major-mode)))
    (save-excursion
      (set-buffer (get-buffer-create (concat " " mode)))
      (goto-char (point-min))
      (if (not (re-search-forward word nil t))
          (progn
            (setq major-mode (intern mode))
            (goto-char (point-min))
            (insert word "\n")
            (with-current-buffer (find-file-noselect ywb-dict-file)
              (beginning-of-buffer)
              (if (re-search-forward (concat "\\* " mode) nil t)
                  (progn
                    (forward-line 1)
                    (insert word "\n"))
                (goto-char (point-max))
                (insert "* " mode "\n"
                        word "\n"))
              (save-buffer)
              (kill-buffer (current-buffer)))
            (message "add %s to %s" word mode))
        (message "%s is in the dictionary!" word)))))
(defun ywb-read-dict-file ()
  "Read dictionary file"
  (interactive)
  (save-excursion
    (let ((buffer (find-file-noselect ywb-dict-file))
          (done nil)
          mode beg end)
      (set-buffer buffer)
      (beginning-of-buffer)
      (re-search-forward "^\\*\\s-*\\(.*-mode\\)" nil t)
      (setq mode (buffer-substring (match-beginning 1)
                                   (match-end 1)))
      (setq beg (1+ (match-end 0)))
      (while (progn
               (if (re-search-forward "^\\*\\s-*\\(.*-mode\\)" nil t)
                   (setq end (match-beginning 0))
                 (setq end (point-max))
                 (setq done t))
               ;; (message "mode: %s, beg: %d, end: %d" mode beg end)
               (with-current-buffer  (get-buffer-create (format " %s-dict" mode))
                 (erase-buffer)
                 (setq major-mode (intern mode))
                 (insert-buffer-substring buffer beg end))
               (setq mode (buffer-substring (match-beginning 1)
                                            (match-end 1)))
               (setq beg (1+ (match-end 0)))
               (not done)))
      (kill-buffer buffer))))
(defvar ywb-dict-file "~/.emacs.d/.dict")
(condition-case nil
    (ywb-read-dict-file)
  (error nil))

;;;###autoload
(defun ywb-org-table-convert-region (beg end wspace)
  (interactive "r\nP")
  (require 'org)
  (when (= beg (point-min))
    (save-excursion
      (goto-char beg)
      (insert "\n")
      (setq beg (1+ beg))))
  (org-mode)
  (org-table-convert-region beg end wspace))

;;;###autoload
(defun ywb-org-table-export-here (beg end)
  (interactive "r")
  (require 'org)
  (let ((buf (generate-new-buffer "*temp*"))
        (table (delete-and-extract-region beg end)))
    (with-current-buffer buf
      (insert table)
      (goto-char (point-min))
      (while (re-search-forward "^[ \t]*|[ \t]*" nil t)
        (replace-match "" t t)
        (end-of-line 1))
      (goto-char (point-min))
      (while (re-search-forward "[ \t]*|[ \t]*$" nil t)
        (replace-match "" t t)
        (goto-char (min (1+ (point)) (point-max))))
      (goto-char (point-min))
      (while (re-search-forward "^-[-+]*$" nil t)
        (replace-match "")
        (if (looking-at "\n")
            (delete-char 1)))
      (goto-char (point-min))
      (while (re-search-forward "[ \t]*|[ \t]*" nil t)
        (replace-match "\t" t t))
      (setq table (buffer-string))
      (kill-buffer buf))
    (insert table)))

;;;###autoload
(defun ywb-shell-command-background (command &optional output-buffer)
  (interactive (list (read-from-minibuffer "Shell Command: " nil
                                           nil nil 'shell-command-history)
                     current-prefix-arg))
  (let ((buffer (or output-buffer
                    (get-buffer-create "*Shell Command Output*")))
        (directory default-directory))
    (with-current-buffer buffer
      (setq default-directory directory)
      (erase-buffer)
      (start-process-shell-command "shell" buffer command))
    (pop-to-buffer buffer t)))
;;;###autoload
(defun ywb-count-word-region ()
  (interactive)
  (let ((beg (point-min)) (end (point-max))
        (word 0) (other 0))
    (if mark-active
        (setq beg (region-beginning)
              end (region-end)))
    (save-excursion
      (goto-char beg)
      (while (< (point) end)
        (cond ((not (equal (car (syntax-after (point))) 2)) ; not a word
               (forward-char))
              ((< (char-after) 128)     ; is a english word
               (progn
                 (setq word (1+ word))
                 (forward-word)))
              (t
               (setq other (1+ other))
               (forward-char)))))
    (message "enlish word: %d\nother char: %d"
             word other)))

;; crazycool ........ ascii .
;;;###autoload
(defun ascii-table-show ()
  "Print the ascii table"
  (interactive)
  (with-current-buffer (switch-to-buffer "*ASCII table*")
    (setq buffer-read-only nil)
    (erase-buffer)
    (let ((i   0)
          (tmp 0))
      (insert (propertize
               "                                [ASCII table]\n\n"
               'face font-lock-comment-face))
      (while (< i 32)
        (dolist (tmp (list i (+ 32 i) (+ 64 i) (+ 96 i)))
          (insert (concat
                   (propertize (format "%3d " tmp)
                               'face font-lock-function-name-face)
                   (propertize (format "[%2x]" tmp)
                               'face font-lock-constant-face)
                   "    "
                   (propertize (format "%3s" (single-key-description tmp))
                               'face font-lock-string-face)
                   (unless (= tmp (+ 96 i))
                     (propertize " | " 'face font-lock-variable-name-face)))))
        (newline)
        (setq i (+ i 1)))
      (beginning-of-buffer))
    (toggle-read-only 1)))

;; .. perltidy ... perl .....................
;; ... buffer... C-u ............ *perltidy* .
;; buffer .....................
;;;###autoload
(defun ywb-perltidy (arg)
  (interactive "P")
  (let ((buffer (generate-new-buffer "*perltidy*"))
        (point (point))
        start end)
    (if (and mark-active transient-mark-mode)
        (setq start (region-beginning)
              end (region-end))
      (setq start (point-min)
            end (point-max)))
    (shell-command-on-region start end "perltidy" buffer)
    (if arg
        (with-current-buffer buffer
          (perl-mode)
          (display-buffer buffer))
      (delete-region start end)
      (insert-buffer buffer)
      (kill-buffer buffer)
      (goto-char point))))

;; ............ enter ..............
;;;###autoload
(defun ywb-dired-jump-to-file (name)
  (interactive (list
                (let ((table (apply 'append
                                    (mapcar (lambda (dir)
                                              (directory-files (car dir)))
                                            dired-subdir-alist))))
                  (when (null table)
                    (error "No files"))
                  (completing-read "Jump to file: "
                                   table nil t))))
  (let* ((len (length name))
         cmd)
    (setq name (regexp-quote name))
    (goto-char (point-min))
    (forward-line 2)                  ; skip two lines in dired buffer
    (if (re-search-forward (concat "\\<" name "\\>") nil t)
        (goto-char (match-beginning 0)))
    (when (save-excursion
            (goto-char (match-end 0))
            (re-search-forward (concat "\\<" name "\\>") nil t))
      (while (progn
               (setq cmd (read-char "(n)ext or (p)rev: "))
               (case cmd
                 (?n (progn
                       (goto-char (+ (point) len))
                       (if (re-search-forward (concat "\\<" name "\\>") nil t)
                           (goto-char (match-beginning 0))
                         (goto-char (- (point) len))
                         nil)))
                 (?p (re-search-backward (concat "\\<" name "\\>") nil t))
                 (t nil)))))))
;; ....................................
;;;###autoload
(defun ywb-insert-item ()
  (interactive)
  (let (curr next)
    (beginning-of-line)
    (cond ((looking-at "\\(\\s-*\\)\\([0-9]+\\)\\.\\s-*")
           (setq curr (string-to-number (buffer-substring (match-beginning 2)
                                                          (match-end 2))))
           (setq next (number-to-string (1+ curr)))
           (end-of-line)
           (insert "\n" (buffer-substring (match-beginning 1)
                                          (match-end 1))
                   next ". ")
           (ywb-sync-item))
          ((looking-at "\\s-*[-+]\\s-*")
           (progn
             (end-of-line)
             (insert "\n" (buffer-substring (match-beginning 0)
                                            (match-end 0)))))
          (t
           (progn
             (end-of-line)
             (newline-and-indent))))))
;;;###autoload
(defun ywb-sync-item ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (if (looking-at "\\(\\s-*\\)\\([0-9]+\\)\\.\\s-*")
        (let ((curr (string-to-number (buffer-substring (match-beginning 2)
                                                        (match-end 2))))
              (blank1 (buffer-substring (match-beginning 1)
                                        (match-end 1)))
              (blank2 (buffer-substring (match-end 2)
                                        (match-end 0))))
          (while (progn
                   (beginning-of-line 2)
                   (looking-at "\\s-*[0-9]+\\.\\s-*"))
            (setq curr (1+ curr))
            (delete-region (match-beginning 0) (match-end 0))
            (insert blank1 (number-to-string curr) blank2))))))
;; . w3m ...........
(defvar ywb-http-proxy "http://202.115.130.58:8080")
;;;###autoload
(defun ywb-toggle-proxy (force)
  "Toggle proxy. With prefix, set proxy on."
  (interactive "P")
  (if (or force
          (not (getenv "http_proxy")))
      (progn
        (setenv "http_proxy" ywb-http-proxy)
        (message "proxy set to %s" (getenv "http_proxy")))
    (setenv "http_proxy" nil)
    (message "proxy off")))
;;;###autoload
(defun ywb-html-insert-newline ()
  (interactive)
  (insert "<br />")
  (newline-and-indent))
;;;###autoload
(defun ywb-marker-sexp ()
  (interactive)
  (goto-char (car (bounds-of-thing-at-point 'sexp)))
  (call-interactively 'set-mark-command)
  (forward-sexp))
;;;###autoload
(defun ywb-create/switch-scratch ()
  (interactive)
  (let ((buf (get-buffer "*scratch*")))
    (switch-to-buffer (get-buffer-create "*scratch*"))
    (when (null buf)
      (lisp-interaction-mode))))
;;;###autoload
(defun ywb-insert-variable (var)
  (interactive (list (completing-read "Insert variable: " obarray
                                      'boundp t)))
  (let ((value (symbol-value (intern var))))
    (or (stringp value) (setq value (symbol-name value)))
    (insert value)))
;; ........ dirsize ..
;;;###autoload
(defun ywb-dired-count-dir-size ()
  (interactive)
  (let ((dir (dired-get-filename nil t)))
    (when (file-directory-p dir)
      (with-current-buffer (get-buffer-create "*Shell Command Output*")
        (erase-buffer)
        (start-process-shell-command "dirsize" (current-buffer) "/home/ywb/bin/dirsize " dir)
        (display-buffer (current-buffer))))))
;;;###autoload
(defun ywb-goto-line (percent)
  (interactive (list (or current-prefix-arg
                         (string-to-number
                          (read-from-minibuffer "Goto percent: ")))))
  (let* ((total (count-lines (point-min) (point-max)))
         (num (round (* (/ total 100.0) percent))))
    (goto-line num)))
;; .... tab .........
;;;###autoload
(defun ywb-get-column (start end)
  (interactive "r")
  (let ((cols (mapcar 'string-to-number
                      (split-string (read-from-minibuffer "cols(seperate by space): "))))
        line)
    (with-output-to-temp-buffer "*column*"
      (save-excursion
        (goto-char start)
        (while (< (point) end)
          (setq line (split-string (buffer-substring-no-properties (line-beginning-position)
                                                                   (line-end-position))
                                   "\t"))
          (princ (mapconcat 'identity (mapcar (lambda (c)
                                                (nth (1- c) line))
                                              cols) "\t"))
          (princ "\n")
          (forward-line 1))))))
;;;###autoload
(defun ywb-ibuffer-rename-buffer ()
  (interactive)
  (call-interactively 'ibuffer-update)
  (let* ((buf (ibuffer-current-buffer))
         (name (generate-new-buffer-name
                (read-from-minibuffer "Rename buffer(to new name): "
                                      (buffer-name buf)))))
    (with-current-buffer buf
      (rename-buffer name)))
  (call-interactively 'ibuffer-update))
;;;###autoload
(defun ywb-ibuffer-find-file ()
  (interactive)
  (let ((default-directory (let ((buf (ibuffer-current-buffer)))
               (if (buffer-live-p buf)
              (with-current-buffer buf
                default-directory)
            default-directory))))
    (call-interactively 'ido-find-file)))
;;;###autoload
(defun ywb-hippie-expand-filename ()
  (interactive)
  (let ((hippie-expand-try-functions-list
         '(try-complete-file-name try-complete-file-name-partially)))
    (call-interactively 'hippie-expand)))

(defvar ywb-kbd-macro
  `(("gnus-delete-letter-noconfirm" . [66 backspace 121 14]))
  "my kbd macros")
(add-to-list 'desktop-globals-to-save 'ywb-kbd-macro)
;;;###autoload
(defun ywb-install-kbd-macro (macro)
  (interactive (list (completing-read "Install kbd macro(name): "
                                      (mapcar 'car ywb-kbd-macro))))
  (setq last-kbd-macro (cdr (assoc macro ywb-kbd-macro))))
;;;###autoload
(defun ywb-save-last-kbd-macro (macro)
  (interactive "sName for last macro: ")
  (add-to-list 'ywb-kbd-macro (cons macro (copy-sequence last-kbd-macro))))
;;;###autoload
(defun ywb-sort-lines-1 (reverse beg end predicate)
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (sort-subr reverse 'forward-line 'end-of-line nil nil
                 predicate))))
;;;###autoload
(defun ywb-org-table-sort-lines (reverse beg end numericp)
  (interactive "P\nr\nsSorting method: [n]=numeric [a]=alpha: ")
  (setq numericp (string-match "[nN]" numericp))
  (org-table-align)
  (save-excursion
    (setq beg (progn (goto-char beg) (line-beginning-position))
          end (progn (goto-char end) (line-end-position))))
  (let ((col (org-table-current-column))
        (cmp (if numericp
                 (lambda (a b) (< (string-to-number a)
                                  (string-to-number b)))
               'string<)))
    (ywb-sort-lines-1 reverse beg end
                      (lambda (pos1 pos2)
                        (let ((dat1 (split-string (buffer-substring-no-properties
                                                   (car pos1) (cdr pos1))
                                                  "\\s-*|\\s-*"))
                              (dat2 (split-string (buffer-substring-no-properties
                                                   (car pos2) (cdr pos2))
                                                  "\\s-*|\\s-*")))
                          (funcall cmp (nth col dat1) (nth col dat2)))))
    (dotimes (i col) (org-table-next-field))))
;; ................. emacs ...
;;;###autoload
(defun ywb-replace-in-rectangle (beg end)
  (interactive "r\n")
  (let ((replace (query-replace-read-args "Replace string" nil)))
    (apply-on-rectangle (lambda (s e)
                          (setq s (progn (move-to-column s) (point))
                                e (progn (move-to-column e) (point)))
                          (replace-string (car replace) (cadr replace) nil s e))
                        beg end)))
;;;###autoload
(defun ywb-html-preview-region (beg end)
  (interactive "r")
  (let ((file (make-temp-file "region-" nil ".html")))
    (write-region beg end file)
    (browse-url file)))
(defvar wcy-rotate-text-definations
  '(("[0-9]+" . (lambda (arg)
                  (format "%d" (+ arg (string-to-number (match-string 0))))))
    ("zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"))
  "
a list of ROT text defination. each element is a defination.
element can be a list of string.
element can be a cons. (REGEXP . func)
if REGEXP matched, func is called with no args, return value is the next value.
")

(defun wcy-rotate-text-aux (arg)
  (catch 'break
    (mapc
     #'(lambda (def)
         (let ((regexp (if (functionp (cdr def))
                           (car def)
                         (mapconcat 'regexp-quote def "\\|")))
               (func (if (functionp (cdr def))
                         (cdr def)
                       #'(lambda (arg)
                           (let* ((len (length def))
                                  (rest (member (match-string 0) def))
                                  (pos (- len (length rest))))
                             (format "%s" (nth (mod (+ pos arg) len) def)))))))
           (if (re-search-forward regexp (line-end-position) t nil)
               (throw 'break (funcall func arg)))))
     wcy-rotate-text-definations)
    nil))

(defun wcy-rotate-text(arg)
  (interactive "p")
  (save-excursion
    (let ((x (wcy-rotate-text-aux arg)))
      (if x (replace-match x)))))
;; ........ metapost .....................
;; ....
;;;###autoload
(defun ywb-sync-id (arg)
  (interactive "p")
  (let ((end (line-end-position))
        col id)
    (save-excursion
      (when (re-search-forward "[0-9]+" (line-end-position) t)
        (setq col (- (current-column) (- (match-end 0)
                                         (match-beginning 0))))
        (forward-line -1)
        (move-to-column col)
        (when (and (= (current-column) col)
                   (looking-at "[0-9]+"))
          (setq id (string-to-number (match-string 0)))
          (while (and (progn (forward-line 1)
                             (move-to-column col)
                             (not (eobp)))
                      (looking-at "[0-9]+"))
            (delete-region (match-beginning 0) (match-end 0))
            (insert (number-to-string (setq id (1+ id))))))))))
(defun his-imenu()
  "Call imenu, showing completions."
  (interactive)
  (setq unread-command-events (list 9))
  (imenu (imenu-choose-buffer-index)))

;;;_ , sudo find file
(defvar find-file-root-prefix
  (if (featurep 'xemacs)
      "/[sudo/root@localhost]"
    "/sudo:root@localhost:" )
  "*The filename prefix used to open a file with `find-file-root'.")


(defvar find-file-root-history nil
  "History list for files found using `find-file-root'.")

(defvar find-file-root-hook nil
  "Normal hook for functions to run after finding a \"root\" file.")

(defun find-file-root ()
  "*Open a file as the root user.
   Prepends `find-file-root-prefix' to the selected file name so that it
   maybe accessed via the corresponding tramp method."
  (interactive)
  (require 'tramp)
  (let* ( ;; We bind the variable `file-name-history' locally so we can
         ;; use a separate history list for "root" files.
         (file-name-history find-file-root-history)
         (name (or buffer-file-name default-directory))
         (tramp (and (tramp-tramp-file-p name)
                     (tramp-dissect-file-name name)))
         path dir file)

    ;; If called from a "root" file, we need to fix up the path.
    (when tramp
      (setq path (tramp-file-name-path tramp)
            dir (file-name-directory path)))

    (when (setq file (read-file-name "Find file (UID = 0): " dir path))
      (find-file (concat find-file-root-prefix file))
      ;; If this all succeeded save our new history list.
      (setq find-file-root-history file-name-history)
      ;; allow some user customization
      (run-hooks 'find-file-root-hook))))

;;; my-utils.el end here

