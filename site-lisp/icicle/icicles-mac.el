<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head><title>EmacsWiki: icicles-mac.el</title><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,NOFOLLOW" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content and diff" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1;diff=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki including minor differences" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;showedit=1" /></head><body class="http://www.emacswiki.org/cgi-bin/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><form class="tiny" action="http://www.emacswiki.org/cgi-bin/emacs"><p>Search: <input type="text" name="search" size="20" /></p></form><h1><a title="Click to search for references to this page" href="http://www.emacswiki.org/cgi-bin/emacs?search=%22icicles-mac%5c.el%22">icicles-mac.el</a></h1></div><div class="content browse"><p><p><a href="http://www.emacswiki.org/cgi-bin/wiki/download/icicles-mac.el">Download</a></p><pre class="source"><pre class="code"><span class="linecomment">;;; icicles-mac.el --- Macros for Icicles</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; Filename: icicles-mac.el</span>
<span class="linecomment">;; Description: Macros for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 2005, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:24:28 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Tue May 16 17:28:37 2006 (-25200 Pacific Daylight Time)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 54</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-mac.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   None</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;; Commentary: </span>
<span class="linecomment">;; </span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  macros.  See `icicles.el' for documentation.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;  Macros defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-define-command', `icicle-define-file-command'.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;  Standard Emacs function defined here for older Emacs versions:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `select-frame-set-input-focus'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2006/05/16 dadams</span>
<span class="linecomment">;;     icicle-define(-file)-command: Treat cases where user wiped out orig-buff or orig-window.</span>
<span class="linecomment">;; 2006/03/31 dadams</span>
<span class="linecomment">;;     icicle-define(-file)-command: Wrap action function in unwind-protect to select minibuf frame.</span>
<span class="linecomment">;; 2006/03/11 dadams</span>
<span class="linecomment">;;     icicle-define-file-command: Expand file in directory of icicle-last-input.</span>
<span class="linecomment">;; 2006/03/08 dadams</span>
<span class="linecomment">;;     icicle-define(-file)-command: Bug fix (thx to TobyCubitt):</span>
<span class="linecomment">;;       Make sure icicle-candidate-action-fn runs FUNCTION in original buffer and window.</span>
<span class="linecomment">;; 2006/03/07 dadams</span>
<span class="linecomment">;;     icicle-define(-file)-command: Mention in doc string that BINDINGS are not in effect</span>
<span class="linecomment">;;       within icicle-candidate-action-fn.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to the</span>
<span class="linecomment">;; Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; ;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;; Code:</span>

<span class="linecomment">;; Byte-compiling this file, you will likely get some error or warning</span>
<span class="linecomment">;; messages. All of the following are benign.  They are due to</span>
<span class="linecomment">;; differences between different versions of Emacs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Compiling in Emacs 20:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; the function x-focus-frame is not known to be defined.</span>

