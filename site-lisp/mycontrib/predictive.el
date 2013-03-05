;;; predictive.el --- my predictive mode

;; Copyright 2006 Ye Wenbin
;;
;; Author: wenbinye@163.com
;; Version: $Id: predictive.el,v 0.0 2006/07/19 15:22:20 ywb Exp $
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

;; (autoload 'predictive-mode "predictive" "Completions to dict" t)
;; (setq predictive-dict "~/.emacs.d/dict")

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'predictive)

;;; Code:

(require 'completion-ui)
(provide 'predictive)
(eval-when-compile
  (require 'cl))

(defvar predictive-buffer nil)
(defun predictive-get-completion (prefix num)
  (let ((i 0)
        (reg (concat "^" (regexp-quote prefix)))
        (len (length prefix))
        completion)
    (save-excursion
      (set-buffer predictive-buffer)
      (predictive-bisearch-word prefix (point-min) (point-max))
      (unless (looking-at reg)
        (forward-line 1))
      (while (progn 
               (when (looking-at reg)
                 (setq completion (append completion (list (substring (predictive-line-at-point) len)))
                       i (1+ i))
                 (forward-line 1)
                 (< i num))))
      completion)))

(defun predictive-bisearch-word (code start end)
  (let ((mid (/ (+ start end) 2))
        ccode)
    (goto-char mid)
    (beginning-of-line)
    (setq ccode (predictive-line-at-point))
    ;;    (message "%d, %d, %d: %s" start mid end ccode)
    (if (string= ccode code)
        ccode
      (if (> mid start)
          (if (string< ccode code)
              (predictive-bisearch-word code mid end)
            (predictive-bisearch-word code start mid))))))

(defun predictive-line-at-point ()
  (buffer-substring-no-properties (line-beginning-position)
                                  (line-end-position)))


(completion-define-minor-mode
 predictive-mode "A simple predictive mode"
 'predictive-get-completion
 nil " Pred" nil
 (setq completion-function 'predictive-get-completion)
 (unless (buffer-live-p predictive-buffer)
   (setq predictive-buffer (get-buffer-create " *dict*"))
   (with-current-buffer predictive-buffer
     (insert-file-contents predictive-dict))))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################
(defvar predictive-dict "~/.emacs.d/dict")

;;; predictive.el ends here
