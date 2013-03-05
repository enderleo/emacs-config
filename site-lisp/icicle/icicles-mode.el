<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head><title>EmacsWiki: icicles-mode.el</title><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,NOFOLLOW" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content and diff" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1;diff=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki including minor differences" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;showedit=1" /></head><body class="http://www.emacswiki.org/cgi-bin/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><form class="tiny" action="http://www.emacswiki.org/cgi-bin/emacs"><p>Search: <input type="text" name="search" size="20" /></p></form><h1><a title="Click to search for references to this page" href="http://www.emacswiki.org/cgi-bin/emacs?search=%22icicles-mode%5c.el%22">icicles-mode.el</a></h1></div><div class="content browse"><p><p><a href="http://www.emacswiki.org/cgi-bin/wiki/download/icicles-mode.el">Download</a></p><pre class="source"><pre class="code"><span class="linecomment">;;; icicles-mode.el --- Icicle Mode definition for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-mode.el</span>
<span class="linecomment">;; Description: Icicle Mode definition for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 2005, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 10:21:10 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Thu Jun 08 15:46:40 2006 (-25200 Pacific Daylight Time)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 130</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-mode.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   None</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines the</span>
<span class="linecomment">;;  command `icicle-mode'.  See `icicles.el' for documentation.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  User options defined here (in Custom group `icicles'):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-mode', `icicle-mode-hook'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Internal variables defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-mode-map'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2006/06/08 dadams</span>
<span class="linecomment">;;     Converted global bindings in icicles-keys.el to icicle-mode-map bindings here.</span>
<span class="linecomment">;;     Added f10 binding for icicle-execute-menu-command.</span>
<span class="linecomment">;; 2006/05/19 dadams</span>
<span class="linecomment">;;     icicle-mode: (add-hook 'kill-emacs-hook 'icicle-control-reminder-prompt).</span>
<span class="linecomment">;; 2006/05/18 dadams</span>
<span class="linecomment">;;     Change :init-value to nil, per new Emacs convention.</span>
<span class="linecomment">;; 2006/05/13 dadams</span>
<span class="linecomment">;;     icicle-mode: Updated doc string.</span>
<span class="linecomment">;; 2006/05/10 dadams</span>
<span class="linecomment">;;     icicle-define-icicle-mode-map: Added menu item Send Bug Report.</span>
<span class="linecomment">;; 2006/04/03 dadams</span>
<span class="linecomment">;;     icicle-define-icicle-mode-map: Added icicle-toggle-(regexp-quote|incremental-completion).</span>
<span class="linecomment">;; 2006/03/16 dadams</span>
<span class="linecomment">;;     icicle-mode: Turn on minibuffer-indicate-depth-mode (Emacs 22 only).</span>
<span class="linecomment">;;     Added soft require of minibuf-depth.el for Emacs 22.</span>
<span class="linecomment">;; 2006/03/14 dadams</span>
<span class="linecomment">;;     Do not use icicle-reset-icicle-completing-p as minibuffer-exit-hook.</span>
<span class="linecomment">;; 2006/03/07 dadams</span>
<span class="linecomment">;;     Corrected menu items for icicle-doc (no name regexp input, just doc regexp).</span>
<span class="linecomment">;; 2006/03/05 dadams</span>
<span class="linecomment">;;     Moved here from icicle-opt.el: icicle-mode, icicle-mode-hook.</span>
<span class="linecomment">;;     Moved here from icicle-fn.el: icicle-mode-map.</span>
<span class="linecomment">;;     Added: icicle-define-icicle-mode-map.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to the</span>
<span class="linecomment">;; Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; ;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(when (fboundp 'define-minor-mode) (require 'minibuf-depth nil t)) <span class="linecomment">; Emacs 22</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>


<span class="linecomment">;;; User Options (alphabetical)</span>

