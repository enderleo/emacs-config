;;;_#4 my-custom.el

;; ....
(global-font-lock-mode t)
;; fill ...
(auto-fill-mode 1)
(setq default-justification 'full)
(setq adaptive-fill-mode nil)
(setq fill-column 80)
(add-hook 'text-mode-hook 'auto-fill-mode)
;; .....
(if (display-graphic-p)
    (set-scroll-bar-mode nil))
;; ......
(setq inhibit-startup-message t)
;; .....
(tool-bar-mode -1)
;; ...........
(setq ring-bell-function 'ignore)
;; ....
(setq truncate-partial-width-windows nil)
;; . mode-line .....
(setq column-number-mode t)
;; .. C-k ....
(setq-default kill-whole-line t)
;; .. kill-ring ...
(setq kill-ring-max 50)
;; .. TAB .........
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-stop-list nil)
;; . mode-line .....
(display-time-mode t)
(setq display-time-format "%m.%d.")
;; .. sentence-end .......
(setq sentence-end "\\([...]\\|\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
;; ... fill ........
(setq sentence-end-double-space nil)
;; ..... 3 .....
(setq scroll-margin 3
      scroll-conservatively 10000)
;; ......
(setq default-major-mode 'text-mode)
;; ......, ................
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; ...........
(mouse-avoidance-mode 'animate)
;; ......
(auto-image-file-mode t)
;; ........
(transient-mark-mode t)
;; ....
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(setq backup-by-copying t)
;; .......
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)
;; ....
(setq default-directory "~/")
;; ....... template ..... elisp ......
(setq user-full-name "Ye Wenbin")
(setq user-mail-address "wenbinye@163.com")
;; WoMan ..... frame
(setq woman-use-own-frame nil)
;; diary.todo.calendar .........
(setq diary-file "~/.emacs.d/diary")
(setq todo-file-do "~/.emacs.d/todo-do")
(setq todo-file-done "~/.emacs.d/todone-done")
(setq todo-file-top "~/.emacs.d/todone-top")
(add-hook 'initial-calendar-window-hook (lambda () (toggle-truncate-lines 1)))
;; ... yes-or-no... y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)
;; ........... print ..emacs ..
(fset 'print-buffer 'ignore)
(setq lpr-command "")
(setq printer-name "")
;; .. emacs ...
(setq frame-title-format "emacs@%b %f")
;; ..............
(defvar ywb-emacs-lisp-path
  (expand-file-name (concat data-directory "../site-lisp/")))
;; ... windows ......... Ubuntu ........
(defvar ywb-load-path
  (concat extra-emacs-directory "/site-lisp/"))
(add-to-list 'load-path ywb-load-path)
(let ((default-directory ywb-load-path))
  (load "subdirs.el"))

;; ..... Info ..
(dolist (path '("/media/hdb1/Programs/Emacs/home/info/perlinfo"
                "/media/hdb1/Programs/Emacs/home/info"
                "~/info" "~/info/perlinfo"))
  (add-to-list 'Info-default-directory-list path))

;; ........... shell .. tab .....
(add-to-list 'exec-path "~/bin")

;; .. C Source ....... emacs ........ c-h f ....
;; C .........
(setq find-function-C-source-directory (concat data-directory "../src"))

;; .. C-x C-c ...........
(setq kill-emacs-query-functions
      (lambda ()
        (y-or-n-p "Do you really want to quit? ")))

;; .. abbrev ....
(setq abbrev-file-name "~/.emacs.d/.abbrev_defs")

;; .................. windows .........
;; HOME..... cygwin ...... Application Data(emacs ...
;; HOME ...) ..... .emacs ........
;;    (setenv "HOME" "d:/emacs/home")
;;    (load "~/.emacs")
;; ..................... Application Data .......
;; ............
(setq abbreviated-home-dir nil)

;; .... Linux .......... emacs ........
(when (eq window-system 'x)
  (setq x-select-enable-clipboard t))

;; appt-message-warning-time ... appt ........
;; ediff-split-window-function .. ediff ........
;; muse ....... muse-init.el ........ customize .......
;; ........
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(appt-display-diary nil)
 '(appt-display-duration 5)
 '(appt-message-warning-time 0)
 '(comint-completion-addsuffix t)
 '(comint-completion-autolist t)
 '(comint-input-ignoredups t)
 '(comint-move-point-for-output t)
 '(comint-scroll-show-maximum-output t)
 '(comint-scroll-to-bottom-on-input t)
 '(diff-switches "-utbB")
 '(ediff-split-window-function (quote split-window-horizontally))
 '(grep-command "grep -nH \"\"")
 '(muse-colors-autogen-headings (quote outline))
 '(muse-colors-inline-image-method (quote muse-colors-use-publishing-directory))
 '(muse-colors-inline-images nil)
 '(muse-file-extension "muse")
 '(muse-file-regexp "[/?]\\|\\.\\(html?\\|pdf\\|mp3\\|el\\|zip\\|org\\|txt\\|tar\\)\\(\\.\\(gz\\|bz2\\)\\)?\\'")
 '(muse-html-charset-default "utf-8")
 '(muse-html-encoding-default (quote utf-8))
 '(muse-html-markup-functions (quote ((anchor . muse-html-markup-anchor) (table . muse-html-markup-table) (footnote . muse-html-markup-footnote))))
 '(muse-html-meta-content-encoding (quote utf-8))
 '(muse-html-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"all\" href=\"../css/core.css\" />")
 '(muse-latex-header "~/.emacs.d/templates/header.tex")
 '(muse-publish-desc-transforms (quote (muse-wiki-publish-pretty-title muse-wiki-publish-pretty-interwiki muse-publish-escape-specials-in-string)))
 '(muse-wiki-publish-small-title-words (quote ("the" "and" "at" "on" "of" "for" "in" "an" "a" "page" "anime")))
 '(org-agenda-files (quote ("~/workspace/projects/snippets/todo/my-project.org" "~/workspace/projects/snippets/todo/work.org")))
 '(org-file-apps (quote (("txt" . emacs) ("tex" . emacs) ("ltx" . emacs) ("org" . emacs) ("el" . emacs) ("gb" . emacs))))
 '(semantic-c-dependency-system-include-path (quote ("/usr/include"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(emms-playlist-selected-face ((t (:background "cornflower blue" :foreground "black" :weight bold))))
 '(emms-playlist-track-face ((t (:foreground "red"))))
 '(muse-link ((t (:foreground "blue" :underline "blue" :weight bold))))
 '(muse-link-face ((t (:foreground "blue" :underline "blue" :weight bold)))))

;; .........
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; set shell path...................
;; mac...texlive...others...........
;; win...putty...plink..............
(cond
 ((eq system-type 'darwin)
  (setenv "PATH"
          (concat "/usr/local/texlive/2012basic/bin/universal-darwin" ":"
                  "/opt/local/bin" ":"
                  (getenv "PATH"))))
 ((eq system-type 'windows-nt)
  (setenv "PATH"
          (concat (getenv "PATH")
                  ";" "C:/Program Files (x86)/PuTTY"
                  ";" "C:/Users/lhu/Workspace/texlive/bin/win32"
                  ";" "C:/Users/lhu/Workspace/gnuwin32/bin"
                  ";" "C:/Users/lhu/Workspace/mingw64/bin"
                  ";" "C:/Users/lhu/Workspace/gadgets"
                  ";" "C:/Users/lhu/Aspell/bin"
                  ";" "C:/Python27")))
 ((eq system-type 'gnu/linux)
  (setenv "PATH"
          (concat "/dbc/pek2-dbc102/lhu/gadgets/bin:"
                  (getenv "PATH"))))
 )

;; exec-path........................
;; win...gtk...pscp...gadgets.......
;; win...gnuwin32...gs...python.....
;; win...gsview...w3m...aspell......
(cond
 ((eq system-type 'windows-nt)
  (mapc (function (lambda (x) (add-to-list 'exec-path x)))
        '("C:/Program Files (x86)/Common Files/GTK/2.0/bin"
          "C:/Program Files (x86)/PuTTY"
          "~/gadgets"
          "~/mingw64/bin"
          "~/gnuwin32/bin"
          "~/texlive/bin/win32"
          "~/gs/gs9.07/bin"
          "C:/Python27"
          "~/gs/Ghostgum/gsview"
          "C:/Program Files/emacs-24.2/w3m"
          "~/Aspell/bin")))
 ;; ((eq system-type 'gnu/linux)
 ;;  (mapc (function (lambda (x) (add-to-list 'exec-path x)))
 ;;        '("/dbc/pek2-dbc102/lhu/gadgets/bin")))
)

(setq stack-trace-on-error t)

;; org...todo-list.................
;; sequences...types...faces.......
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s@)" "BLOCKED(b@/!)" "|" "DONE(d!)" "CANCELED(c@)")
        (type "Leon(l)" "Peyton(p)" "|" "DONE(d)")))
(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("STARTED" . "cyan")
        ("BLOCKED" . (:foreground "dark violet" :weight bold))
        ("CANCELED". (:forground "dark orange" :weight bold))))

;; brower...chromium...............
(when window-system
  (cond
   ((eq system-type 'gnu/linux)
    (setq browse-url-browser-function 'browse-url-firefox
          browse-url-new-window-flag t
          browse-url-firefox-new-window-is-tab t))
   ((eq system-type 'darwin)
    (setq browse-url-browser-function 'browser-url-default-macosx-browser))
   ((eq system-type 'windows-nt)
    (setq browse-url-browser-function 'browser-url-default-windows-browser))
   ))

;; auto-compile....................
(setq load-prefer-newer t)
(when (require 'auto-compile)
  (auto-compile-on-load-mode 1)
  (auto-compile-on-save-mode 1))

;;; my-custom.el end here
