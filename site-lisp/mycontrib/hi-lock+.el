;;; hi-lock+.el --- 

;; Copyright 2006 
;;
;; Author: Administrator@YE
;; Version: $Id: hi-lock+.el,v 0.0 2006/03/07 08:13:11 Administrator Exp $
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'hi-lock+)

;;; Code:

(provide 'hi-lock+)
(eval-when-compile
  (require 'cl))
(require 'hi-lock)

;;;###autoload
(defun hi-lock-active-regexp (regexp)
  (interactive
   (if (and (display-popup-menus-p) (vectorp (this-command-keys)))
       (catch 'snafu
         (or (x-popup-menu t
           (cons `keymap
            (cons "Select Pattern to Activate"
                  (mapcar (lambda (pattern)
                            (list (car pattern)
                                  (format "%s (%s)" (car pattern)
                                   (symbol-name
                                    (car (cdr (car (cdr (car (cdr pattern))))))))
                                  (cons nil nil)
                                  (car pattern)))
                          hi-lock-interactive-patterns))))
          (throw 'snafu '(""))))
     (let ((history-list (mapcar (lambda (p) (car p))
                                 hi-lock-interactive-patterns)))
       (unless hi-lock-interactive-patterns
         (error "No highlighting to activate"))
       (list
        (completing-read "Regexp to activate: "
                         hi-lock-interactive-patterns nil t
                         (car (car hi-lock-interactive-patterns))
                         (cons 'history-list 1))))))
  (let ((keyword (assoc regexp hi-lock-interactive-patterns)))
    (when keyword
      (setq hi-lock-interactive-patterns
            (cons keyword
                  (delq keyword hi-lock-interactive-patterns))))))
;;;###autoload
(defun hi-lock-previous ()
  (interactive)
  (if hi-lock-interactive-patterns
      (let ((reg (caar hi-lock-interactive-patterns)))
        (re-search-backward reg nil t))
    (message "no hight light active")))

;;;###autoload
(defun hi-lock-next ()
  (interactive)
  (if hi-lock-interactive-patterns
      (let ((reg (caar hi-lock-interactive-patterns)))
        (re-search-forward reg nil t))
    (message "no hight light active")))

;;;###autoload
(defun toggle-regexp-font-lock (reg face)
    (if (assoc reg hi-lock-interactive-patterns)
        (unhighlight-regexp reg)
      (highlight-regexp reg face)))

;;;###autoload
(defun toggle-tabs-font-lock ()
  (interactive)
  (toggle-regexp-font-lock "[\t]+" 'hi-blue))

;;;###autoload
(defun toggle-whitespace-font-lock ()
  (interactive)
  (toggle-regexp-font-lock "[\40]+" 'hi-pink))

;;;###autoload
(defun toggle-trailing-whitespace-font-lock ()
  (interactive)
  (toggle-regexp-font-lock "[\t\40]+$" 'hi-yellow))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;;; hi-lock+.el ends here