<span class="linecomment">;; Emacs 20 only</span>
(unless (fboundp 'define-minor-mode)
  (defcustom icicle-mode nil
    "<span class="quote">*Toggle minibuffer input completion and cycling.
Setting this variable directly does not take effect;
use either \\[customize] or command `icy-mode' (aka `icicle-mode').</span>"
    :set (lambda (symbol value) (icicle-mode (if value 1 -1)))
    :initialize 'custom-initialize-default
    :type 'boolean
    :group 'icicles
    :require 'icicles))

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-mode-hook nil
  "<span class="quote">*Functions run after entering and exiting Icicle mode.</span>"
  :type 'hook :group 'icicles)


<span class="linecomment">;;; Internal variables (alphabetical) ----------------------</span>

(defvar icicle-mode-map nil
  "<span class="quote">Keymap for Icicle mode.  These are top-level key bindings.
See also `icicle-rebind-completion-maps' for minibuffer bindings.</span>")

(defvar icicle-touche-pas-aux-menus-flag) <span class="linecomment">; Quiet the byte-compiler</span>


<span class="linecomment">;;; Icicle mode command ------------------------------------</span>

(defalias 'icy-mode 'icicle-mode)

<span class="linecomment">;; Main command.  Inspired from `icomplete-mode'.</span>
<span class="linecomment">;;;###autoload</span>
(if (fboundp 'define-minor-mode)
    <span class="linecomment">;; Emacs 21+ ------------</span>
    (eval '(define-minor-mode icicle-mode
            "<span class="quote">Icicle mode: Toggle minibuffer input completion and cycling.
Non-nil prefix ARG turns mode on if ARG &gt; 0, else turns it off.
Icicle mode binds several keys in the minibuffer.

The following top-level commands are also available in Icicle mode:

`icicle-bookmark'                      - Jump to bookmark(s)
`icicle-buffer'(`-other-window')       - Switch to buffer(s)
`icicle-buffer-config'                 - Pick `icicle-buffer' options
`icicle-clear-option'                  - Set binary option(s) to nil
`icicle-color-theme'                   - Change color theme
`icicle-compilation-search'            - `icicle-search' and show hits
`icicle-complete-thesaurus-entry'      - Complete word using thesaurus
`icicle-completion-help'               - Give bindings for completion
`icicle-customize-icicles-group'       - Customize options and faces
`icicle-delete-file'                   - Delete file(s)/directory(s)
`icicle-doc'                           - Show function/variable doc(s)
`icicle-execute-extended-command'      - `execute-extended-command' +
`icicle-find-file'(`-other-window')    - Visit file(s)/directory(s)
`icicle-font'                          - Change font of frame
`icicle-frame-bg'                      - Change background of frame
`icicle-frame-fg'                      - Change foreground of frame
`icicle-fundoc'                        - Show function description(s)
`icicle-imenu'                         - Navigate among Imenu entries
`icicle-insert-thesaurus-entry'        - Insert thesaurus entry(s)
`icicle-locate-file'(`-other-window')  - Visit file(s) in a directory
`icicle-map'                           - Apply function to alist items
`icy-mode' or `icicle-mode'            - Toggle Icicle mode
`icicle-occur'                         - `occur' + apropos icompletion
`icicle-recent-file'(`-other-window')  - Open recently used file(s)
`icicle-reset-option-to-nil'           - Set binary option(s) to nil
`icicle-save-string-to-variable'       - Save text for use with `C-='
`icicle-search'                        - Search with regexps & cycling
`icicle-send-bug-report'               - Send Icicles bug report
`icicle-set-option-to-t'               - Set binary option(s) to t
`icicle-toggle-ignored-extensions'     - Toggle ignoring file suffixes
`icicle-toggle-incremental-completion' - Toggle apropos icompletion
`icicle-toggle-option'                 - Toggle binary user option(s)
`icicle-toggle-sorting'                - Toggle sorting of completions
`icicle-vardoc'                        - Show variable description(s)

For more information, use `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-completion-help]' \
when the minibuffer is active.</span>"
            :global t :group 'icicles :lighter "<span class="quote"> Icy</span>" :init-value nil
            (cond (icicle-mode
                   (unless icicle-mode-map (icicle-define-icicle-mode-map))
                   (add-hook 'minibuffer-setup-hook    'icicle-minibuffer-setup)
                   (add-hook 'minibuffer-exit-hook     'icicle-cancel-*Help*-redirection)
                   (add-hook 'minibuffer-exit-hook     'icicle-restore-region-face)
                   (add-hook 'icicle-post-command-hook 'icicle-activate-mark 'append)
                   <span class="linecomment">;; The pre- and post-command hooks are local to the minibuffer,</span>
                   <span class="linecomment">;; So they are added in `icicle-minibuffer-setup', not here.</span>
                   <span class="linecomment">;; Nevertheless, they are removed here when Icicle mode is exited.</span>
                   (add-hook 'isearch-mode-hook        'icicle-bind-isearch-keys)
                   (add-hook 'completion-setup-hook    'icicle-set-calling-cmd 'append)
                   (add-hook 'kill-emacs-hook          'icicle-control-reminder-prompt)
                   (icicle-undo-std-completion-faces)
                   (icicle-redefine-std-completion-fns)
                   (icicle-redefine-standard-commands)
                   (icicle-redefine-standard-options)
                   (when (fboundp 'minibuffer-indicate-depth-mode)
                     (minibuffer-indicate-depth-mode 99)))
                  (t
                   (remove-hook 'minibuffer-setup-hook    'icicle-minibuffer-setup)
                   (remove-hook 'minibuffer-exit-hook     'icicle-cancel-*Help*-redirection)
                   (remove-hook 'minibuffer-exit-hook     'icicle-restore-region-face)
                   (remove-hook 'icicle-post-command-hook 'icicle-activate-mark)
                   (remove-hook 'pre-command-hook         'icicle-run-icicle-pre-command-hook nil)
                   (remove-hook 'post-command-hook        'icicle-run-icicle-post-command-hook nil)
                   (remove-hook 'isearch-mode-hook        'icicle-bind-isearch-keys)
                   (remove-hook 'completion-setup-hook    'icicle-set-calling-cmd)
                   (remove-hook 'kill-emacs-hook          'icicle-control-reminder-prompt)
                   <span class="linecomment">;; $$$ Should restore standard completion faces here.</span>
                   (icicle-restore-std-completion-fns)
                   (icicle-restore-standard-commands)
                   (icicle-restore-standard-options)
                   (when (fboundp 'minibuffer-indicate-depth-mode)
                     (minibuffer-indicate-depth-mode -99))))
            (message "<span class="quote">Turning %s Icicle mode...</span>" (if icicle-mode "<span class="quote">ON</span>" "<span class="quote">OFF</span>"))
            (icicle-rebind-completion-maps icicle-mode)
            (message "<span class="quote">Turning %s Icicle mode...done</span>" (if icicle-mode "<span class="quote">ON</span>" "<span class="quote">OFF</span>"))))

  <span class="linecomment">;; Emacs 20 ------------</span>
  (defun icicle-mode (&optional arg)
    "<span class="quote">Icicle mode: Toggle minibuffer input completion and cycling.
Non-nil prefix ARG turns mode on if ARG &gt; 0, else turns it off.
Icicle mode binds several keys in the minibuffer.

The following top-level commands are also available in Icicle mode:

`icicle-bookmark'                      - Jump to bookmark(s)
`icicle-buffer'(`-other-window')       - Switch to buffer(s)
`icicle-buffer-config'                 - Pick `icicle-buffer' options
`icicle-clear-option'                  - Set binary option(s) to nil
`icicle-color-theme'                   - Change color theme
`icicle-compilation-search'            - `icicle-search' and show hits
`icicle-complete-thesaurus-entry'      - Complete word using thesaurus
`icicle-completion-help'               - Give bindings for completion
`icicle-customize-icicles-group'       - Customize options and faces
`icicle-delete-file'                   - Delete file(s)/directory(s)
`icicle-doc'                           - Show function/variable doc(s)
`icicle-execute-extended-command'      - `execute-extended-command' +
`icicle-find-file'(`-other-window')    - Visit file(s)/directory(s)
`icicle-font'                          - Change font of frame
`icicle-frame-bg'                      - Change background of frame
`icicle-frame-fg'                      - Change foreground of frame
`icicle-fundoc'                        - Show function description(s)
`icicle-imenu'                         - Navigate among Imenu entries
`icicle-insert-thesaurus-entry'        - Insert thesaurus entry(s)
`icicle-locate-file'(`-other-window')  - Visit file(s) in a directory
`icicle-map'                           - Apply function to alist items
`icy-mode' or `icicle-mode'            - Toggle Icicle mode
`icicle-occur'                         - `occur' + apropos icompletion
`icicle-recent-file'(`-other-window')  - Open recently used file(s)
`icicle-reset-option-to-nil'           - Set binary option(s) to nil
`icicle-save-string-to-variable'       - Save text for use with `C-='
`icicle-search'                        - Search with regexps & cycling
`icicle-send-bug-report'               - Send Icicles bug report
`icicle-set-option-to-t'               - Set binary option(s) to t
`icicle-toggle-ignored-extensions'     - Toggle ignoring file suffixes
`icicle-toggle-incremental-completion' - Toggle apropos icompletion
`icicle-toggle-option'                 - Toggle binary user option(s)
`icicle-toggle-sorting'                - Toggle sorting of completions
`icicle-vardoc'                        - Show variable description(s)

For more information, use `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-completion-help]' \
when the minibuffer is active.</span>"
    (interactive "<span class="quote">P</span>")
    (setq icicle-mode (if arg (&gt; (prefix-numeric-value arg) 0) (not icicle-mode)))
    (icicle-rebind-completion-maps icicle-mode)
    (cond (icicle-mode
           (unless icicle-mode-map (icicle-define-icicle-mode-map))
           <span class="linecomment">;; This is not really necessary after the first time - no great loss.</span>
           (add-hook 'minibuffer-setup-hook    'icicle-minibuffer-setup)
           (add-hook 'minibuffer-exit-hook     'icicle-cancel-*Help*-redirection)
           (add-hook 'minibuffer-exit-hook     'icicle-restore-region-face)
           (add-hook 'icicle-post-command-hook 'icicle-activate-mark 'append)
           <span class="linecomment">;; The pre- and post-command hooks are local to the minibuffer,</span>
           <span class="linecomment">;; So they are added in `icicle-minibuffer-setup', not here.</span>
           <span class="linecomment">;; Nevertheless, they are removed here when Icicle mode is exited.</span>
           (add-hook 'isearch-mode-hook        'icicle-bind-isearch-keys)
           (add-hook 'completion-setup-hook    'icicle-set-calling-cmd 'append)
           (add-hook 'kill-emacs-hook          'icicle-control-reminder-prompt)
           (icicle-redefine-std-completion-fns)
           (icicle-redefine-standard-commands)
           (icicle-redefine-standard-options)
           (run-hooks 'icicle-mode-hook)
           (message "<span class="quote">Icicle mode is now ON</span>"))
          (t
           (remove-hook 'minibuffer-setup-hook    'icicle-minibuffer-setup)
           (remove-hook 'minibuffer-exit-hook     'icicle-cancel-*Help*-redirection)
           (remove-hook 'minibuffer-exit-hook     'icicle-restore-region-face)
           (remove-hook 'icicle-post-command-hook 'icicle-activate-mark)
           (remove-hook 'pre-command-hook         'icicle-run-icicle-pre-command-hook nil)
           (remove-hook 'post-command-hook        'icicle-run-icicle-post-command-hook nil)
           (remove-hook 'isearch-mode-hook        'icicle-bind-isearch-keys)
           (remove-hook 'completion-setup-hook    'icicle-set-calling-cmd)
           (remove-hook 'kill-emacs-hook          'icicle-control-reminder-prompt)
           (icicle-restore-std-completion-fns)
           (icicle-restore-standard-commands)
           (icicle-restore-standard-options)
           (run-hooks 'icicle-mode-hook)
           (message "<span class="quote">Icicle mode is now OFF</span>"))))
  (add-to-list 'minor-mode-alist '(icicle-mode "<span class="quote"> Icy</span>")))

(defun icicle-define-icicle-mode-map ()
  "<span class="quote">Define `icicle-mode-map'.</span>"
  (let ((map (make-sparse-keymap "<span class="quote">Icicles</span>")))
    (define-key map [menu-bar] (make-sparse-keymap))
    (define-key map [menu-bar icicles] (cons "<span class="quote">Icicles</span>" map))
    (define-key map [icicle-mode] '("<span class="quote">Turn Off Icicle Mode</span>" . icicle-mode))
    (define-key map [icicle-report-bug] '("<span class="quote">Send Bug Report</span>" . icicle-send-bug-report))
    (define-key map [icicle-help] '("<span class="quote">Help</span>" . icicle-completion-help))
    (define-key map [icicle-separator-last] '("<span class="quote">--</span>"))
    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-frames-menu)) <span class="linecomment">; Defined in `menu-bar+.el'.</span>
           (define-key menu-bar-frames-menu [icicle-separator-frame] '("<span class="quote">--</span>"))
           (define-key menu-bar-frames-menu [icicle-font] '("<span class="quote">[Icy] Change Font</span>" . icicle-font))
           (define-key menu-bar-frames-menu [icicle-frame-fg]
             '("<span class="quote">[Icy] Change Foreground...</span>" . icicle-frame-fg))
           (define-key menu-bar-frames-menu [icicle-frame-bg]
             '("<span class="quote">[Icy] Change Background...</span>" . icicle-frame-bg)))
          (t
           (define-key map [icicle-font] '("<span class="quote">Change Font of Frame...</span>" . icicle-font))
           (define-key map [icicle-frame-fg]
             '("<span class="quote">Change Foreground of Frame...</span>" . icicle-frame-fg))
           (define-key map [icicle-frame-bg]
             '("<span class="quote">Change Background of Frame...</span>" . icicle-frame-bg))
           (define-key map [icicle-separator-frame] '("<span class="quote">--</span>"))))
    (put 'icicle-font 'menu-enable
         '(and icicle-mode
           (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
    (put 'icicle-frame-bg 'menu-enable
         '(and icicle-mode
           (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
    (put 'icicle-frame-fg 'menu-enable
         '(and icicle-mode
           (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-describe-menu)) <span class="linecomment">; Use Describe menu, if available.</span>
           (define-key menu-bar-describe-menu [icicle-separator-doc] '("<span class="quote">--</span>"))
           (define-key menu-bar-describe-menu [icicle-doc]
             '("<span class="quote">[Icy] Function or Var with Doc...</span>" . icicle-doc))
           (define-key menu-bar-describe-menu [icicle-fundoc]
             '("<span class="quote">[Icy] Function with Name, Doc...</span>" . icicle-fundoc))
           (define-key menu-bar-describe-menu [icicle-vardoc]
             '("<span class="quote">[Icy] Variable with Name, Doc...</span>" . icicle-vardoc)))
          (t
           (define-key map [icicle-doc]
             '("<span class="quote">Describe Function or Var with Doc...</span>" . icicle-doc))
           (define-key map [icicle-fundoc]
             '("<span class="quote">Describe Function with Name, Doc...</span>" . icicle-fundoc))
           (define-key map [icicle-vardoc]
             '("<span class="quote">Describe Variable with Name, Doc...</span>" . icicle-vardoc))
           (define-key map [icicle-separator-doc] '("<span class="quote">--</span>"))))
    (define-key map [icicle-color-theme] '("<span class="quote">Choose Color Theme...</span>" . icicle-color-theme))
    (put 'icicle-color-theme 'menu-enable
         '(and icicle-mode
           (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
    (define-key map [icicle-complete-thesaurus-entry]
      '("<span class="quote">Complete with Thesaurus...</span>" . icicle-complete-thesaurus-entry))
    (put 'icicle-complete-thesaurus-entry 'menu-enable
         '(and icicle-mode (not buffer-read-only) (boundp 'synonyms-obarray)))
    (define-key map [icicle-separator-misc] '("<span class="quote">--</span>"))
    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-apropos-menu)) <span class="linecomment">; Use Apropos menu, if available.</span>
           (define-key menu-bar-apropos-menu [icicle-separator-apropos] '("<span class="quote">--</span>"))
           (define-key menu-bar-apropos-menu [icicle-apropos-zippy]
             '("<span class="quote">[Icy] Zippy...</span>" . icicle-apropos-zippy))
           (cond ((fboundp 'apropos-option)
                  (define-key menu-bar-apropos-menu [icicle-apropos]
                    '("<span class="quote">[Icy] Symbols...</span>" . icicle-apropos))
                  (define-key menu-bar-apropos-menu [icicle-apropos-function]
                    '("<span class="quote">[Icy] Functions...</span>" . icicle-apropos-function))
                  (define-key menu-bar-apropos-menu [icicle-apropos-variable]
                    '("<span class="quote">[Icy] Variables...</span>" . icicle-apropos-variable))
                  (define-key menu-bar-apropos-menu [icicle-apropos-option]
                    '("<span class="quote">[Icy] Options...</span>" . icicle-apropos-option))
                  (define-key menu-bar-apropos-menu [icicle-apropos-command]
                    '("<span class="quote">[Icy] Commands...</span>" . icicle-apropos-command)))
                 (t
                  (define-key menu-bar-apropos-menu [icicle-apropos-variable]
                    '("<span class="quote">[Icy] Variables...</span>" . icicle-apropos-variable))))
           (define-key menu-bar-apropos-menu [icicle-apropos-command]
             '("<span class="quote">[Icy] Commands...</span>" . icicle-apropos-command)))
          (t
           (define-key map [icicle-apropos-zippy] '("<span class="quote">Apropos Zippy...</span>" . icicle-apropos-zippy))
           (cond ((fboundp 'apropos-option)
                  (define-key map [icicle-apropos]
                    '("<span class="quote">Apropos...</span>" . icicle-apropos))
                  (define-key map [icicle-apropos-function]
                    '("<span class="quote">Apropos Functions...</span>" . icicle-apropos-function))
                  (define-key map [icicle-apropos-variable]
                    '("<span class="quote">Apropos Variables...</span>" . icicle-apropos-variable))
                  (define-key map [icicle-apropos-option]
                    '("<span class="quote">Apropos Options...</span>" . icicle-apropos-option))
                  (define-key map [icicle-apropos-command]
                    '("<span class="quote">Apropos Commands...</span>" . icicle-apropos-command)))
                 (t
                  (define-key map [icicle-apropos-variable]
                    '("<span class="quote">Apropos Variables...</span>" . icicle-apropos-variable))
                  (define-key map [icicle-apropos-command]
                    '("<span class="quote">Apropos Commands...</span>" . icicle-apropos-command))))
           (define-key map [icicle-separator-apropos] '("<span class="quote">--</span>"))))
    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-options-menu)) <span class="linecomment">; Use Options menu, if available.</span>
           (define-key menu-bar-options-menu [icicle-separator-toggle] '("<span class="quote">--</span>"))
           (define-key menu-bar-options-menu [icicle-set-option-to-t]
             '("<span class="quote">[Icy] Turn On Option...</span>" . icicle-set-option-to-t))
           (define-key menu-bar-options-menu [icicle-reset-option-to-nil]
             '("<span class="quote">[Icy] Turn Off Option...</span>" . icicle-reset-option-to-nil))
           (define-key menu-bar-options-menu [icicle-toggle-option]
             '("<span class="quote">[Icy] Toggle Option...</span>" . icicle-toggle-option))
           (define-key menu-bar-options-menu [icicle-toggle-regexp-quote]
             '("<span class="quote">[Icy] Toggle Escaping Special Chars</span>" . icicle-toggle-regexp-quote))
           (define-key menu-bar-options-menu [icicle-toggle-incremental-completion]
             '("<span class="quote">[Icy] Toggle Incremental Completion</span>" . icicle-incremental-completion))
           (define-key menu-bar-options-menu [icicle-toggle-sorting]
             '("<span class="quote">[Icy] Toggle Completion Sorting</span>" . icicle-toggle-sorting))
           (define-key menu-bar-options-menu [icicle-toggle-ignore]
             '("<span class="quote">[Icy] Toggle Ignored File Extensions</span>" . icicle-toggle-ignored-extensions)))
          (t
           (define-key map [icicle-set-option-to-t]
             '("<span class="quote">Turn On Option...</span>" . icicle-set-option-to-t))
           (define-key map [icicle-reset-option-to-nil]
             '("<span class="quote">Turn Off Option...</span>" . icicle-reset-option-to-nil))
           (define-key map [icicle-toggle-option] '("<span class="quote">Toggle Option...</span>" . icicle-toggle-option))
           (define-key map [icicle-toggle-sorting]
             '("<span class="quote">Toggle Completion Sorting</span>" . icicle-toggle-sorting))
           (define-key map [icicle-toggle-ignore]
             '("<span class="quote">Toggle Ignored File Extensions</span>" . icicle-toggle-ignored-extensions))
           (define-key map [icicle-separator-toggle] '("<span class="quote">--</span>"))))
    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-file-menu)) <span class="linecomment">; Use File menu, if available.</span>
           (define-key menu-bar-file-menu [icicle-file-separator] '("<span class="quote">--</span>"))
           (define-key menu-bar-file-menu [icicle-delete-file]
             '("<span class="quote">[Icy] Delete File...</span>" . icicle-delete-file))
           (when (condition-case nil (require 'recentf) (error nil))
             (define-key menu-bar-file-menu [icicle-recent-file-other-window]
               '("<span class="quote">[Icy] Open Recent File Other Window...</span>" . icicle-recent-file-other-window))
             (define-key menu-bar-file-menu [icicle-recent-file]
               '("<span class="quote">[Icy] Open Recent File...</span>" . icicle-recent-file)))
           (define-key menu-bar-file-menu [icicle-find-file-other-window]
             '("<span class="quote">[Icy] Open File or Directory Other Window...</span>" . icicle-find-file-other-window))
           (define-key menu-bar-file-menu [icicle-find-file]
             '("<span class="quote">[Icy] Open File or Directory...</span>" . icicle-find-file)))
          (t
           (define-key map [icicle-delete-file] '("<span class="quote">Delete File...</span>" . icicle-delete-file))
           (when (condition-case nil (require 'recentf) (error nil))
             (define-key map [icicle-recent-file-other-window]
               '("<span class="quote">Open Recent File Other Window...</span>" . icicle-recent-file-other-window))
             (define-key map [icicle-recent-file]
               '("<span class="quote">Open Recent File...</span>" . icicle-recent-file)))
           (define-key map [icicle-find-file-other-window]
             '("<span class="quote">Open File or Directory Other Window...</span>" . icicle-find-file-other-window))
           (define-key map [icicle-find-file]
             '("<span class="quote">Open File or Directory ...</span>" . icicle-find-file))))
    (put 'icicle-delete-file 'menu-enable
         '(and icicle-mode
           (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
    (put 'icicle-find-file 'menu-enable
         '(and icicle-mode
           (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
    (put 'icicle-find-file-other-window 'menu-enable
         '(and icicle-mode
           (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
    (when (condition-case nil (require 'recentf) (error nil))
      (put 'icicle-recent-file 'menu-enable
           '(and icicle-mode
             (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
      (put 'icicle-recent-file-other-window 'menu-enable
           '(and icicle-mode
             (not (window-minibuffer-p (frame-selected-window menu-updating-frame))))))
    (define-key map [icicle-add-buffer-config]
      '("<span class="quote">New Buffer Configuration...</span>" . icicle-add-buffer-config))
    (define-key map [icicle-buffer-config]
      '("<span class="quote">Choose Buffer Configuration...</span>" . icicle-buffer-config))
    (put 'icicle-buffer-config 'menu-enable '(and icicle-mode icicle-buffer-configs))
    (define-key map [icicle-remove-buffer-candidate]
      '("<span class="quote">Don't Always Include Buffer...</span>" . icicle-remove-buffer-candidate))
    (put 'icicle-remove-buffer-candidate 'menu-enable '(and icicle-mode icicle-buffer-extras))
    (define-key map [icicle-add-buffer-candidate]
      '("<span class="quote">Always Include Buffer...</span>" . icicle-add-buffer-candidate))
    (define-key map [icicle-buffer-other-window]
      '("<span class="quote">Switch To Buffer Other Window...</span>" . icicle-buffer-other-window))
    (put 'icicle-buffer-other-window 'menu-enable
         '(and icicle-mode
           (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
    (define-key map [icicle-buffer] '("<span class="quote">Switch To Buffer...</span>" . icicle-buffer))
    (put 'icicle-buffer 'menu-enable
         '(and icicle-mode
           (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-bookmark-map)) <span class="linecomment">; Use Bookmarks menu, if available.</span>
           (require 'bookmark)          <span class="linecomment">; `bookmark-buffer-name' is not autoloaded.</span>
           (define-key menu-bar-bookmark-map [icicle-bookmark]
             '("<span class="quote">[Icy] Jump to Bookmark Using Icicles...</span>" . icicle-bookmark)))
          (t
           (define-key map [icicle-bookmark] '("<span class="quote">Jump To Bookmark...</span>" . icicle-bookmark))
           (define-key map [icicle-separator-bookmark-buffer] '("<span class="quote">--</span>"))))
    (put 'icicle-bookmark 'menu-enable
         '(and icicle-mode
           (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-search-menu)) <span class="linecomment">; Use Search menu, if available.</span>
           (define-key menu-bar-search-menu [icicle-separator-search] '("<span class="quote">--</span>"))
           (define-key menu-bar-search-menu [icicle-compilation-search]
             '("<span class="quote">[Icy] Search Compilation/Grep Hits (Regexp)...</span>" . icicle-compilation-search))
           (define-key menu-bar-search-menu [icicle-search]
             '("<span class="quote">[Icy] Search (Regexp)...</span>" . icicle-search)))
          (t
           (define-key map [icicle-compilation-search]
             '("<span class="quote">Search Compilation/Grep Hits (Regexp)...</span>" . icicle-compilation-search))
           (define-key map [icicle-search] '("<span class="quote">Search (Regexp)...</span>" . icicle-search))))
    (put 'icicle-compilation-search 'menu-enable
         '(and icicle-mode
           (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
           (condition-case nil (eq (current-buffer) (compilation-find-buffer)) (error nil))))
    (put 'icicle-search 'menu-enable
         '(and icicle-mode
           (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))

    <span class="linecomment">;; Optional bindings - governed by `icicle-bind-top-level-commands-flag'.</span>
    (when icicle-bind-top-level-commands-flag
      (define-key map "<span class="quote">\C-c\C-s</span>" 'icicle-search)
      (define-key map "<span class="quote">\C-c/</span>"    'icicle-complete-thesaurus-entry)
      
      <span class="linecomment">;; Replace some standard bindings - use Icicles multi-commands instead.</span>
      (define-key map "<span class="quote">\M-x</span>"     'icicle-execute-extended-command)
      (substitute-key-definition 'switch-to-buffer 'icicle-buffer map global-map)
      (substitute-key-definition 'switch-to-buffer-other-window 'icicle-buffer-other-window
                                 map global-map)
      (substitute-key-definition 'find-file 'icicle-find-file map global-map)
      (substitute-key-definition 'find-file-other-window 'icicle-find-file-other-window
                                 map global-map)
      (substitute-key-definition 'kill-buffer 'icicle-kill-buffer map global-map)
      (substitute-key-definition 'kill-buffer-and-its-windows 'icicle-kill-buffer map global-map)
      
      <span class="linecomment">;; These are not Icicle mode bindings, but it's convenient to do this here.</span>
      (add-hook 'compilation-minor-mode-hook
                (lambda () (define-key compilation-minor-mode-map
                               "<span class="quote">\C-c\C-s</span>" 'icicle-compilation-search)))
      (add-hook 'compilation-mode-hook
                (lambda () (define-key compilation-mode-map
                               "<span class="quote">\C-c\C-s</span>" 'icicle-compilation-search)))
      
      <span class="linecomment">;; This is for Icicles Menu, not Icicles, but it's convenient to do this here.</span>
      (when (fboundp 'icicle-execute-menu-command) <span class="linecomment">; Defined in `icicles-menu.el'.</span>
        (define-key map [?\e ?\M-x] 'icicle-execute-menu-command)
        (define-key map [?\M-`] 'icicle-execute-menu-command)
        (define-key map [f10] 'icicle-execute-menu-command))) <span class="linecomment">; Replaces `tmm-menu'.</span>

    (push (cons 'icicle-mode map) minor-mode-map-alist)
    (setq icicle-mode-map map)))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-mode)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-mode.el ends here</span></span></pre></pre></p></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" href="http://www.emacswiki.org/cgi-bin/emacs?action=edit;id=icicles-mode.el">Edit this page</a> <a class="history" href="http://www.emacswiki.org/cgi-bin/emacs?action=history;id=icicles-mode.el">View other revisions</a> <a class="admin" href="http://www.emacswiki.org/cgi-bin/emacs?action=admin;id=icicles-mode.el">Administration</a></span><span class="time"><br /> Last edited 2006-06-08 22:50 UTC by <a class="author" title="from inet-nc01-o.oracle.com" href="http://www.emacswiki.org/cgi-bin/emacs/DrewAdams">DrewAdams</a> <a class="diff" href="http://www.emacswiki.org/cgi-bin/emacs?action=browse;diff=2;id=icicles-mode.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" class="search">
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