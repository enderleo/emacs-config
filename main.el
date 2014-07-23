;;;_#2 main.el
;; .. custom-file .... M-x customize ........ Face ...
;; .....
(setq custom-file (concat extra-emacs-directory
                          "/my-custom.el"))

;; .......
(load (concat extra-emacs-directory
              "/my-custom.el"))
(load (concat extra-emacs-directory
              "/elisps.el"))
(load (concat extra-emacs-directory
              "/my-utils.el"))
(load (concat extra-emacs-directory
              "/cedet.el"))
(load (concat extra-emacs-directory
              "/program.el"))
(load (concat extra-emacs-directory
              "/program-ab.el"))
(load (concat extra-emacs-directory
              "/vmware.el"))
(load (concat extra-emacs-directory
              "/package.el"))

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
(setenv "HISTFILE" (concat "~/.emacs.d/.history"))
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

;; ......lhu..........configuration........

;; color-theme
(add-to-list 'load-path (concat extra-emacs-directory
                                "/site-map/color-theme/color-theme.el"))
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
    (color-theme-initialize)
    (if (display-graphic-p)
        (if (eq system-type 'windows-nt)
            (color-theme-calm-forest)
          (color-theme-gray30))
      (if (eq system-type 'gnu/linux)
          (color-theme-clarity)
        (color-theme-renegade)))
      ))

