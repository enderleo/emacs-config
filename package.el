;; packages....initialize....elpa...gnu...marmalade
(require 'package)
(package-initialize)
(setq package-archives
      '(("ELPA" . "http://tromey.com/elpa/")
        ("GNU" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")))

;; Packages to install first (check if emacs is 24 or higher)
(if (>= emacs-major-version 24)
    (let* ((extra-package-list
            '(;; "tabbar"
              ;; "tabbar-ruler"
              "adaptive-wrap"
              "auctex"
              "yasnippet"
              "smex"
              "cl"
              "dropdown-list"
              "ecb"
              "magit"
              "multi-term"
              "auto-complete"))
           (missing-package-list
            (delq nil (mapcar (lambda (x)
                                (let ((packsym))
                                  (if (equal x "auctex")
                                      (setq packsym (intern (concat x "-autoloads")))
                                    (setq packsym (intern x)))
                                  (when (not (require packsym nil t)) x)))
                              extra-package-list)))
           )
      ;; if miss any package, refresh package list
      (unless (eq 0 (length missing-package-list))
        (package-refresh-contents))
      ;; install all missing packages
      (mapc (lambda (x)
              (package-install (intern x)))
            missing-package-list)
      ;; (message (mapconcat 'identity missing-package-list " "))
      )
  )
