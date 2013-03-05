<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head><title>EmacsWiki: icicles-fn.el</title><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,NOFOLLOW" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content and diff" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1;diff=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki including minor differences" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;showedit=1" /></head><body class="http://www.emacswiki.org/cgi-bin/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><form class="tiny" action="http://www.emacswiki.org/cgi-bin/emacs"><p>Search: <input type="text" name="search" size="20" /></p></form><h1><a title="Click to search for references to this page" href="http://www.emacswiki.org/cgi-bin/emacs?search=%22icicles-fn%5c.el%22">icicles-fn.el</a></h1></div><div class="content browse"><p><p><a href="http://www.emacswiki.org/cgi-bin/emacs/download/icicles-fn.el">Download</a></p><pre class="source"><pre class="code"><span class="linecomment">;;; icicles-fn.el --- Non-interactive functions for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-fn.el</span>
<span class="linecomment">;; Description: Non-interactive functions for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 2005, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:25:53 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Fri Jun 09 17:46:23 2006 (-25200 Pacific Daylight Time)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 1455</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-fn.el</span>
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
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  non-interactive functions.  See `icicles.el' for documentation.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-activate-mark', `icicle-apropos-candidates',</span>
<span class="linecomment">;;    `icicle-barf-if-outside-Completions',</span>
<span class="linecomment">;;    `icicle-barf-if-outside-minibuffer',</span>
<span class="linecomment">;;    `icicle-bind-completion-keys', `icicle-bind-isearch-keys',</span>
<span class="linecomment">;;    `icicle-call-then-update-Completions',</span>
<span class="linecomment">;;    `icicle-cancel-*Help*-redirection', `icicle-candidate-set-1',</span>
<span class="linecomment">;;    `icicle-choose-completion-string', `icicle-clear-minibuffer',</span>
<span class="linecomment">;;    `icicle-completing-p', `icicle-completing-read',</span>
<span class="linecomment">;;    `icicle-completion-setup-function',</span>
<span class="linecomment">;;    `icicle-control-reminder-prompt', `icicle-delete-if',</span>
<span class="linecomment">;;    `icicle-delete-if-not', `icicle-delete-whitespace-from-string',</span>
<span class="linecomment">;;    `icicle-display-Completions',</span>
<span class="linecomment">;;    `icicle-display-candidates-in-Completions',</span>
<span class="linecomment">;;    `icicle-expand-file-name', `icicle-file-directory-p',</span>
<span class="linecomment">;;    `icicle-file-name-apropos-candidates',</span>
<span class="linecomment">;;    `icicle-file-name-directory-w-default',</span>
<span class="linecomment">;;    `icicle-file-name-input-p', `icicle-file-name-nondirectory',</span>
<span class="linecomment">;;    `icicle-file-name-prefix-candidates', `icicle-file-readable-p',</span>
<span class="linecomment">;;    `icicle-file-writable-p', `icicle-files-within',</span>
<span class="linecomment">;;    `icicle-filter-wo-input', `icicle-fix-default-directory',</span>
<span class="linecomment">;;    `icicle-frames-on', `icicle-highlight-complete-input',</span>
<span class="linecomment">;;    `icicle-highlight-initial-whitespace',</span>
<span class="linecomment">;;    `icicle-increment-cand-nb+signal-end',</span>
<span class="linecomment">;;    `icicle-longest-common-match',</span>
<span class="linecomment">;;    `icicle-maybe-sort-and-strip-candidates',</span>
<span class="linecomment">;;    `icicle-minibuffer-contents',</span>
<span class="linecomment">;;    `icicle-minibuffer-contents-from-minibuffer',</span>
<span class="linecomment">;;    `icicle-minibuffer-prompt-end', `icicle-minibuffer-setup',</span>
<span class="linecomment">;;    `icicle-msg-maybe-in-minibuffer', `icicle-next-candidate',</span>
<span class="linecomment">;;    `icicle-place-cursor', `icicle-place-overlay',</span>
<span class="linecomment">;;    `icicle-prefix-candidates', `icicle-read-file-name',</span>
<span class="linecomment">;;    `icicle-read-from-minibuffer', `icicle-read-string',</span>
<span class="linecomment">;;    `icicle-rebind-completion-maps', `icicle-recompute-candidates',</span>
<span class="linecomment">;;    `icicle-redefine-standard-commands',</span>
<span class="linecomment">;;    `icicle-redefine-standard-options',</span>
<span class="linecomment">;;    `icicle-redefine-std-completion-fns', `icicle-remap',</span>
<span class="linecomment">;;    `icicle-remove-dots', `icicle-remove-duplicates',</span>
<span class="linecomment">;;    `icicle-remove-property', `icicle-restore-completion-keys',</span>
<span class="linecomment">;;    `icicle-restore-region-face',</span>
<span class="linecomment">;;    `icicle-restore-standard-commands',</span>
<span class="linecomment">;;    `icicle-restore-standard-options',</span>
<span class="linecomment">;;    `icicle-restore-std-completion-fns',</span>
<span class="linecomment">;;    `icicle-run-icicle-post-command-hook',</span>
<span class="linecomment">;;    `icicle-run-icicle-pre-command-hook',</span>
<span class="linecomment">;;    `icicle-save-or-restore-input',</span>
<span class="linecomment">;;    `icicle-scroll-or-update-Completions', `icicle-set-calling-cmd',</span>
<span class="linecomment">;;    `icicle-set-difference', `icicle-set-intersection',</span>
<span class="linecomment">;;    `icicle-set-union', `icicle-sort-and-strip-ignored',</span>
<span class="linecomment">;;    `icicle-sort-case-insensitively', `icicle-sort-dirs-last',</span>
<span class="linecomment">;;    `icicle-undo-std-completion-faces', `icicle-unmap',</span>
<span class="linecomment">;;    `icicle-unsorted-apropos-candidates',</span>
<span class="linecomment">;;    `icicle-unsorted-file-name-apropos-candidates',</span>
<span class="linecomment">;;    `icicle-unsorted-file-name-prefix-candidates',</span>
<span class="linecomment">;;    `icicle-unsorted-prefix-candidates',</span>
<span class="linecomment">;;    `icicle-update-completions',</span>
<span class="linecomment">;;    `icicle-update-ignored-extensions-regexp'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: These EMACS PRIMITIVES have been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `completing-read'              - (See below and doc string.)</span>
<span class="linecomment">;;  `read-file-name'               - (See below and doc string.)</span>
<span class="linecomment">;;  `read-from-minibuffer'         - (See below and doc string.)</span>
<span class="linecomment">;;  `read-string'                  - (See below and doc string.)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `simple.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `choose-completion-string' -</span>
<span class="linecomment">;;     Don't exit minibuffer after `lisp-complete-symbol' completion.</span>
<span class="linecomment">;;  `completion-setup-function' - 1. Put faces on inserted string(s).</span>
<span class="linecomment">;;                                2. Help on help.</span>
<span class="linecomment">;;  `repeat-complex-command' - Use `completing-read' to read command.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2006/06/09 dadams</span>
<span class="linecomment">;;     icicle(-file-name)-(apropos|prefix)-candidates: Reset icicle-candidate-nb to nil.</span>
<span class="linecomment">;;     icicle-recompute-candidates: Don't reset icicle-candidate-nb to nil.</span>
<span class="linecomment">;;     icicle-place-cursor: Prevent error on search-forward.</span>
<span class="linecomment">;; 2006/06/08 dadams</span>
<span class="linecomment">;;     icicle-save-or-restore-input: Do not restore if current command is completion.</span>
<span class="linecomment">;;     Added: icicle-expand-file-name.</span>
<span class="linecomment">;;     icicle-next-candidate: Don't pass NTH arg to icicle-display-candidates-in-Completions.</span>
<span class="linecomment">;; 2006/06/06 dadams</span>
<span class="linecomment">;;     icicle-control-reminder-prompt: Protect with condition-case, since it's on kill-emacs-hook.</span>
<span class="linecomment">;; 2006/06/01 dadams</span>
<span class="linecomment">;;     icicle-read-from-minibuffer: Emacs 22 removed the keep-all arg it had added.</span>
<span class="linecomment">;; 2006/05/31 dadams</span>
<span class="linecomment">;;     icicle-barf-if-outside*: Simplified.</span>
<span class="linecomment">;; 2006/05/30 dadams</span>
<span class="linecomment">;;     Bind icicle-erase-minibuffer-or-history to M-k also in non-completion minibuffer maps.</span>
<span class="linecomment">;; 2006/05/26 dadams</span>
<span class="linecomment">;;     Bind icicle-erase-minibuffer-or-history to M-k.</span>
<span class="linecomment">;;     Do not remap (or unmap) kill-sentence (it is on M-k in global map).</span>
<span class="linecomment">;; 2006/05/19 dadams</span>
<span class="linecomment">;;     Added: icicle-control-reminder-prompt.</span>
<span class="linecomment">;;     icicle-reminder-prompt-flag, icicle-read-file-name: Treat new values of icicle-reminder*.</span>
<span class="linecomment">;;     Renamed icicle-inhibit-reminder* to icicle-reminder*.</span>
<span class="linecomment">;; 2006/05/16 dadams</span>
<span class="linecomment">;;     Bug fix:</span>
<span class="linecomment">;;       icicle-recompute-candidates: Add new saved-last-input arg (replaces icicle-last-input).</span>
<span class="linecomment">;;       icicle-next-candidate: Pass saved old last input to icicle-recompute-candidates.</span>
<span class="linecomment">;; 2006/05/15 dadams</span>
<span class="linecomment">;;     Reverted change: icicle-unsorted(-file-name)-apropos-candidates, icicle-display-Completions:</span>
<span class="linecomment">;;       Use icicle-completion-nospace-flag, not nil.</span>
<span class="linecomment">;;     Renamed: icicle-completion-nospace-flag to icicle-ignore-space-prefix-flag.</span>
<span class="linecomment">;;     icicle-toggle-incremental-completion: C-#, icicle-toggle-ignored-space-prefix: C-^.</span>
<span class="linecomment">;; 2006/05/13 dadams</span>
<span class="linecomment">;;     icicle-unsorted(-file-name)-apropos-candidates, icicle-display-Completions:</span>
<span class="linecomment">;;       Use nil, not icicle-completion-nospace-flag.</span>
<span class="linecomment">;; 2006/05/12 dadams</span>
<span class="linecomment">;;     icicle-completion-help-string: Added faces and commands. Cleanup.</span>
<span class="linecomment">;;     Moved from icicles-cmd.el: icicle-barf-if-outside-*.</span>
<span class="linecomment">;; 2006/05/09 dadams</span>
<span class="linecomment">;;     icicle-display-*: Only issue Displaying... message when more candidates than threshold.</span>
<span class="linecomment">;; 2006/05/01 dadams</span>
<span class="linecomment">;;     icicle-save-or-restore-input: No-restore test is non-nil, not non-"", icicle-last-input.</span>
<span class="linecomment">;;     icicle-minibuffer-setup: Reset icicle-last-input to nil, not "".</span>
<span class="linecomment">;;     icicle-next-candidate: Highlight initial whitespace before underline root.</span>
<span class="linecomment">;; 2006/04/28 dadams</span>
<span class="linecomment">;;     icicle-save-or-restore-input:</span>
<span class="linecomment">;;       Restore empty input if it is not a file name.</span>
<span class="linecomment">;;       Don't expand empty common-match-string file-name input (it would lose trailing /).</span>
<span class="linecomment">;;     Added: icicle-highlight-initial-whitespace.</span>
<span class="linecomment">;;     icicle-next-candidate, icicle-call-then-update-Completions:</span>
<span class="linecomment">;;       Use icicle-highlight-initial-whitespace.</span>
<span class="linecomment">;; 2006/04/14 dadams</span>
<span class="linecomment">;;     icicle-call-then-update-Completions: Call icicle-update-input-hook.</span>
<span class="linecomment">;;     Bound icicle-insert-string-from-variable to C-=.  Added to icicle-completion-help-string.</span>
<span class="linecomment">;; 2006/04/09 dadams</span>
<span class="linecomment">;;     icicle-bind-completion-keys, icicle-minibuffer-setup:</span>
<span class="linecomment">;;       Deal with icicle-arrows-respect-completion-type-flag.</span>
<span class="linecomment">;;     icicle-display-candidates-in-Completions:</span>
<span class="linecomment">;;       Bug fix: regexp-quote common match when highlighting it.</span>
<span class="linecomment">;;     icicle-clear-minibuffer: Remove interactive spec.</span>
<span class="linecomment">;;     Moved to icicles-cmd.el: icicle-customize-apropos*, icicle-repeat-complex-command.</span>
<span class="linecomment">;; 2006/04/02 dadams</span>
<span class="linecomment">;;     Bound icicle-toggle-regexp-quote.</span>
<span class="linecomment">;; 2006/03/31 dadams</span>
<span class="linecomment">;;     icicle-next-candidate:</span>
<span class="linecomment">;;       Apply icicle-place-cursor to icicle-current-regexp-input if regexp-p.</span>
<span class="linecomment">;;     icicle-save-or-restore-input:</span>
<span class="linecomment">;;       Don't set icicle-current-regexp-input if this is a next-candidate action.</span>
<span class="linecomment">;; 2006/03/27 dadams</span>
<span class="linecomment">;;     icicle-place-overlay: Made generic: added args overlay, face, buffer, properties.</span>
<span class="linecomment">;; 2006/03/25 dadams</span>
<span class="linecomment">;;     icicle-call-then-update-Completions: Corrected use of icicle-incremental-completion*.</span>
<span class="linecomment">;; 2006/03/24 dadams</span>
<span class="linecomment">;;     Renamed icicle-expand-input-to-common-match to icicle-longest-common-match.  Rewrote it.</span>
<span class="linecomment">;;     icicle-call-then-update-Completions:</span>
<span class="linecomment">;;       Use icicle-incremental-completion-delay and -threshold.</span>
<span class="linecomment">;;     Mapped icicle-delete-char.</span>
<span class="linecomment">;; 2006/03/23 dadams</span>
<span class="linecomment">;;     icicle-expand-input-to-common-match:</span>
<span class="linecomment">;;       Return the longest common match.  Don't set icicle-common-match-string here.</span>
<span class="linecomment">;;     icicle-unsorted-*apropos-candidates: Set icicle-common-match-string here explicitly.</span>
<span class="linecomment">;;     Added: icicle-maybe-sort-and-strip-candidates.  Use in icicle-candidate-set-1.</span>
<span class="linecomment">;; 2006/03/22 dadams</span>
<span class="linecomment">;;     icicle-display-candidates-in-Completions:</span>
<span class="linecomment">;;       Removed root arg (always use icicle-current-input).</span>
<span class="linecomment">;;       Always highlight normal match part.</span>
<span class="linecomment">;;       Highlight common-match part if icicle-expand-input-to-common-match-flag.</span>
<span class="linecomment">;;     icicle-save-or-restore-input:</span>
<span class="linecomment">;;       Update regexp even if not icicle-expand-input-to-common-match-flag.</span>
<span class="linecomment">;;     icicle-recompute-candidates: If no candidates, then delete *Completions* window.</span>
<span class="linecomment">;;     icicle-next-candidate: Set default-directory only if icicle-file-name-input-p.</span>
<span class="linecomment">;;     Applied renamings of icicle-match-* faces.</span>
<span class="linecomment">;; 2006/03/21 dadams</span>
<span class="linecomment">;;     icicle-expand-input-to-common-match:</span>
<span class="linecomment">;;       Bug fixes:</span>
<span class="linecomment">;;         If no overlap between first and second candidates, then no common match.</span>
<span class="linecomment">;;         If no match with another candidate, then no common match.</span>
<span class="linecomment">;;         Input must match computed common match.</span>
<span class="linecomment">;;         When checking others, check only the added (pre|suf)fix, and reduce those as needed.</span>
<span class="linecomment">;;     icicle-save-or-restore-input:</span>
<span class="linecomment">;;       Bug fixes:</span>
<span class="linecomment">;;         When icicle-expand-input-to-common-match-flag, expand using directory from the</span>
<span class="linecomment">;;           input, not the default-directory.  Thx to cacher3.ericsson.net for report.</span>
<span class="linecomment">;;         Do test for case-only difference only when case-fold-search.</span>
<span class="linecomment">;;         If input is a directory (with slash), then use it as is.</span>
<span class="linecomment">;;         Save icicle-current-regexp-input if no icicle-common-match-string too.</span>
<span class="linecomment">;;     icicle-display-candidates-in-Completions: Use icicle-common-match-highlight-Completions.</span>
<span class="linecomment">;; 2006/03/20 dadams</span>
<span class="linecomment">;;     icicle-save-or-restore-input: Set icicle-current-regexp-input too.</span>
<span class="linecomment">;;                                   Corrected letter-case test.</span>
<span class="linecomment">;; 2006/03/19 dadams</span>
<span class="linecomment">;;     Added: icicle-expand-input-to-common-match.</span>
<span class="linecomment">;;     icicle-unsorted*-apropos-candidates:</span>
<span class="linecomment">;;       Set icicle-common-match-string if icicle-expand-input-to-common-match-flag.</span>
<span class="linecomment">;;     icicle-save-or-restore-input:</span>
<span class="linecomment">;;       Added regexp-p arg.  Update input to icicle-common-match-string if appropriate.</span>
<span class="linecomment">;;     icicle-next-candidate: Reset icicle-common-match-string.</span>
<span class="linecomment">;; 2006/03/17 dadams</span>
<span class="linecomment">;;     icicle-file-(read|writ)able-p: Put non-empty string condition first.</span>
<span class="linecomment">;;     Added: icicle-delete-whitespace-from-string.</span>
<span class="linecomment">;;     icicle-files-within: Moved here from icicle-cmd.el.</span>
<span class="linecomment">;; 2006/03/14 dadams</span>
<span class="linecomment">;;     Removed: icicle-reset-icicle-completing-p.</span>
<span class="linecomment">;;     icicle-completing-read, icicle-read-file-name: Removed icicle-icicle-completing-p.</span>
<span class="linecomment">;;     icicle-display-*: Added Displaying... message.</span>
<span class="linecomment">;; 2006/03/13 dadams</span>
<span class="linecomment">;;     Added: icicle-file-(read|writ)able-p.  Bound them to C-{ and C-} in minibuffer.</span>
<span class="linecomment">;;     icicle-rebind-completion-maps, icicle-bind-completion-keys: Added the new commands.</span>
<span class="linecomment">;;     icicle-recompute-candidates: Forgot icicle-keep-only-past-inputs in other branch.</span>
<span class="linecomment">;; 2006/03/10 dadams</span>
<span class="linecomment">;;     icicle-save-or-restore-input: Bug fix (thx to Toby Cubitt) - Not relative to default dir.</span>
<span class="linecomment">;;       Use directory-file-name, so don't include /.</span>
<span class="linecomment">;;       Use file-name-nondirectory, not file-relative-name if not cycling into subdirs.</span>
<span class="linecomment">;;     Renamed icicle-minibuffer-contents to icicle-minibuffer-contents-from-minibuffer.</span>
<span class="linecomment">;;     Added new icicle-minibuffer-contents, which can be called outside minibuffer.</span>
<span class="linecomment">;; 2006/03/08 dadams</span>
<span class="linecomment">;;     icicle-place-overlay: Use new face, icicle-current-candidate-highlight.</span>
<span class="linecomment">;; 2006/03/05 dadams</span>
<span class="linecomment">;;     Bound icicle-toggle-incremental-completion to C-^ in minibuffer.</span>
<span class="linecomment">;;     Updated icicle-completion-help-string with C-^ binding.</span>
<span class="linecomment">;;     icicle-display-candidates-in-Completions:</span>
<span class="linecomment">;;       Allow for on-the-fly changes to icicle-incremental-completion-flag.</span>
<span class="linecomment">;; 2006/03/01 dadams</span>
<span class="linecomment">;;     Added: icicle-clear-minibuffer.  Use in icicle-next-candidate.</span>
<span class="linecomment">;; 2006/02/27 dadams</span>
<span class="linecomment">;;     icicle-call-then-update-Completions: Set last-command to fn arg.</span>
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

