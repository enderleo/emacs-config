;;;_#3 elisps.el

;;;_ , dired
;; dired-x . dired-mode .....................
;; 1. ................... dired-omit-extensions .
;;    dired-omit-files
;; 2. ....... shell .........
;;    dired-guess-shell-alist-default. ...... "!" ........
;; .. dired-mode ..................
;; dired-compare-directories ..........
(require 'dired-x nil t)
(when (featurep 'dired-x)
  (add-hook 'dired-load-hook
            (function (lambda ()
                        (load "dired-x")
                        ;; Set global variables here.  For example:
                        ;; (setq dired-guess-shell-gnutar "gtar")
                        )))
  (add-hook 'dired-mode-hook
            (function (lambda ()
                        ;; Set buffer-local variables here.  For example:
                        (setq dired-omit-files-p t)
                        )))

  (setq dired-omit-extensions
        '(
          ".svn/" "CVS/" ".o" "~" ".bin" ".bak" ".obj" ".map" ".ico"
          ".pif" ".lnk" ".a" ".ln" ".blg" ".bbl" ".dll" ".drv" ".vxd"
          ".386" ".elc" ".lof" ".glo" ".idx" ".lot" ".fmt" ".tfm"
          ".class" ".lib" ".mem" ".x86f" ".sparcf" ".fasl"
          ".ufsl" ".fsl" ".dxl" ".pfsl" ".dfsl" ".lo" ".la" ".gmo"
          ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr"
          ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo"
          ".idx" ".lof" ".lot" ".glo" ".blg" ".bbl" ".cps" ".fn"
          ".fns" ".ky" ".kys" ".pg" ".pgs" ".tp" ".tps" ".vr" ".vrs"
          ".pdb" ".ilk"))

  (setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\.\\|^~")
  (add-to-list 'dired-guess-shell-alist-default '("\\.dvi$" "dvipdfmx"))
  (add-to-list 'dired-guess-shell-alist-default '("\\.pl$" "perltidy"))
  )

;; dired-mode ......
(defun my-dired-long-lines ()
  (setq truncate-lines t))
(add-hook 'dired-after-readin-hook 'my-dired-long-lines)

;; wdired ................... dired-mode .....
;; .................................
(require 'wdired nil t)
(when (featurep 'wdired)
  (autoload 'wdired-change-to-wdired-mode "wdired")
  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode))

;; ...........
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
;; ......... emacs ..........................
(setq dired-dwim-target t)

;; ....... windows .. X ................
;; This allows "X" in dired to open the file using the explorer
;; settings. From TBABIN(at)nortelnetworks.com ToDo: adapt
;; mswindows-shell-execute() for XEmacs or use tinyurl shell exec
(when (and (string-match "GNU" (emacs-version))
           (string= window-system "w32"))
  (defun dired-custom-execute-file (&optional arg)
    (interactive "P")
    (mapcar #'(lambda (file)
                (w32-shell-execute "open" (convert-standard-filename file)))
            (dired-get-marked-files nil arg)))
  (defun dired-custom-dired-mode-hook ()
    (define-key dired-mode-map "X" 'dired-custom-execute-file))
  (add-hook 'dired-mode-hook 'dired-custom-dired-mode-hook))

;;;_ , ido
;; ido .......... buffer ......
(require 'ido nil t)
(when (featurep 'ido)
  (ido-mode 1)
  (setq ido-save-directory-list-file "~/.emacs.d/_ido_last"))

;;;_ , ibuffer
;; ibuffer . buffer ....... dired ............
(require 'ibuffer nil t)
(require 'ibuf-ext nil t)
(when (featurep 'ibuffer)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  ;; ............... buffer ....
  (define-key ibuffer-mode-map "r" 'ywb-ibuffer-rename-buffer)
  ;; .. C-x C-f ...... default-directory .........
  (define-key ibuffer-mode-map (kbd "C-x C-f") 'ywb-ibuffer-find-file)
  (define-key ibuffer-mode-map " " 'scroll-up)
  ;; .. buffer ..... buffer ............. buffer .
  ;; ..........
  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (setq ibuffer-filter-groups
                    '(
                      ("*buffer*" (name . "\\*.*\\*"))
                      ("TAGS" (name . "^TAGS\\(<[0-9]+>\\)?$"))
                      ("dired" (mode . dired-mode))
                      ("perl" (mode . cperl-mode))
                      ("elisp" (or (mode . emacs-lisp-mode)
                                   (mode . lisp-interaction-mode)))
                      ))))
  ;; filter ......... *Ibuffer* .. /-r .........
  ;; buffer ....
  (setq ibuffer-saved-filters
      '(("t" ((or (mode . latex-mode)
                 (mode . plain-tex-mode))))
        ("c" ((or (mode . c-mode)
                 (mode . c++-mode))))
        ("p" ((mode . cperl-mode)))
        ("e" ((or (mode . emacs-lisp-mode)
                  (mode . lisp-interaction-mode))))
        ("d" ((mode . dired-mode)))
        ("s" ((mode . shell-mode)))
        ("i" ((mode . image-mode)))
        ("h" ((mode . html-mode)))
        ("gnus" ((or (mode . message-mode)
                     (mode . mail-mode)
                     (mode . gnus-group-mode)
                     (mode . gnus-summary-mode)
                     (mode . gnus-article-mode))))
        ("pr" ((or (mode . emacs-lisp-mode)
                   (mode . cperl-mode)
                   (mode . c-mode)
                   (mode . c++-mode)
                   (mode . php-mode)
                   (mode . java-mode)
                   (mode . idl-mode)
                   (mode . lisp-interaction-mode))))
        ("m" ((mode . muse-mode)))
        ("w" ((or (mode . emacs-wiki-mode)
                  (mode . muse-mode))))
        ("*" ((name . "*")))
        ))
  )

;;;_ , gnuserv
;; gnuserv ...... emacs ........... emacs.. Windows
;; ......
;;;;(require 'gnuserv nil t)
;;;;(when (featurep 'gnuserv)
;;;;  (gnuserv-start)
;;;;  (setq gnuserv-frame (selected-frame))
;;;;  (setenv "GNUSERV_SHOW_EMACS" "1"))

;;;_ , winner
;; winner ..................
(require 'winner nil t)
(when (featurep 'winner)
  (winner-mode 1))

;;;_ , session
;; session ..............
(require 'session nil t)
(when (featurep 'session)
  (setq session-save-file "~/.emacs.d/_session")
  (setq session-save-file-coding-system 'chinese-gbk)
  ;; org-mark-ring ................ org-mode .....
  ;; emacs ..
  (add-to-list 'session-globals-exclude 'org-mark-ring)
  (add-hook 'after-init-hook 'session-initialize))

;;;_ , view-mode
;; . view-mode .. vim ....
(setq view-mode-hook
      (lambda ()
        (define-key view-mode-map "h" 'backward-char)
        (define-key view-mode-map "l" 'forward-char)
        (define-key view-mode-map "j" 'next-line)
        (define-key view-mode-map "k" 'previous-line)))

;;;_ , time-stamp
;; ........ time-stamp..... time-stamp ......
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(add-hook 'write-file-hooks 'time-stamp)
;; ....... emacs ..... "%U %:y-%02m-%02d %02H:%02M:%02S"
;; ........................
;; (setq time-stamp-format '(time-stamp-yyyy-mm-dd time-stamp-hh:mm:ss user-full-name))
(setq time-stamp-format "%U %:y-%02m-%02d %02H:%02M:%02S")

;;;_ , template
;; .................. ~/.templates/ ....
(require 'template nil t)
(when (featurep 'template)
  (template-initialize))

;;;_ , ..
;; ....... buffer...........
(require 'desktop nil t)

;; ......
(require 'jka-compr nil t)

;; .... M-y .. kill-ring ...
(require 'browse-kill-ring nil t)
(when (featurep 'browse-kill-ring)
  (browse-kill-ring-default-keybindings))

;; ....... elisp
(require 'windmove nil t)

(require 'recent-jump nil t)

;; ....... hi-lock+ ...autoload ..............
;; . elisp..............................
;; .................
(dolist (cm '(hi-lock-previous
              hi-lock-next
              toggle-tabs-font-lock
              toggle-trailing-whitespace-font-lock
              toggle-whitespace-font-lock))
  (autoload cm "hi-lock+" "Hi-lock assist command" t))

;; org-mode ....... elisp...................
;; .................
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook
          (lambda ()
            ;; org-table-sort-lines . windows .......
            (define-key org-mode-map (kbd "C-c ^") 'ywb-org-table-sort-lines)))
;; ....... html .............
(setq org-export-with-sub-superscripts nil)

;; ......... mode
(add-to-list 'auto-mode-alist '("\\.fa\\|\\.gb" . dna-mode))
(autoload 'dna-mode "dna-mode" "Major mode for dna sequence file")
(add-hook 'dna-mode-hook
          (lambda ()
            (define-key dna-mode-map "\C-ch" 'hide-sublevels)
            (outline-minor-mode)))

;; ..... elisp
(autoload 'wb-line-number-toggle "wb-line-number" nil t)

;; .......... elisp
(autoload 'type-test "type-test" "typing test" t)

;; occur ........ occor ...............
(add-hook 'occur-mode-hook (lambda () (setq truncate-lines t)))

;; ...........
(autoload 'eight-puzzle "eight-puzzle" "A game write by me" t)

;; .......... ascii .. elisp............. M-x ascii-table-show
(autoload 'ascii-on "ascii" "Turn on ASCII code display." t)

;; crazycool .............. BBS ......
(autoload 'ansit-ansify-this "ansit"  "Ansi the region." t)

;; .... ffap .... windows ...
(setq ffap-string-at-point-mode-alist
      '((file "--:\\\\$+<>@-Z_a-z~*?" "<@" "@>;.,!:")
        (url "--:=&?$+@-Z_a-z~#,%;*" "^A-Za-z0-9" ":;.,!?")
        (nocolon "--9$+<>@-Z_a-z~" "<@" "@>;.,!?")
        (machine "-a-zA-Z0-9." "" ".")
        (math-mode ",-:$+<>@-Z_a-z~`" "<" "@>;.,!?`:")))

;; .............
(setq tetris-update-speed-function
      (lambda (shapes rows)
        (/ 10.0 (+ 80.0 rows))))

;;;_ , w3m
;; w3m ....
(require 'w3m-load nil t)
(add-hook 'w3m-mode-hook
          (lambda ()
            (defun ywb-w3m-goto-url (url)
              (if (and url (stringp url))
                  (w3m-goto-url url)))
            ;; .... global-map .....w3m ..........
            (local-unset-key "\C-xb")
            ;; ... info .....
            (define-key w3m-mode-map "n" (lambda nil (interactive) (ywb-w3m-goto-url w3m-next-url)))
            (define-key w3m-mode-map "p" (lambda nil (interactive) (ywb-w3m-goto-url w3m-previous-url)))
            (define-key w3m-mode-map "t" (lambda nil (interactive) (ywb-w3m-goto-url w3m-contents-url)))
            ))

;; ........... next, previous, contents url.
(add-hook 'w3m-load-hook
          (lambda ()
            (add-to-list 'w3m-relationship-estimate-rules
                         `(w3m-relationship-simple-estimate
                           ""
                           ,(concat "<a href=" w3m-html-string-regexp
                                    ">.\\{,25\\}\\(?:next\\|.\\|.\\)")
                           ,(concat "<a href=" w3m-html-string-regexp
                                    ">.\\{,25\\}\\(?:prev\\|.\\|.\\)")
                           nil
                           ,(concat "<a href=" w3m-html-string-regexp
                                    ">.\\{,25\\}\\(?:index\\|..\\)")
                           ))))

;;;_ , AutoHotKeys
;; AutoHotKeys . windows .............
;; ahk-syntax-directory .........
(require 'ahk-mode nil t)
(when (featurep 'ahk-mode)
  (defun ahk-run ()
    (interactive)
    (w32-shell-execute "open" (convert-standard-filename buffer-file-name)))
  (add-hook 'ahk-mode-hook (lambda ()
                             (define-key ahk-mode-map (kbd "C-c r") 'ahk-run)))
  (setq ahk-syntax-directory
        (concat ywb-emacs-lisp-path "goodies/Syntax")))

;;; elisps.el end here

