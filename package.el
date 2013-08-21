;; Packages to install first (check if emacs is 24 or higher)
(if (>= emacs-major-version 24)
    (progn
      ;; Add a larger package list
      (setq package-archives '(
                               ("ELPA" . "http://tromey.com/elpa/")
                               ("marmalade" . "http://marmalade-repo.org/packages/")))
      (package-refresh-contents)
      ;; tabbar
      (when (not (require 'tabbar nil t))
        (package-install 'tabbar))
      ;; tabbar-ruler
      (when (not (require 'tabbar-ruler nil t))
        (package-install 'tabbar-ruler))
      ;; auto-wrap
      (when (not (require 'adaptive-wrap nil t))
        (package-install 'adaptive-wrap))
      ;; auctex
      (when (not (require 'auctex nil t))
        (package-install 'auctex))
      ;; ysnippet
      (when (not (require 'yasnippet nil t))
        (package-install 'yasnippet))
      )
  )
