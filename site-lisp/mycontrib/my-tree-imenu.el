;;; my-tree-imenu.el --- 

;; Copyright (C) 2005  Free Software Foundation, Inc.

;; Author: ChunYe Wang
;; Keywords: 

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; 

;;; Code:
(require 'my-tree)
(eval-when-compile
  (require 'cl))
(require 'imenu)

(defcustom my-tr-imenu-one-buffer t
  "*Non-nil means use only one tree-imenu window"
  :group 'my-tree-imenu
  :type 'boolean)

(defcustom my-tr-imenu-one-buffer-name "*tree-imenu*"
  "Buffer name of tr-imenu when use only one buffer"
  :group 'my-tree-imenu
  :type 'string)

(defcustom my-tr-imenu-buffer-name `(concat "*tree-imenu: "
                                            (or (buffer-name)
                                                "<NIL>"))
  "Buffer name of tr-imenu"
  :group 'my-tree-imenu
  :type 'sexp)

(defcustom my-tr-imenu-root-name `(concat mode-name ": " (or (buffer-name) "<NIL>"))
  "tree imenu root name"
  :group 'my-tree-imenu
  :type 'sexp)

(defcustom my-tr-imenu-mode-hook nil
  "Hook run when tr-imenu create"
  :group 'my-tree-imenu
  :type 'hook)

(defcustom my-tr-imenu-images (append my-tr-mode-images
`((function "<-> " ,(create-image (concat my-tr-mode-image-directory "tree-function.xpm")))
  (variable "{-} " ,(create-image (concat my-tr-mode-image-directory "tree-variable.xpm")))
  (bucket "[#] " ,(create-image (concat my-tr-mode-image-directory "tree-bucket.xpm")))))
  "Image used"
  :group 'my-tree-imenu)

(defcustom my-tr-imenu-window-function
  (lambda (trbuf buf)
    (delete-other-windows)
    (let* ((w1 (selected-window))
           (w2 (split-window w1 my-tr-mode-window-width t)))
        (set-window-buffer w1 trbuf)
        (set-window-buffer w2 buf)
        (other-window 1)
        ))
  "Function to set the window buffer display"
  :group 'my-tree-imenu
  :type 'function)

(defvar my-tr-imenu-buffer nil)
(defvar my-tr-imenu-tree nil)

(defvar my-tr-imenu-mode-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map my-tr-mode-map)))

(defun my-tr-imenu-on-click (node)
  (if (my-tr-node-root-node-p node)
      (progn (my-tr-mode-contract-trees-except)
             (pop-to-buffer (my-tr-node-get-property 'buffer node)))
    (let* ((m (my-tr-node-get-property 'marker node))
           (b (marker-buffer m)))
      (pop-to-buffer b)
      (goto-char m))))

(defun my-tr-imenu-arrange-children (node)
  (let ((children (my-tr-node-get-children node)))
    (my-tr-node-put-children (append
                              (remove-if 'my-tr-node-leaf-node-p children)
                              (remove-if-not 'my-tr-node-leaf-node-p children))
                             node)))

(defun my-tr-imenu-update (node)
  (let* ((imenu-auto-rescan t)
         (root (my-tr-node-get-root node))
         (buf (my-tr-node-get-property 'buffer root))
         (indexes (reverse (save-excursion
                             (set-buffer buf)
                             (imenu--make-index-alist t))))
         index buckets)
    (if (my-tr-node-root-node-p node)
        (progn
          ;; remove non-exists function and subalist
          (my-tr-node-put-children  (setq buckets
                                          (remove-if (lambda (n)
                                                       (or (my-tr-node-leaf-node-p n)
                                                           (not (assoc (my-tr-node-get-text n) indexes))))
                                                     (my-tr-node-get-children root))) root)
          (mapc (lambda (index)
                  (if (imenu--subalist-p index)
                      ;; if the buckets not in the tree add it
                      (progn
                        (if (not (member
                                  (car index) (mapcar 'my-tr-node-get-text buckets)))
                            (let ((node (my-tr-make-node (car index) root)))
                              (my-tr-node-put-expended t node)
                              (my-tr-node-put-token 'bucket node)
                              (my-tr-node-put-update-function 'my-tr-imenu-update node)
                              (mapc (lambda (i)
                                      (my-tr-imenu-make-node node i 'variable))
                                    index))))
                    (my-tr-imenu-make-node root index 'function)))
                indexes)
          (my-tr-imenu-arrange-children root))
      (my-tr-node-put-children nil node)
      (mapcar (lambda (i)
                (my-tr-imenu-make-node node i 'variable))
              (assoc (my-tr-node-get-text node) indexes)))))

(defun my-tr-imenu-make-tree (root)
  (let* ((indexes (reverse (imenu--make-index-alist))))
    (my-tr-node-put-expended t root)
    (my-tr-node-put-property 'buffer (current-buffer) root)
    (my-tr-node-put-update-function 'my-tr-imenu-update root)
    (my-tr-node-put-action-on-click 'my-tr-imenu-on-click root)
    (my-tr-node-put-token 'open root)
    (dolist (index indexes)
      (if (imenu--subalist-p index)
          (let ((node (my-tr-make-node (car index) root)))
            (my-tr-node-put-expended t node)
            (my-tr-node-put-token 'bucket node)
            (my-tr-node-put-update-function 'my-tr-imenu-update node)
            (mapc (lambda (i)
                    (my-tr-imenu-make-node node i 'variable))
                  (reverse index)))
        (my-tr-imenu-make-node root index 'function)))
    (my-tr-imenu-arrange-children root)
    root))

(defun my-tr-imenu-make-node(parent indexes &optional token)
  (when (and (markerp (cdr-safe indexes)) (> (cdr indexes) 0))
    (let ((node (my-tr-make-node (car indexes) parent)))
      (my-tr-node-put-property 'marker (cdr indexes) node)
      (my-tr-node-put-action-on-click 'my-tr-imenu-on-click node)
      (if token
          (my-tr-node-put-token token node)))))

;; this function is used to create `tr-imenu-buffer'
(defun my-tr-imenu-mode ()
  "Tree to view imenu.
     Special command:
\\{my-tr-imenu-mode-map}"
  (let ((buffer (if my-tr-imenu-one-buffer
                    (get-buffer-create my-tr-imenu-one-buffer-name)
                  (generate-new-buffer (eval my-tr-imenu-buffer-name))))
        (assoc-buffer (current-buffer)))
    (set (make-local-variable 'my-tr-imenu-buffer) buffer)
    (make-local-variable 'my-tr-imenu-tree)
    (add-hook 'kill-buffer-hook 'my-tr-imenu-destroy nil t)
    (with-current-buffer buffer
      (my-tr-mode)
      (setq major-mode 'my-tr-imenu-mode
            mode-name "tree-imenu")
      (set (make-local-variable 'my-tr-mode-images) my-tr-imenu-images)
      (use-local-map my-tr-imenu-mode-map)
      (run-hooks 'my-tr-imenu-mode-hook))))

(defun my-tr-imenu-destroy ()
  (let ((root my-tr-imenu-tree))
    (when (and my-tr-imenu-buffer
               (buffer-live-p my-tr-imenu-buffer))
      (with-current-buffer my-tr-imenu-buffer
        (my-tr-mode-delete-tree-internal root))
      (if (not my-tr-imenu-one-buffer)
          (kill-buffer my-tr-imenu-buffer)))))

;; when `my-tr-imenu-one-buffer' is nil
;; If the source local variable tr-imenu-buffer exists, and the buffer
;; is live, `tr-imenu-update-buffer'
;; else call tr-imenu-mode to create tr-imenu-buffer, insert imenu tree
;; 
;; when `my-tr-imenu-one-buffer' is t
;; If `tr-imenu-buffer' not exists, call tr-imenu-mode to create the buffer,
;; insert the imenu
;; if tr-imenu-buffer exists, `tr-imenu-update-buffer'
(defun my-tr-imenu ()
  (interactive)
  (let* ((old-tree (and (local-variable-p 'my-tr-imenu-tree)
                        my-tr-imenu-tree))
         (root (my-tr-make-node (eval my-tr-imenu-root-name) nil))
         (oldbuf (current-buffer)))
    (save-excursion
      (if (and (local-variable-p 'my-tr-imenu-buffer)
               (buffer-live-p my-tr-imenu-buffer))
          ;; if the tr-imenu-buffer exists
          (with-current-buffer my-tr-imenu-buffer
            (if (and old-tree
                     (member old-tree my-tr-mode-tree-list))
                ;; if the tree is in the buffer
                (setq root old-tree)
              ;; else insert the tree
              (with-current-buffer oldbuf
                (setq root (my-tr-imenu-make-tree root)))
              (my-tr-mode-insert-tree root)))
        (setq root (my-tr-imenu-make-tree root))
        (my-tr-imenu-mode)
        (with-current-buffer my-tr-imenu-buffer
          (my-tr-mode-insert-tree root)))
      (setq my-tr-imenu-tree root))
    (switch-to-buffer my-tr-imenu-buffer)
    (my-tr-mode-contract-trees-except root)
    (funcall my-tr-imenu-window-function (current-buffer) oldbuf)))

(provide 'my-tree-imenu)
;;; tree-imenu.el ends here
