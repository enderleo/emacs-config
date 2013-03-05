;;;_#4 my-custom.el

;; ....
(global-font-lock-mode t)
;; fill ...
(auto-fill-mode 1)
(setq default-justification 'full)
(setq adaptive-fill-mode nil)
(setq fill-column 70)
(add-hook 'text-mode-hook 'auto-fill-mode)
;; .....
(set-scroll-bar-mode nil)
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
(defvar ywb-load-path "~/.emacs.d/site-lisp/")
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
 '(org-file-apps (quote (("txt" . emacs) ("tex" . emacs) ("ltx" . emacs) ("org" . emacs) ("el" . emacs) ("gb" . emacs))))
 )

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

;;; my-custom.el end here
