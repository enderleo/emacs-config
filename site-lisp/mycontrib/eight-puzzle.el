;;; eight-puzzle.el --- A simple little puzzle game

;; Copyright 2005 Wenbin Ye
;;
;; Author: wenbinye@163.com
;; Version: $Id: eight-puzzle.el,v 0.0 2005/11/25 03:26:08 Administrator Exp $
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
;;   (require 'eight-puzzle)

;;; Code:

(provide 'eight-puzzle)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(defvar eight-puzzle-goal "123804765" "The state to reach")

(defvar eight-puzzle-display " 12345678"
  "String to display. You can set like \" abcdefgh\"")

(defvar eight-puzzle-offsets '[(0 . 1) (1 . 0) (0 . -1) (-1 . 0)]
  "Directions to move")

(defvar eight-puzzle-state "012345678" "Current state")

(defvar eight-puzzle-buffer-name "*8-puzzle*")

(defvar eight-puzzle-mode-hook nil "Hook run before enter eight-puzzle-mode")

(defvar eight-puzzle-cracking nil)

(defvar eight-puzzle-mode-map nil
  "Local keymap for the eight puzzle game.")
(unless eight-puzzle-mode-map
  (let ((map (make-sparse-keymap)))
    (suppress-keymap map t)
    (define-key map [left] 'eight-puzzle-left)
    (define-key map [right] 'eight-puzzle-right)
    (define-key map [up] 'eight-puzzle-up)
    (define-key map [down] 'eight-puzzle-down)
    (define-key map [down] 'eight-puzzle-down)
    (define-key map "r" 'eight-puzzle-restart)
    (define-key map "q" 'eight-puzzle-quit)
    (define-key map "s" 'eight-puzzle-show-state)
    (setq eight-puzzle-mode-map map)))

(defun eight-puzzle-shuffle-string (str)
  (let ((len (length str)))
    (dotimes (pos len)
      (eight-puzzle-swap-char str pos (random len)))
    str))

(defun eight-puzzle-restart ()
  (interactive)
  (while (progn
         (eight-puzzle-shuffle-string eight-puzzle-state)
         (eight-puzzle-evenp)))
  (eight-puzzle-display-state))

(defun eight-puzzle-evenp ()
  (let* ((count 0)
         (pos (string-match "0" eight-puzzle-state))
         (str (concat (substring eight-puzzle-state 0 pos)
                      (substring eight-puzzle-state (1+ pos))))
         i j)
    (dotimes (i 7)
      (setq j (1+ i))
      (while (< j 8)
        (if (> (aref str i)
               (aref str j))
            (setq count (1+ count)))
        (setq j (1+ j))))
    (= (mod count 2) 0)))

(defun eight-puzzle-swap-char (str pos1 pos2)
  (let (tmp)
    (setq tmp (aref str pos1))
    (aset str pos1 (aref str pos2))
    (aset str pos2 tmp)
    str))

(defun eight-puzzle-display-state ()
  (let ((len (length eight-puzzle-state)))
    (setq buffer-read-only nil)
    (erase-buffer)
    (dotimes (pos len)
      (insert (concat "[" (char-to-string (aref eight-puzzle-display
                                                (- (aref eight-puzzle-state pos) ?0)))
                      "]"
                      (if (= (mod pos 3) 2) "\n"))))
    (setq buffer-read-only t)))
  
(defun eight-puzzle-gap-pos ()
  (let* ((pos (string-match "0" eight-puzzle-state))
         (col (mod pos 3))
         (row (/ pos 3)))
    (cons row col)))

(defun eight-puzzle-index (pos)
  (+ (* 3 (car pos)) (cdr pos)))

(defun eight-puzzle-check-pos (pos)
  (and (and (> (car pos) -1)
            (< (car pos) 3))
       (and (> (cdr pos) -1)
            (< (cdr pos) 3))))

(defun eight-puzzle-move (dir)
  (let* ((gap-pos (eight-puzzle-gap-pos))
        (new-pos (cons (+ (car gap-pos)
                          (car (aref eight-puzzle-offsets dir)))
                       (+ (cdr gap-pos)
                          (cdr (aref eight-puzzle-offsets dir))))))
    (if (eight-puzzle-check-pos new-pos)
        (progn
          (eight-puzzle-swap-char eight-puzzle-state
                                  (eight-puzzle-index gap-pos)
                                  (eight-puzzle-index new-pos))
          (eight-puzzle-display-state)
          (if (eight-puzzle-goalp)
              (if (y-or-n-p "You did it! Start again ")
                  (eight-puzzle-restart)
                (eight-puzzle-quit)))))))

(defun eight-puzzle-left ()
  (interactive)
  (eight-puzzle-move 0))
(defun eight-puzzle-up ()
  (interactive)
  (eight-puzzle-move 1))
(defun eight-puzzle-right ()
  (interactive)
  (eight-puzzle-move 2))
(defun eight-puzzle-down ()
  (interactive)
  (eight-puzzle-move 3))

(defun eight-puzzle-goalp ()
  (equal eight-puzzle-state eight-puzzle-goal))

(defun eight-puzzle-mode ()
  " A mode for playing `eight-puzzle'

The key bindings for eight-puzzle-mode are:

\\{eight-puzzle-mode-map}
"
  (kill-all-local-variables)
  (use-local-map eight-puzzle-mode-map)
  (setq major-mode 'eight-puzzle-mode
        mode-name "8-puzzle")
  (run-hooks 'eight-puzzle-mode-hook)
  (setq buffer-read-only t
        truncate-lines   t)
  (buffer-disable-undo (current-buffer)))

(defun eight-puzzle ()
  "Move the num to position like this:

   [1][2][3]
   [8][ ][4]
   [7][6][5]
"
  (interactive)
  (setq eight-puzzle-cracking nil)
  (switch-to-buffer eight-puzzle-buffer-name)
  (eight-puzzle-mode)
  (eight-puzzle-restart))

(defun eight-puzzle-quit ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun eight-puzzle-show-state ()
  (interactive)
  (if eight-puzzle-cracking
      (message "%s\n%s" eight-puzzle-state
               eight-puzzle-goal)))
;;; eight-puzzle.el ends here