(eval-when-compile (require 'cl)) <span class="linecomment">;; case</span>
                                  <span class="linecomment">;; plus, for Emacs &lt; 21: dolist, push, pop</span>
                                  <span class="linecomment">;; plus, for Emacs &lt; 20: when, unless</span>

(eval-when-compile
 (require 'icicles-face)
 (require 'icicles-opt)
 (require 'icicles-var)
 (require 'icicles-mac)
 (require 'icicles-cmd))

<span class="linecomment">;; Byte-compiling this file, you will likely get some error or warning</span>
<span class="linecomment">;; messages. All of the following are benign.  They are due to</span>
<span class="linecomment">;; differences between different versions of Emacs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Compiling in Emacs 22:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Warning: `directory-sep-char' is an obsolete variable (as of Emacs 21.1); do not use it.</span>
<span class="linecomment">;; Warning: `make-local-hook' is an obsolete function (as of Emacs 21.1); not necessary any more.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Compiling in Emacs 20:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; The following functions are not known to be defined:</span>
<span class="linecomment">;;     minibufferp, minibuffer-prompt-end, field-string, minibuffer-contents,</span>
<span class="linecomment">;;     display-mouse-p, propertize, dabbrev--reset-global-variables,</span>
<span class="linecomment">;;     dabbrev--abbrev-at-point, dabbrev--minibuffer-origin,</span>
<span class="linecomment">;;     dabbrev--find-all-expansions, dabbrev--substitute-expansion,</span>
<span class="linecomment">;;     face-spec-reset-face, set-face-attribute,</span>
<span class="linecomment">;;     minibuffer-contents-no-properties</span>


<span class="linecomment">;;; Defvars to quiet byte-compilers (Emacs 20 - 22)</span>

(defvar directory-sep-char)
(defvar partial-completion-mode)
(defvar completion-root-regexp)
(defvar minibuffer-prompt-properties)
(defvar minibuffer-local-filename-completion-map)
(defvar dabbrev-case-fold-search)
(defvar dabbrev-upcase-means-case-search)
(defvar dabbrev--last-obarray)
(defvar dabbrev--last-completion-buffer)
(defvar dabbrev--last-abbreviation)
(defvar dabbrev--check-other-buffers)
(defvar dabbrev-case-replace)



<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>



<span class="linecomment">;;; Noninteractive Functions -------------------------------</span>


<span class="linecomment">;;; Redefined standard functions............................</span>


<span class="linecomment">;;; REPLACE ORIGINAL `choose-completion-string' in `simple.el',</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Don't exit minibuffer if this is just a `lisp-complete-symbol' completion.</span>
<span class="linecomment">;;; Free variable `completion-reference-buffer' is defined in `simple.el'.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-choose-completion-string)
(fset 'old-choose-completion-string (symbol-function 'choose-completion-string)))

<span class="linecomment">;;;###autoload</span>
(when (&lt; emacs-major-version 22)
  (defun icicle-choose-completion-string (choice &optional buffer base-size)
    "<span class="quote">Switch to BUFFER and insert the completion choice CHOICE.
BASE-SIZE, if non-nil, says how many characters of BUFFER's text
to keep.  If it is nil, we call `choose-completion-delete-max-match'
to decide what to delete.
If BUFFER is the minibuffer, then exit the minibuffer, unless one of
the following is true:
   - it is reading a file name and CHOICE is a directory
   - `completion-no-auto-exit' is non-nil
   - this is just a `lisp-complete-symbol' completion.</span>"
    (let ((buffer (or buffer completion-reference-buffer))) <span class="linecomment">; In `simple.el'.</span>
      <span class="linecomment">;; If BUFFER is a minibuffer, barf unless it's currently active.</span>
      (when (and (string-match "<span class="quote">\\` \\*Minibuf-[0-9]+\\*\\'</span>" (buffer-name buffer))
                 (or (not (active-minibuffer-window))
                     (not (equal buffer (window-buffer (active-minibuffer-window))))))
        (error "<span class="quote">Minibuffer is not active for completion</span>"))
      <span class="linecomment">;; Insert the completion into the buffer where completion was requested.</span>
      (set-buffer buffer)
      (if base-size
          (delete-region (+ base-size (point-min)) (point))
        (choose-completion-delete-max-match choice))
      (insert choice)
      (remove-text-properties (- (point) (length choice)) (point) '(mouse-face nil))
      <span class="linecomment">;; Update point in the window that BUFFER is showing in.</span>
      (let ((window (get-buffer-window buffer t)))
        (set-window-point window (point)))
      <span class="linecomment">;; If completing for the minibuffer, exit it with this choice,</span>
      <span class="linecomment">;; unless this was a `lisp-complete-symbol' completion.</span>
      (and (not completion-no-auto-exit)
           (equal buffer (window-buffer (minibuffer-window)))
           minibuffer-completion-table
           (not (eq 'lisp-complete-symbol icicle-cmd-calling-for-completion))
           <span class="linecomment">;; If this is reading a file name, and the file name chosen</span>
           <span class="linecomment">;; is a directory, don't exit the minibuffer.</span>
           (if (and (eq minibuffer-completion-table 'read-file-name-internal)
                    (file-directory-p (buffer-string)))
               (select-window (active-minibuffer-window))
             (exit-minibuffer))))))

<span class="linecomment">;;;###autoload</span>
(when (&gt;= emacs-major-version 22)
  (defun icicle-choose-completion-string (choice &optional buffer base-size)
    "<span class="quote">Switch to BUFFER and insert the completion choice CHOICE.
BASE-SIZE, if non-nil, says how many characters of BUFFER's text
to keep.  If it is nil, we call `choose-completion-delete-max-match'
to decide what to delete.
If BUFFER is the minibuffer, then exit the minibuffer, unless one of
the following is true:
   - it is reading a file name and CHOICE is a directory
   - `completion-no-auto-exit' is non-nil
   - this is just a `lisp-complete-symbol' completion.</span>"
    (let* ((buffer (or buffer completion-reference-buffer)) <span class="linecomment">; In `simple.el'.</span>
           (mini-p (minibufferp buffer)))
      <span class="linecomment">;; If BUFFER is a minibuffer, barf unless it's the currently</span>
      <span class="linecomment">;; active minibuffer.</span>
    (if (and mini-p
             (or (not (active-minibuffer-window))
                 (not (equal buffer (window-buffer (active-minibuffer-window))))))
        (error "<span class="quote">Minibuffer is not active for completion</span>")
      <span class="linecomment">;; Set buffer so buffer-local choose-completion-string-functions works.</span>
      (set-buffer buffer)
      (unless (run-hook-with-args-until-success 'choose-completion-string-functions
                                                choice buffer mini-p base-size)
      <span class="linecomment">;; Insert the completion into the buffer where completion was requested.</span>
      (if base-size
          (delete-region (+ base-size (if mini-p (minibuffer-prompt-end) (point-min))) (point))
        (choose-completion-delete-max-match choice))
      (insert choice)
      (remove-text-properties (- (point) (length choice)) (point) '(mouse-face nil))
      <span class="linecomment">;; Update point in the window that BUFFER is showing in.</span>
      (let ((window (get-buffer-window buffer t)))
        (set-window-point window (point)))
      <span class="linecomment">;; If completing for the minibuffer, exit it with this choice,</span>
      <span class="linecomment">;; unless this was a `lisp-complete-symbol' completion.</span>
      (and (not completion-no-auto-exit)
           (equal buffer (window-buffer (minibuffer-window)))
           minibuffer-completion-table
           (not (eq 'lisp-complete-symbol icicle-cmd-calling-for-completion))
           <span class="linecomment">;; If this is reading a file name, and the file name chosen</span>
           <span class="linecomment">;; is a directory, don't exit the minibuffer.</span>
           (if (and (eq minibuffer-completion-table 'read-file-name-internal)
                    (file-directory-p (field-string (point-max))))
                 (let ((mini (active-minibuffer-window)))
                   (select-window mini)
                   (when minibuffer-auto-raise (raise-frame (window-frame mini))))
             (exit-minibuffer))))))))



<span class="linecomment">;;; REPLACE ORIGINAL `completion-setup-function' in `simple.el',</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; 1. Put faces on inserted strings.  2. Help on help.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-completion-setup-function)
(fset 'old-completion-setup-function (symbol-function 'completion-setup-function)))

<span class="linecomment">;;;###autoload</span>
(when (&lt; emacs-major-version 22)
  (defun icicle-completion-setup-function ()
    "<span class="quote">Set up for completion.  This goes in `completion-setup-hook'
so it is called after completion-list buffer text is written.
Put faces on inserted string(s). Provide help on help.</span>"
    (save-excursion
      (let* ((mainbuf (current-buffer))
             (instruction1 (if window-system         <span class="linecomment">; We have a mouse.</span>
                               (substitute-command-keys
                                "<span class="quote">Click \\&lt;completion-list-mode-map&gt;\
\\[mouse-choose-completion] on a completion to select it.  </span>")
                             (substitute-command-keys <span class="linecomment">; No mouse.</span>
                              "<span class="quote">In this buffer, type \\&lt;completion-list-mode-map&gt;\
\\[choose-completion] to select the completion near point.  </span>")))
             (instruction2
              (and icicle-mode
                   (substitute-command-keys
                    "<span class="quote">(\\&lt;minibuffer-local-completion-map&gt;\\[icicle-completion-help]: \
help) </span>"))))
        (set-buffer standard-output)
        (completion-list-mode)
        (make-local-variable 'completion-reference-buffer)
        (setq completion-reference-buffer mainbuf)
        (if (eq minibuffer-completion-table 'read-file-name-internal)
            <span class="linecomment">;; For file name completion,</span>
            <span class="linecomment">;; use the number of chars before the start of the</span>
            <span class="linecomment">;; last file name component.</span>
            (setq completion-base-size (save-excursion
                                         (set-buffer mainbuf)
                                         (goto-char (point-max))
                                         (skip-chars-backward (format "<span class="quote">^%c</span>" directory-sep-char))
                                         (- (point) (point-min))))
          <span class="linecomment">;; Otherwise, in minibuffer, the whole input is being completed.</span>
          (save-match-data
            (if (string-match "<span class="quote">\\` \\*Minibuf-[0-9]+\\*\\'</span>" (buffer-name mainbuf))
                (setq completion-base-size 0))))
        (goto-char (point-min))
        (put-text-property 0 (length instruction1) 'face 'icicle-Completions-instruction-1
                           instruction1)
        (when instruction2
          (put-text-property 0 (length instruction2) 'face 'icicle-Completions-instruction-2
                             instruction2))
        (insert (concat instruction1 instruction2 "<span class="quote">\n\n</span>"))
        (forward-line 1)
        (while (re-search-forward "<span class="quote">[^ \t\n]+\\( [^ \t\n]+\\)*</span>" nil t)
          (let ((beg (match-beginning 0))
                (end (point)))
<span class="linecomment">;;;Emacs20 (when completion-fixup-function (funcall completion-fixup-function))</span>
            (put-text-property beg (point) 'mouse-face 'highlight)
            (goto-char end)))))))

<span class="linecomment">;;;###autoload</span>
(when (&gt;= emacs-major-version 22)
  (defun icicle-completion-setup-function ()
    "<span class="quote">Set up for completion.  This goes in `completion-setup-hook'
so it is called after completion-list buffer text is written.
Put faces on inserted string(s). Provide help on help.</span>"
    (save-excursion
      (let* ((mainbuf (current-buffer))
             (mbuf-contents (minibuffer-contents))
             (instruction1 (if (display-mouse-p)     <span class="linecomment">; We have a mouse.</span>
                               (substitute-command-keys
                                "<span class="quote">Click \\&lt;completion-list-mode-map&gt;\\[mouse-choose-completion] \
or type \\[choose-completion] on a completion to select it.  </span>")
                             (substitute-command-keys <span class="linecomment">; No mouse.</span>
                              "<span class="quote">In this buffer, type \\&lt;completion-list-mode-map&gt;\
\\[choose-completion] to select the completion near point.  </span>")))
             (instruction2
              (and icicle-mode
                   (substitute-command-keys
                    "<span class="quote">(\\&lt;minibuffer-local-completion-map&gt;\\[icicle-completion-help]: \
help) </span>"))))
        <span class="linecomment">;; When reading a file name in the minibuffer,</span>
        <span class="linecomment">;; set default-directory in the minibuffer</span>
        <span class="linecomment">;; so it will get copied into the completion list buffer.</span>
        (if minibuffer-completing-file-name
            (with-current-buffer mainbuf
              (setq default-directory (file-name-directory mbuf-contents))))
        <span class="linecomment">;; If partial-completion-mode is on, point might not be after the</span>
        <span class="linecomment">;; last character in the minibuffer.</span>
        <span class="linecomment">;; FIXME: This still doesn't work if the text to be completed</span>
        <span class="linecomment">;; starts with a `-'.</span>
        (when (and partial-completion-mode (not (eobp)))
          (setq mbuf-contents
                (substring mbuf-contents 0 (- (point) (point-max)))))
        (with-current-buffer standard-output
          (completion-list-mode)
          (make-local-variable 'completion-reference-buffer)
          (setq completion-reference-buffer mainbuf)
          (if minibuffer-completing-file-name
              <span class="linecomment">;; For file name completion,</span>
              <span class="linecomment">;; use the number of chars before the start of the</span>
              <span class="linecomment">;; last file name component.</span>
              (setq completion-base-size
                    (with-current-buffer mainbuf
                      (save-excursion
                        (goto-char (point-max))
                        (skip-chars-backward completion-root-regexp)
                        (- (point) (minibuffer-prompt-end)))))
            <span class="linecomment">;; Otherwise, in minibuffer, the whole input is being completed.</span>
            (if (minibufferp mainbuf) (setq completion-base-size 0)))
          <span class="linecomment">;; Put faces on first uncommon characters and common parts.</span>
          (when completion-base-size
            (let* ((common-string-length
                    (- (length mbuf-contents) completion-base-size))
                   (element-start (next-single-property-change (point-min) 'mouse-face))
                   (element-common-end
                    (and element-start (+ (or element-start nil) common-string-length)))
                   (maxp (point-max)))
              (while (and element-start (&lt; element-common-end maxp))
                (when (and (get-char-property element-start 'mouse-face)
                           (get-char-property element-common-end 'mouse-face))
                  (put-text-property element-start element-common-end
                                     'font-lock-face 'completions-common-part)
                  (put-text-property element-common-end (1+ element-common-end)
                                     'font-lock-face 'completions-first-difference))
                (setq element-start (next-single-property-change element-start 'mouse-face))
                (if element-start
                    (setq element-common-end  (+ element-start common-string-length))))))
          <span class="linecomment">;; Insert help string.</span>
          (goto-char (point-min))
          (put-text-property 0 (length instruction1)
                             'face 'icicle-Completions-instruction-1 instruction1)
          (when instruction2
            (put-text-property 0 (length instruction2)
                               'face 'icicle-Completions-instruction-2 instruction2))
          (insert (concat instruction1 instruction2 "<span class="quote">\n\n</span>")))))))



<span class="linecomment">;;; REPLACE ORIGINAL `completing-read' (built-in function),</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Allows for completions that are lists of strings.</span>
<span class="linecomment">;;; Appends `icicle-prompt-suffix' if resulting prompt is not too long.</span>
<span class="linecomment">;;; Removes *Completions* window.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-completing-read)
(fset 'old-completing-read (symbol-function 'completing-read)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-completing-read
    (prompt table &optional predicate require-match initial-input hist def inherit-input-method)
  "<span class="quote">Read string in minibuffer, with completion and cycling of completions.
Type `\\[exit-minibuffer]' to end your input.

Prefix completion via \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-prefix-word-complete]' (word) and `\\[icicle-prefix-complete]' (full).
Apropos (regexp) completion via `\\[icicle-apropos-complete]'.

Prefix cycling of candidate completions via `\\[icicle-previous-prefix-candidate]' and \
`\\[icicle-next-prefix-candidate]'.
Apropos cycling of candidate completions via `\\[icicle-previous-apropos-candidate]' and \
`\\[icicle-next-apropos-candidate]'.

Cycling of past minibuffer inputs via `\\[previous-history-element]' and \
`\\[next-history-element]'.
Searching through input history via `\\[previous-matching-history-element]' \
and `\\[next-matching-history-element]'.

Case is ignored if `completion-ignore-case' is non-nil.  For file-name
  completion, `read-file-name-completion-ignore-case' is used instead.
For file-name completion, cycling into subdirectories is determined by
  `icicle-cycle-into-subdirs-flag'.
Position of the cursor (point) and the mark during completion cycling
  is determined by `icicle-point-position-in-candidate' and
  `icicle-mark-position-in-candidate', respectively.
Highlighting of the matched part of completion candidates during
  cycling is determined by `icicle-match-highlight-minibuffer',
  `icicle-match-highlight-Completions', and
  `icicle-common-match-highlight-Completions'.

Use `\\[icicle-completion-help]' during completion for more information on completion and key
bindings in Icicle mode.

Args: PROMPT, TABLE, PREDICATE, REQUIRE-MATCH, INITIAL-INPUT, HIST:

PROMPT is a string to prompt with; normally ends in a colon and space.

TABLE is an alist whose elements' cars are strings, or an obarray.

PREDICATE limits completion to a subset of TABLE.
See `try-completion' and `all-completions' for more details on
completion, TABLE, PREDICATE.

If REQUIRE-MATCH is non-nil, you are not allowed to exit unless the
input is (or completes to) an element of TABLE or is null.  If it is
also not `t', `\\[exit-minibuffer]' doesn't exit if it effects non-null
completion.  If the input is null, `completing-read' returns an empty
string, regardless of the value of REQUIRE-MATCH.

If option `icicle-require-match-flag' is non-nil, it overrides the
value of REQUIRE-MATCH.

If INITIAL-INPUT is non-nil, insert it in the minibuffer initially.
If it is (STRING . POSITION), the initial input is STRING, but point
is placed POSITION characters into the string.

HIST, if non-nil, specifies a history list, and optionally the initial
position in the list.  It can be a symbol, which is the history list
variable to use, or it can be a cons cell (HISTVAR . HISTPOS).  In
that case, HISTVAR is the history list variable to use, and HISTPOS is
the initial position (the position in the list which INITIAL-INPUT
corresponds to).  Positions are counted starting from 1 at the
beginning of the list.

DEF, if non-nil, is the default value.

Non-nil `icicle-init-value-flag' means that when DEF is non-nil and
INITIAL-INPUT is nil or \</span>"\"<span class="quote">, DEF is inserted in the minibuffer as the
INITIAL-INPUT.  The particular non-nil value determines whether or not
the value is preselected and, if preselected, where the cursor is left
\(at the beginning or end of the value).

If INHERIT-INPUT-METHOD is non-nil, the minibuffer inherits the
current input method and the setting of `enable-multibyte-characters'.

Completion ignores case when`completion-ignore-case' is non-nil.</span>"
  (unless initial-input (setq initial-input "<span class="quote"></span>"))
  (if (consp initial-input)
      (setq icicle-initial-value (car initial-input))
    (setq initial-input        (format "<span class="quote">%s</span>" initial-input) <span class="linecomment">; Convert symbol to string</span>
          icicle-initial-value (or initial-input "<span class="quote"></span>")))
  (setq icicle-nb-of-other-cycle-candidates 0)

  <span class="linecomment">;; Maybe use DEF for INITIAL-INPUT also.</span>
  (when (and icicle-init-value-flag def (stringp initial-input) (string= "<span class="quote"></span>" initial-input))
    (setq initial-input def))

  <span class="linecomment">;; Override REQUIRE-MATCH as needed.</span>
  (setq require-match (case icicle-require-match-flag
                        ((nil) require-match)
                        (no-match-required nil)
                        (partial-match-ok t)
                        (full-match-required 'full-match-required)))
  (let ((minibuffer-completion-table table)
        result)

    <span class="linecomment">;; Extension: candidate is a list of strings.  Used for multi-completion.</span>
    (when (and (consp table) (consp (car table)) (consp (caar table)))
      (setq minibuffer-completion-table
            (setq table
                  (mapcar
                   (lambda (entry)
                     (cons (concat (mapconcat #'identity (car entry) icicle-list-join-string)
                                   icicle-list-join-string)
                           (cdr entry)))
                   table))))

    <span class="linecomment">;; Append suffix if prompt is not too long.</span>
    <span class="linecomment">;; Use face on suffix if (boundp 'minibuffer-prompt-properties).</span>
    (cond ((not icicle-mode)
           (setq icicle-prompt prompt)  <span class="linecomment">; No room to add suffix.</span>
           (setq result (old-completing-read icicle-prompt table predicate require-match
                                             initial-input hist def inherit-input-method)))
          ((or (null icicle-reminder-prompt-flag)
               (and (wholenump icicle-reminder-prompt-flag) (zerop icicle-reminder-prompt-flag))
               (&gt; (length icicle-initial-value)
                  (- (window-width (minibuffer-window)) (length prompt))))
           (setq icicle-prompt prompt)  <span class="linecomment">; No room to add suffix.</span>
           (setq result (catch 'icicle-read-top
                          (old-completing-read icicle-prompt table predicate require-match
                                               initial-input hist def inherit-input-method))))
          (t                            <span class="linecomment">; Append suffix to prompt.</span>
           (setq icicle-prompt
                 (if (fboundp 'propertize)
                     (concat (propertize prompt 'face 'minibuffer-prompt)
                             (propertize icicle-prompt-suffix 'face 'icicle-prompt-suffix)
                             "<span class="quote">  </span>")
                   (concat prompt icicle-prompt-suffix "<span class="quote">  </span>")))
           (let ((minibuffer-prompt-properties
                  (and (boundp 'minibuffer-prompt-properties) <span class="linecomment">; Emacs 21+ only</span>
                       (icicle-remove-property 'face minibuffer-prompt-properties))))
             (setq result
                   (catch 'icicle-read-top
                     (old-completing-read icicle-prompt table predicate require-match
                                          initial-input hist def inherit-input-method))))))
    <span class="linecomment">;; HACK.  Without this, when REQUIRE-MATCH is non-nil, *Completions* window</span>
    <span class="linecomment">;; does not disappear.</span>
    (when require-match (icicle-delete-windows-on "<span class="quote">*Completions*</span>"))
    result))



<span class="linecomment">;;; REPLACE ORIGINAL `read-file-name' (built-in function),</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Appends `icicle-prompt-suffix' if resulting prompt is not too long.</span>
<span class="linecomment">;;; Removes *Completions* window.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-read-file-name)
(fset 'old-read-file-name (symbol-function 'read-file-name)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-read-file-name (prompt &optional dir default-filename
                              require-match initial-input predicate)
  "<span class="quote">Read file name, prompting with prompt and completing in directory DIR.
Value is not expanded---you must call `expand-file-name' yourself.
Default the name to DEFAULT-FILENAME if user exits the minibuffer with
the same non-empty string that was inserted by this function.
 (If DEFAULT-FILENAME is omitted, the visited file name is used,
  but if INITIAL-INPUT is specified, that combined with DIR is used.)
If the user exits with an empty minibuffer, this function returns
an empty string.  (This can only happen if the user erased the
pre-inserted contents or if `insert-default-directory' is nil.)
Fourth arg REQUIRE-MATCH non-nil means require existing file's name.
 Non-nil and non-t means also require confirmation after completion.
Fifth arg INITIAL-INPUT specifies text to start with.
If optional sixth arg PREDICATE is non-nil, possible completions and
 the resulting file name must satisfy `(funcall predicate NAME)'.
 This argument is only available starting with Emacs 21.
DIR should be an absolute directory name.  It defaults to the value of
`default-directory'.

Non-nil `icicle-init-value-flag' means that when DEFAULT-FILENAME is
non-nil and INITIAL-INPUT is nil or \</span>"\"<span class="quote">, DEFAULT-FILENAME is inserted
in the minibuffer as the INITIAL-INPUT.  The particular non-nil value
determines whether or not the value is preselected and, if
preselected, where the cursor is left \(at the beginning or end of the
value).

If option `icicle-require-match-flag' is non-nil, it overrides the
value of REQUIRE-MATCH.

If this command was invoked with the mouse, use a file dialog box if
`use-dialog-box' is non-nil, and the window system or X toolkit in use
provides a file dialog box.

Removes *Completions* window when done.

See also `read-file-name-completion-ignore-case'
and `read-file-name-function'.</span>"
  (setq icicle-initial-value                  (or initial-input "<span class="quote"></span>")
        icicle-nb-of-other-cycle-candidates   0)
  (icicle-fix-default-directory)        <span class="linecomment">; Make sure there are no backslashes in it.</span>

  <span class="linecomment">;; Maybe use DEFAULT-FILENAME for INITIAL-INPUT also, after removing the directory part.</span>
  <span class="linecomment">;; Note that if DEFAULT-FILENAME is null, then we let INITIAL-INPUT remain null too.</span>
  (when (and icicle-init-value-flag default-filename (string= "<span class="quote"></span>" icicle-initial-value))
    (setq initial-input (file-name-nondirectory default-filename)))

  <span class="linecomment">;; Override REQUIRE-MATCH as needed.</span>
  (setq require-match (case icicle-require-match-flag
                        ((nil) require-match)
                        (no-match-required nil)
                        (partial-match-ok t)
                        (full-match-required 'full-match-required)))
  (let (result)
    <span class="linecomment">;; Append suffix if prompt is not too long.</span>
    <span class="linecomment">;; Use face on suffix if (boundp 'minibuffer-prompt-properties).</span>
    (cond ((not icicle-mode)
           (setq icicle-prompt prompt)  <span class="linecomment">; No room to add suffix.</span>
           (condition-case nil          <span class="linecomment">; If Emacs 22+, use predicate arg.</span>
               (setq result (old-read-file-name icicle-prompt dir default-filename
                                                require-match initial-input predicate))
             (wrong-number-of-arguments
              (setq result (old-read-file-name icicle-prompt dir default-filename
                                               require-match initial-input)))))
          ((or (null icicle-reminder-prompt-flag)
               (and (wholenump icicle-reminder-prompt-flag) (zerop icicle-reminder-prompt-flag))
               (&gt; (length initial-input)
                  (- (window-width (minibuffer-window)) (length prompt))))
           (setq icicle-prompt prompt)  <span class="linecomment">; No room to add suffix.</span>
           (condition-case nil          <span class="linecomment">; If Emacs 22+, use predicate arg.</span>
               (setq result
                     (catch 'icicle-read-top
                       (old-read-file-name icicle-prompt dir default-filename
                                           require-match initial-input predicate)))
             (wrong-number-of-arguments
              (setq result
                    (catch 'icicle-read-top
                      (old-read-file-name icicle-prompt dir default-filename
                                          require-match initial-input))))))
          (t                            <span class="linecomment">; Append suffix to prompt.</span>
           (setq icicle-prompt
                 (if (fboundp 'propertize)
                     (concat (propertize prompt 'face 'minibuffer-prompt)
                             (propertize icicle-prompt-suffix 'face 'icicle-prompt-suffix)
                             "<span class="quote">  </span>")
                   (concat prompt icicle-prompt-suffix "<span class="quote">  </span>")))
           (let ((minibuffer-prompt-properties <span class="linecomment">; If Emacs 22+, use pred and suffix face.</span>
                  (and (boundp 'minibuffer-prompt-properties)
                       (icicle-remove-property 'face minibuffer-prompt-properties))))
             (condition-case nil
                 (setq result
                       (catch 'icicle-read-top
                         (old-read-file-name icicle-prompt dir default-filename
                                             require-match initial-input predicate)))
               (wrong-number-of-arguments
                (setq result
                      (catch 'icicle-read-top
                        (old-read-file-name icicle-prompt dir default-filename
                                            require-match initial-input))))))))
    <span class="linecomment">;; HACK.  Without this, when REQUIRE-MATCH is non-nil, *Completions* window</span>
    <span class="linecomment">;; does not disappear.</span>
    (when require-match (icicle-delete-windows-on "<span class="quote">*Completions*</span>"))
    result))

(defun icicle-fix-default-directory ()
  "<span class="quote">Convert backslashes in `default-directory' to slashes.</span>"
<span class="linecomment">;; This is a hack.  If you do `C-x 4 f' from a standalone minibuffer</span>
<span class="linecomment">;; frame, `default-directory' on MS Windows has this form:</span>
<span class="linecomment">;; `C:\some-dir/'.  There is a backslash character in the string.  This</span>
<span class="linecomment">;; is not a problem for standard Emacs, but it is a problem for Icicles,</span>
<span class="linecomment">;; because we interpret backslashes using regexp syntax - they are not</span>
<span class="linecomment">;; file separators for Icicles.  So, we call `substitute-in-file-name' to</span>
<span class="linecomment">;; change all backslashes in `default-directory' to slashes.  This</span>
<span class="linecomment">;; shouldn't hurt, because `default-directory' is an absolute directory</span>
<span class="linecomment">;; name - it doesn't contain environment variables.  For example, we</span>
<span class="linecomment">;; convert `C:\some-dir/' to `c:/some-directory/'."</span>
  (setq default-directory (substitute-in-file-name default-directory)))


(defun icicle-remove-property (prop plist)
  "<span class="quote">Remove propery PROP from property-list PLIST, non-destructively.</span>"
  (let ((cpy plist)
        (result nil))
    (while cpy
      (unless (eq prop (car cpy)) (setq result `(,(cadr cpy) ,(car cpy) ,@result)))
      (setq cpy (cddr cpy)))
    (nreverse result)))



<span class="linecomment">;;; REPLACE ORIGINAL `read-from-minibuffer' (built-in function),</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Respect `icicle-init-value-flag'.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-read-from-minibuffer)
(fset 'old-read-from-minibuffer (symbol-function 'read-from-minibuffer)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-read-from-minibuffer (prompt &optional initial-contents keymap read hist
                                    default-value inherit-input-method keep-all)
  "<span class="quote">Read a string from the minibuffer, prompting with string PROMPT.
The optional second arg INITIAL-CONTENTS is an alternative to
  DEFAULT-VALUE.  Vanilla Emacs considers it to be obsolete, but
  Icicles does not.  It is discussed in more detail below.
Third arg KEYMAP is a keymap to use while reading;
  if omitted or nil, the default is `minibuffer-local-map'.
If fourth arg READ is non-nil, then interpret the result as a Lisp object
  and return that object:
  in other words, do `(car (read-from-string INPUT-STRING))'
Fifth arg HIST, if non-nil, specifies a history list and optionally
  the initial position in the list.  It can be a symbol, which is the
  history list variable to use, or it can be a cons cell
  (HISTVAR . HISTPOS).  In that case, HISTVAR is the history list variable
  to use, and HISTPOS is the initial position for use by the minibuffer
  history commands.  For consistency, you should also specify that
  element of the history as the value of INITIAL-CONTENTS.  Positions
  are counted starting from 1 at the beginning of the list.
Sixth arg DEFAULT-VALUE is the default value.  If non-nil, it is available
  for history commands; but, unless READ is non-nil, `read-from-minibuffer'
  does NOT return DEFAULT-VALUE if the user enters empty input!  It returns
  the empty string.
Seventh arg INHERIT-INPUT-METHOD, if non-nil, means the minibuffer inherits
 the current input method and the setting of `enable-multibyte-characters'.
Eighth arg KEEP-ALL, if non-nil, says to put all inputs in the history list,
 even empty or duplicate inputs.  This is available starting with Emacs 22.
If the variable `minibuffer-allow-text-properties' is non-nil,
 then the string which is returned includes whatever text properties
 were present in the minibuffer.  Otherwise the value has no text properties.

Non-nil `icicle-init-value-flag' means that when DEFAULT-VALUE is
non-nil and INITIAL-CONTENTS is nil or \</span>"\"<span class="quote">, DEFAULT-VALUE is inserted
in the minibuffer as the INITIAL-CONTENTS.  The particular non-nil
value determines whether or not the value is preselected and, if
preselected, where the cursor is left \(at the beginning or end of the
value).

The remainder of this documentation string describes the
INITIAL-CONTENTS argument in more detail.  If non-nil,
INITIAL-CONTENTS is a string to be inserted into the minibuffer before
reading input.  Normally, point is put at the end of that string.
However, if INITIAL-CONTENTS is (STRING . POSITION), the initial input
is STRING, but point is placed at _one-indexed_ position POSITION in
the minibuffer.  Any integer value less than or equal to one puts
point at the beginning of the string.  *Note* that this behavior
differs from the way such arguments are used in `completing-read' and
some related functions, which use zero-indexing for POSITION.</span>"
  (unless initial-contents (setq initial-contents "<span class="quote"></span>"))
  <span class="linecomment">;; Maybe use DEFAULT-VALUE for INITIAL-CONTENTS also.</span>
  (when (and icicle-init-value-flag default-value (stringp initial-contents)
             (string= "<span class="quote"></span>" initial-contents))
    (setq initial-contents default-value))
  (old-read-from-minibuffer prompt initial-contents keymap read hist default-value
                            inherit-input-method))



<span class="linecomment">;;; REPLACE ORIGINAL `read-string' (built-in function),</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Respect `icicle-init-value-flag'.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-read-string)
(fset 'old-read-string (symbol-function 'read-string)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-read-string (prompt &optional initial-input history
                           default-value inherit-input-method)
  "<span class="quote">Read a string from the minibuffer, prompting with string PROMPT.
If non-nil, second arg INITIAL-INPUT is a string to insert before reading.
  Vanilla Emacs considers it to be obsolete, but Icicles does not.  It
  behaves as in `read-from-minibuffer'.  See the documentation string
  of `read-from-minibuffer' for details.
The third arg HISTORY, if non-nil, specifies a history list
  and optionally the initial position in the list.
  See `read-from-minibuffer' for details of HISTORY argument.
Fourth arg DEFAULT-VALUE is the default value.  If non-nil, it is used
 for history commands, and as the value to return if the user enters
 the empty string.
Fifth arg INHERIT-INPUT-METHOD, if non-nil, means the minibuffer inherits
 the current input method and the setting of enable-multibyte-characters.</span>"
  (let ((value (read-from-minibuffer prompt initial-input nil nil
                                     history default-value inherit-input-method)))
    (if (and default-value (equal value "<span class="quote"></span>")) default-value value)))




<span class="linecomment">;;; Icicle functions - completion display (not cycling).....</span>

(defun icicle-display-candidates-in-Completions (&optional reverse-p no-display-p)
  "<span class="quote">Refresh the current set of completion candidates in *Completions*.
REVERSE-P non-nil means display the candidates in reverse order.
NO-DISPLAY-P means do not display the candidates; just recompute them.</span>"
  <span class="linecomment">;; Pred is special if `minibuffer-completion-table' is a function.</span>
  (when (and (not (functionp minibuffer-completion-table))
             (functionp minibuffer-completion-predicate))
    (setq icicle-completion-candidates
          (icicle-delete-if-not
           (lambda (cand)
             (funcall minibuffer-completion-predicate
                      (if (arrayp minibuffer-completion-table) (intern cand) (list cand))))
           icicle-completion-candidates)))
  (case icicle-incremental-completion-flag
    ((t always) (setq icicle-incremental-completion-p 'always))
    ((nil) (setq icicle-incremental-completion-p nil)))
  (unless no-display-p
    (when (&gt; (length icicle-completion-candidates) icicle-incremental-completion-threshold)
      (message "<span class="quote">Displaying completion candidates...</span>"))
    (with-output-to-temp-buffer "<span class="quote">*Completions*</span>"
      <span class="linecomment">;; `condition-case' shouldn't be needed, but it prevents an "End of buffer"</span>
      <span class="linecomment">;; message from `display-completion-list' on Emacs 22.</span>
      (condition-case nil
          (display-completion-list (if reverse-p
                                       (reverse icicle-completion-candidates)
                                     icicle-completion-candidates))
        (error nil)))
    (save-excursion
      (save-window-excursion
        (set-buffer (get-buffer "<span class="quote">*Completions*</span>"))
        (let ((buffer-read-only nil)
              (eob (point-max))
              (case-fold-search completion-ignore-case))
          (goto-char (point-min))
          (forward-line 2)
          (while (not (eobp))
            (let ((beg (goto-char (next-single-property-change (point) 'mouse-face nil eob)))
                  (end (goto-char (next-single-property-change (point) 'mouse-face nil eob))))
              (goto-char beg)

              <span class="linecomment">;; Highlight whole candidate if it has been used previously.</span>
              (when (and (symbolp minibuffer-history-variable)
                         (consp (symbol-value minibuffer-history-variable))
                         (member (icicle-current-completion-in-Completions)
                                 (symbol-value minibuffer-history-variable)))
                (put-text-property
                 (point) (next-single-property-change (point) 'mouse-face nil end)
                 'face 'icicle-historical-candidate))

              <span class="linecomment">;; Highlight, inside the candidate, the longest common match.</span>
              (when (and icicle-expand-input-to-common-match-flag
                         (not (string= "<span class="quote"></span>" icicle-current-input)))
                (save-excursion
                  (save-restriction
                    (narrow-to-region beg end) <span class="linecomment">; Search within the completion candidate.</span>
                    (when (re-search-forward
                           (regexp-quote (if (icicle-file-name-input-p)
                                             (icicle-file-name-nondirectory icicle-current-input)
                                           icicle-current-input))
                           nil t)
                      (put-text-property (match-beginning 0) (point)
                                         'face 'icicle-common-match-highlight-Completions)))))
              <span class="linecomment">;; Highlight, inside the candidate, what the input expression matches.</span>
              (unless (string= "<span class="quote"></span>" icicle-current-regexp-input)
                (save-excursion
                  (save-restriction
                    (narrow-to-region beg end) <span class="linecomment">; Search within the completion candidate.</span>
                    (when (re-search-forward (if (icicle-file-name-input-p)
                                                 (icicle-file-name-nondirectory
                                                  icicle-current-regexp-input)
                                               icicle-current-regexp-input)
                                             nil t)
                      (put-text-property (match-beginning 0) (point)
                                         'face 'icicle-match-highlight-Completions)))))
              (goto-char end))))
        (set-buffer-modified-p nil)
        (setq buffer-read-only t)))
    (message nil)))                     <span class="linecomment">; Clear out any "Looking for..."</span>

(defun icicle-place-cursor (input)
  "<span class="quote">Position point and mark with respect to the minibuffer candidate.
Positions are `icicle-point-position-in-candidate' and
`icicle-mark-position-in-candidate', respectively.
INPUT is the current user input, that is, the completion root.</span>"
  (let ((case-fold-search completion-ignore-case)
        input-start-position)
    (goto-char (icicle-minibuffer-prompt-end))
    (setq input-start-position (point))
    (when (and (icicle-file-name-input-p) insert-default-directory)
      (search-forward (icicle-file-name-directory-w-default input) nil t)
      (setq input-start-position (point))) <span class="linecomment">; Skip directory.</span>
    <span class="linecomment">;; Locate completion root within current completion candidate.</span>
    (when (or (memq icicle-point-position-in-candidate '(root-start root-end))
              (memq icicle-mark-position-in-candidate  '(root-start root-end)))
      (save-excursion
        (save-restriction
          (narrow-to-region (point) (point-max)) <span class="linecomment">; Search within the completion candidate.</span>
          (re-search-forward (if (icicle-file-name-input-p)
                                 (icicle-file-name-nondirectory input)
                               input)
                             nil t))))
    <span class="linecomment">;; Position point.</span>
    (case icicle-point-position-in-candidate
      (input-start (goto-char input-start-position))
      (input-end (goto-char (point-max)))
      (root-start (goto-char (match-beginning 0)))
      (root-end (goto-char (match-end 0))))
    <span class="linecomment">;; Position mark.</span>
    (unless (eq icicle-point-position-in-candidate icicle-mark-position-in-candidate)
      (push-mark (case icicle-mark-position-in-candidate
                   (input-start input-start-position)
                   (input-end (point-max))
                   (root-start (match-beginning 0))
                   (root-end (match-end 0)))
                 'nomsg
                 'activate-mark))))

(defun icicle-highlight-initial-whitespace (input)
  "<span class="quote">Highlight any initial whitespace in your input (it might be a typo).
Only if `icicle-highlight-input-initial-whitespace-flag' is non-nil.
INPUT is the current user input, that is, the completion root.
This must be called in the minibuffer.</span>"
  (when (and icicle-highlight-input-initial-whitespace-flag (not (string= "<span class="quote"></span>" input)))
    (let ((case-fold-search completion-ignore-case)
          input-start-position)
      (save-excursion
        (goto-char (icicle-minibuffer-prompt-end))
        (setq input-start-position (point))
        (when (and (icicle-file-name-input-p) insert-default-directory
                   (search-forward (icicle-file-name-directory-w-default input) nil t))
          (setq input-start-position (point))) <span class="linecomment">; Skip directory.</span>
        (save-excursion
          (save-restriction
            (narrow-to-region (point) (point-max)) <span class="linecomment">; Search within completion candidate.</span>
            (while (and (not (eobp)) (looking-at "<span class="quote">\\(\\s-\\|\n\\)+</span>"))
              (put-text-property (point) (1+ (point))
                                 'face 'icicle-whitespace-highlight)
              (forward-char 1))
            <span class="linecomment">;; Remove any previous whitespace highlighting that is no longer part of prefix.</span>
            (while (not (eobp))
              (put-text-property (point) (1+ (point)) 'face nil)
              (forward-char 1))))))))

(defun icicle-minibuffer-prompt-end ()
  "<span class="quote">Version of `minibuffer-prompt-end' that works for Emacs 20 and later.</span>"
  (if (fboundp 'minibuffer-prompt-end) (minibuffer-prompt-end) (point-min)))




<span class="linecomment">;;; Icicles functions - Icicle mode..........................</span>

(defun icicle-rebind-completion-maps (turn-on-p)
  "<span class="quote">Rebind minibuffer completion maps to be able to cycle completions.
Also, update the bindings in the minibuffer-completion help variables.

This is called by `icicle-mode'.  When in Icicle mode, all keys that
are globally bound to `next-line' are rebound in the minibuffer to
`icicle-next-prefix-candidate', for minibuffer completion purposes.
Similarly for other keys.</span>"
  (cond
    (turn-on-p                          <span class="linecomment">; TURN IT ON ********************************</span>

     <span class="linecomment">;; `minibuffer-local-map': default minibuffer map.</span>
     (if (&gt; emacs-major-version 21)
         (define-key minibuffer-local-map [menu-bar minibuf quit]
           (list 'menu-item "<span class="quote">Quit</span>" 'icicle-abort-minibuffer-input
                 :help "<span class="quote">Abort input and exit minibuffer</span>"))
       (define-key minibuffer-local-map [menu-bar minibuf quit]
         (cons "<span class="quote">Quit</span>" 'icicle-abort-minibuffer-input)))
     (define-key minibuffer-local-map [(control ?g)]  'icicle-abort-minibuffer-input)
     (define-key minibuffer-local-map [M-S-backspace] 'icicle-erase-minibuffer)
     (define-key minibuffer-local-map [M-S-delete]    'icicle-erase-minibuffer)
     (define-key minibuffer-local-map [(meta ?.)]     'icicle-insert-string-at-point)
     (define-key minibuffer-local-map [(control ?=)]  'icicle-insert-string-from-variable)
     <span class="linecomment">;; Replaces `kill-sentence':</span>
     (define-key minibuffer-local-map [(meta ?k)]     'icicle-erase-minibuffer-or-history-element)

     <span class="linecomment">;; `minibuffer-local-ns-map': default minibuffer map when spaces are not allowed.</span>
     (define-key minibuffer-local-ns-map [(control ?g)]  'icicle-abort-minibuffer-input)
     (define-key minibuffer-local-ns-map [M-S-backspace] 'icicle-erase-minibuffer)
     (define-key minibuffer-local-ns-map [M-S-delete]    'icicle-erase-minibuffer)
     (define-key minibuffer-local-ns-map [(meta ?.)]     'icicle-insert-string-at-point)
     (define-key minibuffer-local-ns-map [(control ?=)]  'icicle-insert-string-from-variable)
     <span class="linecomment">;; Replaces `kill-sentence':</span>
     (define-key minibuffer-local-ns-map [(meta ?k)]
       'icicle-erase-minibuffer-or-history-element)

     <span class="linecomment">;; `minibuffer-local-isearch-map': minibuffer map for editing isearch strings.</span>
     (define-key minibuffer-local-isearch-map [(control ?g)]  'icicle-abort-minibuffer-input)
     (define-key minibuffer-local-isearch-map [M-S-backspace] 'icicle-erase-minibuffer)
     (define-key minibuffer-local-isearch-map [M-S-delete]    'icicle-erase-minibuffer)
     (define-key minibuffer-local-isearch-map [(meta ?.)]     'icicle-insert-string-at-point)
     (define-key minibuffer-local-isearch-map [(control ?=)]  'icicle-insert-string-from-variable)
     <span class="linecomment">;; Replaces `kill-sentence':</span>
     (define-key minibuffer-local-isearch-map [(meta ?k)]
       'icicle-erase-minibuffer-or-history-element)

     <span class="linecomment">;; `minibuffer-local-completion-map': completion map.</span>
     (icicle-bind-completion-keys minibuffer-local-completion-map)

     <span class="linecomment">;; `minibuffer-local-filename-completion-map': file-name completion map (Emacs 22).</span>
     (when (boundp 'minibuffer-local-filename-completion-map)
       (icicle-bind-completion-keys minibuffer-local-filename-completion-map))

     <span class="linecomment">;; `minibuffer-local-must-match-map': must-match map.</span>
     (icicle-bind-completion-keys minibuffer-local-must-match-map)
     (define-key minibuffer-local-must-match-map [S-return] 'icicle-apropos-complete-and-exit)

     <span class="linecomment">;; `completion-list-mode-map': map for *Completions* buffer.</span>
     <span class="linecomment">;; Abort on `C-g' or `q'.  Switch to minibuffer on [insert].  Do not allow normal input.</span>
     (define-key completion-list-mode-map [(control ?g)]   'icicle-abort-minibuffer-input)
     (define-key completion-list-mode-map "<span class="quote">q</span>"              'icicle-abort-minibuffer-input)
     (define-key completion-list-mode-map [insert]         'icicle-switch-to-minibuffer)
     (define-key completion-list-mode-map [down]           'icicle-next-line)
     (define-key completion-list-mode-map [up]             'icicle-previous-line)
     (define-key completion-list-mode-map [S-iso-lefttab]  'icicle-move-to-previous-completion)
     (define-key completion-list-mode-map [S-tab]          'icicle-move-to-previous-completion)
     (define-key completion-list-mode-map [left]           'icicle-move-to-previous-completion)
     (define-key completion-list-mode-map [(control ?i)]   'icicle-move-to-next-completion)
     (define-key completion-list-mode-map [tab]            'icicle-move-to-next-completion)
     (define-key completion-list-mode-map [right]          'icicle-move-to-next-completion)
     (define-key completion-list-mode-map [C-down-mouse-2] 'icicle-mouse-candidate-action)
     (define-key completion-list-mode-map [C-mouse-2]      nil)
     <span class="linecomment">;; (suppress-keymap completion-list-mode-map) ; Inhibit character self-insertion.</span>
     )


    (t                                  <span class="linecomment">; TURN IT OFF *******************************</span>

     <span class="linecomment">;; `minibuffer-local-map': default minibuffer map.</span>
     (if (&gt; emacs-major-version 21)
         (define-key minibuffer-local-map [menu-bar minibuf quit]
           (list 'menu-item "<span class="quote">Quit</span>" 'keyboard-escape-quit
                 :help "<span class="quote">Abort input and exit minibuffer</span>"))
       (define-key minibuffer-local-map [menu-bar minibuf quit]
         (cons "<span class="quote">Quit</span>" 'keyboard-escape-quit)))
     (define-key minibuffer-local-map [(control ?g)]  'abort-recursive-edit)
     (define-key minibuffer-local-map [M-S-backspace] nil)
     (define-key minibuffer-local-map [M-S-delete]    nil)
     (define-key minibuffer-local-map [(meta ?.)]     nil)
     (define-key minibuffer-local-map [(control ?=)]  nil)
     (define-key minibuffer-local-map [(meta ?k)]     nil)

     <span class="linecomment">;; `minibuffer-local-ns-map': default minibuffer map when spaces are not allowed.</span>
     (define-key minibuffer-local-ns-map [(control ?g)]  'abort-recursive-edit)
     (define-key minibuffer-local-ns-map [M-S-backspace] nil)
     (define-key minibuffer-local-ns-map [M-S-delete]    nil)
     (define-key minibuffer-local-ns-map [(meta ?.)]     nil)
     (define-key minibuffer-local-ns-map [(control ?=)]  nil)
     (define-key minibuffer-local-ns-map [(meta ?k)]     nil)


     <span class="linecomment">;; `minibuffer-local-isearch-map': minibuffer map for editing isearch strings.</span>
     (define-key minibuffer-local-isearch-map [(control ?g)]  'abort-recursive-edit)
     (define-key minibuffer-local-isearch-map [M-S-backspace] nil)
     (define-key minibuffer-local-isearch-map [M-S-delete]    nil)
     (define-key minibuffer-local-isearch-map [(meta ?.)]     nil)
     (define-key minibuffer-local-isearch-map [(control ?=)]  nil)
     (define-key minibuffer-local-isearch-map [(meta ?k)]     nil)

     <span class="linecomment">;; `minibuffer-local-completion-map': completion map.</span>
     (icicle-restore-completion-keys minibuffer-local-completion-map)

     <span class="linecomment">;; `minibuffer-local-filename-completion-map': file-name completion map.</span>
     (when (boundp 'minibuffer-local-filename-completion-map)
       (icicle-restore-completion-keys minibuffer-local-filename-completion-map))

     <span class="linecomment">;; `minibuffer-local-must-match-map': must-match map.</span>
     (icicle-restore-completion-keys minibuffer-local-must-match-map)
     (define-key minibuffer-local-must-match-map [S-return] nil)

     <span class="linecomment">;; `completion-list-mode-map': map for *Completions* buffer.</span>
     (define-key completion-list-mode-map [(control ?g)]    nil)
     (define-key completion-list-mode-map "<span class="quote">q</span>"               nil)
     (define-key completion-list-mode-map [insert]          nil)
     (define-key completion-list-mode-map [down]            nil)
     (define-key completion-list-mode-map [up]              nil)
     (define-key completion-list-mode-map [left]            'previous-completion)
     (define-key completion-list-mode-map [right]           'next-completion)
     (define-key completion-list-mode-map [S-iso-lefttab]   nil)
     (define-key completion-list-mode-map [S-tab]           nil)
     (define-key completion-list-mode-map [tab]             nil)
     (define-key completion-list-mode-map [(control ?i)]    nil)
     (define-key completion-list-mode-map [C-mouse-2]       nil)
     (define-key completion-list-mode-map [C-down-mouse-2]  (if (boundp 'facemenu-mouse-menu)
                                                                facemenu-mouse-menu
                                                              facemenu-menu))))

  <span class="linecomment">;; Update the bindings within the help string.</span>
  (setq icicle-completion-help-string
        (substitute-command-keys
         "<span class="quote">\\&lt;minibuffer-local-completion-map&gt;                     \
Icicles Minibuffer Completion
                     -----------------------------

Minibuffer input can be completed in several ways.
These are the main Icicles actions and their minibuffer key bindings:

 * Display this help.                        \\[icicle-completion-help]

 * Manipulate your input.  You can modify it, before committing it.
     Erase (clear) input                     M-S-backspace
     Yank text at cursor into minibuffer     \\[icicle-insert-string-at-point]
     Retrieve your last real input           \\[icicle-retrieve-last-input] (repeat)
     Insert text (regexp) from a variable    \\[icicle-insert-string-from-variable]
     Abandon input (from minibuffer)         \\[icicle-abort-minibuffer-input]
     Abandon input (from anywhere)           \\[abort-recursive-edit]
     Send input to Emacs                     RET
       Complete partial input, then send     \\&lt;minibuffer-local-must-match-map&gt;\
\\[icicle-apropos-complete-and-exit]\\&lt;minibuffer-local-completion-map&gt;

 * Complete the current input in the minibuffer.
     Apropos (regexp) completion             \\[icicle-apropos-complete]
       Without displaying candidates         \\[icicle-prefix-complete-no-display]
       Match another regexp (chaining)       \\[icicle-narrow-candidates]
     Prefix completion
       As much as possible                   \\[icicle-prefix-complete]
         Without displaying candidates       \\[icicle-prefix-complete-no-display]
       A word at a time                      \\[icicle-prefix-word-complete]
     Complete and send (when match required) \\&lt;minibuffer-local-must-match-map&gt;\
\\[icicle-apropos-complete-and-exit]\\&lt;minibuffer-local-completion-map&gt;
     Complete search string with search ring \\[icicle-apropos-complete]

 * Display/navigate completions for current input (in *Completions*).
     Show completion candidates
       Prefix completion                     \\[icicle-prefix-complete] (repeat)
       Apropos completion                    \\[icicle-apropos-complete]
     Move between minibuffer and list        \\&lt;completion-list-mode-map&gt;\
\\[icicle-switch-to-minibuffer]
     Cycle among completion candidates       right, left, \
\\[icicle-move-to-next-completion], \\[icicle-move-to-previous-completion]
       Within a *Completions* column         down, up
     Choose a completion candidate           \\[choose-completion], \
\\[mouse-choose-completion]\\&lt;minibuffer-local-completion-map&gt;

 * Cycle among input candidates.
     Prefix-completion candidates            down, up
     Apropos-completion candidates           next, prior
     Minibuffer history items                \\[next-history-element], \
\\[previous-history-element]

 * Choose a previous input from the minibuffer history.
     Apropos-complete against history items  \\[icicle-history], \
\\[icicle-keep-only-past-inputs]
     Restrict candidates to history items    \\[icicle-keep-only-past-inputs]
     Cycle among minibuffer history items    \\[next-history-element], \
\\[previous-history-element]
     Search among minibuffer history items   \
\\[next-matching-history-element], \\[previous-matching-history-element]

 * Toggle user options on the fly.
     Ignoring certain file extensions        \\[icicle-toggle-ignored-extensions]
     Sorting completion candidates           \\[icicle-toggle-sorting]
     Incremental completion                  \\[icicle-toggle-incremental-completion]
     Ignoring space prefix                   \\[icicle-toggle-ignored-space-prefix]
     Escaping regexp special chars           \\[icicle-toggle-regexp-quote]

 * Multi-commands: act on candidates. Show candidate help, by default.
     Current candidate                       C-RET, C-o, C-mouse-2
     Next, previous prefix-match candidate   C-down, C-up
     Next, previous apropos-match candidate  C-next, C-prior
     All candidates at once                  \\[icicle-all-candidates-action]
     Show help on current candidate          \\[icicle-help-on-candidate]

 * Perform set operations on candidate sets.
     Set complement                          \\[icicle-candidate-set-complement]
     Set difference                          \\[icicle-candidate-set-difference]
     Set union                               \\[icicle-candidate-set-union]
     Set intersection                        \\[icicle-candidate-set-intersection]
     Set intersection using another regexp   \\[icicle-narrow-candidates]
     Save current set                        \\[icicle-candidate-set-save]
     Retrieve saved set                      \\[icicle-candidate-set-retrieve]
     Save current set to cache file          \\[icicle-candidate-set-save-to-cache-file]
     Retrieve saved set from cache file      \\[icicle-candidate-set-retrieve-from-cache-file]
     Save current set to variable            \\[icicle-candidate-set-save-to-variable]
     Retrieve saved set from variable        \\[icicle-candidate-set-retrieve-from-variable]
     Swap current and saved sets             \\[icicle-candidate-set-swap]
     Define current set by evalling sexpr    \\[icicle-candidate-set-define]
     Restrict candidates to history items    \\[icicle-keep-only-past-inputs]

Remember: You can always input any character that is bound to a
          command (e.g. \\[icicle-prefix-complete]) \
by preceding it with \\&lt;global-map&gt;\\[quoted-insert].

----------------------------------------------------------------------

Customize Icicles: `M-x icicle-customize-icicles-group'.
Summary of customizable options and faces (alphabetical order):

 User options controlling minibuffer completion and cycling.

 * `completion-ignore-case', `read-file-name-completion-ignore-case'
                                          - Case sensitivity?
 * `icicle-buffer-*'                      - `icicle-buffer' options
 * `icicle-change-region-background-flag' - Change region color?
 * `icicle-color-themes'                  - For `icicle-color-theme'
 * `icicle-ignore-space-prefix-flag'      - Ignore space at start?
 * `icicle-Completions-frame-at-right-flag'- *Completions* at right?
 * `icicle-cycle-into-subdirs-flag'       - Explore subdirectories?
 * `icicle-default-thing-insertion'       - Control behavior of \
\\&lt;minibuffer-local-completion-map&gt;\\[icicle-insert-string-at-point]
 * `icicle-incremental-completion-flag'   - *Completions* icompletion?
 * `icicle-init-value-flag'               - Use default as init value?
 * `icicle-list-join-string'              - Multi-completion join
 * `icicle-mark-position-in-candidate'    - Mark position in cycling
 * `icicle-minibuffer-setup-hook'         - Functions run after setup
 * `icicle-point-position-in-candidate'   - Cursor position in cycling
 * `icicle-redefine-standard-commands-flag'- Redefine std commands?
 * `icicle-region-background'             - Background for region
 * `icicle-reminder-prompt-flag'          - Show reminder in prompt?
 * `icicle-require-match-flag'            - Override REQUIRE-MATCH?
 * `icicle-search-ring-max', `icicle-regexp-search-ring-max'
                                          - Search-history lengths
 * `icicle-show-Completions-initially-flag'- Show *Completions* first?
 * `icicle-sort-function'                 - Sort completion candidates
 * `icicle-thing-at-point-functions'      - Functions to yank things
 * `icicle-word-completion-key'           - Keys for word completion

 Faces that highlight input in minibuffer.

 * `icicle-complete-input'               - Input when it is complete
 * `icicle-match-highlight-minibuffer'   - Matched part of input
 * `icicle-whitespace-highlight'         - Initial whitespace in input

 Faces that highlight candidates in buffer *Completions*.

 * `icicle-common-match-highlight-Completions' - Max common substring
 * `icicle-current-candidate-highlight'  - Highlight cycle candidate
 * `icicle-historical-candidate'         - Highlight candidates used
 * `icicle-match-highlight-Completions'  - Matched part of input

 Faces that highlight for command `icicle-search'.

 * `icicle-search-current-input'         - What input matches
 * `icicle-search-main-regexp-current'   - Current match of 1st regexp
 * `icicle-search-main-regexp-others'    - Other matches of 1st regexp

----------------------------------------------------------------------

Some top-level Icicles commands (alphabetical order, with exceptions).
Bind them to keys you like.  See recommended bindings in `icicles.el'.
Multi-commands are indicated by `+': act any number of times.

+ `icicle-add-buffer-candidate'        - To always-candidate buffer(s)
+ `icicle-remove-buffer-candidate'     -  From always-candidate
  `icicle-add-buffer-config'           - To `icicle-buffer-configs'
+ `icicle-remove-buffer-config'        -  From `icicle-buffer-configs'
  `icicle-apropos'                     - `apropos', but shows matches
  `icicle-apropos-command'             - Enhanced `apropos-command'
  `icicle-apropos-variable'            - Enhanced `apropos-variable'
  `icicle-apropos-zippy'               - Show matching Zippy quotes
+ `icicle-bookmark'                    - Jump to bookmark(s)
+ `icicle-buffer'(`-other-window')     - Switch to buffer(s)
+ `icicle-buffer-config'               - Pick `icicle-buffer' options
+ `icicle-buffer-list'                 - Choose a list of buffer names
+ `icicle-clear-option'                - Set binary option(s) to nil
+ `icicle-color-theme'                 - Change color theme
+ `icicle-compilation-search'          - `icicle-search' and show hits
  `icicle-complete-thesaurus-entry'    - Complete word using thesaurus
  `icicle-completion-help'             - Display this help
  `icicle-customize-icicles-group'     - Customize options and faces
+ `icicle-delete-file'                 - Delete file(s)/directory(s)
  `icicle-delete-windows-on'           - Delete all windows for buffer
+ `icicle-doc'                         - Show function/variable doc(s)
+ `icicle-execute-extended-command'    - `execute-extended-command' +
+ `icicle-find-file'(`-other-window')  - Visit file(s)/directory(s)
+ `icicle-font'                        - Change font of frame
+ `icicle-frame-bg'                    - Change background of frame
+ `icicle-frame-fg'                    - Change foreground of frame
+ `icicle-fundoc'                      - Show function description(s)
+ `icicle-imenu'                       - Navigate among Imenu entries
+ `icicle-insert-thesaurus-entry'      - Insert thesaurus entry(s)
+ `icicle-locate-file'(`-other-window') - Visit file(s) in a directory
+ `icicle-map'                         - Apply function to alist items
  `icy-mode' or `icicle-mode'          - Toggle Icicle mode
+ `icicle-occur'                       - `occur' + apropos icompletion
+ `icicle-recent-file'(`-other-window') - Open recently used file(s)
+ `icicle-reset-option-to-nil'         - Set binary option(s) to nil
  `icicle-save-string-to-variable'     - Save text for use with \
`\\[icicle-insert-string-from-variable]'
+ `icicle-search'                      - Search with regexps & cycling
  `icicle-send-bug-report'             - Send Icicles bug report
+ `icicle-set-option-to-t'             - Set binary option(s) to t
  `icicle-toggle-ignored-extensions'   - Toggle ignoring file suffixes
  `icicle-toggle-incremental-completion' - Toggle apropos icompletion
  `icicle-toggle-ignored-space-prefix' - Toggle ignoring space prefix
+ `icicle-toggle-option'               - Toggle binary user option(s)
  `icicle-toggle-sorting'              - Toggle sorting of completions
+ `icicle-vardoc'                      - Show variable description(s)

----------------------------------------------------------------------

Send an Icicles bug report: `\\[icicle-send-bug-report]'.

----------------------------------------------------------------------

These are all of the minibuffer bindings during completion:

\\{minibuffer-local-completion-map}---------------------------------------\
-------------------------------
</span>"))

  (setq icicle-prompt-suffix
        (substitute-command-keys
         "<span class="quote"> (\\&lt;minibuffer-local-completion-map&gt;\\[icicle-apropos-complete], \
\\[icicle-prefix-complete]: list, \\[icicle-completion-help]: help) </span>"))
  (when (and (interactive-p) turn-on-p)
    (message (substitute-command-keys
              "<span class="quote">Use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-completion-help]' in minibuffer for help.</span>"))))

(defsubst icicle-remap (from to map)
  "<span class="quote">Bind command TO in MAP to all keys currently bound globally to FROM.</span>"
  (substitute-key-definition from to map global-map))

(defsubst icicle-unmap (from map)
  "<span class="quote">In MAP, unbind any keys that are globally bound to FROM.</span>"
  (substitute-key-definition from nil map global-map))

(defun icicle-bind-completion-keys (map)
  "<span class="quote">Bind keys for minibuffer completion map MAP.
MAP is `minibuffer-local-completion-map',
`minibuffer-local-filename-completion-map', or
`minibuffer-local-must-match-map'.</span>"

  <span class="linecomment">;; Menu-bar Minibuf menu.</span>
  (define-key map [menu-bar minibuf ?\?] nil)
  (define-key map [menu-bar minibuf space] nil)
  (define-key map [menu-bar minibuf tab] nil)
  (define-key map [menu-bar minibuf separator-last] '("<span class="quote">--</span>"))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf action-all]
        (list 'menu-item "<span class="quote">Act On All Completions - Careful!</span>" 'icicle-all-candidates-action
              :enable '(and icicle-mode icicle-candidate-action-fn)
              :help "<span class="quote">Apply the command action to *each* of the possible completions</span>"))
    (define-key map [menu-bar minibuf action-all]
      (cons "<span class="quote">Act On All Completions - Careful!</span>" 'icicle-all-candidates-action))
    (put 'icicle-all-candidates-action 'menu-enable
         '(and icicle-mode icicle-candidate-action-fn)))
  (define-key map [menu-bar minibuf separator-actions] '("<span class="quote">--</span>"))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf set-define]
        (list 'menu-item "<span class="quote">Define Completions Set by Lisp Sexpr</span>" 'icicle-candidate-set-define
              :help "<span class="quote">Define the set of current completion candidates by evalating a sexpr</span>"))
    (define-key map [menu-bar minibuf set-define]
      (cons "<span class="quote">Define Completions Set by Lisp Sexpr</span>" 'icicle-candidate-set-define)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf set-swap]
        (list 'menu-item "<span class="quote">Swap Saved and Current Completions Sets</span>" 'icicle-candidate-set-swap
              :help "<span class="quote">Swap the saved and current sets of completion candidates</span>"))
    (define-key map [menu-bar minibuf set-swap]
      (cons "<span class="quote">Swap Saved and Current Completions Sets</span>" 'icicle-candidate-set-swap)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf set-retrieve-from-variable]
        (list 'menu-item "<span class="quote">Retrieve Saved Completions Set From Variable</span>"
              'icicle-candidate-set-retrieve-from-variable
              :help "<span class="quote">Retrieve saved completion candidates from variable, making them current</span>"))
    (define-key map [menu-bar minibuf set-retrieve-from-variable]
      (cons "<span class="quote">Retrieve Saved Completions Set From Variable</span>"
            'icicle-candidate-set-retrieve-from-variable)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf set-save-to-variable]
        (list 'menu-item "<span class="quote">Save Completions Set To Variable</span>"
              'icicle-candidate-set-save-to-variable
              :help "<span class="quote">Save current completion candidates to a variable, for later recall</span>"))
    (define-key map [menu-bar minibuf set-save-to-variable]
      (cons "<span class="quote">Save Completions Set To Variable</span>" 'icicle-candidate-set-save-to-variable)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf set-retrieve-from-cache-file]
        (list 'menu-item "<span class="quote">Retrieve Saved Completions Set From Cache File</span>"
              'icicle-candidate-set-retrieve-from-cache-file
              :help "<span class="quote">Retrieve saved completion candidates from cache file, making them current</span>"))
    (define-key map [menu-bar minibuf set-retrieve-from-cache-file]
      (cons "<span class="quote">Retrieve Saved Completions Set From Cache File</span>"
            'icicle-candidate-set-retrieve-from-cache-file)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf set-save-to-cache-file]
        (list 'menu-item "<span class="quote">Save Completions Set To Cache File</span>"
              'icicle-candidate-set-save-to-cache-file
              :help "<span class="quote">Save current completion candidates to your cache file, for later recall</span>"))
    (define-key map [menu-bar minibuf set-save-to-cache-file]
      (cons "<span class="quote">Save Completions Set To Cache File</span>" 'icicle-candidate-set-save-to-cache-file)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf set-retrieve]
        (list 'menu-item "<span class="quote">Retrieve Saved Completions Set</span>" 'icicle-candidate-set-retrieve
              :help "<span class="quote">Retrieve the saved set of completion candidates, making it current</span>"))
    (define-key map [menu-bar minibuf set-retrieve]
      (cons "<span class="quote">Retrieve Saved Completions Set</span>" 'icicle-candidate-set-retrieve)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf set-save]
        (list 'menu-item "<span class="quote">Save Completions Set</span>" 'icicle-candidate-set-save
              :help "<span class="quote">Save the set of current completion candidates, for later recall</span>"))
    (define-key map [menu-bar minibuf set-save]
      (cons "<span class="quote">Save Completions Set</span>" 'icicle-candidate-set-save)))
  (define-key map [menu-bar minibuf separator-set2] '("<span class="quote">--</span>"))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf set-intersection]
        (list 'menu-item "<span class="quote">Intersect Saved Completions Set</span>" 'icicle-candidate-set-intersection
              :help "<span class="quote">Set intersection between the current and saved candidates</span>"))
    (define-key map [menu-bar minibuf set-intersection]
      (cons "<span class="quote">Intersect Saved Completions Set</span>" 'icicle-candidate-set-intersection)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf set-union]
        (list 'menu-item "<span class="quote">Add Saved Completions Set</span>" 'icicle-candidate-set-union
              :help "<span class="quote">Set difference between the current and saved completion candidates</span>"))
    (define-key map [menu-bar minibuf set-union]
      (cons "<span class="quote">Add Saved Completions Set</span>" 'icicle-candidate-set-union)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf set-difference]
        (list 'menu-item "<span class="quote">Subtract Saved Completions Set</span>" 'icicle-candidate-set-difference
              :help "<span class="quote">Set difference between the current and saved completion candidates</span>"))
    (define-key map [menu-bar minibuf set-difference]
      (cons "<span class="quote">Subtract Saved Completions Set</span>" 'icicle-candidate-set-difference)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf set-complement]
        (list 'menu-item "<span class="quote">Complement Completions Set</span>" 'icicle-candidate-set-complement
              :help "<span class="quote">Complement the set of current completion candidates</span>"))
    (define-key map [menu-bar minibuf set-complement]
      (cons "<span class="quote">Complement Completions Set</span>" 'icicle-candidate-set-complement)))
  (define-key map [menu-bar minibuf separator-set1] '("<span class="quote">--</span>"))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf word-complete]
        (list 'menu-item "<span class="quote">Word-Complete</span>" 'icicle-prefix-word-complete
              :help "<span class="quote">Complete at most one word of prefix</span>"))
    (define-key map [menu-bar minibuf word-complete]
      (cons "<span class="quote">Word-Complete</span>" 'icicle-prefix-word-complete)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf prefix-complete]
        (list 'menu-item "<span class="quote">Prefix-Complete</span>" 'icicle-prefix-complete
              :help "<span class="quote">Complete prefix as far as possible</span>"))
    (define-key map [menu-bar minibuf prefix-complete]
      (cons "<span class="quote">Prefix-Complete</span>" 'icicle-prefix-complete)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf apropos-complete]
        (list 'menu-item "<span class="quote">Apropos-Complete</span>" 'icicle-apropos-complete
              :help "<span class="quote">Complete regular expression as far as possible and list completions</span>"))
    (define-key map [menu-bar minibuf apropos-complete]
      (cons "<span class="quote">Apropos-Complete</span>" 'icicle-apropos-complete)))
  (if (&gt; emacs-major-version 21)
      (define-key-after map [menu-bar minibuf C-h]
        (list 'menu-item "<span class="quote">Help</span>" 'icicle-completion-help
              :help "<span class="quote">Display help on minibuffer completion</span>") [menu-bar minibuf ?\?])
    <span class="linecomment">;; Emacs 20: Cannot use `define-key-after' with multi-event key.</span>
    (define-key map [menu-bar minibuf C-h] (cons "<span class="quote">Help</span>" 'icicle-completion-help)))

  <span class="linecomment">;; Remap some commands bound globally.</span>
  (if (fboundp 'command-remapping)
      (define-key map [remap self-insert-command] 'icicle-self-insert)
    (substitute-key-definition 'self-insert-command 'icicle-self-insert map global-map))
  (icicle-remap 'backward-delete-char-untabify 'icicle-backward-delete-char-untabify map)
  (icicle-remap 'delete-backward-char          'icicle-delete-backward-char map)
  (icicle-remap 'delete-char                   'icicle-delete-char map)
  (icicle-remap 'backward-kill-word            'icicle-backward-kill-word map)
  (icicle-remap 'kill-word                     'icicle-kill-word map)
  (icicle-remap 'backward-kill-sexp            'icicle-backward-kill-sexp map)
  (icicle-remap 'kill-sexp                     'icicle-kill-sexp map)
  (icicle-remap 'backward-kill-sentence        'icicle-backward-kill-sentence map)
  (icicle-remap 'backward-kill-paragraph       'icicle-backward-kill-paragraph map)
  (icicle-remap 'kill-paragraph                'icicle-kill-paragraph map)
  (icicle-remap 'kill-line                     'icicle-kill-line map)
  (icicle-remap 'kill-region                   'icicle-kill-region map)
  (icicle-remap 'kill-region-wimpy             'icicle-kill-region-wimpy map)
  (icicle-remap 'transpose-chars               'icicle-transpose-chars map)
  (icicle-remap 'transpose-words               'icicle-transpose-words map)
  (icicle-remap 'transpose-sexps               'icicle-transpose-sexps map)
  (icicle-remap 'transpose-yank                'icicle-transpose-yank map)
  (icicle-remap 'transpose-yank-pop            'icicle-transpose-yank-pop  map)
  (icicle-remap 'help-command                  'icicle-completion-help map)
  (unless icicle-arrows-respect-completion-type-flag
    (icicle-remap 'previous-line               'icicle-previous-prefix-candidate map)
    (icicle-remap 'next-line                   'icicle-next-prefix-candidate map))
  (icicle-remap 'scroll-up                     'icicle-next-apropos-candidate map)
  (icicle-remap 'scroll-down                   'icicle-previous-apropos-candidate map)
  (icicle-remap 'backward-paragraph            'icicle-previous-prefix-candidate-action map)
  (icicle-remap 'forward-paragraph             'icicle-next-prefix-candidate-action map)
  (icicle-remap 'scroll-right                  'icicle-previous-apropos-candidate-action map)
  (icicle-remap 'scroll-left                   'icicle-next-apropos-candidate-action map)

  <span class="linecomment">;; Bind some additional keys.</span>
  (define-key map icicle-word-completion-key 'icicle-prefix-word-complete)
  (define-key map [M-S-backspace]            'icicle-erase-minibuffer)
  (define-key map [M-S-delete]               'icicle-erase-minibuffer)
  <span class="linecomment">;; Replaces `kill-sentence':</span>
  (define-key map [(meta ?k)]                'icicle-erase-minibuffer-or-history-element)
  (define-key map [(meta ?h)]                'icicle-history)
  (define-key map [(meta pause)]             'icicle-keep-only-past-inputs)
  (define-key map [(control help)]           'icicle-help-on-candidate)
  (define-key map [(control f1)]             'icicle-help-on-candidate)
  (define-key map [(control return)]         'icicle-candidate-action)
  (define-key map [(control ?o)]             'icicle-candidate-action)
  (define-key map [(control ?!)]             'icicle-all-candidates-action)
  (define-key map [S-iso-lefttab]            'icicle-apropos-complete)
  (define-key map [S-tab]                    'icicle-apropos-complete)
  (define-key map [S-M-C-iso-lefttab]        'icicle-apropos-complete-no-display)
  (define-key map [S-M-C-tab]                'icicle-apropos-complete-no-display)
  (define-key map [(control ?i)]             'icicle-prefix-complete)
  (define-key map [tab]                      'icicle-prefix-complete)
  (define-key map [(meta control ?/)]        'icicle-prefix-complete) <span class="linecomment">; For `dabbrev.el'.</span>
  (define-key map [(meta control tab)]       'icicle-prefix-complete-no-display)
  (define-key map [insert]                   'icicle-switch-to-Completions-buf)
  <span class="linecomment">;; `minibuffer-completion-help' got wiped out by remap for self-insert.</span>
  (define-key map "<span class="quote">?</span>"                        'icicle-self-insert)
  (define-key map [(control ?g)]             'icicle-abort-minibuffer-input)
  (define-key map [(control ?l)]             'icicle-retrieve-last-input)
  (define-key map "<span class="quote"> </span>"                        'icicle-self-insert)
  (define-key map [(control ?~)]             'icicle-candidate-set-complement)
  (define-key map [(control ?-)]             'icicle-candidate-set-difference)
  (define-key map [(control ?+)]             'icicle-candidate-set-union)
  (define-key map [(control ?*)]             'icicle-candidate-set-intersection)
  (define-key map [(control ?&gt;)]             'icicle-candidate-set-save)
  (define-key map [(control ?&lt;)]             'icicle-candidate-set-retrieve)
  (define-key map [(meta control ?})]        'icicle-candidate-set-save-to-variable)
  (define-key map [(meta control ?{)]        'icicle-candidate-set-retrieve-from-variable)
  (define-key map [(control ?})]             'icicle-candidate-set-save-to-cache-file)
  (define-key map [(control ?{)]             'icicle-candidate-set-retrieve-from-cache-file)
  (define-key map [(control ?%)]             'icicle-candidate-set-swap)
  (define-key map [(control ?:)]             'icicle-candidate-set-define)
  (define-key map [(control ?=)]             'icicle-insert-string-from-variable)
  (define-key map [(control ?,)]             'icicle-toggle-sorting)
  (define-key map [(control ?.)]             'icicle-toggle-ignored-extensions)
  (define-key map [(control ?#)]             'icicle-toggle-incremental-completion)
  (define-key map [(control ?^)]             'icicle-toggle-ignored-space-prefix)
  (define-key map [(control ?`)]             'icicle-toggle-regexp-quote)
  (define-key map [(meta ?.)]                'icicle-insert-string-at-point)
  (define-key map [(meta ?*)]                'icicle-narrow-candidates))

(defun icicle-restore-completion-keys (map)
  "<span class="quote">Restore standard keys for minibuffer completion map MAP.
MAP is `minibuffer-local-completion-map',
`minibuffer-local-filename-completion-map', or
`minibuffer-local-must-match-map'.</span>"

  <span class="linecomment">;; Menu-bar Minibuf menu.</span>
  (define-key map [menu-bar minibuf separator-last]    nil)
  (define-key map [menu-bar minibuf action-all]        nil)
  (define-key map [menu-bar minibuf separator-actions] nil)
  (define-key map [menu-bar minibuf set-define]        nil)
  (define-key map [menu-bar minibuf set-swap]          nil)
  (define-key map [menu-bar minibuf set-retrieve]      nil)
  (define-key map [menu-bar minibuf set-save]          nil)
  (define-key map [menu-bar minibuf separator-set2]    nil)
  (define-key map [menu-bar minibuf set-intersection]  nil)
  (define-key map [menu-bar minibuf set-union]         nil)
  (define-key map [menu-bar minibuf set-difference]    nil)
  (define-key map [menu-bar minibuf set-complement]    nil)
  (define-key map [menu-bar minibuf separator-set1]    nil)
  (define-key map [menu-bar minibuf word-complete]     nil)
  (define-key map [menu-bar minibuf prefix-complete]   nil)
  (define-key map [menu-bar minibuf apropos-complete]  nil)
  (define-key map [menu-bar minibuf C-h]               nil)
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf ?\?]
        (list 'menu-item "<span class="quote">List Completions</span>" 'minibuffer-completion-help
              :help "<span class="quote">Display all possible completions</span>"))
    (define-key map [menu-bar minibuf ?\?]
      (cons "<span class="quote">List Completions</span>" 'minibuffer-completion-help)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf space]
        (list 'menu-item "<span class="quote">Complete Word</span>" 'minibuffer-complete-word
              :help "<span class="quote">Complete at most one word</span>"))
    (define-key map [menu-bar minibuf space]
      (cons "<span class="quote">Complete Word</span>" 'minibuffer-complete-word)))
  (if (&gt; emacs-major-version 21)
      (define-key map [menu-bar minibuf tab]
        (list 'menu-item "<span class="quote">Complete</span>" 'minibuffer-complete :help "<span class="quote">Complete as far as possible</span>"))
    (define-key map [menu-bar minibuf tab] (cons "<span class="quote">Complete</span>" 'minibuffer-complete)))

  <span class="linecomment">;; Restore remapped commands.</span>
  (if (fboundp 'command-remapping)
      (define-key map [remap self-insert-command] nil)
    (substitute-key-definition 'self-insert-command nil map global-map))
  (icicle-unmap 'backward-delete-char-untabify map)
  (icicle-unmap 'delete-backward-char          map)
  (icicle-unmap 'delete-char                   map)
  (icicle-unmap 'backward-kill-word            map)
  (icicle-unmap 'kill-word                     map)
  (icicle-unmap 'backward-kill-sexp            map)
  (icicle-unmap 'kill-sexp                     map)
  (icicle-unmap 'backward-kill-sentence        map)
  (icicle-unmap 'backward-kill-paragraph       map)
  (icicle-unmap 'kill-paragraph                map)
  (icicle-unmap 'kill-line                     map)
  (icicle-unmap 'kill-region                   map)
  (icicle-unmap 'kill-region-wimpy             map)
  (icicle-unmap 'transpose-chars               map)
  (icicle-unmap 'transpose-words               map)
  (icicle-unmap 'transpose-sexps               map)
  (icicle-unmap 'transpose-yank                map)
  (icicle-unmap 'transpose-yank-pop            map)
  (icicle-unmap 'help-command                  map)
  (icicle-unmap 'previous-line                 map)
  (icicle-unmap 'next-line                     map)
  (icicle-unmap 'scroll-up                     map)
  (icicle-unmap 'scroll-down                   map)
  (icicle-unmap 'backward-paragraph            map)
  (icicle-unmap 'forward-paragraph             map)
  (icicle-unmap 'scroll-right                  map)
  (icicle-unmap 'scroll-left                   map)

  <span class="linecomment">;; Restore additional bindings.</span>
  (define-key map icicle-word-completion-key nil) <span class="linecomment">; Do first, so can be rebound, as needed.</span>
  (define-key map [M-S-backspace]            nil)
  (define-key map [M-S-delete]               nil)
  (define-key map [(meta ?k)]                nil)
  (define-key map [(meta ?h)]                nil)
  (define-key map [(meta pause)]             nil)
  (define-key map [(control help)]           nil)
  (define-key map [(control f1)]             nil)
  (define-key map [(control ?l)]             nil)
  (define-key map [(control return)]         nil)
  (define-key map [(control ?o)]             nil)
  (define-key map [(control ?!)]             nil)
  (define-key map [S-iso-lefttab]            nil)
  (define-key map [S-tab]                    nil)
  (define-key map [insert]                   nil)
  (define-key map [(control ?~)]             nil)
  (define-key map [(control ?-)]             nil)
  (define-key map [(control ?+)]             nil)
  (define-key map [(control ?*)]             nil)
  (define-key map [(control ?&gt;)]             nil)
  (define-key map [(control ?&lt;)]             nil)
  (define-key map [(shift control ?})]       nil)
  (define-key map [(shift control ?{)]       nil)
  (define-key map [(control ?})]             nil)
  (define-key map [(control ?{)]             nil)
  (define-key map [(control ?%)]             nil)
  (define-key map [(control ?:)]             nil)
  (define-key map [(control ?=)]             nil)
  (define-key map [(control ?,)]             nil)
  (define-key map [(control ?.)]             nil)
  (define-key map [(control ?#)]             nil)
  (define-key map [(control ?^)]             nil)
  (define-key map [(control ?`)]             nil)
  (define-key map [(meta ?.)]                nil)
  (define-key map [(meta ?*)]                nil)
  (define-key map "<span class="quote">?</span>"                        'minibuffer-completion-help)
  (define-key map [(control ?i)]             'minibuffer-complete)
  (define-key map [tab]                      'minibuffer-complete)
  (define-key map [(meta control tab)]       nil)
  (define-key map [(meta control ?/)]        nil)
  (define-key map [(control ?g)]             'abort-recursive-edit)
  (define-key map "<span class="quote"> </span>"                        'minibuffer-complete-word)
  (define-key map [(meta ?n)]                'next-history-element)
  (define-key map [down]                     'next-history-element)
  (define-key map [next]                     'next-history-element)
  (define-key map [(meta ?p)]                'previous-history-element)
  (define-key map [up]                       'previous-history-element)
  (define-key map [prior]                    'switch-to-completions)
  (define-key map [(meta ?v)]                'switch-to-completions))

<span class="linecomment">;; Inspired from `icomplete-minibuffer-setup'.</span>
<span class="linecomment">;; We change the region background here dynamically.</span>
<span class="linecomment">;; It would be better to just use a buffer-local face, but those don't yet exist.</span>
<span class="linecomment">;;</span>
(defun icicle-minibuffer-setup ()
  "<span class="quote">Run in minibuffer on activation, to enable completion cycling.
Usually run by inclusion in `minibuffer-setup-hook'.</span>"
  (cond ((and icicle-mode (window-minibuffer-p (selected-window)) (not executing-kbd-macro))
         <span class="linecomment">;; The pre- and post-command hooks are local to the</span>
         <span class="linecomment">;; minibuffer, so they are added here, not in `icicle-mode'.</span>
         <span class="linecomment">;; They are removed in `icicle-mode' when mode is exited.</span>
         (unless (fboundp 'define-minor-mode) (make-local-hook 'pre-command-hook))
         (add-hook 'pre-command-hook         'icicle-run-icicle-pre-command-hook nil t)
         (unless (fboundp 'define-minor-mode) (make-local-hook 'post-command-hook))
         (add-hook 'post-command-hook        'icicle-run-icicle-post-command-hook nil t)
         (when (= 1 (recursion-depth))
           (setq icicle-saved-region-background (face-background 'region)))
         (when icicle-change-region-background-flag
           (set-face-background 'region icicle-region-background))
         <span class="linecomment">;; Reset prompt, because some commands (e.g. `find-file') don't use `read-file-name'</span>
         <span class="linecomment">;; or `completing-read'.  Reset other stuff too.</span>
         (setq icicle-prompt                         "<span class="quote"></span>"
               icicle-default-directory              default-directory
               icicle-initial-value                  nil
               icicle-last-completion-command        nil
               icicle-last-input                     nil
               icicle-completion-candidates          nil
               icicle-candidate-nb                   nil
               icicle-incremental-completion-p       icicle-incremental-completion-flag)
         (when icicle-arrows-respect-completion-type-flag
           (dolist (map (if (boundp 'minibuffer-local-filename-completion-map)
                            (list minibuffer-local-completion-map
                                  minibuffer-local-filename-completion-map
                                  minibuffer-local-must-match-map)
                          (list minibuffer-local-completion-map minibuffer-local-must-match-map)))
             (define-key map [up]   'previous-history-element)
             (define-key map [down] 'next-history-element)))
         (icicle-update-ignored-extensions-regexp)
         (when (memq icicle-init-value-flag '(preselect-start preselect-end))
           (icicle-select-minibuffer-contents))
         (when (and icicle-show-Completions-initially-flag (icicle-completing-p))
           (icicle-display-Completions))
         (run-hooks 'icicle-minibuffer-setup-hook))))

(defun icicle-cancel-*Help*-redirection ()
  "<span class="quote">Cancel redirection of focus from *Help* buffer to minibuffer.
Focus was redirected during `icicle-help-on-candidate'.</span>"
  (let* ((help-window (get-buffer-window "<span class="quote">*Help*</span>" t))
         (help-frame (and help-window (window-frame help-window))))
    (when help-frame (redirect-frame-focus help-frame))))

(defun icicle-run-icicle-pre-command-hook ()
  "<span class="quote">Run `icicle-pre-command-hook' functions.
Used in `pre-command-hook'.</span>"
  (run-hooks 'icicle-pre-command-hook))

(defun icicle-run-icicle-post-command-hook ()
  "<span class="quote">Run `icicle-post-command-hook' functions.
Used in `post-command-hook'.</span>"
  (run-hooks 'icicle-post-command-hook))

(defun icicle-set-calling-cmd ()
  "<span class="quote">Remember last command that called for completion.
Used in `completion-setup-hook'.</span>"
  (setq icicle-cmd-calling-for-completion this-command))

(defun icicle-update-ignored-extensions-regexp ()
  "<span class="quote">Update ignored extensions if `completion-ignored-extensions' changed.</span>"
  (when (and (icicle-file-name-input-p)
             (not (equal icicle-ignored-extensions completion-ignored-extensions)))
    (setq icicle-ignored-extensions-regexp <span class="linecomment">; Make regexp for ignored file extensions.</span>
          (concat "<span class="quote">\\(</span>" (mapconcat #'regexp-quote completion-ignored-extensions "<span class="quote">\\|</span>") "<span class="quote">\\)\\'</span>"))
    <span class="linecomment">;; Flag to prevent updating `icicle-ignored-extensions-regexp' unless</span>
    <span class="linecomment">;; `completion-ignored-extensions' changes.</span>
    (setq icicle-ignored-extensions completion-ignored-extensions)))

(defun icicle-completing-p ()
  "<span class="quote">Non-nil if reading minibuffer input with completion.</span>"
  (not (null minibuffer-completion-table)))

<span class="linecomment">;; We change the region background here dynamically.</span>
<span class="linecomment">;; It would be better to just use a buffer-local face, but those don't yet exist.</span>
(defun icicle-restore-region-face ()
  "<span class="quote">Restore region face.  It was changed during minibuffer activity
if `icicle-change-region-background-flag' is non-nil.</span>"
  (when icicle-change-region-background-flag
    (set-face-background 'region icicle-saved-region-background)))

(defun icicle-activate-mark ()
  "<span class="quote">Prevent region from being deactivated.  Use in `icicle-post-command-hook'.</span>"
  (when (and (window-minibuffer-p (selected-window)) (not executing-kbd-macro))
    (setq deactivate-mark nil)))




<span class="linecomment">;;; Icicles functions - Icicle mode helper functions . . . .</span>

<span class="linecomment">;; This is only used in Emacs 22+, but we define it always anyway.</span>
(defun icicle-undo-std-completion-faces ()
  "<span class="quote">Get rid of standard completion-root highlighting in *Completions*.</span>"
  <span class="linecomment">;; Do this because the standard Emacs 22 highlighting can interfere with</span>
  <span class="linecomment">;; apropos-completion highlighting.</span>
  (when (fboundp 'face-spec-reset-face)
    (when (facep 'completions-common-part)
      (face-spec-reset-face 'completions-common-part)
      (set-face-attribute 'completions-common-part nil :inherit nil))
    (when (facep 'completions-first-difference)
      (face-spec-reset-face 'completions-first-difference)
      (set-face-attribute 'completions-first-difference nil :inherit nil))))

(defun icicle-redefine-std-completion-fns ()
  "<span class="quote">Replace standard completion functions with versions for Icicle mode.</span>"
  (when (fboundp 'icicle-completing-read)
    (defalias 'exit-minibuffer              (symbol-function 'icicle-exit-minibuffer))
    (defalias 'minibuffer-complete-and-exit (symbol-function 'icicle-minibuffer-complete-and-exit))
    (defalias 'switch-to-completions        (symbol-function 'icicle-switch-to-completions))
    (defalias 'choose-completion-string     (symbol-function 'icicle-choose-completion-string))
    (defalias 'mouse-choose-completion      (symbol-function 'icicle-mouse-choose-completion))
    (defalias 'completion-setup-function    (symbol-function 'icicle-completion-setup-function))
    (defalias 'completing-read              (symbol-function 'icicle-completing-read))
    (defalias 'read-file-name               (symbol-function 'icicle-read-file-name))))

(defun icicle-restore-std-completion-fns ()
  "<span class="quote">Restore standard completion functions replaced in Icicle mode.</span>"
  (when (fboundp 'old-completing-read)
    (defalias 'exit-minibuffer              (symbol-function 'old-exit-minibuffer))
    (defalias 'minibuffer-complete-and-exit (symbol-function 'old-minibuffer-complete-and-exit))
    (defalias 'switch-to-completions        (symbol-function 'old-switch-to-completions))
    (defalias 'choose-completion-string     (symbol-function 'old-choose-completion-string))
    (defalias 'mouse-choose-completion      (symbol-function 'old-mouse-choose-completion))
    (defalias 'completion-setup-function    (symbol-function 'old-completion-setup-function))
    (defalias 'completing-read              (symbol-function 'old-completing-read))
    (defalias 'read-file-name               (symbol-function 'old-read-file-name))))

(defun icicle-redefine-standard-commands ()
  "<span class="quote">Replace certain standard Emacs commands with Icicles versions.</span>"
  (when (and (fboundp 'icicle-completing-read) icicle-redefine-standard-commands-flag)
    (defalias 'dabbrev-completion           (symbol-function 'icicle-dabbrev-completion))
    (defalias 'lisp-complete-symbol         (symbol-function 'icicle-lisp-complete-symbol))
    (defalias 'repeat-complex-command       (symbol-function 'icicle-repeat-complex-command))
    (defalias 'customize-apropos            (symbol-function 'icicle-customize-apropos))
    (defalias 'customize-apropos-faces      (symbol-function 'icicle-customize-apropos-faces))
    (defalias 'customize-apropos-groups     (symbol-function 'icicle-customize-apropos-groups))
    (defalias 'customize-apropos-options    (symbol-function 'icicle-customize-apropos-options))
    (defalias 'read-from-minibuffer         (symbol-function 'icicle-read-from-minibuffer))
    (defalias 'read-string                  (symbol-function 'icicle-read-string))))

(defun icicle-restore-standard-commands ()
  "<span class="quote">Restore standard Emacs commands replaced in Icicle mode.</span>"
  (when (and (fboundp 'old-completing-read) icicle-redefine-standard-commands-flag)
    (defalias 'dabbrev-completion           (symbol-function 'old-dabbrev-completion))
    (defalias 'lisp-complete-symbol         (symbol-function 'old-lisp-complete-symbol))
    (defalias 'repeat-complex-command       (symbol-function 'old-repeat-complex-command))
    (defalias 'customize-apropos            (symbol-function 'old-customize-apropos))
    (defalias 'customize-apropos-faces      (symbol-function 'old-customize-apropos-faces))
    (defalias 'customize-apropos-groups     (symbol-function 'old-customize-apropos-groups))
    (defalias 'customize-apropos-options    (symbol-function 'old-customize-apropos-options))
    (defalias 'read-from-minibuffer         (symbol-function 'old-read-from-minibuffer))
    (defalias 'read-string                  (symbol-function 'old-read-string))))

(defun icicle-redefine-standard-options ()
  "<span class="quote">Replace certain standard Emacs options with Icicles versions.</span>"
  (when (boundp 'icicle-search-ring-max)
    (setq icicle-saved-search-ring-max        search-ring-max <span class="linecomment">; Save it.</span>
          search-ring-max                     icicle-search-ring-max)
    (setq icicle-saved-regexp-search-ring-max regexp-search-ring-max <span class="linecomment">; Save it.</span>
          regexp-search-ring-max              icicle-regexp-search-ring-max)))

(defun icicle-restore-standard-options ()
  "<span class="quote">Restore standard Emacs options replaced in Icicle mode.</span>"
  (when (boundp 'icicle-saved-search-ring-max)
    (setq search-ring-max        icicle-saved-search-ring-max)
    (setq regexp-search-ring-max icicle-saved-regexp-search-ring-max)))

(defun icicle-bind-isearch-keys ()
  "<span class="quote">Bind `S-TAB' in Isearch maps.  Use in `isearch-mode-hook'.</span>"
  (define-key isearch-mode-map [S-tab] 'icicle-isearch-complete)
  (define-key minibuffer-local-isearch-map [S-tab] 'isearch-complete-edit))




<span class="linecomment">;;; Icicles functions - prefix completion cycling...........</span>

(defun icicle-prefix-candidates (input)
  "<span class="quote">List of candidate prefix completions for the current partial INPUT.
INPUT is a string.  Each candidate is a string.</span>"
  (setq icicle-candidate-nb nil)
  (if icicle-sort-function
      (sort (icicle-unsorted-prefix-candidates input) icicle-sort-function)
    (icicle-unsorted-prefix-candidates input)))

(defun icicle-unsorted-prefix-candidates (input)
  "<span class="quote">Unsorted list of prefix completions for the current partial INPUT.</span>"
  (append icicle-extra-candidates
          (icicle-delete-if-not
           (lambda (cand) (let ((case-fold-search completion-ignore-case))
                            (icicle-filter-wo-input cand)))
           (all-completions input minibuffer-completion-table minibuffer-completion-predicate
                            icicle-ignore-space-prefix-flag))))

(defun icicle-file-name-prefix-candidates (input)
  "<span class="quote">List of prefix completions for partial file name INPUT.
INPUT is a string.
Candidates can be directories.  Each candidate is a string.</span>"
  (setq icicle-candidate-nb nil)
  (let ((default-directory (icicle-file-name-directory-w-default input)))
    (icicle-sort-and-strip-ignored
     (icicle-unsorted-file-name-prefix-candidates (or (icicle-file-name-nondirectory input) "<span class="quote"></span>")))))

(defun icicle-unsorted-file-name-prefix-candidates (input)
  "<span class="quote">Unsorted list of prefix completions for the current file-name INPUT.</span>"
  (let ((slashed-p (and (&gt; (length input) 0) (eq ?/ (aref input 0)))))
    (when slashed-p (setq input (substring input 1)))
    (append icicle-extra-candidates
            (icicle-delete-if-not
             (lambda (cand) (let ((case-fold-search completion-ignore-case))
                              (if (member cand '("<span class="quote">../</span>" "<span class="quote">./</span>"))
                                  (member input '("<span class="quote">..</span>" "<span class="quote">.</span>")) <span class="linecomment">; Prevent "" from matching "../"</span>
                                (and (string-match (concat "<span class="quote">^</span>" (regexp-quote input)) cand)
                                     (icicle-filter-wo-input cand)))))
             (all-completions input minibuffer-completion-table
                              (if slashed-p "<span class="quote">/</span>" default-directory)
                              icicle-ignore-space-prefix-flag)))))




<span class="linecomment">;;; Icicles functions - apropos completion cycling..........</span>

(defun icicle-apropos-candidates (input)
  "<span class="quote">List of candidate apropos completions for the current partial INPUT.
INPUT is a string.  Each candidate is a string.</span>"
  (setq icicle-candidate-nb nil)
  (if icicle-sort-function
      (sort (icicle-unsorted-apropos-candidates input) icicle-sort-function)
    (icicle-unsorted-apropos-candidates input)))

(defun icicle-unsorted-apropos-candidates (input)
  "<span class="quote">Unsorted list of apropos completions for the current partial INPUT.
When `icicle-expand-input-to-common-match-flag' is non-nil, this also
sets `icicle-common-match-string' to the longest common match of input
over all candidates.</span>"
  (when icicle-regexp-quote-flag (setq input (regexp-quote input)))
  (let ((candidates (append icicle-extra-candidates
                            (icicle-delete-if-not
                             (lambda (cand) (let ((case-fold-search completion-ignore-case))
                                              (and (string-match input cand)
                                                   (icicle-filter-wo-input cand))))
                             (all-completions "<span class="quote"></span>" minibuffer-completion-table
                                              minibuffer-completion-predicate
                                              icicle-ignore-space-prefix-flag)))))
    (when (and icicle-expand-input-to-common-match-flag (consp candidates))
      (setq icicle-common-match-string (icicle-longest-common-match input candidates)))
    candidates))                        <span class="linecomment">; Return candidates.</span>

(defun icicle-file-name-apropos-candidates (input)
  "<span class="quote">List of apropos completions for partial file-name INPUT.
INPUT is a string.
Candidates can be directories.  Each candidate is a string.</span>"
  (setq icicle-candidate-nb nil)
  (let ((default-directory (icicle-file-name-directory-w-default input)))
    (icicle-sort-and-strip-ignored
     (icicle-unsorted-file-name-apropos-candidates
      (or (icicle-file-name-nondirectory input) "<span class="quote"></span>")))))

(defun icicle-unsorted-file-name-apropos-candidates (input)
  "<span class="quote">Unsorted list of apropos completions for the partial file-name INPUT.
When `icicle-expand-input-to-common-match-flag' is non-nil, this also
sets `icicle-common-match-string' to the longest common match of input
over all candidates.</span>"
  (when icicle-regexp-quote-flag (setq input (regexp-quote input)))
  (let ((slashed-p (and (&gt; (length input) 0) (eq ?/ (aref input 0)))))
    (when slashed-p (setq input (substring input 1)))
    (let ((candidates (append icicle-extra-candidates
                              (icicle-delete-if-not
                               (lambda (cand)
                                 (let ((case-fold-search completion-ignore-case))
                                   (if (member cand '("<span class="quote">../</span>" "<span class="quote">./</span>")) <span class="linecomment">; Prevent "" from matching "../"</span>
                                       (member input '("<span class="quote">..</span>" "<span class="quote">.</span>"))
                                     (and (string-match input cand)
                                          (icicle-filter-wo-input cand)))))
                               (all-completions "<span class="quote"></span>" minibuffer-completion-table
                                                (if slashed-p "<span class="quote">/</span>" default-directory)
                                                icicle-ignore-space-prefix-flag)))))
      (when (and icicle-expand-input-to-common-match-flag (consp candidates))
        (setq icicle-common-match-string (icicle-longest-common-match input candidates)))
      candidates)))                     <span class="linecomment">; Return candidates.</span>

(defun icicle-longest-common-match (input candidates)
  "<span class="quote">Return the longest common match for INPUT among all CANDIDATES.
This assumes that INPUT matches each string in list CANDIDATES.
Return nil if there is no common match.  This actually returns
`regexp-quote' applied to the longest common match, so that special
characters in the match don't throw off regexp matching.</span>"
  (let ((case-fold-search completion-ignore-case)
        (first (car candidates)))
    (string-match input first)
    (let* ((len-first (length first))
           (beg 0)
           (end len-first)
           (orig-match-beg (match-beginning 0))
           (lcm first)                  <span class="linecomment">; "lcm" for "longest common match".</span>
           (rest (cdr candidates)))
      <span class="linecomment">;; Compare with the rest of the candidates, reducing as needed.</span>
      (while (and rest lcm)
        <span class="linecomment">;; Remove any prefix that doesn't match some other candidate.</span>
        (while (and (&lt; beg orig-match-beg)
                    (not (string-match (regexp-quote (substring lcm 0 (1+ (- orig-match-beg beg))))
                                       (car rest)))) <span class="linecomment">; Use 1+ so include first character of input.</span>
          <span class="linecomment">;; Take a character off of the left.</span>
          (setq lcm (substring lcm 1)
                beg (1+ beg)))
        <span class="linecomment">;; Remove any suffix that doesn't match some other candidate.</span>
        (while (and (&gt; end 0) (not (string-match (regexp-quote lcm) (car rest))))
          <span class="linecomment">;; Take a character off of the right.</span>
          (setq lcm (substring lcm 0 (1- (length lcm)))
                end (1- end)))
        (unless (and (string-match (regexp-quote lcm) (car rest))
                     (string-match input lcm))
          (setq lcm nil))               <span class="linecomment">; No possible expansion</span>
        (pop rest))
      lcm)))




<span class="linecomment">;;; Icicles functions - common helper functions.............</span>

<span class="linecomment">;; Main cycling function - used by `icicle-next-prefix-candidate', `icicle-next-apropos-candidate'.</span>
(defun icicle-next-candidate (nth candidates-fn &optional regexp-p)
  "<span class="quote">Replace input by NTH next or previous completion for an input.
Default value of NTH is 1, meaning use the next completion.
Negative NTH means use a previous, not subsequent, completion.

CANDIDATES-FN is a function that returns the list of candidate
completions for its argument, the current partial input (a string).

Optional arg REGEXP-P non-nil means that CANDIDATES-FN uses regexp
matching. This is used to highlight the appropriate matching root.</span>"
  (let ((saved-last-input icicle-last-input)) <span class="linecomment">; For call to `icicle-recompute-candidates'.</span>
    (unless (stringp icicle-last-completion-candidate)
      (setq icicle-last-completion-candidate icicle-initial-value))
    (setq nth (or nth 1))
    (setq icicle-current-input (icicle-minibuffer-contents-from-minibuffer))
    (setq icicle-common-match-string nil) <span class="linecomment">; Don't use old one in `icicle-save-or-restore-input'</span>
    (icicle-save-or-restore-input regexp-p)
    (when (and (icicle-file-name-input-p) (icicle-file-directory-p icicle-current-input))
      (setq icicle-default-directory icicle-current-input))
    (icicle-recompute-candidates nth candidates-fn saved-last-input)
    (cond ((null icicle-completion-candidates)
           (save-selected-window (icicle-delete-windows-on "<span class="quote">*Completions*</span>"))
           (minibuffer-message "<span class="quote">  [No completion]</span>"))
          (t
           (icicle-clear-minibuffer)
           (let ((nb-cands (length icicle-completion-candidates))
                 (unit (if (wholenump nth) 1 -1))
                 next)
             <span class="linecomment">;; So `icomplete+' can append the number of other candidates to the minibuffer.</span>
             (when icicle-completion-candidates
               (setq icicle-nb-of-other-cycle-candidates (1- nb-cands)))
             (icicle-increment-cand-nb+signal-end nth nb-cands)
             (setq next (elt icicle-completion-candidates icicle-candidate-nb))
             (while (null next)         <span class="linecomment">; Skip null candidates.</span>
               (icicle-increment-cand-nb+signal-end unit nb-cands)
               (setq next (elt icicle-completion-candidates icicle-candidate-nb)))
             <span class="linecomment">;; Filter with predicate</span>
             (when (and (not (icicle-file-name-input-p)) <span class="linecomment">; Pred is special for files.</span>
                        minibuffer-completion-predicate)
               (while (not (condition-case nil
                               (funcall minibuffer-completion-predicate
                                        (if (arrayp minibuffer-completion-table)
                                            (intern next) <span class="linecomment">; obarray of symbols.</span>
                                          (list next))) <span class="linecomment">; List of strings (sym names).</span>
                             (error nil)))
                 (icicle-increment-cand-nb+signal-end unit nb-cands)
                 (setq next (elt icicle-completion-candidates icicle-candidate-nb))
                 (while (null next)     <span class="linecomment">; Skip null candidates.</span>
                   (icicle-increment-cand-nb+signal-end unit nb-cands)
                   (setq next (elt icicle-completion-candidates icicle-candidate-nb)))))
             <span class="linecomment">;; Reset last candidate.  Need a copy, because we change its text properties.</span>
             (setq icicle-last-completion-candidate (copy-sequence next))
             <span class="linecomment">;; Highlight any initial whitespace (probably a user typo).</span>
             (let ((input (if regexp-p icicle-current-regexp-input icicle-current-input)))
               (icicle-highlight-initial-whitespace input))

             <span class="linecomment">;; Underline the root that was completed, in the minibuffer.</span>
             (let ((case-fold-search completion-ignore-case)
                   (inp (if (icicle-file-name-input-p)
                            (icicle-file-name-nondirectory icicle-current-input)
                          icicle-current-input))
                   indx)
               (unless regexp-p (setq inp (regexp-quote inp)))
               (setq indx (string-match inp icicle-last-completion-candidate))
               (when indx
                 (put-text-property indx (match-end 0) 'face 'icicle-match-highlight-minibuffer
                                    icicle-last-completion-candidate)))
             (insert (if (and (icicle-file-name-input-p) insert-default-directory)
                         (icicle-file-name-directory-w-default icicle-current-input)
                       "<span class="quote"></span>")
                     icicle-last-completion-candidate)
             (let ((input (if regexp-p icicle-current-regexp-input icicle-current-input)))
               (icicle-place-cursor input))

             <span class="linecomment">;; Highlight current completion candidate, if *Completions* is displayed.</span>
             (when (get-buffer-window "<span class="quote">*Completions*</span>" t)

               <span class="linecomment">;; Refresh *Completions*, updating it to reflect the current candidates.</span>
               (unless (or (and (memq this-command '(icicle-next-apropos-candidate
                                                     icicle-previous-apropos-candidate
                                                     icicle-next-apropos-candidate-action
                                                     icicle-previous-apropos-candidate-action))
                                (memq last-command '(icicle-next-apropos-candidate
                                                     icicle-previous-apropos-candidate
                                                     icicle-next-apropos-candidate-action
                                                     icicle-previous-apropos-candidate-action
                                                     icicle-candidate-action)))
                           (and (memq this-command '(icicle-next-prefix-candidate
                                                     icicle-previous-prefix-candidate
                                                     icicle-next-prefix-candidate-action
                                                     icicle-previous-prefix-candidate-action))
                                (memq last-command '(icicle-next-prefix-candidate
                                                     icicle-previous-prefix-candidate
                                                     icicle-next-prefix-candidate-action
                                                     icicle-previous-prefix-candidate-action
                                                     icicle-candidate-action))))
                 (icicle-display-candidates-in-Completions))
               <span class="linecomment">;; Highlight current candidate in *Completions*.</span>
               (let ((compl-win (get-buffer-window "<span class="quote">*Completions*</span>" t))
                     curr-candidate-pos)
                 (save-window-excursion
                   (select-window compl-win)
                   (let ((case-fold-search completion-ignore-case))
                     (goto-char (point-min))
                     (forward-line 3)
                     (icicle-move-to-next-completion icicle-candidate-nb t)
                     (set-buffer-modified-p nil)
                     (setq curr-candidate-pos (point))))
                 (set-window-point compl-win curr-candidate-pos))))))))

(defun icicle-save-or-restore-input (&optional regexp-p)
  "<span class="quote">Save current minibuffer input, or restore last input.
If value in minibuffer now is `icicle-last-completion-candidate',
then it is probably not a real input, so restore last real input.
Otherwise, save current value as last input.

See the code for particular cases - for instance, last input is not
restored if the current command is a completion command.

This also updates `icicle-current-regexp-input'.

If optional arg REGEXP-P and `icicle-common-match-string' are non-nil,
then also update the current input to be `icicle-common-match-string'.</span>"
  (cond
    <span class="linecomment">;; Restore last input.</span>
    ((and icicle-last-input
          (not (string= "<span class="quote"></span>" icicle-last-completion-candidate))
          (not (memq this-command '(icicle-prefix-complete icicle-apropos-complete)))
          <span class="linecomment">;; Current input = last candidate?</span>
          (string= (if (icicle-file-name-input-p)
                       (directory-file-name (icicle-remove-dots icicle-last-completion-candidate))
                     icicle-last-completion-candidate)
                   (if (icicle-file-name-input-p)
                       (if icicle-cycle-into-subdirs-flag
                           (icicle-file-name-nondirectory icicle-current-input)
                         (file-name-nondirectory
                          (directory-file-name (icicle-remove-dots icicle-current-input))))
                     icicle-current-input))
          (not (string= icicle-current-input icicle-initial-value)))
     (setq icicle-current-input icicle-last-input))
    (t
     <span class="linecomment">;; Save current input.</span>
     (cond ((and icicle-expand-input-to-common-match-flag regexp-p icicle-common-match-string)
            (let ((common (if (and (icicle-file-name-input-p) insert-default-directory)
                              (if (string= "<span class="quote"></span>" icicle-common-match-string)
                                  (file-name-directory icicle-current-input)
                                (directory-file-name
                                 (expand-file-name icicle-common-match-string
                                                   (file-name-directory icicle-current-input))))
                            icicle-common-match-string)))

              <span class="linecomment">;; This test ensures:</span>
              <span class="linecomment">;; 1) We don't just change letter case (e.g. MS Windows file names).</span>
              <span class="linecomment">;; 2) We don't do this more than once (the saved regexp input would get overwritten).</span>
              (unless (or (and case-fold-search
                               (string= (upcase icicle-current-input) (upcase common))
                               (not (string= icicle-current-input common)))
                          (memq last-command (list this-command 'handle-switch-frame)))
                (setq icicle-current-regexp-input icicle-current-input) <span class="linecomment">; Save it for `C-l'.</span>
                <span class="linecomment">;; Use common as current input, unless input is a directory.</span>
                (unless (and (icicle-file-name-input-p) (file-directory-p icicle-current-input))
                  (setq icicle-current-input common)))))
           ((and regexp-p
                 (not (memq last-command (list this-command 'handle-switch-frame)))
                 (not (memq this-command <span class="linecomment">; Cycled candidates are not input regexps.</span>
                            '(icicle-next-apropos-candidate icicle-previous-apropos-candidate
                              icicle-next-apropos-candidate-action
                              icicle-previous-apropos-candidate-action
                              icicle-next-prefix-candidate         icicle-previous-prefix-candidate
                              icicle-next-prefix-candidate-action
                              icicle-previous-prefix-candidate-action))))
            (setq icicle-current-regexp-input icicle-current-input))) <span class="linecomment">; Save it for `C-l'.</span>

     <span class="linecomment">;; Update to use current input.</span>
     (setq icicle-last-completion-candidate icicle-current-input
           icicle-last-input icicle-current-input))))

(defun icicle-remove-dots (filename)
  "<span class="quote">Strip leading string through last ../ or ./ from FILENAME.</span>"
  (let ((newname filename))
    (while
        (or (string-match "<span class="quote">\\.\\./</span>" newname)
            (string-match "<span class="quote">\\./</span>" newname)
            <span class="linecomment">;; Emacs 21+ `file-relative-name' returns ".." and "." (no slash) for "" first arg</span>
            (string-match "<span class="quote">^\\.\\.$</span>" newname)
            (string-match "<span class="quote">^\\.$</span>" newname))
      (setq newname (substring newname (match-end 0))))
    newname))

(defun icicle-recompute-candidates (nth candidates-fn saved-last-input)
  "<span class="quote">Recompute `icicle-completion-candidates', if needed.
If buffer *Completions* is already displayed, it is updated.
This does nothing, unless the user changed the minibuffer input or the
completion type has changed (from apropos to prefix or vice versa).
Argument NTH is passed to `icicle-display-candidates-in-Completions'.
Argument CANDIDATES-FN is a function that recomputes the candidates.</span>"
  (unless (and icicle-last-completion-command
               (string= icicle-current-input saved-last-input) <span class="linecomment">; No change in user input.</span>
               <span class="linecomment">;; No change in completion type: apropos vs prefix.</span>
               (or (and (memq icicle-last-completion-command
                              '(icicle-apropos-complete icicle-candidate-set-complement
                                icicle-keep-only-past-inputs))
                        (memq this-command '(icicle-apropos-complete
                                             icicle-next-apropos-candidate
                                             icicle-next-apropos-candidate-action
                                             icicle-previous-apropos-candidate
                                             icicle-previous-apropos-candidate-action)))
                   (and (memq icicle-last-completion-command
                              '(icicle-prefix-complete icicle-candidate-set-complement
                                icicle-keep-only-past-inputs))
                        (memq this-command '(icicle-prefix-complete
                                             icicle-next-prefix-candidate
                                             icicle-next-prefix-candidate-action
                                             icicle-previous-prefix-candidate
                                             icicle-previous-prefix-candidate-action)))))
    <span class="linecomment">;; Set `icicle-last-completion-command', to record new completion type.</span>
    (case this-command
      ((icicle-next-prefix-candidate
        icicle-previous-prefix-candidate
        icicle-next-prefix-candidate-action
        icicle-previous-prefix-candidate-action)
       (setq icicle-last-completion-command 'icicle-prefix-complete))
      ((icicle-next-apropos-candidate
        icicle-previous-apropos-candidate
        icicle-next-apropos-candidate-action
        icicle-previous-apropos-candidate-action)
       (setq icicle-last-completion-command 'icicle-apropos-complete)))
    <span class="linecomment">;; Recompute and redisplay completion candidates.  Reset candidate number.</span>
    (setq icicle-completion-candidates (funcall candidates-fn icicle-current-input))
    (when (get-buffer-window "<span class="quote">*Completions*</span>" 0)
      (if icicle-completion-candidates
          (icicle-display-candidates-in-Completions (not (wholenump nth)))
        (save-selected-window (icicle-delete-windows-on "<span class="quote">*Completions*</span>"))))))

(defun icicle-increment-cand-nb+signal-end (incr max)
  "<span class="quote">Increment candidate number by INCR modulo MAX, and signal end of cycle.</span>"
  (if icicle-candidate-nb
      (setq icicle-candidate-nb (+ incr icicle-candidate-nb))
    (setq icicle-candidate-nb 0))       <span class="linecomment">; Reset.</span>
  (setq icicle-candidate-nb (mod icicle-candidate-nb max))
  (when (and (= 0 icicle-candidate-nb)  <span class="linecomment">; Signal end of cycle.</span>
             (eq last-command this-command))
    (let ((visible-bell t)) (ding) (setq visible-bell nil) (ding))))

(defun icicle-place-overlay (start end overlay face buffer &rest properties)
  "<span class="quote">Put OVERLAY with FACE between START and END in BUFFER.
OVERLAY is a symbol whose value is the overlay.  If nil, the overlay
  is created.  If non-nil, it is simply moved.
PROPERTIES are additional overlay properties to add: pairs of a
property and a value.</span>"
  (if (symbol-value overlay)            <span class="linecomment">; Overlay exists, just move it.</span>
      (move-overlay (symbol-value overlay) start end buffer)
    (set overlay (make-overlay start end buffer))
    (overlay-put (symbol-value overlay) 'face face)))

(defun icicle-sort-and-strip-ignored (candidates)
  "<span class="quote">Remove file names with ignored extensions, and \</span>".\"<span class="quote">.  Sort CANDIDATES.
If `icicle-sort-function' is nil, then do not sort.</span>"
  (let* ((pred1 (lambda (cand) (or (string-match icicle-ignored-extensions-regexp cand)
                                   (string= "<span class="quote">./</span>" cand))))
         (pred2 (lambda (cand) (string= "<span class="quote">./</span>" cand)))
         (new-candidates (icicle-delete-if (if icicle-ignored-extensions-regexp pred1 pred2)
                                           candidates)))
    <span class="linecomment">;; If the only candidates have ignored extensions, then use them.</span>
    (unless new-candidates (setq new-candidates (icicle-delete-if pred2 candidates)))
    (if icicle-sort-function
        (sort new-candidates icicle-sort-function)
      new-candidates)))

(defun icicle-file-name-directory-w-default (file)
  "<span class="quote">Like `file-name-directory', but return `default-directory', not nil.
Does not treat backslash as a directory separator, even on MS Windows.</span>"
  (let ((escaped-file (subst-char-in-string ?\\ ?\a file)))
    (or (file-name-directory escaped-file) default-directory)))

(defun icicle-file-name-nondirectory (file)
  "<span class="quote">Like `file-name-nondirectory', but does not treat backslash specially.
That is, backslash is never treated as a directory separator.</span>"
  (let ((escaped-file (subst-char-in-string ?\\ ?\a file)))
    (subst-char-in-string ?\a ?\\ (file-name-nondirectory escaped-file))))

(defun icicle-file-name-input-p ()
  "<span class="quote">Return non-nil if expected input is a file name.
This is used, instead of variable `minibuffer-completing-file-name',
because we sometimes complete against an explicit alist of file names,
even in the overall context of file-name input.  In that case, we do
not want to use file-name completion.  An example of this is
completing against a history list of file names, using
`icicle-history'.</span>"
  <span class="linecomment">;;</span>
  <span class="linecomment">;; Note that some Emacs 20 code uses this as the equivalent of `minibuffer-completing-file-name':</span>
  <span class="linecomment">;; (memq minibuffer-completion-table '(read-file-name-internal read-directory-name-internal))</span>
  <span class="linecomment">;;</span>
  (and (symbolp minibuffer-completion-table) (stringp minibuffer-completion-predicate)))

(defun icicle-sort-dirs-last (name1 name2)
  "<span class="quote">Non-nil if NAME1 is a file and NAME2 is a dir, or `string-lessp'.
This can be used as the value for `icicle-sort-function'.
It is especially useful when `icicle-cycle-into-subdirs-flag' is
non-nil.  Otherwise, cycling into subdirectories is depth-first, not
breadth-first.</span>"
  (if (icicle-file-name-input-p)
      (let ((name1-dir-p (icicle-file-directory-p name1))
            (name2-dir-p (icicle-file-directory-p name2)))
        (if (or (and name1-dir-p name2-dir-p) <span class="linecomment">; Both or neither are directories.</span>
                (not (or name1-dir-p name2-dir-p)))
            (string-lessp name1 name2)  <span class="linecomment">; Compare equals.</span>
          name2-dir-p))                 <span class="linecomment">; Files come before directories.</span>
    (string-lessp name1 name2)))

(defun icicle-sort-case-insensitively (string1 string2)
  "<span class="quote">Like `string-lessp', but case is ignored, so `A' = `a' , and so on.</span>"
  (string-lessp (upcase string1) (upcase string2)))

(defun icicle-file-directory-p (file)
  "<span class="quote">Local, faster replacement for `file-directory-p'.
This does not do all of the file-handler processing that
`file-directory-p' does, so it is not a general replacement.</span>"
  (and (stringp file) (string= file (icicle-file-name-directory-w-default file))))

(defun icicle-minibuffer-contents ()
  "<span class="quote">Return the user minibuffer input as a string, without text-properties.</span>"
  (save-selected-window
    (select-window (minibuffer-window))
    (icicle-minibuffer-contents-from-minibuffer)))

(defun icicle-minibuffer-contents-from-minibuffer ()
  "<span class="quote">Return the user minibuffer input as a string, without text-properties.
The current buffer must be a minibuffer.</span>"
  (let ((input (if (fboundp 'minibuffer-contents-no-properties)
                   (minibuffer-contents-no-properties) <span class="linecomment">; e.g. Emacs 22</span>
                 (buffer-substring-no-properties (point-min) (point-max))))) <span class="linecomment">; e.g. Emacs 20</span>
    (when (and (icicle-file-name-input-p)
               (not (string= "<span class="quote"></span>" input))) <span class="linecomment">; Do nothing if user deleted everything in minibuffer.</span>
      (let ((last-char "<span class="quote"></span>"))
        (when (string= "<span class="quote">$</span>" (substring input (1- (length input)) (length input)))
          (setq last-char "<span class="quote">$</span>"
                input (substring input 0 (1- (length input)))))
        (setq input
              (save-match-data
                (concat (subst-char-in-string ?\a ?\\
                                              (condition-case nil
                                                  (substitute-in-file-name
                                                   (subst-char-in-string ?\\ ?\a input 'in-place))
                                                (error input))
                                              'in-place)
                        last-char)))))
    input))

(defun icicle-filter-wo-input (candidate)
  "<span class="quote">Filter completion CANDIDATE using regexps and predicate.
This filtering is in addition to matching user input.</span>"
  (and (or (not icicle-must-match-regexp)
           (string-match icicle-must-match-regexp candidate))
       (or (not icicle-must-not-match-regexp)
           (not (string-match icicle-must-not-match-regexp candidate)))
       (or (not icicle-must-pass-predicate)
           (funcall icicle-must-pass-predicate candidate))))

(defun icicle-update-completions ()
  "<span class="quote">Update completions list.  Update display too, if already shown.</span>"
  (setq icicle-completion-candidates
        (funcall (case icicle-last-completion-command
                   (icicle-prefix-complete (if (icicle-file-name-input-p)
                                               #'icicle-file-name-prefix-candidates
                                             #'icicle-prefix-candidates))
                   (t (if (icicle-file-name-input-p)
                          #'icicle-file-name-apropos-candidates
                        #'icicle-apropos-candidates)))
                 icicle-current-input))
  (when (get-buffer-window "<span class="quote">*Completions*</span>" 0)
    (icicle-display-candidates-in-Completions)))

(defun icicle-msg-maybe-in-minibuffer (format-string &rest args)
  "<span class="quote">Display FORMAT-STRING as a message.
If called with the minibuffer active, this is done using `message'.
Otherwise, it is done using `minibuffer-message'.</span>"
  (if (active-minibuffer-window)
      (minibuffer-message (apply #'format (concat "<span class="quote">  [</span>" format-string "<span class="quote">]</span>") args))
    (apply #'message format-string args)))

(defun icicle-delete-if (pred inlist)
  "<span class="quote">A copy of list INLIST with no elements that satisfy predicate PRED.</span>"
  (let ((outlist nil))
    (dolist (o inlist) (unless (funcall pred o) (push o outlist)))
    (nreverse outlist)))

(defun icicle-delete-if-not (pred inlist)
  "<span class="quote">A copy of list INLIST with only elements that satisfy predicate PRED.</span>"
  (let ((outlist nil))
    (dolist (o inlist) (when (funcall pred o) (push o outlist)))
    (nreverse outlist)))

(defun icicle-frames-on (buffer &optional frame) <span class="linecomment">; From `frames-on' in `frame-fns.el'.</span>
  "<span class="quote">List of all live frames showing BUFFER (a buffer or its name).
The optional FRAME argument is as for function `get-buffer-window'.</span>"
  (filtered-frame-list (function (lambda (fr) (get-buffer-window buffer fr)))))

(defun icicle-candidate-set-1 (set-fn msg)
  "<span class="quote">Helper function for defining Icicle set commands.
SET-FN is the function to apply to the current and saved candidates.
MESSAGE is the confirmation message to display in the minibuffer.</span>"
  (setq icicle-completion-candidates
        (funcall set-fn icicle-completion-candidates icicle-saved-completion-candidates))
  (if (null icicle-completion-candidates)
      (minibuffer-message "<span class="quote">  [EMPTY SET]</span>")
    (icicle-maybe-sort-and-strip-candidates)
    (icicle-scroll-or-update-Completions msg)))

(defun icicle-maybe-sort-and-strip-candidates ()
  "<span class="quote">Sort `icicle-completion-candidates'.  Strip ignored file names too.</span>"
  (if (icicle-file-name-input-p)
      (setq icicle-completion-candidates
            (icicle-sort-and-strip-ignored icicle-completion-candidates))
    (if icicle-sort-function
        (setq icicle-completion-candidates
              (sort icicle-completion-candidates icicle-sort-function)))))

(defun icicle-scroll-or-update-Completions (msg)
  "<span class="quote">Scroll *Completions* if this command was repeated; else update it.</span>"
  (if (get-buffer-window "<span class="quote">*Completions*</span>" 0)
      (if (eq last-command this-command)
          <span class="linecomment">;; User repeated the command.  Scroll window around.</span>
          (save-selected-window
            (select-window (get-buffer-window "<span class="quote">*Completions*</span>" 0))
            (condition-case nil
                (scroll-up nil)
              (end-of-buffer (goto-char (point-min)) (forward-line 3))))
        <span class="linecomment">;; User did something else (e.g. changed input).  Update the display.</span>
        (icicle-display-candidates-in-Completions)
        (minibuffer-message msg))
    <span class="linecomment">;; No window yet.  Show window.</span>
    (icicle-display-candidates-in-Completions)
    (minibuffer-message msg)))

(defun icicle-display-Completions ()
  "<span class="quote">Display *Completions* buffer.</span>"
  (let ((completions (all-completions "<span class="quote"></span>" minibuffer-completion-table
                                      minibuffer-completion-predicate
                                      icicle-ignore-space-prefix-flag)))
    (when (&gt; (length icicle-completion-candidates) icicle-incremental-completion-threshold)
      (message "<span class="quote">Displaying completion candidates...</span>"))
    (with-output-to-temp-buffer "<span class="quote">*Completions*</span>"
      (display-completion-list
       (if icicle-sort-function (sort completions icicle-sort-function) completions)))))

<span class="linecomment">;; From `cl-seq.el', function `union', without keyword treatment.</span>
<span class="linecomment">;; Same as `simple-set-union' in `misc-fns.el'.</span>
(defun icicle-set-union (list1 list2)
  "<span class="quote">Combine LIST1 and LIST2 using a set-union operation.
The result list contains all items that appear in either LIST1 or
LIST2.  This is a non-destructive function; it copies the data if
necessary.</span>"
  (cond ((null list1) list2)
        ((null list2) list1)
        ((equal list1 list2) list1)
        (t
         (or (&gt;= (length list1) (length list2))
             (setq list1 (prog1 list2 (setq list2 list1)))) <span class="linecomment">; Swap them.</span>
         (while list2
           (unless (member (car list2) list1)
               (setq list1 (cons (car list2) list1)))
           (setq list2 (cdr list2)))
         list1)))

<span class="linecomment">;; From `cl-seq.el', function `intersection', without keyword treatment.</span>
<span class="linecomment">;; Same as `simple-set-intersection' in `misc-fns.el'.</span>
(defun icicle-set-intersection (list1 list2)
  "<span class="quote">Set intersection of lists LIST1 and LIST2.
This is a non-destructive operation: it copies the data if necessary.</span>"
  (and list1 list2
       (if (equal list1 list2)
           list1
         (let ((result nil))
           (unless (&gt;= (length list1) (length list2))
             (setq list1 (prog1 list2 (setq list2 list1)))) <span class="linecomment">; Swap them.</span>
           (while list2
             (when (member (car list2) list1)
               (setq result (cons (car list2) result)))
             (setq list2 (cdr list2)))
           result))))

<span class="linecomment">;; From `cl-seq.el', function `set-difference', without keyword treatment.</span>
<span class="linecomment">;; Same as `simple-set-difference' in `misc-fns.el'.</span>
(defun icicle-set-difference (list1 list2 &rest cl-keys)
  "<span class="quote">Combine LIST1 and LIST2 using a set-difference operation.
The result list contains all items that appear in LIST1 but not LIST2.
This is non-destructive; it makes a copy of the data if necessary, to
avoid corrupting the original LIST1 and LIST2.</span>"
  (if (or (null list1) (null list2)) list1    (let ((result nil))
      (while list1
        (unless (member (car list1) list2) (setq result (cons (car list1) result)))
        (setq list1 (cdr list1)))
      result)))

<span class="linecomment">;; Note that initial and trailing spaces will not be noticeable.  That's OK.</span>
(defun icicle-highlight-complete-input ()
  "<span class="quote">Highlight minibuffer input, showing that it is a sole completion.
Overlay `icicle-complete-input-overlay' is created with `match' face,
unless it exists.</span>"
  (let ((case-fold-search completion-ignore-case)
        input-start-position)
    (save-excursion
      (goto-char (icicle-minibuffer-prompt-end))
      (setq input-start-position (point))
      (when (and (icicle-file-name-input-p) insert-default-directory)
        (search-forward (icicle-file-name-directory-w-default
                         (icicle-minibuffer-contents-from-minibuffer)))
        (setq input-start-position (point))) <span class="linecomment">; Skip directory.</span>
      (if icicle-complete-input-overlay <span class="linecomment">; Don't recreate if exists.</span>
          (move-overlay icicle-complete-input-overlay
                        input-start-position (point-max) (current-buffer))
        (setq icicle-complete-input-overlay (make-overlay input-start-position (point-max)))
        (overlay-put icicle-complete-input-overlay 'face 'icicle-complete-input)))))

(defun icicle-call-then-update-Completions (fn &rest args)
  "<span class="quote">Call FN with ARGS, then update *Completions* with input matches.</span>"
  (apply fn args)
  (setq icicle-current-input (icicle-minibuffer-contents-from-minibuffer))
  (icicle-highlight-initial-whitespace icicle-current-input)
  (when (and icicle-incremental-completion-p
             (or (get-buffer-window "<span class="quote">*Completions*</span>" 0) <span class="linecomment">; Already displayed.</span>
                 (not (eq t icicle-incremental-completion-p))) <span class="linecomment">; Display anyway.</span>
             (or (&gt; icicle-incremental-completion-threshold (length icicle-completion-candidates))
                 (sit-for icicle-incremental-completion-delay))) <span class="linecomment">; Wait if many candidates.</span>
    (let ((icicle-icompleting-p t))
      (setq this-command (if (eq 'icicle-prefix-complete icicle-last-completion-command)
                             'icicle-prefix-complete
                           'icicle-apropos-complete))
      (setq last-command fn)
      (funcall this-command)
      (run-hooks 'icicle-update-input-hook))))

(defun icicle-clear-minibuffer ()
  "<span class="quote">Delete all user input in the minibuffer.</span>"
  (if (fboundp 'delete-minibuffer-contents) (delete-minibuffer-contents) (erase-buffer)))

<span class="linecomment">;; Borrowed from `ps-print.el'</span>
(defun icicle-remove-duplicates (list)
  "<span class="quote">Copy of LIST with duplicate elements removed.  Tested with `equal'.</span>"
  (let ((tail list)
        new)
    (while tail
      (unless (member (car tail) new) (push (car tail) new))
      (pop tail))
    (nreverse new)))

(defun icicle-file-readable-p (file)
  "<span class="quote">Return non-nil if FILE (a string) names a readable file.</span>"
  (and (not (string= "<span class="quote"></span>" file)) (file-readable-p file) (not (file-directory-p file))))

(defun icicle-file-writable-p (file)
  "<span class="quote">Return non-nil if FILE (a string) names a writable file.</span>"
  (and (not (string= "<span class="quote"></span>" file)) (file-writable-p file) (not (file-directory-p file))))

(defun icicle-files-within (file-list accum)
  "<span class="quote">List of all files in FILE-LIST.
Directories in FILE-LIST are processed recursively to include their
files and the files in their subdirectories.  The list of files is
accumulated in ACCUM, which is used for recursive calls.</span>"
  (let ((res accum))
    (while file-list
      (if (file-directory-p (car file-list))
          (setq res (icicle-files-within (directory-files (car file-list) 'full icicle-re-no-dot)
                                         res))
        (setq res (cons (car file-list) res)))
      (pop file-list))
    res))

(defun icicle-delete-whitespace-from-string (string)
  "<span class="quote">Remove whitespace from STRING.</span>"
  (with-temp-buffer
    (insert string)
    (goto-char (point-min))
    (let (char)
      (while (not (eobp))
        (setq char (char-after))
        (if (memq char '(?\  ?\t ?\n)) (delete-char 1) (forward-char 1)))
      (buffer-string))))

(defun icicle-barf-if-outside-minibuffer ()
  "<span class="quote">Raise an error if `this-command' is called outside the minibuffer.</span>"
  (unless (eq (current-buffer) (window-buffer (minibuffer-window)))
    (error "<span class="quote">Command `%s' must be called from the minibuffer</span>" this-command)))

(defun icicle-barf-if-outside-Completions ()
  "<span class="quote">Raise an error if `this-command' is called outside buffer *Completions*.</span>"
  (unless (eq (current-buffer) (get-buffer "<span class="quote">*Completions*</span>"))
    (error "<span class="quote">Command `%s' must be called from *Completions* buffer</span>" this-command)))

(defun icicle-control-reminder-prompt ()
  "<span class="quote">If `icicle-reminder-prompt-flag' &gt; 0, then decrement it and save it.
Used in `kill-emacs-hook'.</span>"
  (when (and (wholenump icicle-reminder-prompt-flag) (&gt; icicle-reminder-prompt-flag 0))
    (condition-case nil                 <span class="linecomment">; Don't raise an error, since it's on `kill-emacs-hook.</span>
        (customize-save-variable 'icicle-reminder-prompt-flag (1- icicle-reminder-prompt-flag))
      (error nil))))

(defun icicle-expand-file-name (input dir)
  "<span class="quote">Expand file-name INPUT in directory DIR.
Similar to `expand-file-name', except:

 - If INPUT does not end in a slash, and DIR/INPUT is a directory,
   a trailing slash is added.

 - If INPUT ends in a slash, but DIR/INPUT is not a directory, then
   the trailing slash is removed.</span>"
  (let ((expanded-input (directory-file-name (expand-file-name input dir))))
    <span class="linecomment">;; Add trailing slash if input is a directory.</span>
    (when (file-directory-p expanded-input)
      (setq expanded-input (file-name-as-directory expanded-input)))
    expanded-input))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-fn)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-fn.el ends here</span></span></pre></pre></p></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" href="http://www.emacswiki.org/cgi-bin/emacs?action=edit;id=icicles-fn.el">Edit this page</a> <a class="history" href="http://www.emacswiki.org/cgi-bin/emacs?action=history;id=icicles-fn.el">View other revisions</a> <a class="admin" href="http://www.emacswiki.org/cgi-bin/emacs?action=admin;id=icicles-fn.el">Administration</a></span><span class="time"><br /> Last edited 2006-06-10 00:47 UTC by <a class="author" title="from inet-nc01-o.oracle.com" href="http://www.emacswiki.org/cgi-bin/emacs/DrewAdams">DrewAdams</a> <a class="diff" href="http://www.emacswiki.org/cgi-bin/emacs?action=browse;diff=2;id=icicles-fn.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" class="search">
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