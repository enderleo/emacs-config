;;; my-tree.el --- a libary for tree view

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

; Hi-lock: (("^;;; .*" (0 (quote hi-black-hb) t)))
; Hi-lock: ( ("make-variable-buffer-\\(local\\)" (0 font-lock-keyword-face)(1 'italic append)))))
; Hi-lock: end

;;; Code:

;;; User variables
;; graphics supply
(defconst my-tr-mode-images-can-be-used
  (and (or (fboundp 'defimage)
           (fboundp 'make-image-specifier))
       (if (fboundp 'display-images-p)
           (display-images-p)
         window-system)))

(defcustom my-tr-mode-use-images my-tr-mode-images-can-be-used
  "*Non-nil if speedbar should display icons."
  :group 'my-tree
  :version "0.0"
  :type 'boolean)

(defcustom my-tr-mode-image-directory (concat data-directory "images/tree/")
  "Directory of images"
  :group 'my-tree
  :type 'directory)

(defcustom my-tr-mode-window-width 40
  "Width of tree view window"
  :group 'my-tree
  :type 'integer)

(defcustom my-tr-mode-images
  `((open       "[-] " ,(create-image (concat my-tr-mode-image-directory "tree-open.xpm")))
    (close      "[+] " ,(create-image (concat my-tr-mode-image-directory "tree-close.xpm")))
    (no-updated "[x] " ,(create-image (concat my-tr-mode-image-directory "tree-empty.xpm")))
    (leaf       " *  " ,(create-image (concat my-tr-mode-image-directory "tree-leaf.xpm")))
    (guide      " |  " ,(create-image (concat my-tr-mode-image-directory "tree-guide.xpm")))
    (no-guide   "    " ,(create-image (concat my-tr-mode-image-directory "tree-no_guide.xpm")))
    (end-guide  " `- " ,(create-image (concat my-tr-mode-image-directory "tree-end_guide.xpm")))
    (handle     " |- " ,(create-image (concat my-tr-mode-image-directory "tree-handle.xpm"))))
  "contains images possible to draw a tree."
  :group 'tree)

(defcustom my-tr-mode-hook nil
  "Tree mode hook"
  :group 'tree
  :type 'hook)

;;; Tree node manipulation
(defun my-tr-node-new ()
  "this is very lower function, and should not be called."
  (make-symbol "a-tree-node"))
;;  (my-tr-node-put-id (make-symbol "a-tree-node") (setq my-tr-node-id (1+ my-tr-node-id))))
(defun my-tr-node-get-property (property node &optional default)
  (or (get node property) default))
(defun my-tr-node-put-property (property value node)
  (put node property value ))
(defun my-tr-make-node ( text &optional parent)
  "create a node. parent is nil, mean a root node."
  (let ((r (my-tr-node-new)))
    (my-tr-node-put-property :text text r)
    (my-tr-node-put-property :children nil r)
    (my-tr-node-put-property :expended nil r)
    (if (not parent)
        (my-tr-node-put-property :depth 0 r)
      ;; ’‚∏ˆÀ∆∫ı∂‡”‡
      ;; (my-tr-node-put-property :depth (1+ (my-tr-node-get-depth parent)) r)
      ;; insert this node into parent.
      (my-tr-node-insert-child parent r))
    r))
(defun my-tr-node-insert-child (parent child)
  "insert child into parent's children list at the head.."
  (or parent (error "parent is nil. when insert a child."))
  (or child (error "it doesn't make sense to insert a nil child"))
  (let* ((children (my-tr-node-get-children parent)))
    (my-tr-node-put-property :depth (1+ (my-tr-node-get-depth parent)) child)
    (my-tr-node-put-property :parent parent child)
    (my-tr-node-put-property :children (cons child children) parent )))

;; property children.
(defun my-tr-node-get-children(node)
  "return the children node list. nil if node is a leaf node."
  (my-tr-node-get-property :children node))
;; put parent of each elt in childres to node also. the depth of each child is
;; put correctly too.
(defun my-tr-node-put-children(children node)
  "put the children"
  (my-tr-node-put-property :children children node)
  (mapc (function (lambda (n)
          (my-tr-node-put-property :depth (1+ (my-tr-node-get-depth node)) n)
          (my-tr-node-put-property :parent node n)))
        children))
;; if the node has no parent, return t,
;; if the node has parent and the node is last child, return nil
;; else return the rest children
(defun my-tr-node-not-last-child-p(node)
  (let ((parent (my-tr-node-get-parent node)))
    (if parent
        (cdr (memq node (my-tr-node-get-children parent)))
      t)))
;; if parent is nil, then the node is root node.
(defun my-tr-node-root-node-p(node)
  (not (my-tr-node-get-parent node)))
;; whether the node is a leaf node.
(defun my-tr-node-leaf-node-p(node)
  (not (my-tr-node-get-children node)))
;; get next brother
(defun my-tr-node-get-next-brother (node)
  (let ((parent (my-tr-node-get-parent node)))
    (if (not parent)
        nil ;; root node has no next brother.
      (cadr (memq node (my-tr-node-get-children parent))))))
;; ;; is it function useful ?
;; (defun my-tr-node-sort-children (node sortfunc)
;;   (let ((children (my-tr-node-get-children node)))
;;     (my-tr-node-put-property :children 
;;                           (sort children sortfunc) node)))

;; property parent. read only
(defun my-tr-node-get-parent (node)
  "return nil, if node is a root node."
  (my-tr-node-get-property :parent node))

(defun my-tr-node-get-root (node)
  (if (my-tr-node-root-node-p node)
      node
    (let ((parent (my-tr-node-get-parent node)))
      (while (not (my-tr-node-root-node-p parent))
        (setq parent (my-tr-node-get-parent parent)))
      parent)))

;; property depth. read only. depth = 0 means root node.
(defun my-tr-node-get-depth (node)
  "return the depth of a node. read only."
  (my-tr-node-get-property :depth node 0))

;; property text the text property can be a string or a function. if function,
;; the function accept a NODE as a parameter and return a string as text of the
;; node. the text of node is displayed.
(defun my-tr-node-get-text (node)
  (let ((f (my-tr-node-get-property :text node)))
    (cond 
     ((stringp f) f)
     ((functionp f) (funcall f node))
     (t ""))))

;; property token
(defun my-tr-node-get-token (node)
  "return token type of the node"
  (my-tr-node-get-property :token node nil))
(defun my-tr-node-put-token (type node)
  (my-tr-node-put-property :token type node))

(defvar my-tr-node-token-pair '((open . close)
                                (updated . no-updated)))
(defun my-tr-node-toggle-token (node)
  (let ((token (my-tr-node-get-token node))
        pair new)
    (if (setq pair (assoc token my-tr-node-token-pair))
        (setq new (cdr pair))
      (if (setq pair (rassoc token my-tr-node-token-pair))
          (setq new (car pair))))
    (if new
        (my-tr-node-put-token new node))))

;; the function is used to access the property of `update-function'
;; change the undecided node to a stem node or a leaf node.
(defun my-tr-node-get-update-function (node)
  (or (my-tr-node-get-property :update-function node) 'ignore))
(defun my-tr-node-put-update-function (func node)
  (my-tr-node-put-property :update-function func node))

;; the following two function is used to access the property of `updated'
;; if click on a node, then update the node, i.e. get all
;; possible children of the node. for effiency, node is
;; updated on demand. so when a node is not updated, we can
;; not tell whether the node is a leaf node, even it has no
;; children.
(defun my-tr-node-get-updated (node)
  (my-tr-node-get-property :updated node))
(defun my-tr-node-put-updated (v node)
  (my-tr-node-put-property :updated v node))

;; if a node is expanded and all his ancestors are expaned, the node is expaned.
;; otherwise, it is not expanded. the root node is always expaned. 
(defun my-tr-node-get-expended (node)
  (if (not node)
      t ;; root node is expaned. root's parent is nul.
    (if (my-tr-node-get-property :expended node)
        (my-tr-node-get-expended (my-tr-node-get-parent node))
      nil)))
;; put the expaned property of a node.
(defun my-tr-node-put-expended (v node)
  (my-tr-node-put-property :expended v node))

;; check whether a node is visiable. root node is always visiable.
;; a node is visible if his parent is expanded.
(defun my-tr-node-get-visible(node)
  (let ((parent (my-tr-node-get-parent node)))
    (if parent 
        (my-tr-node-get-expended parent)
      ;; root node should be always visiable.
      t)))
;; put all parent of a node expanded. so make the node is visible.
(defun my-tr-node-make-visible(v node)
  (let ((parent (my-tr-node-get-parent node)))
    (when parent
      (my-tr-node-put-expended t parent)
      (my-tr-node-make-visible t parent))))

;; property on-click
(defun my-tr-node-get-action-on-click (node)
  (or (my-tr-node-get-property :on-click node) 'ignore))
(defun my-tr-node-put-action-on-click (func node)
  (my-tr-node-put-property :on-click func node))

(defun my-tr-node-mapc (func node)
  (funcall func node)
  (let ((childen (my-tr-node-get-children node)))
    (if childen 
        (mapc (lambda (n)
                (my-tr-node-mapc func n))
              childen))))

;;; Mode for view a tree
(defvar my-tr-mode-tree-list nil
  "A list of tree in the buffer. The element of the list is a
list which car is the root node")
(defvar my-tr-mode-map nil)
(defvar my-tr-mode-create-tree-hook nil)
(defvar my-tr-mode-delete-tree-hook nil)

(if my-tr-mode-map
    ()
  (progn
    (setq my-tr-mode-map (make-sparse-keymap))
    (define-key my-tr-mode-map (kbd "<RET>") 'my-tr-mode-click-node)
    (define-key my-tr-mode-map (kbd "n") 'my-tr-mode-next-node)
    (define-key my-tr-mode-map (kbd "p") 'my-tr-mode-prev-node)
    (define-key my-tr-mode-map (kbd "N") 'my-tr-mode-next-tree)
    (define-key my-tr-mode-map (kbd "P") 'my-tr-mode-prev-tree)
    (define-key my-tr-mode-map (kbd "d") 'my-tr-mode-delete-tree)
    (define-key my-tr-mode-map (kbd "_") 'my-tr-mode-contract-node)
    (define-key my-tr-mode-map (kbd "-") 'my-tr-mode-contract-this-node)
    (define-key my-tr-mode-map (kbd "=") 'my-tr-mode-expand-node)
    (define-key my-tr-mode-map (kbd "^") 'my-tr-mode-goto-parent)
    (define-key my-tr-mode-map (kbd "!") 'my-tr-mode-contract-trees-except)
    (define-key my-tr-mode-map (kbd "<right>") 'my-tr-mode-expand-node)
    (define-key my-tr-mode-map (kbd "<left>") 'my-tr-mode-contract-node)
    (define-key my-tr-mode-map (kbd "<down>") 'my-tr-mode-next)
    (define-key my-tr-mode-map (kbd "<up>") 'my-tr-mode-prev)
    (define-key my-tr-mode-map (kbd "<down-mouse-1>") 'ignore)
    (define-key my-tr-mode-map (kbd "<mouse-1>") 'my-tr-mode-mouse-click)
    (define-key my-tr-mode-map (kbd "<drag-mouse-1>") 'ignore)
    (define-key my-tr-mode-map (kbd "g") 'my-tr-mode-redraw-tree)
    (define-key my-tr-mode-map (kbd "<SPC>") 'scroll-up)
    (define-key my-tr-mode-map (kbd "<DEL>") 'scroll-down)))

(defun my-tr-mode ()
  "Major mode for view a tree structure:
      Special commands: 
\\{my-tr-mode-map}"
  (make-local-variable 'my-tr-mode-tree-list)
  (make-local-variable 'my-tr-mode-create-tree-hook)
  (make-local-variable 'my-tr-mode-delete-tree-hook)
  (setq major-mode 'my-tr-mode
        mode-name "tree")
  (use-local-map my-tr-mode-map)
  (setq buffer-read-only t)
  (setq truncate-lines t)
  (run-hooks 'my-tr-mode-hook))

;;; Tree display functions
;; get a list of all visible nodes.
(defun my-tr-mode-get-node-list (node)
  (apply 'append (list node)
         (if (my-tr-node-get-expended node)
             (mapcar 'my-tr-mode-get-node-list 
                     (my-tr-node-get-children node))
           nil)))

;; Display node and all his children .
(defun my-tr-mode-insert-tree (root &optional pos)
  "Draw tree at the position `pos'"
  (let ((buffer-read-only nil))
    (goto-char (or pos (point-max)))
    (my-tr-mode-draw-node root)
    (insert "\n")
    (add-to-list 'my-tr-mode-tree-list root t)
    (run-hook-with-args 'my-tr-mode-create-tree-hook root)))

(defun my-tr-mode-delete-tree (force)
  (interactive "P")
  (let ((node (my-tr-mode-node-at-point)) root)
    (if node
        (setq root (my-tr-node-get-root node)))
    (when (or force (y-or-n-p "Delete this tree: "))
      (my-tr-mode-delete-tree-internal root))))

(defun my-tr-mode-delete-tree-internal (root)
  (let ((buffer-read-only nil))
    (when (and root
               (member root my-tr-mode-tree-list))
      (save-excursion
        (goto-char (my-tr-overlay-start (my-tr-node-get-property :overlay root)))
        (my-tr-mode-clear-node root)
        (delete-blank-lines)
        (setq my-tr-mode-tree-list (remove root my-tr-mode-tree-list))
        (run-hook-with-args 'my-tr-mode-delete-tree-hook root)))))

(defun my-tr-mode-draw-node (node)
  (mapc 'my-tr-mode-draw-a-node (my-tr-mode-get-node-list node)))

(defun my-tr-mode-draw-a-node (node)
  "this is a private function, only called by my-tr-mode-draw-node"
  (let ((buffer-read-only nil)
        (token (or (my-tr-node-get-token node)
                   (cond ((not (my-tr-node-get-updated node)) 'no-updated)
                         ((my-tr-node-leaf-node-p node) 'leaf )
                         ((my-tr-node-get-expended node) 'open)
                         (t 'close))))
        (old-point (point))
        begin 
        (overlay (my-tr-node-get-property :overlay node)))
    (or overlay (setq overlay (my-tr-make-overlay 1 1)))
    (when (not (my-tr-node-root-node-p node))
      (insert-char ?\n 1)
      ;; draw some preceding picture to show the tree line.
      (mapc 'my-tr-mode-draw-a-node-draw-a-symbol 
            (reverse (my-tr-mode-draw-a-node-get-preceding (my-tr-node-get-parent node))))
      (if (my-tr-node-not-last-child-p node)
          (my-tr-mode-draw-a-node-draw-a-symbol 'handle)
        (my-tr-mode-draw-a-node-draw-a-symbol 'end-guide)))
    (my-tr-mode-draw-a-node-draw-a-symbol token)
    (setq begin (point))
    (insert (my-tr-node-get-text node))
    (my-tr-move-overlay overlay begin (point))
    (put-text-property begin (point) 'node-at-point node)
    (my-tr-node-put-property :overlay overlay node)))

(defun my-tr-mode-draw-a-node-get-preceding (node)
  (let ((parent (my-tr-node-get-parent node)))
    (if parent
        (cons (if (my-tr-node-not-last-child-p node) 
                  'guide
                'no-guide)
              (my-tr-mode-draw-a-node-get-preceding parent))
      nil)))
(defun my-tr-mode-draw-a-node-draw-a-symbol(type)
  (let* ((pair (assq type my-tr-mode-images))
         (ascii (nth 1 pair))
         (image (nth 2 pair))
         start end)
    (setq start (point))
    (insert ascii)
    (setq end (point))
    (when my-tr-mode-use-images   ;; there are some problem when
                                  ;; display adjance image.
      (put-text-property start end 'display (cons 'image (cdr image))))
    nil))

;;; Functions related with overlay
;; return a cons cell with symbol name overlay, which record start and end, 
(defun my-tr-make-overlay(start end)
  (let ((s (make-symbol "overlay"))
        (m1 (make-marker))
        (m2 (make-marker)))
    (set-marker m1 start (current-buffer))
    (set-marker m2 end (current-buffer))
    (set s (cons m1 m2))
    s))
(defun my-tr-move-overlay( overlay begin end)
  (let ((v (symbol-value overlay)))
    (set-marker (car v) begin)
    (set-marker (cdr v) end)))
(defun my-tr-overlay-buffer(overlay)
  (let ((v (symbol-value overlay)))
    (marker-buffer (car v))))
(defun my-tr-overlay-start(overlay)
  (car (symbol-value overlay)))
(defun my-tr-overlay-end(overlay)
  (cdr (symbol-value overlay)))

;;; Tree contract and expand
;; (defimage my-tr-image-open 
;;   '((:file "open" :type :xpm)
;; ))

;;; Tree display update functions
;; get the region for displaying the node and all his children.
(defun my-tr-node-get-region (node)
  (let* ((parent (my-tr-node-get-parent node))
         (last-node  (car (last (my-tr-mode-get-node-list node))))) ;; last visiable node.
    (cond 
     ((null parent) ;; root node
      (cons 
       ;; for root node has no preceding '\n'.
       (my-tr-get-line-beginning-position (my-tr-overlay-start (my-tr-node-get-property
                                                          :overlay node)))
       (my-tr-get-line-end-position (my-tr-overlay-start (my-tr-node-get-property
                                                    :overlay last-node )))))
     (t
      (cons 
       ;; including the preceding '\n'.
       (1- (my-tr-get-line-beginning-position (my-tr-overlay-start (my-tr-node-get-property
                                                              :overlay node))))
       (my-tr-get-line-end-position (my-tr-overlay-start (my-tr-node-get-property
                                                          :overlay last-node))))))))
;; clear display a node and all hist children
(defun my-tr-mode-clear-node(node)
  (let ((region (my-tr-node-get-region node))
        (buffer-read-only nil))
    (delete-region (car region) (cdr region))))

;; this is a helper function which is used by my-tr-mode-node-at-point if node is
;; containded in the range (s e) then return t.
(defun my-tr-node-at-point-p (node s e)
  (let ((overlay (my-tr-node-get-property :overlay node)))
    (and overlay 
         (buffer-live-p (my-tr-overlay-buffer overlay))
         (<= s (my-tr-overlay-start overlay))
         (>= e (my-tr-overlay-end overlay)))))
;; return the node at a point POS. nil if there is no such node.
(defun my-tr-mode-node-at-point (&optional pos)
  (or pos (setq pos (point)))
  (get-text-property (1- (my-tr-get-line-end-position (point))) 'node-at-point))

;; because the node is updated on demand, i.e. maybe a node has children, the
;; children doesn't exist until the node is updated. the node has a property
;; `updated', it is nil, even the node has no children, we can't tell whether it
;; is a leaf node or not until the node is updated. the node also has a property
;; 'update-function', it is a function accept one parameter, which is the NODE.
;; the function will be involved to update the node. it is reponsibility of the
;; update function to put the property `updated' of a node.
;; `my-tr-node-put-updated' is used to get the property `updated'.
;; `my-tr-node-get-update-function' and `my-tr-node-put-update-function' is used to
;; access the property `update-function'
(defun my-tr-mode-redraw-tree ()
  (interactive)
  (let* ((node (my-tr-mode-node-at-point (point)))
         (root (my-tr-node-get-root node)))
    (goto-char (my-tr-overlay-start (my-tr-node-get-property :overlay root)))
    (my-tr-mode-clear-node root)
    (my-tr-node-mapc (lambda (n)
                       (funcall
                        (my-tr-node-get-update-function n) n))
                     root)
    (my-tr-mode-draw-node root)
    (if node ;; maybe the node is not exists. How to solve this
             ;; problem? No `my-tr-node-offspring-p' function
        (goto-char (my-tr-overlay-start (my-tr-node-get-property :overlay node)))
      (goto-char 1))))
;; Is there need a function to redraw all tree
(defun my-tr-mode-redraw ()
  (interactive)
  (let ((buffer-read-only nil)
        (node (my-tr-mode-node-at-point (point))))
    (erase-buffer)
    (mapc (lambda (root)
            (my-tr-node-mapc (lambda (n)
                               (funcall
                                (my-tr-node-get-update-function n) n))
                             root)
            (my-tr-mode-draw-node root))
          my-tr-mode-tree-list)
    (if node                            ; how to signal error when the
                                        ; node is not exists
        (my-tr-mode-goto-node node)
      (goto-char 1))))

(defun my-tr-mode-expand-node-internal (node)
  (when (and node
             (not (my-tr-node-get-expended node)))
    (save-excursion
      (goto-char (my-tr-overlay-start (my-tr-node-get-property :overlay node)))
      (my-tr-mode-clear-node node)
      (my-tr-node-put-expended t node)
      (my-tr-node-toggle-token node)
      (funcall (my-tr-node-get-update-function node) node)
      (my-tr-mode-draw-node node))
    (forward-char 1)
    (my-tr-mode-adjust-pos)))

(defun my-tr-mode-contract-node-internal (node)
  (when (and node
             (my-tr-node-get-expended node))
    (save-excursion
      (goto-char (my-tr-overlay-start (my-tr-node-get-property :overlay node)))
      (my-tr-mode-clear-node node)
      (my-tr-node-put-expended nil node)
      (my-tr-node-toggle-token node)
      (my-tr-mode-draw-node node))
    (if (null (my-tr-node-root-node-p node)) (forward-line))
    (my-tr-mode-adjust-pos)))

(defun my-tr-mode-expand-node()
  (interactive)
  (let ((node (my-tr-mode-node-at-point (point))))
    (my-tr-mode-expand-node-internal node)))
;; contract this node not it's parent
(defun my-tr-mode-contract-this-node ()
  "Contract node at the point. If the node is contract, do not
contract it's parent"
  (interactive)
  (let ((node (my-tr-mode-node-at-point (point))))
    (when (and node
               (my-tr-node-get-children node))
      (my-tr-mode-contract-node-internal node))))
;; if this node is contract, contract it's parent
(defun my-tr-mode-contract-node()
  "Contract node at the point. If the node is contract, contract
it's parent"
  (interactive)
  (let* ((node (my-tr-mode-node-at-point (point))))
    (when node
      (my-tr-mode-contract-node-internal 
       (if (my-tr-node-get-children node)
           node
         (my-tr-node-get-parent node))))))

(defun my-tr-mode-contract-trees-except (&optional root)
  (interactive)
  (or (and root
           (member root my-tr-mode-tree-list))
      (setq root (my-tr-node-get-root (my-tr-mode-node-at-point))))
  (when root
    (mapc (lambda (r)
            (my-tr-mode-contract-node-internal r))
          (remove root my-tr-mode-tree-list))
    (my-tr-mode-expand-node-internal root)
    (my-tr-mode-goto-node root)))

;;; Movement functions
(defun my-tr-mode-goto-parent ()
  (interactive)
  (my-tr-mode-goto-node (my-tr-node-get-parent
                        (my-tr-mode-node-at-point))))
(defun my-tr-mode-next-node (arg)
  (interactive "p")
  (forward-line (or arg 1))
  (my-tr-mode-adjust-pos))
(defun my-tr-mode-prev-node (arg)
  "Move to the previous ARGth line in a speedbar buffer."
  (interactive "p")
  (my-tr-mode-next-node (if arg (- arg) -1)))

(defun my-tr-mode-goto-node (node)
  (let ((pos (my-tr-overlay-start (my-tr-node-get-property :overlay node))))
;;    (message "node at %s" pos)
    (goto-char pos)))

(defun my-tr-mode-next-tree ()
  (interactive)
  (let* ((root (my-tr-node-get-root (my-tr-mode-node-at-point)))
         (rest (member root my-tr-mode-tree-list))
         (next (cadr rest)))
    (my-tr-mode-goto-node next)))
(defun my-tr-mode-prev-tree ()
  (interactive)
  (let* ((root (my-tr-node-get-root (my-tr-mode-node-at-point)))
         (rest (member root my-tr-mode-tree-list))
         (prev (nth
                (- (length my-tr-mode-tree-list)
                   (length rest) 1)
                my-tr-mode-tree-list)))
    (my-tr-mode-goto-node prev)))

(defun my-tr-get-line-beginning-position (pos)
  (save-excursion
    (goto-char pos)
    (line-beginning-position)))
(defun my-tr-get-line-end-position (pos)
  (save-excursion
    (goto-char pos)
    (line-end-position)))

(defun my-tr-mode-adjust-pos()
  "adjust the point to a beginning of a node."
  (let* ((node (my-tr-mode-node-at-point (point)))
         (overlay (and node (my-tr-node-get-property :overlay node)))
         (pos (and overlay (my-tr-overlay-start overlay))))
    (when pos 
      (goto-char pos)))) 

(defun my-tr-mode-click-node ()
  (interactive)
  (let ((node (my-tr-mode-node-at-point)))
    (when node
      (funcall (my-tr-node-get-action-on-click node) node))))

(defun my-tr-mode-mouse-click(e)
  (interactive "e")
  (let* ((start-event (event-start e))
         (pos (posn-point start-event))
         (window (posn-window start-event))
         (buffer (window-buffer window))
         (current-buffer (current-buffer)))
    (if (not (eq current-buffer buffer))
        (progn
          ;; jump to the window
          (select-window window)
          (with-current-buffer buffer
            (goto-char pos)
            (my-tr-mode-adjust-pos)))
      (let* ((node (my-tr-mode-node-at-point pos))
             (parent (and node (my-tr-node-get-parent node)))
             (overlay (and node (my-tr-node-get-property :overlay node)))
             (start (and overlay (my-tr-overlay-start overlay)))
             (end (and overlay(my-tr-overlay-end overlay))))
        (when node
          (goto-char pos)
          (if (and (>= pos start) (< pos end))
              (my-tr-mode-click-node)
            ;; not click on the label of a tree node. expand or contract a node.
            ;; if not udpated, update it first.
            (if (not (my-tr-node-get-updated node))
                (progn 
                  (funcall (my-tr-node-get-update-function node) node)
                  (my-tr-node-put-expended nil node)))
            (if (my-tr-node-get-expended node)
                (my-tr-mode-contract-node-internal node)
              (my-tr-mode-expand-node-internal node))))))))

;;; Use only debug
(defun tr-image-dump ()
  (interactive)
  (let ((images my-tr-mode-images))
    (switch-to-buffer   (get-buffer-create "*tree-image*"))
    (erase-buffer)
    (insert "image name    image token    image   file\n")
    (insert "=========================================================\n")
    (dolist (img images)
      (insert (format " %-10s %10s        "
                      (symbol-name (car img))
                      (concat "'" (cadr img) "'")))
      (insert-image (nth 2 img))
      (insert (format "     %s\n" (nth 4 (nth 2 img)))))))

(defun tr-dump (node)
  (message 
   (with-output-to-string
     (mapc (lambda (n)
             (princ (symbol-plist n))
             (princ "\n"))
           (my-tr-mode-get-node-list node))))
  t)
(defalias 'tr-node 'my-tr-mode-node-at-point)

(provide 'my-tree)

;;; tree.el ends here
