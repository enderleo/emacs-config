<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head><title>EmacsWiki: icicles-opt.el</title><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,NOFOLLOW" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content and diff" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1;diff=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki including minor differences" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;showedit=1" /></head><body class="http://www.emacswiki.org/cgi-bin/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><form class="tiny" action="http://www.emacswiki.org/cgi-bin/emacs"><p>Search: <input type="text" name="search" size="20" /></p></form><h1><a title="Click to search for references to this page" href="http://www.emacswiki.org/cgi-bin/emacs?search=%22icicles-opt%5c.el%22">icicles-opt.el</a></h1></div><div class="content browse"><p><p><a href="http://www.emacswiki.org/cgi-bin/emacs/download/icicles-opt.el">Download</a></p><pre class="source"><pre class="code"><span class="linecomment">;;; icicles-opt.el --- User options (variables) for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-opt.el</span>
<span class="linecomment">;; Description: User options (variables) for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 2005, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:22:14 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Fri Jun 09 14:45:43 2006 (-25200 Pacific Daylight Time)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 252</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-opt.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `cl', `color-theme', `cus-face', `easymenu', `hexrgb',</span>
<span class="linecomment">;;   `thingatpt', `thingatpt+', `wid-edit', `widget'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  user options (variables).  See `icicles.el' for documentation.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  User options defined here (in Custom group `icicles'):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-arrows-respect-completion-type-flag',</span>
<span class="linecomment">;;    `icicle-bind-top-level-commands-flag', `icicle-buffer-configs',</span>
<span class="linecomment">;;    `icicle-buffer-extras',</span>
<span class="linecomment">;;    `icicle-buffer-ignore-space-prefix-flag',</span>
<span class="linecomment">;;    `icicle-buffer-match-regexp', `icicle-buffer-no-match-regexp',</span>
<span class="linecomment">;;    `icicle-buffer-predicate', `icicle-buffer-require-match-flag'</span>
<span class="linecomment">;;    `icicle-buffer-sort', `icicle-change-region-background-flag',</span>
<span class="linecomment">;;    `icicle-color-themes', `icicle-Completions-frame-at-right-flag',</span>
<span class="linecomment">;;    `icicle-cycle-into-subdirs-flag',</span>
<span class="linecomment">;;    `icicle-default-thing-insertion',</span>
<span class="linecomment">;;    `icicle-expand-input-to-common-match-flag',</span>
<span class="linecomment">;;    `icicle-highlight-input-initial-whitespace-flag',</span>
<span class="linecomment">;;    `icicle-ignore-space-prefix-flag',</span>
<span class="linecomment">;;    `icicle-incremental-completion-delay',</span>
<span class="linecomment">;;    `icicle-incremental-completion-flag',</span>
<span class="linecomment">;;    `icicle-incremental-completion-threshold',</span>
<span class="linecomment">;;    `icicle-init-value-flag', `icicle-input-string'</span>
<span class="linecomment">;;    `icicle-list-join-string', `icicle-mark-position-in-candidate',</span>
<span class="linecomment">;;    `icicle-minibuffer-setup-hook',</span>
<span class="linecomment">;;    `icicle-point-position-in-candidate',</span>
<span class="linecomment">;;    `icicle-redefine-standard-commands-flag',</span>
<span class="linecomment">;;    `icicle-regexp-quote-flag', `icicle-regexp-search-ring-max',</span>
<span class="linecomment">;;    `icicle-region-background', `icicle-reminder-prompt-flag',</span>
<span class="linecomment">;;    `icicle-require-match-flag', `icicle-saved-completion-sets',</span>
<span class="linecomment">;;    `icicle-search-highlight-all-flag',</span>
<span class="linecomment">;;    `icicle-search-cleanup-flag', `icicle-search-hook',</span>
<span class="linecomment">;;    `icicle-search-ring-max',</span>
<span class="linecomment">;;    `icicle-show-Completions-initially-flag',</span>
<span class="linecomment">;;    `icicle-sort-function', `icicle-thing-at-point-functions',</span>
<span class="linecomment">;;    `icicle-touche-pas-aux-menus-flag', `icicle-update-input-hook'</span>
<span class="linecomment">;;    `icicle-word-completion-key'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-buffer-sort-*...*-last', `icicle-increment-color-hue',</span>
<span class="linecomment">;;    `icicle-increment-color-value'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2006/06/09 dadams</span>
<span class="linecomment">;;     icicle-region-background: Use nil in defcustom.  Initialize separately.</span>
<span class="linecomment">;; 2006/06/08 dadams</span>
<span class="linecomment">;;     icicle-bind-top-level-commands-flag: Updated doc string.</span>
<span class="linecomment">;; 2006/05/19 dadams</span>
<span class="linecomment">;;     Renamed icicle-inhibit-reminder* to icicle-reminder*.</span>
<span class="linecomment">;;       Changed its functionality to use a countdown.</span>
<span class="linecomment">;; 2006/05/16 dadams</span>
<span class="linecomment">;;     Added: icicle-bind-top-level-commands-flag.</span>
<span class="linecomment">;; 2006/05/15 dadams</span>
<span class="linecomment">;;     Renamed: icicle-completion-nospace-flag to icicle-ignore-space-prefix-flag.</span>
<span class="linecomment">;;     Added: icicle-buffer-ignore-space-prefix-flag.</span>
<span class="linecomment">;;     icicle-ignore-space-prefix-flag: Changed default value to nil.</span>
<span class="linecomment">;; 2006/05/09 dadams</span>
<span class="linecomment">;;     icicle-incremental-completion-threshold: Updated doc string (msg "Displaying...").</span>
<span class="linecomment">;; 2006/04/28 dadams</span>
<span class="linecomment">;;     Added: icicle-highlight-input-initial-whitespace-flag.</span>
<span class="linecomment">;; 2006/04/14 dadams</span>
<span class="linecomment">;;     Added: icicle-input-string, icicle-search-cleanup-flag, icicle-update-input-hook.</span>
<span class="linecomment">;;     icicle-list-join-string: Added :type and :group.</span>
<span class="linecomment">;; 2006/04/09 dadams</span>
<span class="linecomment">;;     Added: icicle-arrows-respect-completion-type-flag.</span>
<span class="linecomment">;; 2006/04/07 dadams</span>
<span class="linecomment">;;     Added: icicle-search-highlight-all-flag.</span>
<span class="linecomment">;; 2006/04/02 dadams</span>
<span class="linecomment">;;     Added: icicle-regexp-quote-flag.</span>
<span class="linecomment">;; 2006/03/24 dadams</span>
<span class="linecomment">;;     Added: icicle-incremental-completion-(delay|threshold).</span>
<span class="linecomment">;; 2006/03/20 dadams</span>
<span class="linecomment">;;     icicle-expand-input-to-common-match-flag: Changed default value to t.</span>
<span class="linecomment">;; 2006/03/19 dadams</span>
<span class="linecomment">;;     Added: icicle-expand-input-to-common-match-flag.</span>
<span class="linecomment">;; 2006/03/17 dadams</span>
<span class="linecomment">;;     Removed: icicle-cache-file.</span>
<span class="linecomment">;;     Added: icicle-saved-completion-sets.</span>
<span class="linecomment">;; 2006/03/13 dadams</span>
<span class="linecomment">;;     Added: icicle-cache-file.</span>
<span class="linecomment">;; 2006/03/08 dadams</span>
<span class="linecomment">;;     icicle-default-thing-insertion: Use substitute-command-keys in :tag.</span>
<span class="linecomment">;; 2006/03/05 dadams</span>
<span class="linecomment">;;     Moved from here to icicle-mode.el: icicle-mode, icicle-mode-hook.</span>
<span class="linecomment">;;     Added: icicle-touche-pas-aux-menus-flag.</span>
<span class="linecomment">;; 2006/03/03 dadams</span>
<span class="linecomment">;;     icicle-list-join-string: Changed value to ^G^J.  Clarified doc string.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or</span>
<span class="linecomment">;; modify it under the terms of the GNU General Public License as</span>
<span class="linecomment">;; published by the Free Software Foundation; either version 2, or (at</span>
<span class="linecomment">;; your option) any later version.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful, but</span>
<span class="linecomment">;; WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU</span>
<span class="linecomment">;; General Public License for more details.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(when (&lt; emacs-major-version 20) (eval-when-compile (require 'cl))) <span class="linecomment">;; when, unless</span>

(require 'hexrgb nil t)     <span class="linecomment">;; (no error if not found): hexrgb-color-values-to-hex,</span>
                            <span class="linecomment">;; hexrgb-increment-(red|green|blue), hexrgb-rgb-to-hsv,</span>
                            <span class="linecomment">;; hexrgb-color-values-to-hex, hexrgb-hsv-to-rgb</span>
(require 'thingatpt)        <span class="linecomment">;; symbol-at-point, thing-at-point, thing-at-point-url-at-point,</span>
(require 'thingatpt+ nil t) <span class="linecomment">;; (no error if not found): symbol-name-nearest-point,</span>
                            <span class="linecomment">;; word-nearest-point</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>


<span class="linecomment">;;; User Options (alphabetical, except for dependencies) ---</span>

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-arrows-respect-completion-type-flag nil
  "<span class="quote">*Non-nil means `TAB', `S-TAB' change the behavior of vertical arrows.
