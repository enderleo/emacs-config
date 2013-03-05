<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head><title>EmacsWiki: icicles-var.el</title><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,NOFOLLOW" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content and diff" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1;diff=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki including minor differences" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;showedit=1" /></head><body class="http://www.emacswiki.org/cgi-bin/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><form class="tiny" action="http://www.emacswiki.org/cgi-bin/emacs"><p>Search: <input type="text" name="search" size="20" /></p></form><h1><a title="Click to search for references to this page" href="http://www.emacswiki.org/cgi-bin/emacs?search=%22icicles-var%5c.el%22">icicles-var.el</a></h1></div><div class="content browse"><p><p><a href="http://www.emacswiki.org/cgi-bin/wiki/download/icicles-var.el">Download</a></p><pre class="source"><pre class="code"><span class="linecomment">;;; icicles-var.el --- Internal variables for Icicles</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; Filename: icicles-var.el</span>
<span class="linecomment">;; Description: Internal variables for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 2005, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:23:26 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Sun Apr 30 13:17:22 2006 (-25200 Pacific Daylight Time)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 178</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-var.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `apropos', `apropos-fn+var', `cl', `color-theme', `cus-face',</span>
<span class="linecomment">;;   `easymenu', `hexrgb', `icicles-opt', `thingatpt', `thingatpt+',</span>
<span class="linecomment">;;   `wid-edit', `widget'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;; Commentary: </span>
<span class="linecomment">;; </span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  internal variables (not to be modified by users.  See `icicles.el'</span>
<span class="linecomment">;;  for documentation.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;  Internal variables defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-candidate-action-fn', `icicle-candidate-entry-fn',</span>
<span class="linecomment">;;    `icicle-candidate-nb', `icicle-candidates-alist',</span>
<span class="linecomment">;;    `icicle-cmd-calling-for-completion',</span>
<span class="linecomment">;;    `icicle-common-match-string', `icicle-complete-input-overlay',</span>
<span class="linecomment">;;    `icicle-completion-candidates' `icicle-completion-help-string',</span>
<span class="linecomment">;;    `icicle-current-completion-candidate-overlay',</span>
<span class="linecomment">;;    `icicle-current-input', `icicle-current-regexp-input',</span>
<span class="linecomment">;;    `icicle-default-directory',</span>
<span class="linecomment">;;    `icicle-default-thing-insertion-flipped-p',</span>
<span class="linecomment">;;    `icicle-extra-candidates', `icicle-icompleting-p',</span>
<span class="linecomment">;;    `icicle-ignored-extensions', `icicle-ignored-extensions-regexp',</span>
<span class="linecomment">;;    `icicle-incremental-completion-p', `icicle-initial-value',</span>
<span class="linecomment">;;    `icicle-insert-string-at-pt-end',</span>
<span class="linecomment">;;    `icicle-insert-string-at-pt-start',</span>
<span class="linecomment">;;    `icicle-last-completion-candidate',</span>
<span class="linecomment">;;    `icicle-last-completion-command', `icicle-last-input',</span>
<span class="linecomment">;;    `icicle-last-sort-function', `icicle-menu-items-alist',</span>
<span class="linecomment">;;    `icicle-must-match-regexp', `icicle-must-not-match-regexp',</span>
<span class="linecomment">;;    `icicle-must-pass-predicate',</span>
<span class="linecomment">;;    `icicle-nb-of-other-cycle-candidates',</span>
<span class="linecomment">;;    `icicle-post-command-hook', `icicle-pre-command-hook',</span>
<span class="linecomment">;;    `icicle-prompt', `icicle-prompt-suffix', `icicle-re-no-dot',</span>
<span class="linecomment">;;    `icicle-saved-candidates-variables-obarray',</span>
<span class="linecomment">;;    `icicle-saved-completion-candidates',</span>
<span class="linecomment">;;    `icicle-saved-ignored-extensions',</span>
<span class="linecomment">;;    `icicle-saved-regexp-search-ring-max',</span>
<span class="linecomment">;;    `icicle-saved-region-background',</span>
<span class="linecomment">;;    `icicle-saved-search-ring-max', `icicle-search-current-overlay',</span>
<span class="linecomment">;;    `icicle-search-overlays', `icicle-search-refined-overlays',</span>
<span class="linecomment">;;    `icicle-successive-grab-count',</span>
<span class="linecomment">;;    `icicle-thing-at-pt-fns-pointer'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2006/04/30 dadams</span>
<span class="linecomment">;;     Added: icicle-candidate-entry-fn.</span>
<span class="linecomment">;;     Renamed: icicle-search-candidates to icicle-candidates-alist.</span>
<span class="linecomment">;; 2006/04/14 dadams</span>
<span class="linecomment">;;     Renamed icicle-search-refined-overlay to icicle-search-refined-overlays.</span>
<span class="linecomment">;;     Added: icicle-search-candidates.</span>
<span class="linecomment">;; 2006/04/07 dadams</span>
<span class="linecomment">;;     Added: icicle-search-overlays.</span>
<span class="linecomment">;;     Renamed icicle-search-overlay to icicle-search-current-overlay.</span>
<span class="linecomment">;; 2006/03/27 dadams</span>
<span class="linecomment">;;     Added: icicle-search-refined-overlay.</span>
<span class="linecomment">;; 2006/03/26 dadams</span>
<span class="linecomment">;;     Added: icicle-search-overlay.</span>
<span class="linecomment">;; 2006/03/25 dadams</span>
<span class="linecomment">;;     Added: icicle-saved-candidates-variables-obarray.</span>
<span class="linecomment">;; 2006/03/20 dadams</span>
<span class="linecomment">;;     Added: icicle-common-match-string, icicle-current-regexp-input.</span>
<span class="linecomment">;; 2006/03/14 dadams</span>
<span class="linecomment">;;     Removed: icicle-icicle-completing-p.</span>
<span class="linecomment">;; 2006/03/13 dadams</span>
<span class="linecomment">;;     Added: icicle-re-no-dot.</span>
<span class="linecomment">;; 2006/03/05 dadams</span>
<span class="linecomment">;;     Moved to icicles-mode.el: icicle-mode-map.</span>
<span class="linecomment">;; 2006/03/04 dadams</span>
<span class="linecomment">;;     Moved options stuff to Options menu, when available.</span>
<span class="linecomment">;;     Moved apropos stuff to Apropos menu, when available.</span>
<span class="linecomment">;;     Moved describe stuff to Describe menu, when available.</span>
<span class="linecomment">;; 2006/03/03 dadams </span>
<span class="linecomment">;;     Added to Icicles menu: icicle-complete-thesaurus-entry, icicle-apropos*,</span>
<span class="linecomment">;;       option-setting cmds, buffer-config cmds icicle-(var|fun)doc.</span>
<span class="linecomment">;;     Require apropos-fn+var.el.</span>
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

(when (&lt; emacs-major-version 21)     <span class="linecomment">;; for Emacs &lt; 21: push</span>
  (eval-when-compile (require 'cl))) <span class="linecomment">;; for Emacs &lt; 20: when, unless</span>

(require 'apropos-fn+var nil t) <span class="linecomment">;; (no error if not found): apropos-command, apropos-function,</span>
                                <span class="linecomment">;; apropos-option, apropos-variable</span>
(require 'icicles-opt) <span class="linecomment">;; icicle-sort-function</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>



<span class="linecomment">;;; Internal variables (alphabetical) ----------------------</span>

<span class="linecomment">;; These two are defined here so they won't raise an error in `font-lock-add-keywords'.</span>
(defvar font-lock-function-name-face 'font-lock-function-name-face <span class="linecomment">; Defined in `font-lock.el'.</span>
  "<span class="quote">Face name to use for function names.</span>")

(defvar font-lock-keyword-face 'font-lock-keyword-face <span class="linecomment">; Defined in `font-lock.el'.</span>
  "<span class="quote">Face name to use for keywords.</span>")

(defvar icicle-icompleting-p nil
  "<span class="quote">Internal flag: non-nil when editing text in minibuffer.
This is really non-nil when inside simple character-editing commands
such as `icicle-self-insert' and `icicle-delete-backward-char'.</span>")

(defvar icicle-candidate-action-fn nil
  "<span class="quote">Function to be applied to current completion candidate.
For `icicle-all-candidates-action' to be able to report successes,
this should return non-nil for \</span>"success\"<span class="quote"> and nil for \</span>"failure\"<span class="quote">.</span>")

(defvar icicle-candidate-entry-fn nil
  "<span class="quote">Function to apply to selected entries in `icicle-candidates-alist'.</span>")

(defvar icicle-candidate-nb nil
  "<span class="quote">Current completion candidate number, or nil if not cycling candidates.
Numbering starts at zero.</span>")

(defvar icicle-candidates-alist nil
  "<span class="quote">Alist of candidate entries.
The car (key) of each entry is treated as a completion candidate.
The cdr is some other data to be used when the candidate is chosen.</span>")

(defvar icicle-cmd-calling-for-completion 'ignore
  "<span class="quote">Last command causing display of list of possible completions.</span>")

(defvar icicle-common-match-string nil
  "<span class="quote">Longest common match among all completion candidates.
Nil means no such common match is available.</span>")

(defvar icicle-completion-candidates nil "<span class="quote">Current list of completion candidates.</span>")

(defvar icicle-completion-help-string "<span class="quote"></span>"
  "<span class="quote">Description of minibuffer bindings.</span>")

(defvar icicle-extra-candidates nil
  "<span class="quote">A list of extra completion candidates (strings).</span>")

(defvar icicle-current-completion-candidate-overlay nil
  "<span class="quote">Overlay used to highlight current completion candidate.</span>")

(defvar icicle-complete-input-overlay nil
  "<span class="quote">Overlay used to highlight minibuffer input when it is complete.</span>")

(defvar icicle-current-input "<span class="quote"></span>" "<span class="quote">Current minibuffer input.</span>")

(defvar icicle-current-regexp-input "<span class="quote"></span>" "<span class="quote">Current minibuffer regexp input.
This can be different from `icicle-current-input' only when
`icicle-expand-input-to-common-match-flag' is non-nil.</span>")

(defvar icicle-default-directory default-directory
  "<span class="quote">Local copy of `default-directory'.
Set whenever minibuffer is entered or input is completed.</span>")

(defvar icicle-default-thing-insertion-flipped-p nil
  "<span class="quote">Non-nil means a previous `M-.' in this succession was used with `C-u'.
This means that the meaning of `icicle-default-thing-insertion' has
been reversed.</span>")

(defvar icicle-incremental-completion-p nil
  "<span class="quote">Takes the place of `icicle-incremental-completion-flag' during input.
The program updates this to `always' from `t' after *Completions* has
been displayed.</span>")

(defvar icicle-ignored-extensions completion-ignored-extensions
  "<span class="quote">Copy of `completion-ignored-extensions', serving as a control flag.
When `completion-ignored-extensions' changes, we remake
`icicle-ignored-extensions-regexp'.</span>")

(defvar icicle-ignored-extensions-regexp
  (concat "<span class="quote">\\(</span>" (mapconcat #'regexp-quote completion-ignored-extensions "<span class="quote">\\|</span>")
          "<span class="quote">\\)\\'</span>")
  "<span class="quote">Regular expression matching ignored file extensions.
If this is nil, then no file extensions are ignored.
The ignored file extensions come from `completion-ignored-extensions'.</span>")

(defvar icicle-initial-value "<span class="quote"></span>"
  "<span class="quote">Initial value used in minibuffer completion.
Any function that reads from the minibuffer and accepts a default
value or initial value should, before reading, put that value in
`icicle-initial-value'.  For example, `completing-read' does that.</span>")

(defvar icicle-insert-string-at-pt-start 0
  "<span class="quote">Position of start of text `icicle-insert-string-at-point' inserted.</span>")

(defvar icicle-insert-string-at-pt-end 0
  "<span class="quote">Position of end of text `icicle-insert-string-at-point' inserted.</span>")

(defvar icicle-last-completion-candidate "<span class="quote"></span>"
  "<span class="quote">Last completion candidate used in minibuffer completion.</span>")

<span class="linecomment">;; This is used to be able to ignore `handle-switch-frame'.</span>
(defvar icicle-last-completion-command nil "<span class="quote">Last completion command used.</span>")

(defvar icicle-last-input "<span class="quote"></span>" "<span class="quote">Last minibuffer input.</span>")

(defvar icicle-last-sort-function (or icicle-sort-function 'string-lessp)
  "<span class="quote">Local copy of `icicle-sort-function', so we can restore it.</span>")

(defvar icicle-menu-items-alist nil)    <span class="linecomment">; Defined in `icicles-menu.el'.</span>

(defvar icicle-must-match-regexp nil
  "<span class="quote">Nil or a regexp that completion candidates must match.
If nil, then this does nothing.  If a regexp (string), then show only
candidates that match it (and match the user input).
See also `icicle-must-not-match-regexp'.</span>")

(defvar icicle-must-not-match-regexp nil
  "<span class="quote">Nil or a regexp that completion candidates must not match.
If nil, then this does nothing.  If a regexp (string), then show only
candidates that do not match it.
See also `icicle-must-match-regexp'.</span>")

(defvar icicle-must-pass-predicate nil
  "<span class="quote">Nil or a predicate that completion candidates must satisfy.
If nil, then this does nothing.  Otherwise, this is a function of one
argument, a candidate, and only candidates that satisfy the predicate
are displayed.</span>")

(defvar icicle-nb-of-other-cycle-candidates 0
  "<span class="quote">Number of other candidates available for cycling.
This is for use by other libraries, in particular, `icomplete+.el'.</span>")

<span class="linecomment">;; Inspired from `icomplete-post-command-hook'.</span>
(defvar icicle-post-command-hook nil
  "<span class="quote">Functions added to `post-command-hook' when in Icicle mode.
Use command `icy-mode' (aka `icicle-mode') to set this up properly.</span>")

<span class="linecomment">;; Inspired from `icomplete-pre-command-hook'.  There is none, by default.</span>
(defvar icicle-pre-command-hook nil
  "<span class="quote">Functions added to `pre-command-hook' when in Icicle mode.
Use command `icy-mode' (aka `icicle-mode') to set this up properly.</span>")

(defvar icicle-prompt "<span class="quote"></span>")

(defvar icicle-prompt-suffix "<span class="quote"></span>"
  "<span class="quote">String to append to the input-completion prompt, if there is room.
Intended to remind you how to obtain help on input completion.</span>")

(defvar icicle-re-no-dot "<span class="quote">^\\([^.]\\|\\.\\([^.]\\|\\..\\)\\).*</span>"
  "<span class="quote">Regexp that matches anything except `.' and `..'.</span>")

(defvar icicle-saved-candidates-variables-obarray (make-vector 100 0)
  "<span class="quote">Obarray of variables you have saved sets of completion candidates in.
Used for completion in `icicle-candidate-set-retrieve-from-variable'.</span>")

(defvar icicle-saved-completion-candidates nil
  "<span class="quote">Completion candidates user saved using `icicle-candidate-set-save'.</span>")

(defvar icicle-saved-ignored-extensions nil
  "<span class="quote">Local copy of `icicle-ignored-extensions', so we can restore it.</span>")

(defvar icicle-saved-regexp-search-ring-max regexp-search-ring-max
  "<span class="quote">Saved value of `search-ring-max', so it can be restored.</span>")

(defvar icicle-saved-region-background nil
  "<span class="quote">Background of `region' face.  Saved so it can be restored.</span>")

(defvar icicle-saved-search-ring-max search-ring-max
  "<span class="quote">Saved value of `search-ring-max', so it can be restored.</span>")

(defvar icicle-search-current-overlay nil
  "<span class="quote">Overlay used to highlight current match of `icicle-search' regexp arg.</span>")

(defvar icicle-search-overlays nil
  "<span class="quote">Overlays used to highlight match of `icicle-search' regexp argument.</span>")

(defvar icicle-search-refined-overlays nil
  "<span class="quote">Overlay(s) used to highlight match of current input for `icicle-search'.
If `icicle-search-highlight-all-flag' is nil, then this is a single
overlay (or nil).  Otherwise, this is a list of overlays.</span>")

(defvar icicle-successive-grab-count 0
  "<span class="quote">Number of text things to be grabbed by next `\\&lt;minibuffer-local-map&gt;\
\\[icicle-insert-string-at-point]'.</span>")

(defvar icicle-thing-at-pt-fns-pointer 0
  "<span class="quote">Current index into the car of `icicle-thing-at-point-functions'.
This points to the current function in the list.</span>")

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-var)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-var.el ends here</span></span></pre></pre></p></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" href="http://www.emacswiki.org/cgi-bin/emacs?action=edit;id=icicles-var.el">Edit this page</a> <a class="history" href="http://www.emacswiki.org/cgi-bin/emacs?action=history;id=icicles-var.el">View other revisions</a> <a class="admin" href="http://www.emacswiki.org/cgi-bin/emacs?action=admin;id=icicles-var.el">Administration</a></span><span class="time"><br /> Last edited 2006-05-01 00:35 UTC by <a class="author" title="from inet-nc01-o.oracle.com" href="http://www.emacswiki.org/cgi-bin/emacs/DrewAdams">DrewAdams</a> <a class="diff" href="http://www.emacswiki.org/cgi-bin/emacs?action=browse;diff=2;id=icicles-var.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" class="search">
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