(when (&lt; emacs-major-version 20) (eval-when-compile (require 'cl))) <span class="linecomment">;; when, unless</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>




<span class="linecomment">;;; Macros  ------------------------------------------------</span>

(defmacro icicle-define-command
    (command doc-string function
     prompt table &optional predicate require-match initial-input hist def inherit-input-method
     bindings first-sexp undo-sexp last-sexp)
  <span class="linecomment">;; Hard-code these in doc string, because \\[...] prefers ASCII</span>
  <span class="linecomment">;; `C-RET'   instead of `\\[icicle-candidate-action]'</span>
  <span class="linecomment">;; `C-next'  instead of `\\[icicle-next-prefix-candidate-action]'</span>
  <span class="linecomment">;; `C-prior' instead of `\\[icicle-previous-prefix-candidate-action]'</span>
  <span class="linecomment">;; `next'    instead of `\\[icicle-next-apropos-candidate-action]'</span>
  <span class="linecomment">;; `prior'   instead of `\\[icicle-previous-apropos-candidate-action]'</span>
  "<span class="quote">Define COMMAND with DOC-STRING based on FUNCTION.
COMMAND is a symbol.  DOC-STRING is a string.
FUNCTION is a function that takes one argument, read as input.
  (If the argument to FUNCTION is a file name or directory name, then
  use macro `icicle-define-file-command', instead.)

BINDINGS is a list of `let*' bindings added around the command code.
  The following bindings are pre-included - you can refer to them in
  the command body (including in FIRST-SEXP, LAST-SEXP, UNDO-SEXP).

  `orig-buff'   is bound to (current-buffer)
  `orig-window' is bound to (selected-window)

In case of error or user quit, the original buffer is restored.

FIRST-SEXP is a sexp evaluated before the main body of the command.
UNDO-SEXP is a sexp evaluated in case of error or if the user quits.
LAST-SEXP is a sexp evaluated after the main body of the command.

Other arguments are as for `completing-read'.

In order, the created command does this:

 - Uses DOC-STRING, with information about Icicles bindings appended.
 - Binds BINDINGS for the rest of the command.
 - Evaluates FIRST-SEXP.
 - Reads input with `completing-read', using PROMPT, TABLE, PREDICATE,
   REQUIRE-MATCH, INITIAL-INPUT, HIST, DEF, and INHERIT-INPUT-METHOD.
 - Calls FUNCTION on the input that was read.
 - Evaluates UNDO-SEXP in case of error or if the user quits.
 - Evaluates LAST-SEXP.

The created command also binds `icicle-candidate-action-fn' to a
function that calls FUNCTION on the current completion candidate.
Note that BINDINGS are of course not in effect within
`icicle-candidate-action-fn'.</span>"
  `(defun ,command ()
    ,(concat doc-string "<span class="quote">\n\nRead input, then </span>"
             (and (symbolp function) (concat "<span class="quote">call `</span>" (symbol-name function) "<span class="quote">' to </span>"))
             "<span class="quote">act on it.

Input-candidate completion and cycling are available.  While cycling,
these keys act on the current candidate:

\\&lt;minibuffer-local-completion-map&gt;\
`C-RET'   - Act on current completion candidate only
`C-next'  - Act, then move to next \
prefix-completion candidate
`C-prior' - Act, then move to previous \
prefix-completion candidate
`next'    - Act, then move to next \
apropos-completion candidate
`prior'   - Act, then move to previous \
apropos-completion candidate
`\\[icicle-all-candidates-action]'     - Act on *all* candidates, successively (careful!)

Use `RET' or `S-RET' to finally choose a candidate, or `C-g' to quit.
This is an Icicles command - see `icicle-mode'.</span>")
    (interactive)
    (let* ((orig-buff (current-buffer))
           (orig-window (selected-window))
           ,@bindings
           (icicle-candidate-action-fn
            (lambda (candidate)
              (unwind-protect
                   (condition-case action-fn-return
                       (progn
                         (condition-case in-action-fn
                             <span class="linecomment">;; Treat 3 cases, because previous use of `icicle-candidate-action-fn'</span>
                             <span class="linecomment">;; might have killed the buffer or deleted the window.</span>
                             (if (and (buffer-live-p orig-buff) (window-live-p orig-window))
                                 (with-current-buffer orig-buff
                                   (save-selected-window
                                     (select-window orig-window)
                                     (funcall ',function candidate)))
                               (if (window-live-p orig-window)
                                   (save-selected-window
                                     (select-window orig-window)
                                     (funcall ',function candidate))
                                 (funcall ',function candidate)))
                           (error (unless (string= "<span class="quote">Cannot switch buffers in minibuffer window</span>"
                                                   (error-message-string in-action-fn))
                                    (error (error-message-string in-action-fn)))
                                  (select-frame-set-input-focus (window-frame orig-window))
                                  (funcall ',function candidate)))
                         (select-frame-set-input-focus (window-frame (minibuffer-window)))
                         nil)           <span class="linecomment">; Return nil for success.</span>
                     (error (error-message-string action-fn-return))) <span class="linecomment">; Return error msg.</span>
                (select-frame-set-input-focus (window-frame (minibuffer-window)))))))
      
      ,first-sexp
      (condition-case act-on-choice
          (funcall ',function (completing-read ,prompt ,table ,predicate ,require-match
                                               ,initial-input ,hist ,def ,inherit-input-method))
        (quit (when (buffer-live-p orig-buff) (switch-to-buffer orig-buff)) ,undo-sexp)
        (error (when (buffer-live-p orig-buff) (switch-to-buffer orig-buff)) ,undo-sexp
               (error (error-message-string act-on-choice))))
      ,last-sexp)))

(defmacro icicle-define-file-command
    (command doc-string function
     prompt &optional dir default-filename require-match initial-input predicate
     bindings first-sexp undo-sexp last-sexp)
  <span class="linecomment">;; Hard-code these in doc string, because \\[...] prefers ASCII</span>
  <span class="linecomment">;; `C-RET'   instead of `\\[icicle-candidate-action]'</span>
  <span class="linecomment">;; `C-next'  instead of `\\[icicle-next-prefix-candidate-action]'</span>
  <span class="linecomment">;; `C-prior' instead of `\\[icicle-previous-prefix-candidate-action]'</span>
  <span class="linecomment">;; `next'    instead of `\\[icicle-next-apropos-candidate-action]'</span>
  <span class="linecomment">;; `prior'   instead of `\\[icicle-previous-apropos-candidate-action]'</span>
  "<span class="quote">Define COMMAND with DOC-STRING based on FUNCTION.
COMMAND is a symbol.  DOC-STRING is a string.
FUNCTION is a function that takes one file-name or directory-name
argument, read as input.  (Use macro `icicle-define-command' for a
FUNCTION whose argument is not a file or directory name.)

BINDINGS is a list of `let*' bindings added around the command code.
  The following bindings are pre-included - you can refer to them in
  the command body (including in FIRST-SEXP, LAST-SEXP, UNDO-SEXP).

  `orig-buff'   is bound to (current-buffer)
  `orig-window' is bound to (selected-window)

In case of error or user quit, the original buffer is restored.

FIRST-SEXP is a sexp evaluated before the main body of the command.
UNDO-SEXP is a sexp evaluated in case of error or if the user quits.
LAST-SEXP is a sexp evaluated after the main body of the command.

Other arguments are as for `read-file-name'.

In order, the created command does this:

 - Uses DOC-STRING, with information about Icicles bindings appended.
 - Binds BINDINGS for the rest of the command.
 - Evaluates FIRST-SEXP.
 - Reads input with `read-file-name', using PROMPT, DIR,
   DEFAULT-FILENAME, REQUIRE-MATCH, INITIAL-INPUT, and PREDICATE.
 - Calls FUNCTION on the input that was read.
 - Evaluates UNDO-SEXP in case of error or if the user quits.
 - Evaluates LAST-SEXP.

The created command also binds `icicle-candidate-action-fn' to a
function that calls FUNCTION on the current completion candidate.
Note that BINDINGS are of course not in effect within
`icicle-candidate-action-fn'.</span>"
  `(defun ,command ()
    ,(concat doc-string "<span class="quote">\n\nRead input, then </span>"
             (and (symbolp function) (concat "<span class="quote">call `</span>" (symbol-name function) "<span class="quote">' to </span>"))
             "<span class="quote">act on it.

Input-candidate completion and cycling are available.  While cycling,
these keys act on the current candidate:

\\&lt;minibuffer-local-completion-map&gt;\
`C-RET'   - Act on current completion candidate only
`C-next'  - Act, then move to next \
prefix-completion candidate
`C-prior' - Act, then move to previous \
prefix-completion candidate
`next'    - Act, then move to next \
apropos-completion candidate
`prior'   - Act, then move to previous \
apropos-completion candidate
`\\[icicle-all-candidates-action]'     - Act on *all* candidates, successively (careful!)

Use `RET' or `S-RET' to finally choose a candidate, or `C-g' to quit.
This is an Icicles command - see `icicle-mode'.</span>")
    (interactive)
    (let* ((orig-buff (current-buffer))
           (orig-window (selected-window))
           ,@bindings
           (icicle-candidate-action-fn
            (lambda (candidate)
              (setq candidate (expand-file-name candidate
                                                (file-name-directory icicle-last-input)))
              (unwind-protect
                   (condition-case action-fn-return
                       (progn
                         (condition-case in-action-fn
                             <span class="linecomment">;; Treat 3 cases, because previous use of `icicle-candidate-action-fn'</span>
                             <span class="linecomment">;; might have killed the buffer or deleted the window.</span>
                             (if (and (buffer-live-p orig-buff) (window-live-p orig-window))
                                 (with-current-buffer orig-buff
                                   (save-selected-window
                                     (select-window orig-window)
                                     (funcall ',function candidate)))
                               (if (window-live-p orig-window)
                                   (save-selected-window
                                     (select-window orig-window)
                                     (funcall ',function candidate))
                                 (funcall ',function candidate)))
                           (error (unless (string= "<span class="quote">Cannot switch buffers in minibuffer window</span>"
                                                   (error-message-string in-action-fn))
                                    (error (error-message-string in-action-fn)))
                                  (select-frame-set-input-focus (window-frame orig-window))
                                  (funcall ',function candidate)))
                         (select-frame-set-input-focus (window-frame (minibuffer-window)))
                         nil)           <span class="linecomment">; Return nil for success.</span>
                     (error (error-message-string action-fn-return))) <span class="linecomment">; Return error msg.</span>
                (select-frame-set-input-focus (window-frame (minibuffer-window)))))))
      ,first-sexp
      (condition-case act-on-choice
          (funcall
           ',function
           (if (&lt; emacs-major-version 21) <span class="linecomment">; No predicate arg for Emacs 20.</span>
               (read-file-name ,prompt ,dir ,default-filename ,require-match ,initial-input)
             (read-file-name ,prompt ,dir ,default-filename ,require-match
                             ,initial-input ,predicate)))
        (quit  (when (buffer-live-p orig-buff) (switch-to-buffer orig-buff)) ,undo-sexp)
        (error (when (buffer-live-p orig-buff) (switch-to-buffer orig-buff)) ,undo-sexp
               (error (error-message-string act-on-choice))))
      ,last-sexp)))

(unless (fboundp 'select-frame-set-input-focus) <span class="linecomment">; Defined in Emacs 22.</span>
  (defun select-frame-set-input-focus (frame)
    "<span class="quote">Select FRAME, raise it, and set input focus, if possible.</span>"
    (select-frame frame)
    (raise-frame frame)
    <span class="linecomment">;; Ensure, if possible, that frame gets input focus.</span>
    (cond ((eq window-system 'x) (x-focus-frame frame))
          ((eq window-system 'w32) (w32-focus-frame frame)))
    (cond (focus-follows-mouse (set-mouse-position (selected-frame) (1- (frame-width)) 0)))))

<span class="linecomment">;; Make Emacs-Lisp mode fontify definitions of Icicles commands.</span>
(font-lock-add-keywords
 'emacs-lisp-mode
 `((,(concat "<span class="quote">(</span>" (regexp-opt '("<span class="quote">icicle-define-command</span>" "<span class="quote">icicle-define-file-command</span>") t)
             "<span class="quote">\\s-+\\(\\sw\\(\\sw\\|\\s_\\)+\\)</span>")
    (1 font-lock-keyword-face)
    <span class="linecomment">;; Index (2 or 3) depends on whether or not shy groups are supported.</span>
    ,(list (if (string-match "<span class="quote">\\(?:\\)</span>" "<span class="quote"></span>") 2 3) font-lock-function-name-face))))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-mac)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-mac.el ends here</span></span></pre></pre></p></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" href="http://www.emacswiki.org/cgi-bin/emacs?action=edit;id=icicles-mac.el">Edit this page</a> <a class="history" href="http://www.emacswiki.org/cgi-bin/emacs?action=history;id=icicles-mac.el">View other revisions</a> <a class="admin" href="http://www.emacswiki.org/cgi-bin/emacs?action=admin;id=icicles-mac.el">Administration</a></span><span class="time"><br /> Last edited 2006-05-17 00:54 UTC by <a class="author" title="from inet-netcache3-o.oracle.com" href="http://www.emacswiki.org/cgi-bin/emacs/DrewAdams">DrewAdams</a> <a class="diff" href="http://www.emacswiki.org/cgi-bin/emacs?action=browse;diff=2;id=icicles-mac.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" class="search">
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