Nil means that `up' and `down' always cycle prefix completions.
Non-nil means that `up' and `down':
 - Traverse the input history, by default.
 - Cycle prefix completions, if preceded by `TAB'.
 - Cycle apropos completions, if preceded by `S-TAB'.

If this option is non-nil you can still use `M-p' and `M-n' to
traverse the input history, `C-p' and `C-n' to cycle prefix
completions, and `prior' and `next' to cycle apropos completions.  If
you do that, you need not use `TAB' and `S-TAB' to switch between the
two completion types.  Once you have used `TAB' or `S-TAB', the only
way to traverse the history is via `M-p' and `M-n'.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-bind-top-level-commands-flag t
  "<span class="quote">*Non-nil means to bind top-level Icicles commands.
That is done in `icicle-define-icicle-mode-map'.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-extras nil
  "<span class="quote">*List of additional buffer-name candidates added to the normal list.
List elements are strings.</span>"
  :type '(repeat string) :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-ignore-space-prefix-flag t
  "<span class="quote">*Override `icicle-ignore-space-prefix-flag' for `icicle-buffer*'.
Note: This option is provided mainly for use (binding) in
      `icicle-define-command' and `icicle-define-file-command'.
      You probably do not want to set this globally, but you can.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-match-regexp nil
  "<span class="quote">*Nil or a regexp that buffer-name completion candidates must match.
