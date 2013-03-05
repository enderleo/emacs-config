<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head><title>EmacsWiki: icicles-menu.el</title><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,NOFOLLOW" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content and diff" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1;diff=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki including minor differences" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;showedit=1" /></head><body class="http://www.emacswiki.org/cgi-bin/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><form class="tiny" action="http://www.emacswiki.org/cgi-bin/emacs"><p>Search: <input type="text" name="search" size="20" /></p></form><h1><a title="Click to search for references to this page" href="http://www.emacswiki.org/cgi-bin/emacs?search=%22icicles-menu%5c.el%22">icicles-menu.el</a></h1></div><div class="content browse"><p><p><a href="http://www.emacswiki.org/cgi-bin/emacs/download/icicles-menu.el">Download</a></p><pre class="source"><pre class="code"><span class="linecomment">;;; icicles-menu.el --- Execute menu items as commands, with completion.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-menu.el</span>
<span class="linecomment">;; Description: Execute menu items as commands, with completion.</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 2005-2006, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Fri Aug 12 17:18:02 2005</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Thu Mar 16 11:10:50 2006 (-28800 Pacific Standard Time)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 346</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-menu.el</span>
<span class="linecomment">;; Keywords: menu-bar, menu, command, help, abbrev, minibuffer, keys,</span>
<span class="linecomment">;;           completion, matching, local, internal, extensions,</span>
<span class="linecomment">;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `subr-21'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Execute menu items as commands, with completion.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Type a menu item.  Completion is available.  Completion candidates</span>
<span class="linecomment">;;  are of the form menu &gt; submenu &gt; subsubmenu...  For example:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  File &gt; Open Recent &gt; Cleanup list File &gt; Open Recent &gt; Edit list...</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  When you choose a menu-item candidate, the corresponding command</span>
<span class="linecomment">;;  is executed.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Put this in your init file (~/.emacs):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (require 'icicles-menu)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Suggested binding:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (global-set-key [?\e ?\M-x] 'icicle-execute-menu-command)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Consider also replacing `tmm-menu':</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (global-set-key [?\M-`] 'icicle-execute-menu-command)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  For a powerful and easy-to-use extension to ordinary minibuffer</span>
<span class="linecomment">;;  completion, try library `icicles.el'.  It enhances the</span>
<span class="linecomment">;;  functionality of `icicles-menu.el' in several ways, but it is not</span>
<span class="linecomment">;;  required, to be able to use `icicles-menu.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Note: If you use MS Windows keyboard accelerators, consider using</span>
<span class="linecomment">;;        `icicle-remove-w32-keybd-accelerators' as the value of</span>
<span class="linecomment">;;        `icicle-convert-menu-item-function'.  It removes any</span>
<span class="linecomment">;;        unescaped `&' characters (indicating an accelerator) from</span>
<span class="linecomment">;;        the menu items.  A library that adds keyboard accelerators</span>
<span class="linecomment">;;        to your menu items is `emacsw32-menu.el', by Lennart Borgman</span>
<span class="linecomment">;;        (&lt;lennart.borgman.073@student.lu.se&gt;).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands defined here: `icicle-execute-menu-command'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Options defined here: `icicle-convert-menu-item-function'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non-interactive functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-escape-w32-accel', `icicle-get-a-menu-item-alist',</span>
<span class="linecomment">;;    `icicle-get-a-menu-item-alist-1',</span>
<span class="linecomment">;;    `icicle-get-overall-menu-item-alist',</span>
<span class="linecomment">;;    `icicle-remove-w32-keybd-accelerators'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Getting Started</span>
<span class="linecomment">;;  ---------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Type `ESC M-x' (that's the same as `ESC ESC x').  You are prompted</span>
<span class="linecomment">;;  for a menu command to execute.  Just start typing its name.  Each</span>
<span class="linecomment">;;  menu item's full name, for completion, has its parent menu names</span>
<span class="linecomment">;;  as prefixes.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ESC M-x</span>
<span class="linecomment">;;  Menu command:</span>
<span class="linecomment">;;  Menu command: T [TAB]</span>
<span class="linecomment">;;  Menu command: Tools &gt; </span>
<span class="linecomment">;;  Menu command: Tools &gt; Compa [TAB]</span>
<span class="linecomment">;;  Menu command: Tools &gt; Compare (Ediff) &gt; Two F [TAB]</span>
<span class="linecomment">;;  Menu command: Tools &gt; Compare (Ediff) &gt; Two Files... [RET]</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Not Just for Wimps and Noobs Anymore</span>
<span class="linecomment">;;  ------------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  *You* don't use menus.  They're too slow.  Only newbies and wimps</span>
<span class="linecomment">;;  use menus.  Not any more!  Use the keyboard to access any menu</span>
<span class="linecomment">;;  item, without knowing where it is or what its full name is.  Type</span>
<span class="linecomment">;;  just part of its name - any part - and use completion to get the</span>
<span class="linecomment">;;  rest: the complete path and item name.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Using `icicles-menu.el' with `icicles.el' lets you cycle through</span>
<span class="linecomment">;;  the menu items in any menu (or all menus), using the arrow keys,</span>
<span class="linecomment">;;  and then hit `RET' (Return) when you get to the command you want,</span>
<span class="linecomment">;;  to execute it.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `icicles.el' gives you even more power and convenience: apropos</span>
<span class="linecomment">;;  completion.  Type any part of a menu-item, then use the Page Up</span>
<span class="linecomment">;;  and Page Down keys ([prior] and [next]) to cycle through all menu</span>
<span class="linecomment">;;  commands that contain the text you typed, somewhere in their name.</span>
<span class="linecomment">;;  You can use `S-TAB' to show and choose from all such apropos</span>
<span class="linecomment">;;  completions, just as you normally use `TAB' to show all prefix</span>
<span class="linecomment">;;  completions (that is, ordinary completions).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Menu Organization Helps You Find a Command</span>
<span class="linecomment">;;  ------------------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Unlike commands listed in a flat `*Apropos*' page, menu items are</span>
<span class="linecomment">;;  organized, grouped logically by common area of application</span>
<span class="linecomment">;;  (`File', `Edit',...).  This grouping is also available when</span>
<span class="linecomment">;;  cycling completion candidates, and you can take advantage of it to</span>
<span class="linecomment">;;  hasten your search for the right command.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  You want to execute a command that puts the cursor at the end of a</span>
<span class="linecomment">;;  buffer, but you don't remember its name, what menu it might be a</span>
<span class="linecomment">;;  part of, or where it might appear in that (possibly complex) menu.</span>
<span class="linecomment">;;  You type `ESC M-x' and type `buffer' at the prompt.  You use the</span>
<span class="linecomment">;;  Page Up and Page Down keys to cycle through all menu items that</span>
<span class="linecomment">;;  contain the word `buffer'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  There are lots of such menu items.  But all items from the same</span>
<span class="linecomment">;;  menu (e.g. `File') are grouped together.  You cycle quickly (not</span>
<span class="linecomment">;;  reading) to the `Edit' menu, because you guess that moving the</span>
<span class="linecomment">;;  cursor has more to do with editing than with file operations, tool</span>
<span class="linecomment">;;  use, buffer choice, help, etc.  Then you cycle more slowly among</span>
<span class="linecomment">;;  the `buffer' menu items in the `Edit' menu.  You quickly find</span>
<span class="linecomment">;;  `Edit &gt; Go To &gt; Goto End of Buffer'.  QED.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Regexp Matching of Menu Items</span>
<span class="linecomment">;;  -----------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Apropos completion also lets you type a regular expression - it is</span>
<span class="linecomment">;;  matched against all of the possible menu items.  So, for instance,</span>
<span class="linecomment">;;  you could type `^e.+buff [next] [next]...' to quickly cycle to</span>
<span class="linecomment">;;  menu command `Edit &gt; Go To &gt; Goto End of Buffer'.  Or type</span>
<span class="linecomment">;;  `.*print.*buf S-TAB' to choose from the list of all menu commands</span>
<span class="linecomment">;;  that match `print' followed somewhere by `buf'.  If you know how</span>
<span class="linecomment">;;  to use regexps, you can easily and quickly get to the menu command</span>
<span class="linecomment">;;  you want, or at least narrow the list of candidates for completion</span>
<span class="linecomment">;;  and cycling.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Learn About Menu Items By Exploring Them</span>
<span class="linecomment">;;  ----------------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  You can display the complete documentation (doc string) for the</span>
<span class="linecomment">;;  command corresponding to each menu item, as the item appears in</span>
<span class="linecomment">;;  the minibuffer.  To do this, just cycle menu-item candidates using</span>
<span class="linecomment">;;  `C-down' or `C-next', instead of `[down]' or `[next]'.  The</span>
<span class="linecomment">;;  documentation appears in buffer `*Help*'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Enjoy!</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  To Do?</span>
<span class="linecomment">;;  ------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  1. Provide an option to sort by menu-bar order, instead of</span>
<span class="linecomment">;;     alphabetically.</span>
<span class="linecomment">;;  2. Echo key bindings for each completed menu item.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  3. Maybe use tmm-get-bind?</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2006/03/16 dadams</span>
<span class="linecomment">;;      Added to Commentary.</span>
<span class="linecomment">;; 2006/02/18 dadams</span>
<span class="linecomment">;;      icicle-execute-menu-command: \s -&gt; \\s.  (Thx to dslcustomer-211-74.vivodi.gr.)</span>
<span class="linecomment">;; 2006/01/07 dadams</span>
<span class="linecomment">;;      Added :link for sending bug reports.</span>
<span class="linecomment">;; 2006/01/06 dadams</span>
<span class="linecomment">;;      Changed defgroup to icicles-menu from icicles.</span>
<span class="linecomment">;;      Added :link.</span>
<span class="linecomment">;; 2005/11/08 dadams</span>
<span class="linecomment">;;     icicle-execute-menu-command: </span>
<span class="linecomment">;;       Reset icicle-menu-items-alist in unwind-protect.</span>
<span class="linecomment">;;       Fix for dynamic menus Select and Paste, Buffers, and Frames: </span>
<span class="linecomment">;;         Treat special cases of last-command-event.</span>
<span class="linecomment">;;     icicle-get-overall-menu-item-alist: setq result of sort.</span>
<span class="linecomment">;; 2005/11/05 dadams</span>
<span class="linecomment">;;     Replaced icicle-menu-items with icicle-menu-items-alist (no need for both).</span>
<span class="linecomment">;;     icicle-execute-menu-command: Set, don't bind icicle-menu-items-alist.</span>
<span class="linecomment">;; 2005/08/23 dadams</span>
<span class="linecomment">;;     icicle-execute-menu-command: renamed alist to icicle-menu-items-alist, so can</span>
<span class="linecomment">;;       refer to it unambiguously in icicle-help-on-candidate (in icicles.el).</span>
<span class="linecomment">;; 2005/08/19 dadams</span>
<span class="linecomment">;;     Added: icicle-convert-menu-item-function, icicle-remove-w32-keybd-accelerators,</span>
<span class="linecomment">;;            icicle-escape-w32-accel.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(when (&lt; emacs-major-version 20) (eval-when-compile (require 'cl))) <span class="linecomment">;; when, unless</span>

(unless (fboundp 'replace-regexp-in-string) (require 'subr-21 nil t))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;</span>



<span class="linecomment">;;; User Options -------------------------------------------</span>

(defgroup Icicles-Menu nil
  "<span class="quote">Execute menu items as commands, with completion.</span>"
  :prefix "<span class="quote">icicle-</span>" :group 'icicles
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>" "<span class="quote">.com?subject=
icicles-menu.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>" "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icicles-menu.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>" "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/IciclesMenu</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Commentary</span>" "<span class="quote">icicles-menu.el</span>")
  )

(defcustom icicle-convert-menu-item-function nil
  "<span class="quote">*Function to call to convert a menu item.
Used by `icicle-execute-menu-command'.  A typical use would be to
remove the `&' characters used in MS Windows menus to define keyboard
accelerators.  See `icicle-remove-w32-keybd-accelerators'.</span>"
  :type  'function :group 'Icicles-Menu)

<span class="linecomment">;; $$$ NOT YET IMPLEMENTED</span>
<span class="linecomment">;; (defcustom icicle-sort-menu-bar-order-flag nil</span>
<span class="linecomment">;;   "*Non-nil means that `icicle-execute-menu-command' uses menu-bar order.</span>
<span class="linecomment">;; Nil means use alphabetic order.</span>
<span class="linecomment">;; The order is what is used for completion.</span>
<span class="linecomment">;; Note: Using a non-nil value imposes an extra sorting operation, which</span>
<span class="linecomment">;;       slows down the creation of the completion-candidates list."</span>
<span class="linecomment">;;   :type 'boolean :group 'Icicles-Menu)</span>



<span class="linecomment">;;; Internal variables -------------------------------------</span>

<span class="linecomment">;; This is used also in `icicle-help-on-candidate', which is defined in `icicles.el'.</span>
(defvar icicle-menu-items-alist nil
  "<span class="quote">Alist of pairs (MENU-ITEM . COMMAND).
The pairs are defined by the current local and global keymaps.
MENU-ITEM is a menu item, with ancestor-menu prefixes.
  Example: `(\</span>"Files &gt; Insert File...\"<span class="quote"> . insert-file)'.
COMMAND is the command  bound to the menu item.</span>")



<span class="linecomment">;;; Functions -------------------------------</span>

(defun icicle-execute-menu-command ()
  "<span class="quote">Execute a menu-bar menu command.
Type a menu item.  Completion is available.</span>"
  (interactive)
  (unwind-protect
       (progn
         (setq icicle-menu-items-alist (icicle-get-overall-menu-item-alist))
         (let* ((menu-item (completing-read "<span class="quote">Menu command: </span>" icicle-menu-items-alist))
                (cmd (cdr (assoc menu-item icicle-menu-items-alist))))
           (unless cmd (error "<span class="quote">No such menu command</span>"))
           <span class="linecomment">;; Treat special cases of `last-command-event', reconstructing it for</span>
           <span class="linecomment">;; menu items that get their meaning from the click itself.</span>
           (cond ((eq cmd 'menu-bar-select-buffer)
                  (string-match "<span class="quote"> &gt;\\s-+\\(.+\\)\\s-+\\*?%?\\s-+\\S-*\\s-*$</span>"
                                menu-item)
                  (setq menu-item (substring menu-item (match-beginning 1) (match-end 1)))
                  (when (string-match "<span class="quote">  \\*?%?</span>" menu-item)
                    (setq menu-item (substring menu-item 0 (match-beginning 0))))
                  (setq last-command-event menu-item))
                 ((eq cmd 'menu-bar-select-yank)
                  (string-match "<span class="quote">Edit &gt; Select and Paste &gt; \\(.*\\)$</span>" menu-item)
                  (setq last-command-event
                        (substring menu-item (match-beginning 1) (match-end 1))))
                 ((eq cmd 'menu-bar-select-frame)
                  (string-match "<span class="quote"> &gt;\\s-[^&gt;]+&gt;\\s-+\\(.+\\)$</span>" menu-item)
                  (setq menu-item (substring menu-item (match-beginning 1) (match-end 1)))
                  (setq last-command-event menu-item)))
           (call-interactively cmd)))
    (setq icicle-menu-items-alist nil))) <span class="linecomment">; Reset it.</span>

(defun icicle-get-overall-menu-item-alist ()
  "<span class="quote">Alist formed from menu items in current local and global keymaps.
See `icicle-get-a-menu-item-alist' for the structure.</span>"
  (let ((alist
         (nconc (icicle-get-a-menu-item-alist (assq 'menu-bar (current-local-map)))
                (icicle-get-a-menu-item-alist (assq 'menu-bar (current-global-map))))))
    (if nil<span class="linecomment">;; icicle-sort-menu-bar-order-flag ; Not yet implemented.</span>
        (setq alist (sort alist))
      alist)))

(defun icicle-get-a-menu-item-alist (keymap)
  "<span class="quote">Alist of pairs (MENU-ITEM . COMMAND) defined by KEYMAP.
KEYMAP is any keymap that has menu items.
MENU-ITEM is a menu item, with ancestor-menu prefixes.
  Example: `(\</span>"Files &gt; Insert File...\"<span class="quote"> . insert-file)'.
COMMAND is the command  bound to the menu item.</span>"
  (setq icicle-menu-items-alist nil)
  (icicle-get-a-menu-item-alist-1 keymap)
  (nreverse icicle-menu-items-alist))

(defun icicle-get-a-menu-item-alist-1 (keymap &optional root)
  "<span class="quote">Helper function for `icicle-get-a-menu-item-alist'.
This calls itself recursively, to process submenus.</span>"
  (let ((scan keymap))
    (setq root (or root))               <span class="linecomment">; nil, for top level.</span>
    (while (consp scan)
      (if (atom (car scan))
          (setq scan (cdr scan))
        (let ((defn (cdr (car scan)))
              composite-name)
          <span class="linecomment">;; Get REAL-BINDING for the menu item.</span>
          (cond
            <span class="linecomment">;; (menu-item ITEM-STRING): non-selectable item - skip it.</span>
            ((and (eq 'menu-item (car-safe defn))
                  (null (cdr-safe (cdr-safe defn))))
             (setq defn nil))           <span class="linecomment">; So `keymapp' test, below, fails.</span>

            <span class="linecomment">;; (ITEM-STRING): non-selectable item - skip it.</span>
            ((and (stringp (car-safe defn)) (null (cdr-safe defn)))
             (setq defn nil))           <span class="linecomment">; So `keymapp' test, below, fails.</span>

            <span class="linecomment">;; (menu-item ITEM-STRING REAL-BINDING . PROPERTIES)</span>
            ((eq 'menu-item (car-safe defn))
             (setq composite-name (concat root (and root "<span class="quote"> &gt; </span>") (eval (cadr defn))))
             (setq defn (car (cddr defn))))

            <span class="linecomment">;; (ITEM-STRING . REAL-BINDING) or</span>
            <span class="linecomment">;; (ITEM-STRING [HELP-STRING] (KEYBD-SHORTCUTS) . REAL-BINDING)</span>
            ((stringp (car-safe defn))
             (setq composite-name (concat root (and root "<span class="quote"> &gt; </span>") (eval (car defn))))
             (setq defn (cdr defn))
             <span class="linecomment">;; Skip HELP-STRING</span>
             (when (stringp (car-safe defn)) (setq defn (cdr defn)))
             <span class="linecomment">;; Skip (KEYBD-SHORTCUTS): cached key-equivalence data for menu items.</span>
             (when (and (consp defn) (consp (car defn))) (setq defn (cdr defn)))))

          <span class="linecomment">;; If REAL-BINDING is a keymap, then recurse on it.</span>
          (when (keymapp defn)
            <span class="linecomment">;; Follow indirections to ultimate symbol naming a command.</span>
            (while (and (symbolp defn) (fboundp defn) (keymapp (symbol-function defn)))
              (setq defn (symbol-function defn)))
            (if (eq 'keymap (car-safe defn))
                (icicle-get-a-menu-item-alist-1 (cdr defn) composite-name)
              (icicle-get-a-menu-item-alist-1 (symbol-function defn) composite-name)))

          <span class="linecomment">;; Add menu item and command pair to `icicle-menu-items-alist' alist.</span>
          <span class="linecomment">;; (`name' is bound in `icicle-get-a-menu-item-alist'.)</span>
          (when (and root (not (keymapp defn)))
            (setq icicle-menu-items-alist
                  (cons
                   (cons (if (and (functionp icicle-convert-menu-item-function)
                                  (stringp composite-name)) <span class="linecomment">; Could be nil</span>
                             (funcall icicle-convert-menu-item-function composite-name)
                           composite-name)
                         defn)
                   icicle-menu-items-alist))))
        (when (consp scan) (setq scan (cdr scan)))))
    icicle-menu-items-alist)) 

(defun icicle-remove-w32-keybd-accelerators (menu-item)
  "<span class="quote">Remove `&' characters that define keyboard accelerators in MS Windows.
\</span>"&&\"<span class="quote"> is an escaped `&' - it is replaced by a single `&'.
This is a candidate value for `icicle-convert-menu-item-function'.</span>"
  (replace-regexp-in-string "<span class="quote">&&?</span>" 'icicle-escape-w32-accel menu-item))

(defun icicle-escape-w32-accel (match-string)
  "<span class="quote">If STRING is \</span>"&&\"<span class="quote">, then return \</span>"&\"<span class="quote">.  Else return \</span>"\"<span class="quote">.</span>"
  (if (&gt; (length match-string) 1) "<span class="quote">&</span>" "<span class="quote"></span>"))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-menu)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-menu.el ends here</span></span></pre></pre></p></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" href="http://www.emacswiki.org/cgi-bin/emacs?action=edit;id=icicles-menu.el">Edit this page</a> <a class="history" href="http://www.emacswiki.org/cgi-bin/emacs?action=history;id=icicles-menu.el">View other revisions</a> <a class="admin" href="http://www.emacswiki.org/cgi-bin/emacs?action=admin;id=icicles-menu.el">Administration</a></span><span class="time"><br /> Last edited 2006-03-16 19:11 UTC by <a class="author" title="from inet-nc01-o.oracle.com" href="http://www.emacswiki.org/cgi-bin/emacs/DrewAdams">DrewAdams</a> <a class="diff" href="http://www.emacswiki.org/cgi-bin/emacs?action=browse;diff=2;id=icicles-menu.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" class="search">
<p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p><div></div>
</form><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="http://creativecommons.org/images/public/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p>
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div></body></html>