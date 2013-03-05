;;;_#2 .emacs
;; .. custom-file .... M-x customize ........ Face ...
;; .....
(setq custom-file "~/.emacs.d/my-custom.el")

;; .......
(load "~/.emacs.d/my-custom.el")
(load "~/.emacs.d/elisps.el")
(load "~/.emacs.d/my-utils.el")
(load "~/.emacs.d/program.el")
(load "~/.emacs.d/program-ab.el")
(load "~/.emacs.d/vmware.el")

;; ..........................
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)

;; .. hippie-expand ........ hippie-expand ......
;; hippie-expan ........... dabbrev-expand.........
;; . Alt.
(setq hippie-expand-try-functions-list
      '(try-expand-line
        try-expand-dabbrev
        try-expand-line-all-buffers
        try-expand-list
        try-expand-list-all-buffers
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name
        try-complete-file-name-partially
        try-complete-lisp-symbol
        try-complete-lisp-symbol-partially
        try-expand-whole-kill))
(global-set-key (kbd "M-;") 'hippie-expand)
(global-set-key (kbd "M-/") 'dabbrev-expand)

;; goto-line ......... M-g g . M-g M-g...........
;; ....................
(global-set-key (kbd "M-g g") 'ywb-goto-line)

;; .....C-c .... emacs ...................
;; .....................

;; .............C-c c c.C-z n.....
;; C-z .............
(define-prefix-command 'ctl-cc-map)
(global-set-key (kbd "C-c c") 'ctl-cc-map)
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)

(global-set-key (kbd "C-c $") 'toggle-truncate-lines)

;; ffap ...........
(global-set-key (kbd "C-c j") 'ffap)

;; ................ vim . f...........
(global-set-key (kbd "C-c a") 'wy-go-to-char)

;; .... *scratch*..........................
(global-set-key (kbd "C-c b") 'ywb-create/switch-scratch)

;; .. ann77 ......... vim . C-a...............
(global-set-key (kbd "C-c d") 'wcy-rotate-text)

;; ........ hippie-expand ..................
;; ....................
(global-set-key (kbd "C-c f") 'ywb-hippie-expand-filename)

;; ........ buffer
(global-set-key (kbd "C-c l") 'his-transpose-windows)

;; .. ilovecpp ........... mode.....
(global-set-key (kbd "C-c m") 'switch-major-mode)

;; .....
(global-set-key (kbd "C-c u") 'revert-buffer)

;; .......................... frame ....
;; .................... 3:7 ...
(global-set-key (kbd "C-c w") 'ywb-favorite-window-config)

;; .. template
(global-set-key (kbd "C-c t") 'template-expand-template)

;; ..................... mode ..... compile
;; ........ makefile .... make ...
(global-set-key (kbd "C-c r") 'smart-run)
(global-set-key (kbd "C-c s") 'smart-compile)

;; ...... comment-dwim .............
(global-set-key (kbd "C-c g") 'comment-or-uncomment-region)

;; hide-show .......... elisp................
(global-set-key (kbd "C-c h") 'hs-hide-all)
(global-set-key (kbd "<f5>") 'hs-toggle-hiding)


;; imenu ...................... imenu .........
(global-set-key (kbd "C-c i") 'his-imenu)

;; ................
(global-set-key (kbd "C-c o") 'browse-url-at-point)

;; ..... elisp..... imenu
(global-set-key (kbd "C-c v") 'my-tr-imenu)

;; .... elisp ......
(global-set-key (kbd "C-c x") 'ywb-insert-variable)

;; Windmove .................... Shift+........
(when (featurep 'windmove)
  (global-set-key (kbd "C-c n") 'windmove-down)
  (global-set-key (kbd "C-c p") 'windmove-up)
  (global-set-key (kbd "C-c ,") 'windmove-left)
  (global-set-key (kbd "C-c .") 'windmove-right)
  (windmove-default-keybindings))

;; .......................
(global-set-key (kbd "C-c cc") 'eim-wbx-create-word)

;; view-mode .............. mode...... vim normal
;; mode ..............
(global-set-key (kbd "C-c cv") 'view-mode)

;; org-mode .............. org-table-convert-region .
;; org-table-export ............
(global-set-key (kbd "C-c co") 'ywb-org-table-convert-region)
(global-set-key (kbd "C-c ct") 'ywb-org-table-export-here)

;; .. speedbar ............... speedbar.frame ...
;; ......
(global-set-key (kbd "<f4>") 'speedbar-get-focus)

;; bookmark ......................
(global-set-key (kbd "<f12>") 'list-bookmarks)

;; w3m ....... html.............
(global-set-key (kbd "<f11>") 'w3m)

(global-set-key (kbd "<f8>") 'calendar)

;; .........
(global-set-key (kbd "C-'") 'comment-dwim)

;; .. C-SPC .................. w3m .....
(global-set-key (kbd "S-SPC") 'set-mark-command)

;; ................. vim ......
(global-set-key "%" 'his-match-paren)

;; .....................................
(global-set-key (kbd "C-M-=") 'ywb-indent-accoding-to-paren)

;; ... shell-command..............
(global-set-key (kbd "M-#") 'ywb-shell-command-background)

;; .... sexp.balanced-parenthesis expressions..........
;; elisp ....
(global-set-key (kbd "M-2") 'ywb-marker-sexp)

;; ..... hi-lock+... highlight-regexp... hi-lock-next ...
;; .......... vim . n . N.
(global-set-key (kbd "C-z h") 'highlight-regexp)
(global-set-key (kbd "C-z n") 'hi-lock-next)
(global-set-key (kbd "C-z p") 'hi-lock-previous)

;; ......... C-M-t..... Fterm .........
;; transpose-line ............... cperl-mode .....
;; .......muse-mode ...... url ............
(global-set-key (kbd "C-x C-t") 'transpose-sexps)

;; . emacs-wiki .......................
(global-set-key (kbd "C-x C-r") 'find-file-root)

;; dired-mode .........
;; ywb-dired-compress-dir .............
;; ywb-dired-w3m-visit . w3m .......
;; ywb-dired-jump-to-file ... ibuffer . j ...........
;; ywb-dired-count-dir-size ..........
;; ywb-dired-copy-fullname-as-kill ... w............
;; ywb-dired-quickview ... TC ............... buffer
;;   .......................... buffer
(add-hook 'dired-mode-hook (lambda ()
(define-key dired-mode-map "z" 'ywb-dired-compress-dir)
(define-key dired-mode-map "E" 'ywb-dired-w3m-visit)
(define-key dired-mode-map "j" 'ywb-dired-jump-to-file)
(define-key dired-mode-map " " 'ywb-dired-count-dir-size)
(define-key dired-mode-map "W" 'ywb-dired-copy-fullname-as-kill)
(define-key dired-mode-map "\C-q" 'ywb-dired-quickview)))

;; ann77 ... elisp..................... vim .
;; C-o . C-i.
;; .........(require 'recent-jump)...... require ...
;; ............ recent-jump .. elisp.emacs ......
;; ...... (when (featurep 'recent-jump) ...) ..........
;; . recent-jump ... load-path ......... elisp ..
(require 'recent-jump nil t)
(when (featurep 'recent-jump)
  (global-set-key (kbd "M-o") 'recent-jump-jump-backward)
  (global-set-key (kbd "M-i") 'recent-jump-jump-forward))


;; ann77 ............ shell...............
;; shell ............... Ibuffer .... buffer ...
;; shell . buffer......... buffer
(setenv "HISTFILE" "~/.emacs.d/.history")
(defun wcy-shell-mode-auto-rename-buffer (text)
  (if (eq major-mode 'shell-mode)
      (rename-buffer  (concat "*shell: " default-directory "*") t)))
(add-hook 'comint-output-filter-functions 'wcy-shell-mode-auto-rename-buffer)
(defun wcy-shell-mode-hook-func  ()
   (set-process-sentinel (get-buffer-process (current-buffer))
                            #'wcy-shell-mode-kill-buffer-on-exit))
(defun wcy-shell-mode-kill-buffer-on-exit (process state)
  (shell-write-history-on-exit process state)
  (kill-buffer (process-buffer process)))
(defun ywb-shell-mode-hook nil
  (wcy-shell-mode-hook-func)
  ;; .. ansi-color.
  (ansi-color-for-comint-mode-on)
  ;; .. abbrev
  (abbrev-mode t))
(add-hook 'shell-mode-hook 'ywb-shell-mode-hook)

;; .......................desktop .....
;; . ywb-load-slow-part .. t................
(defvar ywb-load-slow-part nil)
(unless ywb-load-slow-part
  (add-to-list 'load-path "~/.emacs.d/site-lisp/eim")
  (autoload 'eim-use-package "eim" "Another emacs input method")

  ;; ......
  (register-input-method
   "eim-wb" "euc-cn" 'eim-use-package
   ".." "......." "~/.emacs.d/site-lisp/eim/wb.txt")
  (setq default-input-method "eim-wb")
  (register-input-method
   "eim-py" "euc-cn" 'eim-use-package
   ".." "......." "~/.emacs.d/site-lisp/eim/py.txt")
  (require 'eim-extra nil t)
  (when (featurep 'eim-extra)
    (global-set-key "\\" 'eim-insert-ascii))

  ;; (require 'emms nil t)
  ;; (when (featurep 'emms)
  ;;   (load "~/.emacs.d/emms-init.el"))

  ;; (require 'muse nil t)
  ;; (when (featurep 'muse)
  ;;   (load "~/.emacs.d/muse-init.el"))

  (when (featurep 'desktop)
    (desktop-save-mode 1)
    (condition-case nil
        (desktop-read)
      (error nil)))
  (appt-activate t)
  (setq ywb-load-slow-part t))

;; color-theme
(add-to-list 'load-path "~/.emacs.d/site-map/color-theme/color-theme.el")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
    (color-theme-initialize)
    (color-theme-tty-dark)))

(setq linum-format "%d  ")

;;; .emacs end here