If nil, then this does nothing.  If a regexp, then show only
candidates that match it (and match the user input).
See also `icicle-buffer-no-match-regexp'.</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) regexp) :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-no-match-regexp nil
  "<span class="quote">*Nil or a regexp that buffer-name completion candidates must not match.
If nil, then this does nothing.  If a regexp, then show only
candidates that do not match it.
See also `icicle-buffer-match-regexp'.</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) regexp) :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-predicate nil
  "<span class="quote">*Nil or a predicate that buffer-name candidates must satisfy.
If nil, then this does nothing.  Otherwise, this is a function of one
argument, a candidate, and only candidates that satisfy the predicate
are displayed.  For example, this value will show only buffers that
are associated with files:

  (lambda (bufname) (buffer-file-name (get-buffer bufname))).</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) function) :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-require-match-flag nil
  "<span class="quote">*Override `icicle-require-match-flag' for `icicle-buffer*' commands.
The possible values are as follows:
- nil means this option imposes nothing on completion;
  the REQUIRE-MATCH argument provided to the function governs behavior
- `no-match-required' means the same as a nil value for REQUIRE-MATCH
- `partial-match-ok' means the same as a t value for REQUIRE-MATCH
- `full-match-required' means the same as a non-nil, non-t value for
  REQUIRE-MATCH

Note: This option is provided mainly for use (binding) in
      `icicle-define-command' and `icicle-define-file-command'.
      You probably do not want to set this globally, but you can.</span>"
  :type '(choice
          (const :tag "<span class="quote">Do not impose any match behavior</span>"  nil)
          (const :tag "<span class="quote">Do not require a match</span>"            no-match-required)
          (const :tag "<span class="quote">Require a partial match, with RET</span>" partial-match-ok)
          (const :tag "<span class="quote">Require a full match</span>"              full-match-required))
  :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-sort nil
  "<span class="quote">*Nil or a sort function for buffer names.