;; w2m...configuration...
(when (require 'w3m-load nil t)
  (setq mm-text-html-renderer 'w3m)
  (unless window-system
    (setq browse-url-browser-function 'w3m-browse-url))
  (setq w3m-coding-system 'utf-8
        w3m-file-coding-system 'utf-8
        w3m-file-name-coding-system 'utf-8
        w3m-input-coding-system 'utf-8
        w3m-output-coding-system 'utf-8
        w3m-terminal-coding-system 'utf-8
        w3m-use-favicon nil
        w3m-command-arguments '("-cookie" "-F")
        w3m-use-cookies t
        w3m-home-page "http://www.google.com")
  (setq w3m-command-arguments
        (nconc w3m-command-arguments
               '("-o" "http_proxy=http://proxy.vmware.com:3128/")))
  )

;; Tabbar.......tabbar-ruler.......tabbar face
(when (display-graphic-p)
  (require 'tabbar)
  (tabbar-mode 1)
  (define-prefix-command 'lwindow-map)
  (global-set-key (kbd "<M-up>") 'tabbar-backward-group)
  (global-set-key (kbd "<M-down>") 'tabbar-forward-group)
  (global-set-key (kbd "<M-left>") 'tabbar-backward)
  (global-set-key (kbd "<M-right>") 'tabbar-forward)
      
  ;; tabbar-ruler
  (setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
  (setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
  ;; (setq tabbar-ruler-popup-menu 't) ; If you want a popup menu.
  ;; (setq tabbar-ruler-popup-toolbar 't) ; If you want a popup toolbar
  (require 'tabbar-ruler))

;; tabbar face
(defun set-tabbar-look ()
  "configure how tabbar looks"
  (let ((tabbar-title-font
         (cond ((eq system-type 'darwin)
                "Monaco")
               ((eq system-type 'gnu/linux)
                "Bitstream Sans Mono")
               ((eq system-type 'windows-nt)
                "Courier New"))))
    ;; set default face: font-family, background, foreground, size
    ;; (set-face-attribute 'tabbar-default nil
    ;;                     ;; :family tabbar-title-font
    ;;                     :background "gray60"
    ;;                     :foreground "black"
    ;;                     :height 1)
    ;; set button face：outer-box size and color
    (set-face-attribute 'tabbar-button nil
                        :inherit 'tabbar-default
                        :background "#37B371"
                        :box '(:line-width 2
                                           :color "yellow")
                        :width 'ultra-expanded)
    ;; set selected tab face: color, font family, outer-box size and color
    (set-face-attribute 'tabbar-selected nil
                        :family tabbar-title-font
                        :background "gray80"
                        :foreground "purple"
                        :weight 'bold
                        :box '(:line-width 3
                                           :color "cyan")
                        :height 1.3)
    ;; set unselected tab face: color
    (set-face-attribute 'tabbar-unselected nil
                        :family tabbar-title-font
                        :background "gray50"
                        :box '(:line-width 3
                                           :color "dark orange")
                        :foreground "black")
    )
  )
(if (display-graphic-p)
    (set-tabbar-look))

;; minor...configurations...linum...
;; encoding....max specpdl size.....
;; font...family...size.............
(when (eq system-type 'windows-nt)
  (prefer-coding-system 'utf-8-unix)
  (setq default-buffer-file-coding-system 'utf-8-unix))
(setq max-specpdl-size 1000)
(cond ((eq system-type 'darwin)
       (set-default-font "Courier New-16"))
      ((eq system-type 'windows-nt)
       (set-default-font "Courier New-12")))

;; .switch command key and control key on MAC...
(when (eq system-type 'darwin)
  ;; (setq mac-contril-modifier 'alt)
  (setq mac-option-modifier 'control)
  (setq mac-command-modifier 'meta))

;; org-mode...disable postamble...w3m...
(setq org-export-html-postamble 'nil)

;; smex
(require 'smex)
(smex-initialize)

;; yasnippnet
(require 'yasnippet)
(if (functionp 'yas-global-mode)
    (yas-global-mode 1)
  (yas/global-mode 1))

;;; aspell...personal dic...........
(require 'ispell)
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary
      (expand-file-name "~/.ispell"))

;; auctex...tex....xetex...pdf-viewer...
(defun auctex-configuration ()
  "Auctex configurations"
  (setq TeX-auto-untabify t     ; remove all tabs before saving
        TeX-engine 'xetex       ; use xelatex default
        TeX-show-compilation t) ; display compilation windows
  (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
  (setq TeX-save-query nil)
  (setq-default TeX-master nil)
  (imenu-add-menubar-index)
  (setq TeX-view-program-list
        '(("SumatraPDF" "SumatraPDF.exe %o")
          ("Gsview" "gsview64.exe %o")
          ("Okular" "okular --unique %o")
          ("Evince" "evince %o")
          ("Firefox" "firefox %o")
          ("Skim" "/Applications/Skim.app/Contents/MacOS/Skim %o")))
  (cond
   ((eq system-type 'windows-nt)
    (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
                                       (output-dvi "dviout"))))
   ((eq system-type 'gnu/linux)
    (setq TeX-view-program-selection '((output-pdf "Okular")
                                       (output-dvi "Okular"))))
   ((eq system-type 'darwin)
    (setq TeX-view-program-selection '((output-pdf "Skim")
                                       (output-dvi "xdvi"))))
   )
  (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol))

(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auctex-configuration
            'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode
            'flyspell-mode))

;; darwin...hsplit window...........
(when (eq system-type 'darwin)
  (setq split-height-threshold nil)
  (setq split-width-threshold 80))

;; tramp mode...autosave dir........
;; ...never expire password.........
(setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave")
(setq password-cache-expiry nil)

;; Semantic and auto-config integration
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(define-key ac-mode-map [(meta return)] 'auto-complete)

;; multi-term....bash...............
;; eshell....color....completion....
(require 'multi-term)
(setq multi-term-program "/usr/bin/bash")

(defun last-term-buffer (l)
  "Return most recently used term buffer."
  (when l
	(if (eq 'term-mode (with-current-buffer (car l) major-mode))
	    (car l) (last-term-buffer (cdr l)))))

(defun get-term ()
  "Switch to the term buffer last used, or create a new one if
    none exists, or if the current buffer is already a term."
  (interactive)
  (let ((b (last-term-buffer (buffer-list))))
	(if (or (not b) (eq 'term-mode major-mode))
	    (multi-term)
	  (switch-to-buffer b))))

(custom-set-variables
 '(comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
 '(comint-scroll-to-bottom-on-output t) ; always add output at the bottom
 '(comint-scroll-show-maximum-output t) ; scroll to show max possible output
 '(comint-completion-autolist t)        ; show completion list when ambiguous
 '(comint-input-ignoredups t)           ; no duplicates in command history
 '(comint-completion-addsuffix t)       ; insert space/slash after file completion
 )

; interpret and use ansi color codes in shell output windows
(ansi-color-for-comint-mode-on)

; make completion buffers disappear after 3 seconds.
(add-hook 'completion-setup-hook
  (lambda () (run-at-time 20 nil
    (lambda () (delete-windows-on "*Completions*")))))

;; evernote....key.bindings......
(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
(setq evernote-developer-token
      "S=s130:U=dff5f0:E=14e9b2a2399:C=1474378f3d0:P=1cd:A=en-devtoken:V=2:H=22524cf3dcd8b1feb885249f12a6e773")
(setenv "EN_PROXY" (getenv "http_proxy"))
(when (require 'evernote-mode)
  (global-set-key "\C-cec" 'evernote-create-note)
  (global-set-key "\C-ceo" 'evernote-open-note)
  (global-set-key "\C-ces" 'evernote-search-notes)
  (global-set-key "\C-ceS" 'evernote-do-saved-search)
  (global-set-key "\C-cew" 'evernote-write-note)
  (global-set-key "\C-cep" 'evernote-post-region)
  (global-set-key "\C-ceb" 'evernote-browser))

;; mu4e....email.client........
;; smtpmail....send.email......
(require 'mu4e)
(setq mu4e-maildir "~/workspace/mail/vmware")
(setq mu4e-mail-dir-shortcuts
      '(("/Inbox"      . ?i)
        ("/sent"       . ?s)
        ("/Code"       . ?c)))
(setq mu4e-get-mail-command "mbsync vmware")
(setq user-mail-address "lhu@vmware.com"
      user-full-name "Leonhard Hu"
      mu4e-compose-signature
        (concat
          "Thanks,\n"
          "Leonhard Hu\n"))
(setq mu4e-view-show-images t)
(setq mu4e-attachment-dir "~/workspace/trash")
(cond
  ((eq system-type 'darwin)
   (setq mu4e-html2text-command
         "textutil -stdin -format html -convert txt -stdout"))
  ((eq system-type 'gnu/linux)
   (setq mu4e-html2text-command
         "html2text -utf8 -width 80")))
(setq message-kill-buffer-on-exit t)

(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "email.vmware.com"
      smtpmail-smtp-server "email.vmware.com"
      smtpmail-smtp-service 587)

;; node.js...js-mode...espresso...
(require 'nodejs)

;; .............
;; Start emacs server
(server-start)

;; .......................desktop .....
;; . ywb-load-slow-part .. t................
(defvar ywb-load-slow-part nil)
(unless ywb-load-slow-part
  (add-to-list 'load-path (concat extra-emacs-directory "/site-lisp/eim"))
  (autoload 'eim-use-package "eim" "Another emacs input method")

  ;; ......
  (register-input-method
   "eim-wb" "euc-cn" 'eim-use-package
   ".." "......." (concat extra-emacs-directory "/site-lisp/eim/wb.txt"))
  (setq default-input-method "eim-wb")
  (register-input-method
   "eim-py" "euc-cn" 'eim-use-package
   ".." "......." (concat extra-emacs-directory "/site-lisp/eim/py.txt"))
  (require 'eim-extra nil t)
  (when (featurep 'eim-extra)
    (global-set-key "\\" 'eim-insert-ascii))

  (when (featurep 'desktop)
    (desktop-save-mode 1)
    (condition-case nil
        (desktop-read)
      (error nil)))
  (appt-activate t)
  (setq ywb-load-slow-part t))

;;; .emacs end here
