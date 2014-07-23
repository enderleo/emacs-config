(load-file (concat extra-emacs-directory "/cedet/cedet-devel-load.el"))

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

(require 'semantic/ia)
(semantic-mode 1)

(setq-mode-local c-mode semanticdb-create-cscope-database)

(require 'semantic/bovine/gcc)

(require 'semantic/db)
(global-semanticdb-minor-mode 1)
(semanticdb-enable-cscope-databases)

;; (semantic-add-system-include "/usr/include/mpi/" 'c++-mode)

;; Imenu integration
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

;; Class suggest improvement
(defun my-c-mode-cedet-hook ()
 (local-set-key "." 'semantic-complete-self-insert)
 (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

(defun my-cedet-hook ()
  (add-to-list 'ac-sources 'ac-source-semantic)
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c,?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c,>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c,d" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
(when (cedet-ectag-version-check)
  (semantic-load-enable-primary-exuberent-ctags-support))

(global-ede-mode t)

(add-to-list 'completion-at-point-functions 'semantic-completion-at-point-function)
;;(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)

(add-hook 'c-mode-hook 'semantic-default-c-setup)
(add-hook 'c++-mode-hook 'semantic-default-c-setup)
