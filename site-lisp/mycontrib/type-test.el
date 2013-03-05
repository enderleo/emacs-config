;;; type-test.el --- Typing test

;; Copyright 2005 Wenbin Ye
;;
;; Author: wenbinye@163.com
;; Version: $Id: type-test.el,v 0.0 2005/12/21 16:47:13 Administrator Exp $
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

;; TODO:
;; * 模板文字设置为不能更改
;; * 显示 insert-marker 的位置
;; * 以一个 mode 的形式

;; Put this file into your load-path and the following into your ~/.emacs:
;; (autoload 'type-test "type-test" "type test" t)

;;; Code:

(provide 'type-test)
(eval-when-compile
  (require 'cl))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(defvar type-test-text nil)
(defvar type-test-fill-bufferp nil)
(defvar type-test-fill-column 70)

(defface type-test-normal-face
  '((t (:foreground "gold")))
  "Face for indicating a correct typing character."
  :group 'type-test)

(defface type-test-wrong-face
  '((t (:foreground "red")))
  "Face for indicating a wrong typing character."
  :group 'type-test)

(defun type-test-before-change ()
  (if (and (eq this-command 'self-insert-command)
           (< type-test-insert-marker (point)))
      (progn
        (goto-char type-test-insert-marker))))

(defun type-test-after-change ()
  (cond ((eq this-command 'self-insert-command)
         (progn
           (type-test-update)
           (if (type-test-eolp)
               (progn
                 (forward-line 2)
                 (if (eobp)
                     (type-test-finish))))
           (if (< type-test-insert-marker (point))
               (progn
                 (set-marker type-test-insert-marker (point))))))
        ((memq this-command '(delete-char delete-backward-char))
         (progn
           (if (= (mod (line-number-at-pos) 2) 1)
               (progn
                 (newline)
                 (set-marker type-test-insert-marker (point))))
           (type-test-update)))))

(defun type-test-update ()
  (type-test-compare-lines)
  (type-test-update-header))

(defun type-test-compare-lines ()
  (save-excursion
    (let (pos peol)
      (or (bolp)
          (backward-char 1))
      (save-excursion
        (previous-line 1)
        (setq pos (point)
              peol (line-end-position)))
      (while (< (point) (line-end-position))
        (if (not (equal (char-after pos)
                        (char-after)))
            (add-text-properties pos
                                 (1+ pos)
                                 '(face type-test-wrong-face))
          (add-text-properties pos
                               (1+ pos)
                               '(face type-test-normal-face)))
        (forward-char)
        (setq pos (1+ pos)))
      (add-text-properties pos peol '(face default)))))

(defun type-test-eolp ()
  (save-excursion
    (previous-line 1)
    (eolp)))

(defun type-test-next-line ()
  (beginning-of-line)
  (if (looking-at "[ \t]*$")
      (delete-region (point)
                     (if (re-search-forward "[^ \t\n]" nil t)
                         (progn (beginning-of-line) (point))
                       (point-max)))))

(defun type-test-update-header ()
  (let ((time (- (float-time) type-test-start-time))
        (char (- (floor (/ (- (point)
                              (save-excursion
                                (previous-line 1)
                                (- (line-end-position) (point))))
                           2)) 1)))
    (setq header-line-format
          (format "time: %s   char: %d   speed: %.2f"
                  (type-test-format-time time)
                  char (* (/ char time) 60)))))

(defun type-test-format-time (time)
  (let* ((ss (mod time 60))
         (mm (mod (/ (- time ss) 60) 60))
         (hh (floor (/ (- time ss) 3600))))
    (format "%d:%2d:%2d" hh mm ss)))

(defun type-test-build-buffer ()
  (switch-to-buffer (get-buffer-create "*type test*"))
  (setq buffer-read-only nil)
  (erase-buffer)
  (insert type-test-text)
  (if type-test-fill-bufferp
      (progn
        (set-fill-column type-test-fill-column)
        (fill-region (point-min) (point-max))))
  (goto-char (point-min))
  (while (progn
           (type-test-next-line)
           (end-of-line)
           (newline)
           (equal (forward-line 1) 0)))
  (goto-char (point-min))
  (forward-line 1))

(defun type-test-start ()
  (interactive)
  (if buffer-read-only
      (progn
        (setq type-test-start-time (- (float-time) type-test-time-record))
        (type-test-update-header)
        (add-hook 'pre-command-hook 'type-test-before-change)
        (add-hook 'post-command-hook 'type-test-after-change)
        (setq buffer-read-only nil)))
  (force-mode-line-update))

(defun type-test-pause ()
  (interactive)
  (if (not buffer-read-only)
      (progn
        (setq type-test-time-record (- (float-time)
                                       type-test-start-time))
        (setq header-line-format (concat header-line-format
                                         "  -- Press C-s to start"))
        (setq buffer-read-only t)))
  (force-mode-line-update))

(defun type-test-finish ()
  (interactive)
  (type-test-pause)
  (if (y-or-n-p "Start again? ")
      (type-test)))

(defun type-test-file (file)
  (interactive "f")
  (setq type-test-text
        (with-temp-buffer
          (insert-file-contents file)
          (buffer-string)))
  (type-test))

(defun type-test-region (start end)
  (interactive "r")
  (setq type-test-text
        (buffer-substring-no-properties start end))
  (type-test))

(defun type-test ()
  (interactive)
  (cond (mark-active
         (let ((start (region-beginning))
               (end (region-end)))
           (deactivate-mark)
           (type-test-region start end)))
        ((not type-test-text)
         (call-interactively 'type-test-file))
        (t
         (type-test-build-buffer)
         (kill-all-local-variables)
         (make-local-variable 'pre-command-hook)
         (make-local-variable 'type-test-insert-marker)
         (make-local-variable 'type-test-start-time)
         (make-local-variable 'type-test-time-record)
         (setq type-test-time-record 0)
         (setq type-test-insert-marker (make-marker))
         (set-marker type-test-insert-marker (point))
         (make-local-variable 'pre-command-hook)
         (make-local-variable 'post-command-hook)
         (add-hook 'pre-command-hook 'type-test-before-change)
         (add-hook 'post-command-hook 'type-test-after-change)
         (setq header-line-format " Press C-s to start")
         (local-set-key (kbd "C-s") 'type-test-start)
         (local-set-key (kbd "C-j") 'type-test-pause)
         (setq buffer-read-only t)
         (if (y-or-n-p "Ready? ")
             (type-test-start)))))

;;; type-test.el ends here