Examples of sort functions are `icicle-buffer-sort-*...*-last' and
`string&lt;'.  If nil, then buffer names are not sorted.  Option
`icicle-sort-function' is bound to `icicle-buffer-sort' by command
`icicle-buffer'.</span>"
  :type 'function :group 'icicles)

<span class="linecomment">;; Replace this list by your favorite color themes. Each must be the name of a defined function.</span>
<span class="linecomment">;; By default, this includes all color themes defined globally (variable `color-themes').</span>
<span class="linecomment">;;;###autoload</span>
(defcustom icicle-color-themes
  (and (require 'color-theme nil t)
       (delq 'bury-buffer
             (mapcar (lambda (entry) (list (symbol-name (car entry)))) color-themes)))
  "<span class="quote">*List of color themes to cycle through using `M-x icicle-color-theme'.</span>"
  :type 'hook :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-Completions-frame-at-right-flag t
  "<span class="quote">*Non-nil means move *Completions* frame to right edge of display.
This is done by `icicle-candidate-action'.
It only happens if *Completions* is alone in its frame.
This can be useful to make *Completions* more visible.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-cycle-into-subdirs-flag nil
  "<span class="quote">*Non-nil means minibuffer-input cycling explores subdirectories.
If this is non-nil, then you might want to use a function such as
`icicle-sort-dirs-last' for option `icicle-sort-function', to prevent
cycling into subdirectories depth first.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-default-thing-insertion 'more-of-the-same
  "<span class="quote">*Behavior of successive `\\&lt;minibuffer-local-map&gt;\\[icicle-insert-string-at-point]'.
If `alternatives', then the next function in the `car' of
`icicle-thing-at-point-functions' is used to retrieve the text to be
inserted.
If `more-of-the-same', then the function that is the `cdr' of
`icicle-thing-at-point-functions' is used to retrieve the text to be
inserted.</span>"
  :type `(choice
          (const :tag ,(substitute-command-keys
                        "<span class="quote">Successive calls to `\\&lt;minibuffer-local-map&gt;\
\\[icicle-insert-string-at-point]' use different text-grabbing functions.</span>")
           alternatives)
          (const :tag ,(substitute-command-keys
                        "<span class="quote">Successive calls to `\\&lt;minibuffer-local-map&gt;\
\\[icicle-insert-string-at-point]' grab more text at point.</span>")
           more-of-the-same))
  :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-expand-input-to-common-match-flag t
  "<span class="quote">*Non-nil means that `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-apropos-complete]' \
expands your minibuffer input to the
longest common match among all completion candidates.  This replaces
your regexp input, completing it as far as possible.

If you want to edit your original regexp input, use `\\[icicle-retrieve-last-input]'.
If your input has been expanded, then hit `\\[icicle-retrieve-last-input]' twice:
once to replace a completion candidate (from, say, [next]) with the
common match string, and a second time to replace the common match
string with your original regexp input.

If you want to always work with a regexp in the minibuffer, then set
this option to nil.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-highlight-input-initial-whitespace-flag t
  "<span class="quote">*Non-nil means highlight initial whitespace in your input.
This is done using face `icicle-whitespace-highlight'.
Purpose: Otherwise, you might not notice that you accidentally typed
some whitespace at the beginning of your input, so you might not
understand the set of matching candidates (or lack thereof).</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-ignore-space-prefix-flag nil
  "<span class="quote">*Non-nil means ignore completion candidates that start with a space.
However, such candidates are not ignored for prefix completion when
the input also starts with a space.
Note: Some Icicles functionalities ignore the value of this option.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-incremental-completion-delay 0.5
  "<span class="quote">*Number of seconds to wait before updating *Completions* incrementally.
There is no wait if the number of completion candidates is less than
or equal to `icicle-incremental-completion-threshold'.
See also `icicle-incremental-completion-flag'.</span>"
  :type 'number :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-incremental-completion-flag t
  "<span class="quote">*Non-nil means update *Completions* buffer incrementally, as you type.
t means do nothing if *Completions* is not already displayed.
Non-nil and non-t means display *Completions* and update it.

You can toggle this between t and nil using command
`icicle-toggle-incremental-completion', bound to `C-^' in the
minibuffer.

See also `icicle-incremental-completion-delay' and
`icicle-incremental-completion-threshold'.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-incremental-completion-threshold 1000
  "<span class="quote">*More candidates means apply `icicle-incremental-completion-delay'.
See also `icicle-incremental-completion-flag' and
`icicle-incremental-completion-delay'.
This threshold is also used to decide when to display the message
 \</span>"Displaying completion candidates...\"<span class="quote">.</span>"
  :type 'integer :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-init-value-flag nil
  "<span class="quote">*Non-nil means to use default value as init value when reading input.
This is used by `completing-read', `read-file-name', `read-string',
and `read-from-minibuffer'.  When the default-value argument to one of
these functions is non-nil and the initial-input argument is nil or
\</span>"\"<span class="quote">, the default value is inserted in the minibuffer as the initial
input.

This has the advantage of not requiring you to use `M-n' to retrieve
the default value.  It has the disadvantage of making you empty the
minibuffer if you do not want to use or edit the default value.

The particular non-nil value determines whether or not the value is
preselected and, if preselected, where the cursor is left: at the
beginning or end of the value.  Possible values:

  nil               - Do not insert default value.
  `insert'          - Insert default value (leave cursor at end).
  `preselect-start' - Insert and preselect default value;
                      leave cursor at beginning.
  `preselect-end'   - Insert and preselect default value;
                      leave cursor at end.

My own preference is `insert'.  This is not the value by default only
because people are not used to it.  I recommend that you try `insert'
for a while, before giving up on it.

Preselection can be useful in Delete Selection mode or PC Selection
mode.  It makes it easy to replace the value by typing characters, or
delete it by hitting `C-d' or `DEL' (backspace).  However, all of the
initial input is lost if you type or hit `C-d' or `DEL'.  That is
inconvenient if you want to keep most of it and edit it only slightly.</span>"
  :type '(choice
          (const :tag "<span class="quote">Do not insert default value as initial value</span>"     nil)
          (const :tag "<span class="quote">Insert (and leave cursor at end)</span>"                 insert)
          (const :tag "<span class="quote">Insert, preselect, and leave cursor at beginning</span>" preselect-start)
          (const :tag "<span class="quote">Insert, preselect, and leave cursor at end</span>"       preselect-end))
  :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-input-string "<span class="quote">.*</span>"
  "<span class="quote">*String to insert in minibuffer via `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-from-variable]'.
Typically, this is a regexp or a portion of a regexp.</span>"
  :type 'string :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-list-join-string "<span class="quote">
</span>"
  "<span class="quote">*String joining items in a completion that is a list of strings.
When a completion candidate is a list of strings, this string is used
to join the strings in the list, for display and matching purposes.
When completing input, you type regexps that match the strings,
separating them pairwise by the value of `icicle-list-join-string'.
Actually, what you enter is interpreted as a single regexp to be
matched against the joined strings.  Typically, the candidate list
contains two strings: a name and its doc string.

A good value for this option is a string that:
 1) does not normally occur in doc strings,
 2) visually separates the two strings it joins, and
 3) is not too difficult or too long to type.

The default value is \</span>"^G\^J\"<span class="quote">, that is, control-g followed by
control-j (newline):
 1) ^G does not normally occur in doc strings
 2) a newline visually separates the multiple component strings, which
    helps readability in buffer *Completions*
 3) you can type the value using `C-q C-g C-q C-j'.</span>"
  :type 'string :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-mark-position-in-candidate 'input-end
  "<span class="quote">*Position of mark when you cycle through completion candidates.
Possible values are those for `icicle-point-position-in-candidate'.</span>"
  :type '(choice
          (const :tag "<span class="quote">Leave mark at the beginning of the minibuffer input</span>" input-start)
          (const :tag "<span class="quote">Leave mark at the end of the minibuffer input</span>" input-end)
          (const :tag "<span class="quote">Leave mark at the beginning of the completion root</span>" root-start)
          (const :tag "<span class="quote">Leave mark at the end of the completion root</span>" root-end))
  :group 'icicles)

<span class="linecomment">;; Inspired from `icomplete-minibuffer-setup-hook'.</span>
<span class="linecomment">;;;###autoload</span>
(defcustom icicle-minibuffer-setup-hook nil
  "<span class="quote">*Functions run at the end of minibuffer setup for Icicle mode.</span>"
  :type 'hook :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-point-position-in-candidate 'root-end
  "<span class="quote">*Position of cursor when you cycle through completion candidates.
Possible values are:
 `input-start': beginning of the minibuffer input
 `input-end':   end of the minibuffer input
 `root-start':  beginning of the completion root
 `root-end':    end of the completion root
When input is expected to be a file name, `input-start' is just after
the directory, which is added automatically during completion cycling.
See also `icicle-mark-position-in-candidate'.</span>"
  :type '(choice
          (const :tag "<span class="quote">Leave cursor at the beginning of the minibuffer input</span>" input-start)
          (const :tag "<span class="quote">Leave cursor at the end of the minibuffer input</span>" input-end)
          (const :tag "<span class="quote">Leave cursor at the beginning of the completion root</span>" root-start)
          (const :tag "<span class="quote">Leave cursor at the end of the completion root</span>" root-end))
  :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-change-region-background-flag
  (and (not (eq icicle-point-position-in-candidate icicle-mark-position-in-candidate))
       (boundp 'delete-selection-mode)
       delete-selection-mode)
  "<span class="quote">*Non-nil means the region background is changed during input.
The background is changed to differ only slightly from the minibuffer
background, by default.  The actual region background color used is
`icicle-region-background'</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;; This is essentially a version of `doremi-increment-color-component' for value only.</span>
(defun icicle-increment-color-value (color increment)
  "<span class="quote">Increase value component (brightness) of COLOR by INCREMENT.</span>"
  (unless (string-match "<span class="quote">#</span>" color)      <span class="linecomment">; Convert color name to #hhh...</span>
    (setq color (hexrgb-color-values-to-hex (x-color-values color))))
  <span class="linecomment">;; Convert RGB to HSV</span>
  (let* ((rgb (x-color-values color))
         (red   (/ (float (nth 0 rgb)) 65535.0)) <span class="linecomment">; Convert from 0-65535 to 0.0-1.0</span>
         (green (/ (float (nth 1 rgb)) 65535.0))
         (blue  (/ (float (nth 2 rgb)) 65535.0))
         (hsv (hexrgb-rgb-to-hsv red green blue))
         (hue        (nth 0 hsv))
         (saturation (nth 1 hsv))
         (value      (nth 2 hsv)))
    (setq value (+ value (/ increment 100.0)))
    (when (&gt; value 1.0) (setq value (1- value)))
    (hexrgb-color-values-to-hex (mapcar (lambda (x) (floor (* x 65535.0)))
                                        (hexrgb-hsv-to-rgb hue saturation value)))))

<span class="linecomment">;; This is essentially a version of `doremi-increment-color-component' for hue only.</span>
(defun icicle-increment-color-hue (color increment)
  "<span class="quote">Increase hue component of COLOR by INCREMENT.</span>"
  (unless (string-match "<span class="quote">#</span>" color)      <span class="linecomment">; Convert color name to #hhh...</span>
    (setq color (hexrgb-color-values-to-hex (x-color-values color))))
  <span class="linecomment">;; Convert RGB to HSV</span>
  (let* ((rgb (x-color-values color))
         (red   (/ (float (nth 0 rgb)) 65535.0)) <span class="linecomment">; Convert from 0-65535 to 0.0-1.0</span>
         (green (/ (float (nth 1 rgb)) 65535.0))
         (blue  (/ (float (nth 2 rgb)) 65535.0))
         (hsv (hexrgb-rgb-to-hsv red green blue))
         (hue        (nth 0 hsv))
         (saturation (nth 1 hsv))
         (value      (nth 2 hsv)))
    (setq hue (+ hue (/ increment 100.0)))
    (when (&gt; hue 1.0) (setq hue (1- hue)))
    (hexrgb-color-values-to-hex (mapcar (lambda (x) (floor (* x 65535.0)))
                                        (hexrgb-hsv-to-rgb hue saturation value)))))

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-redefine-standard-commands-flag t
  "<span class="quote">*Non-nil means Icicle mode redefines some standard Emacs commands.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-regexp-quote-flag nil
  "<span class="quote">*Non-nil means special characters in regexps are escaped.
This means that no characters are recognized as special: they match
themselves.  This turn apropos completion into simple substring
completion.

You probably do not want to customize this option.  Instead, use
command `icicle-toggle-regexp-quote' (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-regexp-quote]' in the minibuffer) to
toggle this option at any time.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-regexp-search-ring-max (if (boundp 'most-positive-fixnum)
                                             most-positive-fixnum
                                           67108863) <span class="linecomment">; 1/2 of `most-positive-fixnum' on Windows.</span>
  "<span class="quote">*Icicles version of `regexp-search-ring-max'.</span>"
  :type 'integer :group 'icicles)

<span class="linecomment">;; You can use `icicle-increment-color-value' in place of `icicle-increment-color-hue', if you</span>
<span class="linecomment">;; prefer highlighting background to be slightly darker instead of a slightly different hue.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defcustom icicle-region-background nil
  "<span class="quote">*Background color to use for region during minibuffer cycling.</span>"
  :type 'string :group 'icicles)

