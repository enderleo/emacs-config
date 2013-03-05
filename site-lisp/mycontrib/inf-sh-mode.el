;;; -*- lisp-interaction -*-
;;; inf-sh-mode.el --- A simple inferior shell mode

;; Copyright 2006 Ye Wenbin
;;
;; Author: wenbinye@163.com
;; Version: $Id: inferior-sh-mode.el,v 0.0 2006/07/24 15:41:53 ywb Exp $
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
;;   (require 'inferior-sh-mode)

;;; Code:

(provide 'inf-sh-mode)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(defvar inf-sh-buffer nil)
(defvar inf-sh-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-x\C-e" 'inf-sh-sent-line)
    (define-key map "\C-x\C-r" 'inf-sh-sent-region)
    map)
  "keymap for inf-sh-mode")

(defun inf-sh-sent-line ()
  (interactive)
  (inf-sh-sent-region (line-beginning-position) (line-end-position))
  (comint-send-string (inf-sh-proc) "\n"))

(defun inf-sh-sent-region (beg end)
  (interactive "r")
  (comint-send-string (inf-sh-proc) (buffer-substring-no-properties beg end)))

(defun inf-sh-set-buffer (buf)
  (interactive
   (let ((bufs (mapcar 'buffer-name
                       (save-excursion
                         (remove-if-not (lambda (b)
                                          (set-buffer b)
                                          (eq major-mode 'shell-mode))
                                        (buffer-list))))))
     (list (completing-read 
            "Set shell buffer to: " bufs nil t (car bufs)))))
  (setq inf-sh-buffer (get-buffer buf)))

(defun inf-sh-proc ()
  (let ((proc (get-buffer-process inf-sh-buffer)))
    (or proc
        (error "No current process. See variables `inf-sh-buffer'"))))

(define-minor-mode inf-sh-mode "Interactive shell mode"
  :lighter " Inf"
  :keymap '(("\C-c\C-e" . inf-sh-sent-line)
            ("\C-c\C-r" . inf-sh-sent-region))
  (if inf-sh-mode
      (let ((buf (save-excursion
                   (car (remove-if-not (lambda (b)
                                         (set-buffer b)
                                         (eq major-mode 'shell-mode))
                                       (buffer-list))))))
        (set (make-local-variable 'inf-sh-buffer) buf)
        (if buf
            (message "Set shell buffer to %S" inf-sh-buffer)
          (message "No shell buffer find")))
    (setq inf-sh-buffer nil)))

;;; inferior-shell-mode.el ends here
