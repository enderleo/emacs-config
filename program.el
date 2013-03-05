;;;_#5 program.el
;; . etags ............. TAGS ..
(setq tags-table-list '("." ".." "../.."))

;;;_ , hideshow
;; .... mode ... hideshow
(require 'hideshow nil t)
(when (featurep 'hideshow)
  (dolist (hook '(c++-mode-hook c-mode-hook emacs-lisp-mode-hook
                                cperl-mode-hook))
    (add-hook hook 'hs-minor-mode)))

;; .... my-tree-imenu .. imenu..........
(setq my-tr-mode-image-directory "/media/hdb1/Programs/Emacs/etc/images/tree/")
(autoload 'my-tr-imenu "my-tree-imenu" "Tree imenu" t)

;;;_ , smart-compile
;; smart compile ........ elisp...................
;; .. compile . run ...............
;; smart-executable-alist ...... smart-run ..... compile...
;; .................... smart-compile ...
(require 'smart-compile nil t)
;;   %F  absolute pathname            ( /usr/local/bin/netscape.bin )
;;   %f  file name without directory  ( netscape.bin )
;;   %n  file name without extention  ( netscape )
;;   %e  extention of file name       ( bin )
(when (featurep 'smart-compile)
(setq smart-compile-alist
      '(("\\.c$"          . "g++ -o %n %f")
        ("\\.[Cc]+[Pp]*$" . "g++ -o %n %f")
        ("\\.java$"       . "javac %f")
        ("\\.f90$"        . "f90 %f -o %n")
        ("\\.[Ff]$"       . "f77 %f -o %n")
        ("\\.mp$"         . "runmpost.pl %f -o ps")
        ("\\.php$"        . "php %f")
        ("\\.tex$"        . "latex %f")
        ("\\.l$"          . "lex -o %n.yy.c %f")
        ("\\.y$"          . "yacc -o %n.tab.c %f")
        ("\\.py$"         . "python %f")
        ("\\.sql$"        . "mysql < %f")
        ("\\.ahk$"        . "start d:\\Programs\\AutoHotkey\\AutoHotkey %f")
        ("\\.sh$"         . "./%f")
        (emacs-lisp-mode  . (emacs-lisp-byte-compile))))
(setq smart-run-alist
      '(("\\.c$"          . "./%n")
        ("\\.[Cc]+[Pp]*$" . "./%n")
        ("\\.java$"       . "java %n")
        ("\\.php$"        . "php %f")
        ("\\.m$"          . "%f")
        ("\\.scm"         . "%f")
        ("\\.tex$"        . "dvisvga %n.dvi")
        ("\\.py$"         . "python %f")
        ("\\.pl$"         . "perl \"%f\"")
        ("\\.pm$"         . "perl \"%f\"")
        ("\\.bat$"        . "%f")
        ("\\.mp$"         . "mpost %f")
        ("\\.ahk$"        . "start d:\\Programs\\AutoHotkey\\AutoHotkey %f")
        ("\\.sh$"         . "./%f")))
(setq smart-executable-alist
      '("%n.class"
        "%n.exe"
        "%n"
        "%n.mp"
        "%n.m"
        "%n.php"
        "%n.scm"
        "%n.dvi"
        "%n.py"
        "%n.pl"
        "%n.ahk"
        "%n.pm"
        "%n.bat"
        "%n.sh")))

;;;_ , ......
;; emacs21 .... number-sequence ...............
;; (require 'cl) .. loop .......
;; (when (not (fboundp 'number-sequence))
;;   (defun number-sequence (from &optional to inc)
;;     (if (and to (<= from to))
;;         (cons from
;;               (number-sequence (+ from (or inc 1)) to inc)))))
;; .......... subr.el .............. number-sequence
;; ........
(defun my-mode-common-hook ()
  (setq tab-width 4)
  (set (make-local-variable 'tab-stop-list) (number-sequence tab-width 80 tab-width))
  (abbrev-mode t)
  (setq c-basic-offset tab-width))

;;;_ , C & C++
(autoload 'cc-mode "cc-mode" "c & c++ mode" t)
(defun my-c-mode-common-hook ()
  (c-set-style "k&r")
  (setq c-basic-offset tab-width)
  (my-mode-common-hook)
  (c-toggle-auto-hungry-state t)
  (c-toggle-hungry-state t)
  (c-toggle-auto-state t)
  (setq local-abbrev-table c-mode-abbrev-table))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-hook 'my-c-mode-common-hook)
;; .. ffap . c-mode .......windows ......
;; (setq ffap-c-path
;;       (append ffap-c-path
;;               '("e:/Programs/MSYS/mingw/include/"
;;                 "e:/Programs/MSYS/mingw/include/c++/3.4.0/")))

;; ;;;_ , Perl
;; (autoload 'cperl-mode "cperl-mode" "cperl mode" t)
;; ;; emacs . perl-mode . cperl-mode.cperl-mode ........
;; (defalias 'perl-mode 'cperl-mode)
;; ;; ....... emacs .. perl ....
;; (autoload 'run-perl "inf-perl" "perl shell" t)
;; ;; pod-mod . cperl-mode .. pod ......
;; (autoload 'pod-mode "pod-mode" "A major mode to edit pod" t)
;; (add-hook 'cperl-mode-hook 'my-mode-common-hook)

;; ;; windows ......... cpan ........ppm ..... emacs ....
;; ;; (add-hook 'shell-mode-hook (lambda () (insert "set PERLIO=:unix")
;; ;;                              (call-interactively 'comint-send-input)))
;; (add-hook 'cperl-mode-hook
;;           (lambda()
;;             (cperl-set-style "CPerl")
;;             ;; ..........
;;             (setq cperl-indent-parens-as-block t)
;;             ;; ..........
;;             (setq cperl-invalid-face nil)
;;             ;; .. ; . } ....
;;             (setq cperl-auto-newline t)
;;             (setq cperl-continued-statement-offset 4)
;;             (setq cperl-indent-level 4)
;;             ;; windows .. pod .......................
;;             (define-key cperl-mode-map (kbd "C-c C-l") 'font-lock-fontify-buffer)
;;             ;; fill .. perl .......................
;;             (define-key cperl-mode-map (kbd "C-c C-f") 'cperl-perldoc)))

;; ;; .. perltidy ....... cperl-mode
;; (add-to-list 'auto-mode-alist '("\\.tdy$" . perl-mode))
;; ;; ...........
;; (setenv "PERL5LIB" "/home/ywb/proj/perl/lib/perl/5.8.7:/home/ywb/proj/perl/share/perl/5.8.7")

;; ;; ......... LWP::UserAgent ......... ffap ...
;; ;; File:: ...... url ........
;; (setq ffap-perl-inc-dirs
;;       (split-string (shell-command-to-string
;;                      "perl -e \"print join(q/ /, @INC);\"")))
;; (defun my-cperl-ffap-locate (name &optional arg)
;;   "Return cperl module for ffap"
;;   (let* ((file (if arg name (ffap-string-at-point)))
;;          (r (replace-regexp-in-string ":" "/"  (file-name-sans-extension file)))
;;          (e (replace-regexp-in-string "//" "/" r))
;;          (x (ffap-locate-file e '(".pm" ".pl" ".xs") ffap-perl-inc-dirs)))
;;     x))
;; (add-to-list 'ffap-alist '(cperl-mode . my-cperl-ffap-locate))
;; ;; ............ mode ......
;; ;;;###autoload
;; (defun ywb-cperl-find-file (file)
;;   (interactive "s")
;;   (setq file  (my-cperl-ffap-locate file t))
;;   (if (and file
;;            (stringp file)
;;            (file-exists-p file))
;;       (find-file file)
;;     (message "No such file: %s" file)))
;; ;; windows .. cperl-perldoc ........... ywb-cperl-perldoc
;; ;; ....... shell-command .. perldoc ...... C-u ....
;; ;; .. w3m ......... w3m . perldoc -f func ........
;; ;; ........ cperl-mode-map . C-c C-f ........
;; (setq ywb-cperl-html-dir
;;       (append
;;        (mapcar (lambda (path)
;;                  (concat "/media/hdb1/Programs/Perl/html/" path))
;;                '("lib/" "site/lib/" "lib/Pod/"))
;;        '("/home/ywb/downloads/perldoc-html/")))
;; (defun ywb-cperl-perldoc (file)
;;   (interactive (list (let ((word (current-word))
;;                            (case-fold-search nil))
;;                        (if (stringp word)
;;                            (or (string-match "[A-Z]" word)
;;                                (setq word (concat "-f " word)))
;;                          (setq word ""))
;;                        (replace-regexp-in-string "^\\s-*" ""
;;                                                  (read-from-minibuffer (concat "perldoc ") word)))))
;;   (if (null current-prefix-arg)
;;       (shell-command (concat "perldoc " file))
;;     (require 'w3m)
;;     (setq file (replace-regexp-in-string "::" "/" file))
;;     (setq file (ffap-locate-file file '(".html") ywb-cperl-html-dir))
;;     (when (and file (file-exists-p file))
;;       (w3m-goto-url (if (string-match "^[a-zA-Z]:" file)
;;                         (ywb-convert-to-cygwin-path file)
;;                       (concat "file://" file))))))

;;;_ , ..
;; . lisp-interactive-mode .. ffap.
;(add-to-list 'ffap-alist '(lisp-interaction-mode . ffap-el-mode))

;; R
(autoload 'R "ess-site" "run R" t)
(autoload 'R-mode "ess-site" "run R" t)

;; windows ...... mode
(add-to-list 'auto-mode-alist '("\\.bat$" . bat-mode))
(autoload 'bat-mode "bat-mode" "Bat mode for Windows batch file" t)

;; ... scheme-mode . switch .........
(setq scheme-program-name "mzscheme")
(setq scheme-mode-hook
      (lambda ()
        (defun switch-to-scheme (eob-p)
          "Switch to the scheme process buffer.
With argument, position cursor at end of buffer."
          (interactive "P")
          (if (or (and scheme-buffer (get-buffer scheme-buffer))
                  (scheme-interactively-start-process))
              (pop-to-buffer scheme-buffer t)
            (error "No current process buffer.  See variable `scheme-buffer'"))
          (when eob-p
            (push-mark)
            (goto-char (point-max))))
        (my-mode-common-hook)))

(add-hook 'html-mode-hook (lambda ()
(define-key html-mode-map (kbd "<C-return>") 'ywb-html-insert-newline)
))

;; css-mode
(autoload 'css-mode "css-mode" "Mode for editing CSS files" t)
(add-hook 'css-mode-common-hook 'my-mode-common-hook)
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

;; python-mode
(autoload 'python-mode "python" "Python editing mode." t)
(add-hook 'python-mode-common-hook 'my-mode-common-hook)

;; emacs-lisp-mode :
(add-hook 'emacs-lisp-mode-hook 'my-mode-common-hook)

;; sgml-mode :
(add-hook 'sgml-mode-hook 'my-mode-common-hook)

;; javascript-mode
(autoload 'javascript-mode "javascript-mode" "JavaScript mode" t)

;;{{{ php-mode : add php support
;; (require 'php-mode)
(autoload 'php-mode "php-mode" "php mode" t)
(add-hook 'php-mode-common-hook 'my-mode-common-hook)

(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))

;; metapost ....... smart-compile ..... runmpost .....
;; ......ywb-install-kbd-macro ..............
;; macro . desktop .......................
;; last-kbd-macro . C-x e ...
(setq meta-common-mode-hook
      (lambda ()
        (abbrev-mode 1)
        (define-key meta-mode-map ";"
          (lambda nil (interactive) (insert ";")
            (reindent-then-newline-and-indent)))
        (ywb-install-kbd-macro "sync-id"))
      )
;; .. MPINPUTS ...... metapost .......
(setenv "MPINPUTS" "e:/Programs/emacs/home/proj/mpost/;")

;; sql-mode .. sql-send-line ............
(defun ywb-sql-send-line ()
  (interactive)
  (sql-send-region (line-beginning-position) (line-end-position)))
(add-hook 'sql-mode-hook
          (lambda ()
            (define-key sql-mode-map (kbd "C-c C-j") 'ywb-sql-send-line)))

;;; program.el end here