<span class="linecomment">;; Do it this way, not inside `defcustom', to avoid processing by</span>
<span class="linecomment">;; `customize-update-all' run on idle timer by `cus-edit+.el'.</span>
(setq icicle-region-background
      (or icicle-region-background      <span class="linecomment">; Don't redefine, if user has set it.</span>
          (if (featurep 'hexrgb)
              (icicle-increment-color-hue <span class="linecomment">; Use a slightly different hue than frame background.</span>
               (or (and (boundp '1on1-active-minibuffer-frame-background)
                        1on1-active-minibuffer-frame-background) <span class="linecomment">; In `oneonone.el'.</span>
                   (cdr (assq 'background-color (frame-parameters)))
                   (face-background 'region))
               24)
            (cdr (assq 'background-color (frame-parameters)))))) <span class="linecomment">; Invisible, if no `hexrgb.el'.</span>

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-reminder-prompt-flag 20
  "<span class="quote">*Whether to use `icicle-prompt-suffix' reminder in minibuffer prompt.
Nil means never use the reminder.
Non-nil means use the reminder, if space permits:
 An integer value means use only for that many Emacs sessions.
 t means always use it.</span>"
  :type '(choice
          (const   :tag "<span class="quote">Never use a reminder in the prompt</span>"                  nil)
          (const   :tag "<span class="quote">Always use a reminder in the prompt</span>"                 t)
          (integer :tag "<span class="quote">Use a reminder in the prompt for this many sessions</span>" :value 20))
  :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-require-match-flag nil
  "<span class="quote">*Control REQUIRE-MATCH arg to `completing-read' and `read-file-name'.
The possible values are as follows:
- nil means this option imposes nothing on completion;
  the REQUIRE-MATCH argument provided to the function governs behavior
- `no-match-required' means the same as a nil value for REQUIRE-MATCH
- `partial-match-ok' means the same as a t value for REQUIRE-MATCH
- `full-match-required' means the same as a non-nil, non-t value for
  REQUIRE-MATCH

Note: This option is provided mainly for use (binding) in
      `icicle-define-command' and `icicle-define-file-command'.
      You probably do not want to set this globally, but you can.</span>"
  :type '(choice
          (const :tag "<span class="quote">Do not impose any match behavior</span>"  nil)
          (const :tag "<span class="quote">Do not require a match</span>"            no-match-required)
          (const :tag "<span class="quote">Require a partial match, with RET</span>" partial-match-ok)
          (const :tag "<span class="quote">Require a full match</span>"              full-match-required))
  :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-saved-completion-sets nil
  "<span class="quote">*List of completion sets available for `icicle-completion-set'.
The form is ((SET-NAME . CACHE-FILE-NAME)...), where SET-NAME is the
name of a set of completion candidates and CACHE-FILE-NAME is the
absolute name of the cache file that contains those candidates.
You normally do not customize this directly, statically.
Instead, you add or remove sets using commands
`icicle-add/update-saved-completion-set' and
`icicle-remove-saved-completion-set'.</span>"
  :type '(repeat (cons string file)) :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-highlight-all-flag t
  "<span class="quote">*Non-nil means `icicle-search' highlights all matches at once.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-cleanup-flag t
  "<span class="quote">*Controls whether to remove highlighting after a search.
If this is nil, highlighting can be removed manually with
`\\[icicle-search-highlight-cleanup]'.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-hook nil
  "<span class="quote">*List of hook functions run by `icicle-search' (see `run-hooks').</span>"
  :type 'hook :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-ring-max (if (boundp 'most-positive-fixnum)
                                      most-positive-fixnum
                                    67108863) <span class="linecomment">; 1/2 of `most-positive-fixnum' on Windows.</span>
  "<span class="quote">*Icicles version of `search-ring-max'.</span>"
  :type 'integer :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-show-Completions-initially-flag nil
  "<span class="quote">*Non-nil means to show buffer *Completions* with no user input.
nil means that *Completions* is shown upon demand, via `TAB' or
`S-TAB'.

Alternatively, you can set option `icicle-incremental-completion-flag'
to a value that is neither nil nor t.  That will display buffer
*Completions* as soon as you type or delete input (but not
initially).</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-sort-function 'string-lessp
  "<span class="quote">*Comparison function passed to `sort', to sort completion candidates.
This sorting determines the order of candidates when cycling and their
order in buffer *Completions*.  If the value nil, no sorting is done.

When `icicle-cycle-into-subdirs-flag' is non-nil, you might want to
use a function such as `icicle-sort-dirs-last' for this option, to
prevent cycling into subdirectories depth first.

You can toggle sorting at any time using command
`icicle-toggle-sorting', bound to `C-,' in the minibuffer</span>"
  :type 'function :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-configs
  `(("<span class="quote">All</span>" nil nil nil nil ,icicle-sort-function)
    ("<span class="quote">Files</span>" nil nil (lambda (bufname) (buffer-file-name (get-buffer bufname))) nil
     ,icicle-sort-function)
    ("<span class="quote">Files and Scratch</span>" nil nil (lambda (bufname) (buffer-file-name (get-buffer bufname)))
     ("<span class="quote">*scratch*</span>") ,icicle-sort-function)
    ("<span class="quote">All, *...* Buffers Last</span>" nil nil nil nil icicle-buffer-sort-*...*-last))
  "<span class="quote">*List of option configurations available for `icicle-buffer-config'.
The form is (CONFIG...), where CONFIG is a list of these items:

 - Configuration name                    (string)
 - `icicle-buffer-match-regexp' value    (regexp string)
 - `icicle-buffer-no-match-regexp' value (regexp string)
 - `icicle-buffer-predicate' value       (function)
 - `icicle-buffer-extras' value          (list of strings)
 - `icicle-buffer-sort' value            (function)

A configuration describes which buffer names are displayed during
completion and their order.</span>"
  :type '(repeat (list
                  string                <span class="linecomment">; Configuration name</span>
                  (choice (const :tag "<span class="quote">None</span>" nil) string) <span class="linecomment">; Match regexp</span>
                  (choice (const :tag "<span class="quote">None</span>" nil) string) <span class="linecomment">; No-match regexp</span>
                  (choice (const :tag "<span class="quote">None</span>" nil) function) <span class="linecomment">; Predicate</span>
                  (choice (const :tag "<span class="quote">None</span>" nil) (repeat string)) <span class="linecomment">; Extras list</span>
                  (choice (const :tag "<span class="quote">None</span>" nil) function))) <span class="linecomment">; Sort function</span>
  :group 'icicles)

(defun icicle-buffer-sort-*...*-last (buf1 buf2)
  "<span class="quote">Returns non-nil if BUF1 is `string&lt;' BUF2 or only BUF2 starts with \</span>"*\"<span class="quote">.</span>"
  (let ((b1 (if completion-ignore-case (downcase buf1) buf1))
        (b2 (if completion-ignore-case (downcase buf2) buf2)))
    (if (string-match "<span class="quote">^\\*</span>" b1)
        (and (string-match "<span class="quote">^\\*</span>" b2) (string&lt; b1 b2))
      (or (string-match "<span class="quote">^\\*</span>" b2) (string&lt; b1 b2)))))

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-thing-at-point-functions
  (cons
   <span class="linecomment">;; Lisp symbol or file name, word, url.</span>
   (list
    (if (fboundp 'symbol-name-nearest-point)
        'symbol-name-nearest-point
      (lambda () (symbol-name (symbol-at-point))))
    (if (fboundp 'word-nearest-point)
        'word-nearest-point
      (lambda () (thing-at-point 'word)))
    'thing-at-point-url-at-point)
   'forward-word)
  "<span class="quote">*Functions that return a string at or near the cursor.
This is a cons cell whose car and cdr may each be empty.

The car of the cons cell is a list of functions that grab different
kinds of strings at or near point.  By default, there are three
functions, which grab 1) the symbol or file name, 2) the word, 3) the
URL at point.  Any number of functions can be used.  They are used in
sequence by command `icicle-insert-string-at-point'.

The cdr of the cons cell is nil or a function that advances point one
text thing.  Each time command `icicle-insert-string-at-point' is
called successively, this is called to grab more things of text (of
the same kind).  By default, successive words are grabbed.

If either the car or cdr is empty, then the other alone determines the
behavior of `icicle-insert-string-at-point'.  Otherwise, option
`icicle-default-thing-insertion' determines whether the car or cdr is
used by `icicle-insert-string-at-point'.  `C-u' with no number
reverses the meaning of `icicle-default-thing-insertion'.</span>"
  :type
  '(cons
    (choice
     (repeat (function :tag "<span class="quote">Function to grab some text at point and insert it in minibuffer</span>"))
     (const :tag "<span class="quote">No alternative text-grabbing functions</span>" nil))
    (choice
     (const :tag "<span class="quote">No function to successively grabs more text</span>" nil)
     (function :tag "<span class="quote">Function to advance point one text thing</span>")))
  :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-touche-pas-aux-menus-flag nil
  "<span class="quote">*Non-nil means do not add items to menus except Minibuf and Icicles.
This value is used only when Icicles mode is initially established, so
changing this has no effect after Icicles has been loaded.  However,
you can change it and save the new value so it will be used next time.</span>"
  :type 'boolean :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-update-input-hook nil
  "<span class="quote">*Functions run when minibuffer input is updated (typing or deleting).</span>"
  :type 'hook :group 'icicles)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-word-completion-key [(meta ?\ )]
  "<span class="quote">*Key sequence to use for minibuffer word completion.
The value has the same form as a key-sequence arg to `define-key'.

Because file names, in particular, can contain spaces, some people
prefer this to be a non-printable key sequence, such as `M-SPC'.  This
is the default value in Icicles.

But because the spacebar is such a convenient key to hit, other people
prefer to use `SPC' for word completion, and to insert a space some
other way.  The usual way to do that is via `C-q SPC', but command
`icicle-insert-a-space' is provided for convenience.  You can bind
this to `M-SPC', for instance, in `minibuffer-local-completion-map',
`minibuffer-local-completion-map', and
`minibuffer-local-must-match-map'.</span>"
  :type 'sexp :group 'icicles)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-opt)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-opt.el ends here</span></span></pre></pre></p></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" href="http://www.emacswiki.org/cgi-bin/emacs?action=edit;id=icicles-opt.el">Edit this page</a> <a class="history" href="http://www.emacswiki.org/cgi-bin/emacs?action=history;id=icicles-opt.el">View other revisions</a> <a class="admin" href="http://www.emacswiki.org/cgi-bin/emacs?action=admin;id=icicles-opt.el">Administration</a></span><span class="time"><br /> Last edited 2006-06-09 21:53 UTC by <a class="author" title="from inet-netcache3-o.oracle.com" href="http://www.emacswiki.org/cgi-bin/emacs/DrewAdams">DrewAdams</a> <a class="diff" href="http://www.emacswiki.org/cgi-bin/emacs?action=browse;diff=2;id=icicles-opt.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" class="search">
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