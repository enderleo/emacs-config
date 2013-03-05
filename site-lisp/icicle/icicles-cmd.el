<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head><title>EmacsWiki: icicles-cmd.el</title><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,NOFOLLOW" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content and diff" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1;diff=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki including minor differences" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;showedit=1" /></head><body class="http://www.emacswiki.org/cgi-bin/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><form class="tiny" action="http://www.emacswiki.org/cgi-bin/emacs"><p>Search: <input type="text" name="search" size="20" /></p></form><h1><a title="Click to search for references to this page" href="http://www.emacswiki.org/cgi-bin/emacs?search=%22icicles-cmd%5c.el%22">icicles-cmd.el</a></h1></div><div class="content browse"><p><p><a href="http://www.emacswiki.org/cgi-bin/emacs/download/icicles-cmd.el">Download</a></p><pre class="source"><pre class="code"><span class="linecomment">;;; icicles-cmd.el --- Commands for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-cmd.el</span>
<span class="linecomment">;; Description: Commands for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 2005, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:25:04 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Fri Jun 09 17:18:40 2006 (-25200 Pacific Daylight Time)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 2647</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-cmd.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `apropos', `apropos-fn+var', `misc-fns'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  commands (and a few non-interactive functions used in commands).</span>
<span class="linecomment">;;  See `icicles.el' for documentation.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands defined here -</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   Commands to be used mainly at top level:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-add-buffer-candidate', `icicle-add-buffer-config',</span>
<span class="linecomment">;;    `icicle-add/update-saved-completion-set', `icicle-apropos',</span>
<span class="linecomment">;;    `icicle-apropos-command', `icicle-apropos-function',</span>
<span class="linecomment">;;    `icicle-apropos-option', `icicle-apropos-variable',</span>
<span class="linecomment">;;    `icicle-apropos-zippy', `icicle-bookmark', `icicle-buffer',</span>
<span class="linecomment">;;    `icicle-buffer-config', `icicle-buffer-list',</span>
<span class="linecomment">;;    `icicle-buffer-other-window', `icicle-color-theme',</span>
<span class="linecomment">;;    `icicle-compilation-search', `icicle-complete-thesaurus-entry',</span>
<span class="linecomment">;;    `icicle-clear-option', `icicle-customize-icicles-group',</span>
<span class="linecomment">;;    `icicle-dabbrev-completion', `icicle-delete-file',</span>
<span class="linecomment">;;    `icicle-dired-saved-file-candidates',</span>
<span class="linecomment">;;    `icicle-dired-saved-file-candidates-other-window', `icicle-doc',</span>
<span class="linecomment">;;    `icicle-execute-extended-command', `icicle-find-file',</span>
<span class="linecomment">;;    `icicle-find-file-other-window', `icicle-font',</span>
<span class="linecomment">;;    `icicle-frame-bg', `icicle-frame-fg', `icicle-fundoc',</span>
<span class="linecomment">;;    `icicle-imenu', `icicle-insert-string-from-variable',</span>
<span class="linecomment">;;    `icicle-insert-thesaurus-entry', `icicle-kill-buffer',</span>
<span class="linecomment">;;    `icicle-lisp-complete-symbol', `icicle-locate-file',</span>
<span class="linecomment">;;    `icicle-locate-file-other-window', `icicle-map' `icicle-mode',</span>
<span class="linecomment">;;    `icy-mode', `icicle-occur', `icicle-recent-file',</span>
<span class="linecomment">;;    `icicle-recent-file-other-window',</span>
<span class="linecomment">;;    `icicle-remove-buffer-candidate', `icicle-remove-buffer-config',</span>
<span class="linecomment">;;    `icicle-remove-saved-completion-set',</span>
<span class="linecomment">;;    `icicle-repeat-complex-command', `icicle-reset-option-to-nil',</span>
<span class="linecomment">;;    `icicle-save-string-to-variable', `icicle-search',</span>
<span class="linecomment">;;    `icicle-search-highlight-cleanup', `icicle-set-option-to-t',</span>
<span class="linecomment">;;    `icicle-toggle-ignored-extensions',</span>
<span class="linecomment">;;    `icicle-toggle-ignored-space-prefix',</span>
<span class="linecomment">;;    `icicle-toggle-incremental-completion',</span>
<span class="linecomment">;;    `icicle-toggle-regexp-quote', `icicle-toggle-sorting',</span>
<span class="linecomment">;;    `icicle-vardoc', `toggle-icicle-ignored-extensions',</span>
<span class="linecomment">;;    `toggle-icicle-ignored-space-prefix',</span>
<span class="linecomment">;;    `toggle-icicle-incremental-completion',</span>
<span class="linecomment">;;    `toggle-icicle-regexp-quote', `toggle-icicle-sorting'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   Commands to be used mainly in the minibuffer or *Completions*:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-abort-minibuffer-input', `icicle-apropos-complete',</span>
<span class="linecomment">;;    `icicle-apropos-complete-no-display',</span>
<span class="linecomment">;;    `icicle-apropos-complete-and-exit',</span>
<span class="linecomment">;;    `icicle-backward-delete-char-untabify',</span>
<span class="linecomment">;;    `icicle-backward-kill-paragraph',</span>
<span class="linecomment">;;    `icicle-backward-kill-sentence', `icicle-backward-kill-sexp',</span>
<span class="linecomment">;;    `icicle-backward-kill-word', `icicle-candidate-action',</span>
<span class="linecomment">;;    `icicle-candidate-set-complement',</span>
<span class="linecomment">;;    `icicle-candidate-set-define',</span>
<span class="linecomment">;;    `icicle-candidate-set-difference',</span>
<span class="linecomment">;;    `icicle-candidate-set-intersection',</span>
<span class="linecomment">;;    `icicle-candidate-set-retrieve',</span>
<span class="linecomment">;;    `icicle-candidate-set-retrieve-from-cache-file',</span>
<span class="linecomment">;;    `icicle-candidate-set-retrieve-from-variable',</span>
<span class="linecomment">;;    `icicle-candidate-set-save',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-to-cache-file',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-to-variable',</span>
<span class="linecomment">;;    `icicle-candidate-set-swap', `icicle-candidate-set-union',</span>
<span class="linecomment">;;    `icicle-choose-completion-string', `icicle-completion-help',</span>
<span class="linecomment">;;    `icicle-customize-apropos', `icicle-customize-apropos-faces',</span>
<span class="linecomment">;;    `icicle-customize-apropos-groups',</span>
<span class="linecomment">;;    `icicle-customize-apropos-options',</span>
<span class="linecomment">;;    `icicle-delete-backward-char', `icicle-delete-char',</span>
<span class="linecomment">;;    `icicle-delete-windows-on', `icicle-erase-minibuffer',</span>
<span class="linecomment">;;    `icicle-erase-minibuffer-or-history-element',</span>
<span class="linecomment">;;    `icicle-exit-minibuffer', `icicle-help-on-candidate',</span>
<span class="linecomment">;;    `icicle-history', `icicle-insert-string-at-point',</span>
<span class="linecomment">;;    `icicle-insert-string-from-variable', `icicle-isearch-complete',</span>
<span class="linecomment">;;    `icicle-keep-only-past-inputs', `icicle-kill-line',</span>
<span class="linecomment">;;    `icicle-kill-paragraph', `icicle-kill-region',</span>
<span class="linecomment">;;    `icicle-kill-region-wimpy', `icicle-kill-sentence',</span>
<span class="linecomment">;;    `icicle-kill-sexp', `icicle-kill-word',</span>
<span class="linecomment">;;    `icicle-minibuffer-complete-and-exit',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-action',</span>
<span class="linecomment">;;    `icicle-mouse-choose-completion',</span>
<span class="linecomment">;;    `icicle-move-to-next-completion',</span>
<span class="linecomment">;;    `icicle-move-to-previous-completion',</span>
<span class="linecomment">;;    `icicle-narrow-candidates', `icicle-next-apropos-candidate',</span>
<span class="linecomment">;;    `icicle-next-apropos-candidate-action', `icicle-next-line',</span>
<span class="linecomment">;;    `icicle-next-prefix-candidate',</span>
<span class="linecomment">;;    `icicle-next-prefix-candidate-action', `icicle-prefix-complete',</span>
<span class="linecomment">;;    `icicle-prefix-complete-no-display',</span>
<span class="linecomment">;;    `icicle-previous-apropos-candidate',</span>
<span class="linecomment">;;    `icicle-previous-apropos-candidate-action',</span>
<span class="linecomment">;;    `icicle-previous-line', `icicle-previous-prefix-candidate',</span>
<span class="linecomment">;;    `icicle-previous-prefix-candidate-action',</span>
<span class="linecomment">;;    `icicle-retrieve-candidates-from-set',</span>
<span class="linecomment">;;    `icicle-retrieve-last-input', `icicle-self-insert',</span>
<span class="linecomment">;;    `icicle-send-bug-report', `icicle-switch-to-Completions-buf',</span>
<span class="linecomment">;;    `icicle-switch-to-completions', `icicle-switch-to-minibuffer',</span>
<span class="linecomment">;;    `icicle-toggle-ignored-extensions',</span>
<span class="linecomment">;;    `icicle-toggle-ignored-space-prefix',</span>
<span class="linecomment">;;    `icicle-toggle-incremental-completion',</span>
<span class="linecomment">;;    `icicle-toggle-regexp-quote', `icicle-toggle-sorting',</span>
<span class="linecomment">;;    `toggle-icicle-ignored-extensions', `icicle-transpose-chars',</span>
<span class="linecomment">;;    `icicle-transpose-sexps', `icicle-transpose-words',</span>
<span class="linecomment">;;    `icicle-yank', `icicle-yank-pop', `old-completing-read',</span>
<span class="linecomment">;;    `old-choose-completion-string', `old-completion-setup-function',</span>
<span class="linecomment">;;    `old-exit-minibuffer', `old-minibuffer-complete-and-exit',</span>
<span class="linecomment">;;    `old-read-file-name', `old-switch-to-completions',</span>
<span class="linecomment">;;    `toggle-icicle-ignored-extensions',</span>
<span class="linecomment">;;    `toggle-icicle-ignored-space-prefix',</span>
<span class="linecomment">;;    `toggle-icicle-incremental-completion',</span>
<span class="linecomment">;;    `toggle-icicle-regexp-quote', `toggle-icicle-sorting'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non interactive functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-apropos-complete-1', `icicle-binary-option-p',</span>
<span class="linecomment">;;    `icicle-current-completion-in-Completions',</span>
<span class="linecomment">;;    `icicle-delete-file-or-directory',</span>
<span class="linecomment">;;    `icicle-execute-extended-command-1', `icicle-filter-alist',</span>
<span class="linecomment">;;    `icicle-find-file-other-window-w-wildcards',</span>
<span class="linecomment">;;    `icicle-find-file-w-wildcards', `icicle-imenu-in-buffer-p',</span>
<span class="linecomment">;;    `icicle-insert-input', `icicle-insert-thing',</span>
<span class="linecomment">;;    `icicle-isearch-resume', `icicle-kill-a-buffer',</span>
<span class="linecomment">;;    `icicle-map-action', `icicle-nb-of-candidate-in-Completions',</span>
<span class="linecomment">;;    `icicle-non-whitespace-string-p', `icicle-prefix-complete-1',</span>
<span class="linecomment">;;    `icicle-read-from-minibuf-nil-default', `icicle-search-action',</span>
<span class="linecomment">;;    `icicle-search-highlight-all-input-matches',</span>
<span class="linecomment">;;    `icicle-select-minibuffer-contents', `icicle-signum'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: These EMACS PRIMITIVES have been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `exit-minibuffer'              - Remove *Completion* window.</span>
<span class="linecomment">;;  `minibuffer-complete-and-exit' - Remove *Completion* window.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `dabbrev.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `dabbrev-completion' - Use Icicles completion when you repeat</span>
<span class="linecomment">;;                         (`M-C-/').</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `lisp.el' have</span>
<span class="linecomment">;;              been REDEFINED in Icicles:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `lisp-complete-symbol' - Selects *Completions* window even if on</span>
<span class="linecomment">;;                           another frame.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `mouse.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `mouse-choose-completion' - Return the number of the completion.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `simple.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `switch-to-completions' - Always selects *Completions* window.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `next-history-element' (advised only) -</span>
<span class="linecomment">;;     Depending on `icicle-init-value-flag', select minibuffer</span>
<span class="linecomment">;;     contents.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `repeat-complex-command' - Use `completing-read' to read command.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `cus-edit.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `customize-apropos', `customize-apropos-faces',</span>
<span class="linecomment">;;  `customize-apropos-groups', `customize-apropos-options' -</span>
<span class="linecomment">;;     Use `completing-read' to read the regexp.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Key bindings made by Icicles: See "Key Bindings" in `icicles.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2006/06/09 dadams</span>
<span class="linecomment">;;     Bug fixes: Picked up matching subdir as default dir, even if there were other matching files. </span>
<span class="linecomment">;;                  Thx to Andrey Zhdanov.</span>
<span class="linecomment">;;                Empty directory not treated as a match.</span>
<span class="linecomment">;;     icicle-(apropos|prefix)-complete-1:</span>
<span class="linecomment">;;       If input matches an empty directory, then use that directory as the sole completion.</span>
<span class="linecomment">;;       Do not expand file-name input before call icicle-file-name-(apropos|prefix)-candidates.</span>
<span class="linecomment">;;     icicle-retrieve-last-input: Use insert, not icicle-insert-input (no longer used).</span>
<span class="linecomment">;;                                 (Input backslashes reverted to slashes.)</span>
<span class="linecomment">;; 2006/06/08 dadams</span>
<span class="linecomment">;;     Bug fix: Could not complete after cycling file names.  Thx to Andrey Zhdanov.</span>
<span class="linecomment">;;     icicle-insert-input: Use icicle-expand-file-name.</span>
<span class="linecomment">;;     icicle-prefix-complete-1:</span>
<span class="linecomment">;;       Expand file-name input before call icicle-file-name-prefix-candidates.</span>
<span class="linecomment">;;       Expand icicle-last-completion-candidate if it is a directory name.</span>
<span class="linecomment">;; 2006/05/30 dadams</span>
<span class="linecomment">;;     icicle-erase-minibuffer-or-history-element: Fix for consecutive deletions.</span>
<span class="linecomment">;; 2006/05/26 dadams</span>
<span class="linecomment">;;     Added: icicle-erase-minibuffer-or-history-element.</span>
<span class="linecomment">;; 2006/05/19 dadams</span>
<span class="linecomment">;;     Renamed icicle-inhibit-reminder* to icicle-reminder*.</span>
<span class="linecomment">;;     icicle-narrow-candidates: Bind icicle-reminder-prompt-flag to nil, not t.</span>
<span class="linecomment">;; 2006/05/16 dadams</span>
<span class="linecomment">;;     Added: icicle-kill(-a)-buffer.</span>
<span class="linecomment">;; 2006/05/15 dadams</span>
<span class="linecomment">;;     Renamed: icicle-completion-nospace-flag to icicle-ignore-space-prefix-flag.</span>
<span class="linecomment">;;     icicle-candidate-set-complement: Put back icicle-ignore-space-prefix-flag.</span>
<span class="linecomment">;;     icicle-buffer(-other-window): Bind icicle-buffer-ignore-space-prefix-flag.</span>
<span class="linecomment">;;     Added: icicle-toggle-ignored-space-prefix, toggle-icicle-ignored-space-prefix.</span>
<span class="linecomment">;; 2006/05/13 dadams</span>
<span class="linecomment">;;     icicle-occur: Make icicle-search-main-regexp-others unnoticeable instead of</span>
<span class="linecomment">;;                   setting icicle-search-highlight-all-flag to nil.</span>
<span class="linecomment">;;     icicle-candidate-set-complement: Use nil, not icicle-completion-nospace-flag.</span>
<span class="linecomment">;;     Renamed: icicle-search-imenu to icicle-imenu,</span>
<span class="linecomment">;;              icicle-search-imenu-in-buffer-p to icicle-imenu-in-buffer-p.</span>
<span class="linecomment">;; 2006/05/12 dadams</span>
<span class="linecomment">;;     icicle-search-imenu: Remove unmatched submenus.  Error if no imenu for the buffer.</span>
<span class="linecomment">;;     Added: icicle-search-imenu-in-buffer-p.</span>
<span class="linecomment">;;     icicle-insert-string-at-point: Use icicle-barf-if-outside-minibuffer.</span>
<span class="linecomment">;;     Moved to icicles-fn.el: icicle-barf-if-outside-*.</span>
<span class="linecomment">;;     Moved some commands to minibuffer-cmds section from top-level cmds section.</span>
<span class="linecomment">;; 2006/05/09 dadams</span>
<span class="linecomment">;;     Added: icicle-customize-icicles-group, icicle-send-bug-report, icicle-customize-button.</span>
<span class="linecomment">;; 2006/04/30 dadams</span>
<span class="linecomment">;;     Added: icicle-map, icicle-map-action.</span>
<span class="linecomment">;;     icicle-filter-alist: Corrected and simplified.</span>
<span class="linecomment">;;     icicle-search: Corrected cand-nb adjustment when cycle with action fns.</span>
<span class="linecomment">;;     Renamed: icicle-search-action-fn to icicle-search-action,</span>
<span class="linecomment">;;              icicle-search-candidates to icicle-candidates-alist.</span>
<span class="linecomment">;; 2006/04/28 dadams</span>
<span class="linecomment">;;     icicle-retrieve-last-input, icicle-(apropos|prefix)-complete-1:</span>
<span class="linecomment">;;       Use icicle-highlight-initial-whitespace.</span>
<span class="linecomment">;; 2006/04/25 dadams</span>
<span class="linecomment">;;     icicle-completion-help: Bug fix: Emacs 21.3's help-insert-xref-button signature is different.</span>
<span class="linecomment">;; 2006/04/16 dadams</span>
<span class="linecomment">;;     Added: icicle-search-imenu.</span>
<span class="linecomment">;;     icicle-search: Bug fixes:</span>
<span class="linecomment">;;       Treat completion without cycling: error or singleton go-to.</span>
<span class="linecomment">;;       Only subtract one from candidate number for C- cycling, not regular cycling.</span>
<span class="linecomment">;; 2006/04/14 dadams</span>
<span class="linecomment">;;     icicle-search:</span>
<span class="linecomment">;;       Bug fix: Position was off by one.</span>
<span class="linecomment">;;       Highlight input match inside each main regexp match (or not).</span>
<span class="linecomment">;;         Bind icicle-update-input-hook and icicle-incremental-completion-flag.</span>
<span class="linecomment">;;       Extract code to define icicle-search-action-fn.</span>
<span class="linecomment">;;       Use icicle-search-candidates instead of local variable search-candidates.</span>
<span class="linecomment">;;       Respect icicle-search-cleanup-flag.</span>
<span class="linecomment">;;     Added: icicle-search-highlight-*, icicle-search-action-fn,</span>
<span class="linecomment">;;            icicle-(insert|save)-text-(from|to)-variable.</span>
<span class="linecomment">;;     Renamed icicle-search-refined-regexp to icicle-search-current-input.</span>
<span class="linecomment">;; 2006/04/09 dadams</span>
<span class="linecomment">;;     icicle-(apropos|prefix)-complete-1: Deal with icicle-arrows-respect-completion-type-flag.</span>
<span class="linecomment">;;     Moved here from icicles-fn.el: icicle-customize-apropos*, icicle-repeat-complex-command.</span>
<span class="linecomment">;; 2006/04/07 dadams</span>
<span class="linecomment">;;     icicle-search: Highlight all occurrences at once (like isearch highlighting, but not lazy).</span>
<span class="linecomment">;;                    Error if no match for initial regexp.</span>
<span class="linecomment">;;     icicle-occur: Bind icicle-search-highlight-all-flag to nil, so don't highlight each line.</span>
<span class="linecomment">;; 2006/04/02 dadms</span>
<span class="linecomment">;;     Added: icicle-toggle-regexp-quote, icicle-find-file*-w-wildcards.</span>
<span class="linecomment">;;     icicle-find-file*: Use icicle-find-file*-w-wildcards.</span>
<span class="linecomment">;; 2006/03/31 dadams</span>
<span class="linecomment">;;     icicle-search: Wrap action function with unwind-protect to select minibuffer frame.</span>
<span class="linecomment">;;                    Use completion-ignore-case when highlighting search hits.</span>
<span class="linecomment">;;                    Protect delete-overlay with overlayp.</span>
<span class="linecomment">;;                    Turn off region highlighting (so can see highlighting done here).</span>
<span class="linecomment">;;                    Removed sit-for-period argument.</span>
<span class="linecomment">;;     icicle-candidate-set-save: Use prin1 instead of pp.</span>
<span class="linecomment">;; 2006/03/27 dadams</span>
<span class="linecomment">;;     Added: icicle-occur.</span>
<span class="linecomment">;;     icicle-search: Highlight also match of current regexp, inside that of regexp arg.</span>
<span class="linecomment">;;                    Use new faces icicle-search-*-regexp.</span>
<span class="linecomment">;;     icicle-search, icicle-switch-to-Completions-buf, icicle-move-to-next-completion:</span>
<span class="linecomment">;;       Use new, generic icicle-place-overlay.</span>
<span class="linecomment">;;     Removed icicle-place-search-overlay.</span>
<span class="linecomment">;; 2006/03/26 dadams</span>
<span class="linecomment">;;     icicle-search: Use icicle-search-overlay.  Ensure don't match twice at same position.</span>
<span class="linecomment">;;                    Added regexp arg.  Use 0 as sit-for default.</span>
<span class="linecomment">;;     Added: icicle-place-search-overlay.</span>
<span class="linecomment">;; 2006/03/25 dadams</span>
<span class="linecomment">;;     icicle-prefix-complete: Minor bug fix: Don't save try-completion if not a string.</span>
<span class="linecomment">;;     icicle-candidate-set-(save|retrieve): Allow use of a variable to save/retrieve.</span>
<span class="linecomment">;;     Added: icicle-candidate-set-(retrieve-from|save-to)-variable, icicle-*-complete-no-display,</span>
<span class="linecomment">;;            icicle-prefix-complete-1.</span>
<span class="linecomment">;;     icicle-apropos-complete-1: Added no-display-p optional arg.</span>
<span class="linecomment">;;     Use no-display-p arg in calls to icicle-display-candidates-in-Completions.</span>
<span class="linecomment">;;     icicle-candidate-set-(retrieve-from|save-to)-cache-file: Pass a consp, not t.</span>
<span class="linecomment">;;     icicle-candidate-set-retrieve: Don't display *Completions*.</span>
<span class="linecomment">;; 2006/03/24 dadams</span>
<span class="linecomment">;;     Added icicle-delete-char.</span>
<span class="linecomment">;; 2006/03/23 dadams</span>
<span class="linecomment">;;     icicle-candidate-set-define: Rewrote.  Can also use at top level.</span>
<span class="linecomment">;;       Error if wrong result type.  Sort result.  Use display-completion-list and</span>
<span class="linecomment">;;       icicle-narrow-candidates (unless at top level).</span>
<span class="linecomment">;;     icicle-narrow-candidates: Can call from top-level (but not interactively).</span>
<span class="linecomment">;;     icicle-candidate-set-complement: Use icicle-maybe-sort-and-strip-candidates.</span>
<span class="linecomment">;;     Mention in doc strings of minibuffer and *Completions* functions: where, key.</span>
<span class="linecomment">;; 2006/03/22 dadams</span>
<span class="linecomment">;;     icicle-find-file*: Use default-directory as default value, so opens directory on empty input.</span>
<span class="linecomment">;;     icicle-prefix-complete:</span>
<span class="linecomment">;;       Save icicle-current-regexp-input.</span>
<span class="linecomment">;;       Set icicle-current-input to common prefix.  Use it everywhere here.</span>
<span class="linecomment">;;     Calls to icicle-display-candidates-in-Completions: no root arg now.</span>
<span class="linecomment">;; 2006/03/21 dadams</span>
<span class="linecomment">;;     icicle-insert-input: Bug fix: Use directory of input, not default-directory.</span>
<span class="linecomment">;;                                   Append a slash if input itself is a directory.</span>
<span class="linecomment">;; 2006/03/20 dadams</span>
<span class="linecomment">;;     icicle-retrieve-last-input: Insert icicle-current-regexp-input if repeat C-l.</span>
<span class="linecomment">;;     Added: icicle-insert-input.</span>
<span class="linecomment">;; 2006/03/19 dadams</span>
<span class="linecomment">;;     icicle-apropos-complete-1: Call icicle-save-or-restore-input with non-nil regexp-p arg.</span>
<span class="linecomment">;; 2006/03/17 dadams</span>
<span class="linecomment">;;     Added: icicle-add/update-saved-completion-set, icicle-remove-saved-completion-set,</span>
<span class="linecomment">;;            icicle-retrieve-candidates-from-set.</span>
<span class="linecomment">;;     Removed: icicle-cache-file.</span>
<span class="linecomment">;;     icicle-candidate-set-retrieve: Read candidates set and use its cache file.</span>
<span class="linecomment">;;                                    Enable recursive minibuffers.</span>
<span class="linecomment">;;     icicle-candidate-set-save: Read candidates set and cache-file names.</span>
<span class="linecomment">;;                                Use icicle-add/update-saved-completion-set.</span>
<span class="linecomment">;;     icicle-barf-if-outside-minibuffer: Move interactive test to calling functions.</span>
<span class="linecomment">;;     icicle-files-within: Moved to icicle-fn.el.</span>
<span class="linecomment">;; 2006/03/16 dadams</span>
<span class="linecomment">;;     Added: icicle*-saved-completion-set.</span>
<span class="linecomment">;; 2006/03/14 dadams</span>
<span class="linecomment">;;     icicle-narrow-candidates: Handle no-catch error.  Don't use icicle-icicle-completing-p.</span>
<span class="linecomment">;;     icicle-candidate-set-complement:</span>
<span class="linecomment">;;       Do what we do in icicle-candidate-set-retrieve: call icicle-narrow-candidates.</span>
<span class="linecomment">;;     icicle-candidate-set-(retrieve|complement): Msg when display.</span>
<span class="linecomment">;;     icicle-(apropos|prefix)-complete-1:</span>
<span class="linecomment">;;       Removed test for last-command = icicle-candidate-set-complement.</span>
<span class="linecomment">;; 2006/03/13 dadams</span>
<span class="linecomment">;;     Added: icicle-candidate-set-(retrieve-from|save-to)-cache-file.</span>
<span class="linecomment">;;     icicle-candidate-set-(retrieve|save): C-u uses cache file.</span>
<span class="linecomment">;; 2006/03/12 dadams</span>
<span class="linecomment">;;     Added: icicle-dired-saved-file-candidates(-other-window), icicle-locate-file*,</span>
<span class="linecomment">;;            icicle-files-within.</span>
<span class="linecomment">;; 2006/03/11 dadams</span>
<span class="linecomment">;;     icicle-find-file*, icicle-delete-file*:</span>
<span class="linecomment">;;       Reverted to simple form (moved directory control to icicles-mac.el).</span>
<span class="linecomment">;;     icicle-keep-only-past-inputs: Expand file name relative to directory of last input.</span>
<span class="linecomment">;; 2006/03/10 dadams</span>
<span class="linecomment">;;     icicle-find-file*, icicle-delete-file*: Expand file name relative to directory of last input.</span>
<span class="linecomment">;;     Renamed icicle-minibuffer-contents to icicle-minibuffer-contents-from-minibuffer.</span>
<span class="linecomment">;; 2006/03/09 dadams</span>
<span class="linecomment">;;     icicle-barf-if-outside-*: Removed argument - use this-command instead.</span>
<span class="linecomment">;; 2006/03/08 dadams</span>
<span class="linecomment">;;     icicle-bookmark: Use default value, not init value, for completing-read.</span>
<span class="linecomment">;; 2006/03/07 dadams</span>
<span class="linecomment">;;     icicle-doc: Save table in minibuffer-completion-table, so can access via C-RET too.</span>
<span class="linecomment">;;     icicle-insert-thesaurus-entry, icicle-*doc:</span>
<span class="linecomment">;;       Removed binding of icicle-incremental-completion-flag to nil.</span>
<span class="linecomment">;;     Added: icicle-barf-if-outside-(minibuffer|Completions).  Use in appropriate commands.</span>
<span class="linecomment">;;     Added: icicle-non-whitespace-string-p.  Use in icicle-*doc.</span>
<span class="linecomment">;; 2006/03/06 dadams</span>
<span class="linecomment">;;     Update doc strings of *-thesaurus*.</span>
<span class="linecomment">;; 2006/03/05 dadams</span>
<span class="linecomment">;;     Added: icicle-toggle-incremental-completion, toggle-icicle-incremental-completion.</span>
<span class="linecomment">;; 2006/03/03 dadams</span>
<span class="linecomment">;;     icicle-*doc: Clarified doc strings.  Updated prompts.</span>
<span class="linecomment">;;     Added: icicle-help-button.  Use in icicle-completion-help.</span>
<span class="linecomment">;; 2006/03/02 dadams</span>
<span class="linecomment">;;     icicle-insert-thesaurus-entry, icicle-complete-thesaurus-entry:</span>
<span class="linecomment">;;       Use synonyms-ensure-synonyms-read-from-cache.  Clarified doc strings.</span>
<span class="linecomment">;;     icicle-complete-thesaurus-entry: Error if no word at point.  Corrected looking-at regexp.</span>
<span class="linecomment">;; 2006/03/01 dadams</span>
<span class="linecomment">;;     Added: icicle-insert-thesaurus-entry, icicle-insert-thesaurus-entry-cand-fn,</span>
<span class="linecomment">;;            icicle-complete-thesaurus-entry.</span>
<span class="linecomment">;;     icicle-(previous|next)-(apropos|prefix)-candidate-action: Wrap in save-excursion.</span>
<span class="linecomment">;;     Use icicle-clear-minibuffer instead of icicle-erase-minibuffer non-interactively.</span>
<span class="linecomment">;;     icicle-erase-minibuffer: Use icicle-call-then-update-Completions.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or</span>
<span class="linecomment">;; modify it under the terms of the GNU General Public License as</span>
<span class="linecomment">;; published by the Free Software Foundation; either version 2, or (at</span>
<span class="linecomment">;; your option) any later version.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(when (&lt; emacs-major-version 21) (eval-when-compile (require 'cl))) <span class="linecomment">;; dolist, pop, push</span>
                                                                    <span class="linecomment">;; for Emacs &lt; 20: when, unless</span>

(require 'misc-fns nil t)   <span class="linecomment">;; (no error if not found): another-buffer</span>
(require 'apropos-fn+var nil t) <span class="linecomment">;; (no error if not found): apropos-command, apropos-function,</span>
                                <span class="linecomment">;; apropos-option, apropos-variable</span>

<span class="linecomment">;; Byte-compiling this file, you will likely get some error or warning</span>
<span class="linecomment">;; messages. All of the following are benign.  They are due to</span>
<span class="linecomment">;; differences between different versions of Emacs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Compiling in Emacs 20:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; describe-mode called with 1 argument, but accepts only 0</span>
<span class="linecomment">;; The following functions are not known to be defined:</span>
<span class="linecomment">;;   minibuffer-prompt-end, delete-minibuffer-contents, recentf-mode</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Warnings about various functions not known to be defined.</span>
<span class="linecomment">;; Warnings about references and assignments to dabbrev-* variables.</span>
<span class="linecomment">;; You might also get warnings about function icicle-apropos-zippy.</span>


<span class="linecomment">;;; Defvars to quiet byte-compilers (Emacs 20 - 22)</span>

(defvar recentf-list)
(defvar yow-file)
(defvar yow-load-message)
(defvar yow-after-load-message)
(defvar cookie-cache)

(defvar icicle-track-pt) <span class="linecomment">;; Defined in icicle-insert-thesaurus-entry</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>



<span class="linecomment">;;; Commands -----------------------------------------------</span>


<span class="linecomment">;;; Redefined standard commands.............................</span>





<span class="linecomment">;;; REPLACE ORIGINAL `dabbrev-completion' defined in `dabbrev.el',</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Selects *Completions* window even if on another frame.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-dabbrev-completion)
(fset 'old-dabbrev-completion (symbol-function 'dabbrev-completion)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dabbrev-completion (&optional arg) <span class="linecomment">; Bound to `M-C-/' globally.</span>
  "<span class="quote">Completion on current word.
Like \\[dabbrev-expand], but finds all expansions in the current buffer
and presents suggestions for completion.

With a prefix argument, it searches all buffers accepted by
`dabbrev-friend-buffer-function', to find the completions.

If the prefix argument is 16 (which comes from `C-u C-u'), then it
searches *all* buffers.

With no prefix argument, it reuses an old completion list
if there is a suitable one already.</span>"
  (interactive "<span class="quote">*P</span>")
  (unless (featurep 'dabbrev)
    (unless (require 'dabbrev nil t) (error "<span class="quote">Library `dabbrev' not found</span>"))
    (icicle-mode 1))                    <span class="linecomment">; Redefine `dabbrev-completion' to Icicles version.</span>
  (dabbrev--reset-global-variables)
  (let* ((dabbrev-check-other-buffers (and arg t))
         (dabbrev-check-all-buffers (and arg (= (prefix-numeric-value arg) 16)))
         (abbrev (dabbrev--abbrev-at-point))
         (ignore-case-p (and (if (eq dabbrev-case-fold-search 'case-fold-search)
                                 case-fold-search
                               dabbrev-case-fold-search)
                             (or (not dabbrev-upcase-means-case-search)
                                 (string= abbrev (downcase abbrev)))))
         (my-obarray dabbrev--last-obarray)
         init)
    <span class="linecomment">;; If new abbreviation to expand, then expand it.</span>
    (save-excursion
      (unless (and (null arg)
                   my-obarray
                   (or (eq dabbrev--last-completion-buffer (current-buffer))
                       (and (window-minibuffer-p (selected-window))
                            (eq dabbrev--last-completion-buffer
                                (dabbrev--minibuffer-origin))))
                   dabbrev--last-abbreviation
                   (&gt;= (length abbrev) (length dabbrev--last-abbreviation))
                   (string= dabbrev--last-abbreviation
                            (substring abbrev 0 (length dabbrev--last-abbreviation)))
                   (setq init (try-completion abbrev my-obarray)))
        (setq dabbrev--last-abbreviation abbrev)
        (let ((completion-list (dabbrev--find-all-expansions abbrev ignore-case-p))
              (completion-ignore-case ignore-case-p))
          <span class="linecomment">;; Make an obarray with all expansions</span>
          (setq my-obarray (make-vector (length completion-list) 0))
          (unless (&gt; (length my-obarray) 0)
            (error "<span class="quote">No dynamic expansion for \</span>"%s\"<span class="quote"> found%s</span>" abbrev
                   (if dabbrev--check-other-buffers "<span class="quote"></span>" "<span class="quote"> in this-buffer</span>")))
          (dolist (string completion-list)
            (cond ((or (not ignore-case-p) (not dabbrev-case-replace))
                   (intern string my-obarray))
                  ((string= abbrev (upcase abbrev))
                   (intern (upcase string) my-obarray))
                  ((string= (substring abbrev 0 1) (upcase (substring abbrev 0 1)))
                   (intern (capitalize string) my-obarray))
                  (t (intern (downcase string) my-obarray))))
          (setq dabbrev--last-obarray my-obarray)
          (setq dabbrev--last-completion-buffer (current-buffer))
          <span class="linecomment">;; Find the longest common string.</span>
          (setq init (try-completion abbrev my-obarray)))))
    <span class="linecomment">;; Let the user choose between the expansions</span>
    (unless (stringp init) (setq init abbrev))
    (cond
      <span class="linecomment">;; Complete text up through the common root.</span>
      ((and (not (string-equal init "<span class="quote"></span>"))
            (not (string-equal (downcase init) (downcase abbrev))))
       (if (&gt; (length (all-completions init my-obarray)) 1)
           (message "<span class="quote">Use `%s' again to complete further</span>"
                    (key-description (this-command-keys)))
         (message "<span class="quote">Completed (no other completions)</span>"))
       (if (&lt; emacs-major-version 21)
           (dabbrev--substitute-expansion nil abbrev init)
         (dabbrev--substitute-expansion nil abbrev init nil))
       (when (window-minibuffer-p (selected-window)) (message nil))) <span class="linecomment">; $$$ NEEDED?</span>
      (t
       <span class="linecomment">;; String is a common root already.  Use Icicles completion.</span>
       (message "<span class="quote">Making completion list...</span>")
       (search-backward abbrev)
       (replace-match "<span class="quote"></span>")
       (condition-case nil
           (let* ((icicle-show-Completions-initially-flag t)
                  (icicle-incremental-completion-p 'display)
                  (minibuffer-completion-table my-obarray)
                  (choice (completing-read "<span class="quote">Complete: </span>" my-obarray nil t init nil init)))
             (when choice (insert choice)))
         (quit (insert abbrev)))))))


<span class="linecomment">;;; REPLACE ORIGINAL `exit-minibuffer' (built-in function),</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Removes *Completion* window.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-exit-minibuffer)
(fset 'old-exit-minibuffer (symbol-function 'exit-minibuffer)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-exit-minibuffer ()        <span class="linecomment">; Bound to `C-m' and `\n' in minibuffer.</span>
  "<span class="quote">Terminate this minibuffer argument.
Removes *Completions* window.</span>"
  (interactive)
  (icicle-delete-windows-on "<span class="quote">*Completions*</span>")
  (old-exit-minibuffer))


<span class="linecomment">;;; REPLACE ORIGINAL `lisp-complete-symbol' defined in `lisp.el',</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Selects *Completions* window even if on another frame.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-lisp-complete-symbol)
(fset 'old-lisp-complete-symbol (symbol-function 'lisp-complete-symbol)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-lisp-complete-symbol ()   <span class="linecomment">; Bound to `ESC TAB' globally.</span>
  "<span class="quote">Complete the Lisp symbol preceding point against known Lisp symbols.
If no characters can be completed, display a list of possible completions.
Repeating the command at that point scrolls the list.

The context determines which symbols are considered.
If the symbol starts just after an open-parenthesis, only symbols
with function definitions are considered.  Otherwise, all symbols with
function definitions, values or properties are considered.</span>"
  (interactive)
  (let* ((end (point))
	 (buffer-syntax (syntax-table))
	 (beg (unwind-protect
		  (save-excursion
		    (set-syntax-table emacs-lisp-mode-syntax-table)
		    (backward-sexp 1)
		    (while (= (char-syntax (following-char)) ?\')
		      (forward-char 1))
		    (point))
		(set-syntax-table buffer-syntax)))
	 (pattern (buffer-substring beg end))
	 (predicate
	  (if (eq (char-after (1- beg)) ?\()
	      'fboundp
	    (function (lambda (sym)
			(or (boundp sym) (fboundp sym)
			    (symbol-plist sym))))))
         (enable-recursive-minibuffers (active-minibuffer-window))
         (completion (completing-read "<span class="quote">Complete Lisp symbol: </span>"
                                      obarray predicate t pattern minibuffer-history)))
    (delete-region beg end)
    (insert completion)))


<span class="linecomment">;;; REPLACE ORIGINAL `minibuffer-complete-and-exit' (built-in function),</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Removes *Completion* window.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-minibuffer-complete-and-exit)
(fset 'old-minibuffer-complete-and-exit (symbol-function 'minibuffer-complete-and-exit)))

<span class="linecomment">;; Bound to `C-m' and `\n' in `minibuffer-local-must-match-map'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-minibuffer-complete-and-exit ()
  "<span class="quote">If the minibuffer contents is a valid completion, then exit.
Otherwise try to complete it.  If completion leads to a valid completion,
a repetition of this command will exit.
Removes *Completions* window.</span>"
  (interactive)
  (save-excursion (icicle-delete-windows-on "<span class="quote">*Completions*</span>"))
  (old-minibuffer-complete-and-exit))


<span class="linecomment">;;; REPLACE ORIGINAL `mouse-choose-completion' in `mouse.el',</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Return the number of the completion.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-mouse-choose-completion)
(fset 'old-mouse-choose-completion (symbol-function 'mouse-choose-completion)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-choose-completion (event) <span class="linecomment">; Bound to `mouse-2' in `completion-list-mode-map'.</span>
  "<span class="quote">Click a completion candidate in buffer `*Completions*', to choose it.
Returns the number of the candidate - 0 for first, 1 for second, ...</span>"
  (interactive "<span class="quote">e</span>")
  <span class="linecomment">;; Give temporary modes such as isearch a chance to turn off.</span>
  (run-hooks 'mouse-leave-buffer-hook)
  (let* ((buffer (window-buffer))
         (orig-buffer buffer)
         choice base-size)
    (save-excursion
      (set-buffer (window-buffer (posn-window (event-start event))))
      (when completion-reference-buffer (setq buffer completion-reference-buffer))
      (setq base-size completion-base-size)
      (save-excursion
        (goto-char (posn-point (event-start event)))
        (let (beg end)
          (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
            (setq end (point) beg (1+ (point))))
          (unless beg (error "<span class="quote">No completion here</span>"))
          (setq beg    (previous-single-property-change beg 'mouse-face)
                end    (or (next-single-property-change end 'mouse-face) (point-max))
                choice (buffer-substring beg end)))))
    (if (eq orig-buffer (get-buffer "<span class="quote">*Completions*</span>"))
        (icicle-delete-windows-on "<span class="quote">*Completions*</span>")
      (save-selected-window (icicle-delete-windows-on "<span class="quote">*Completions*</span>")))
    (setq icicle-candidate-nb
          (icicle-nb-of-candidate-in-Completions (posn-point (event-start event))))
    (choose-completion-string choice buffer base-size)))

(defun icicle-nb-of-candidate-in-Completions (position)
  "<span class="quote">Return number of completion candidate at POSITION in *Completions*.</span>"
  (let ((compl-buf (get-buffer "<span class="quote">*Completions*</span>")))
    (unless compl-buf (error "<span class="quote">No *Completions* buffer</span>"))
    (save-window-excursion
      (set-buffer compl-buf)
      (let ((cand-nb 0)
            last-pos)
        (goto-char position)
        (setq last-pos (point))
        (while (&lt;= (point) last-pos)
          (icicle-move-to-next-completion -1 t)
          (setq cand-nb (1+ cand-nb))
          (setq last-pos (min last-pos (point))))
        (set-buffer-modified-p nil)
        (1- cand-nb)))))


<span class="linecomment">;;; REPLACE ORIGINAL `switch-to-completions' defined in `simple.el',</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Selects *Completions* window even if on another frame.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-switch-to-completions)
(fset 'old-switch-to-completions (symbol-function 'switch-to-completions)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-switch-to-completions ()  <span class="linecomment">; Bound to `insert' in minibuffer.</span>
  "<span class="quote">Select the completion list window, *Completions*.</span>"
  (interactive)
  <span class="linecomment">;; Make sure we have a completions window.</span>
  (or (get-buffer-window "<span class="quote">*Completions*</span>") (minibuffer-completion-help))
  (let ((window (get-buffer-window "<span class="quote">*Completions*</span>" 0))) <span class="linecomment">; Added 0 arg.</span>
    (when window
      (select-window window)
      (goto-char (point-min))
      (forward-line 3))))

(defun icicle-select-minibuffer-contents ()
  "<span class="quote">Select minibuffer contents and leave point at its beginning.</span>"
  (set-mark (if (eq 'preselect-start icicle-init-value-flag) (point-max) (point-min)))
  (goto-char (if (fboundp 'minibuffer-prompt-end)
                 (minibuffer-prompt-end)
               (if (eq 'preselect-start icicle-init-value-flag) (point-min) (point-max)))))

(defadvice next-history-element (after icicle-select-minibuffer-contents activate)
  "<span class="quote">Select minibuffer contents and leave point at its beginning.</span>"
  (when (and icicle-mode (memq icicle-init-value-flag '(preselect-start preselect-end)))
    (icicle-select-minibuffer-contents)
    (setq deactivate-mark nil)))

<span class="linecomment">;;; The branch that deletes a history element is based on Juri Linkov's</span>
<span class="linecomment">;;; `delete-history-element', proposed for Emacs 22 but rejected by RMS.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-erase-minibuffer-or-history-element () <span class="linecomment">; Bound to `M-k' in minibuffer.</span>
  "<span class="quote">`icicle-erase-minibuffer' or, if using history, delete history element.</span>"
  (interactive)
  (if (not (memq last-command '(previous-history-element next-history-element
                                icicle-erase-minibuffer-or-history-element
                                previous-matching-history-element next-matching-history-element)))
      (icicle-erase-minibuffer)
    (let* ((curr-pos (1- minibuffer-history-position))
           (current (nth curr-pos
                         (symbol-value minibuffer-history-variable))))
      (cond ((= minibuffer-history-position 1)
             (set minibuffer-history-variable (cdr (symbol-value minibuffer-history-variable))))
            ((&gt; minibuffer-history-position 1)
             (setcdr (nthcdr (- minibuffer-history-position 2)
                             (symbol-value minibuffer-history-variable))
                     (nthcdr minibuffer-history-position
                             (symbol-value minibuffer-history-variable)))))
      (condition-case nil
          (cond ((memq last-command '(next-history-element next-matching-history-element))
                 (next-history-element 1)
                 (setq this-command 'next-history-element))
                ((memq last-command '(previous-history-element previous-matching-history-element))
                 (next-history-element 1)
                 (previous-history-element 1)
                 (setq this-command 'previous-history-element)))
        (error (condition-case nil
                   (cond ((memq last-command '(next-history-element next-matching-history-element))
                          (previous-history-element 1)
                          (setq this-command 'previous-history-element))
                         ((memq last-command
                                '(previous-history-element previous-matching-history-element))
                          (next-history-element 1)
                          (setq this-command 'next-history-element)))
                 (error nil))))
      (when (wholenump curr-pos)
        (icicle-msg-maybe-in-minibuffer "<span class="quote">Deleted `%s'</span>" current)))))



<span class="linecomment">;;; REPLACE ORIGINAL `customize-apropos' defined in `cus-edit.el',</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-customize-apropos)
(fset 'old-customize-apropos (symbol-function 'customize-apropos)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos (regexp &optional all)
  "<span class="quote">Customize all user options matching REGEXP.
If ALL is `options', include only options.
If ALL is `faces', include only faces.
If ALL is `groups', include only groups.
If ALL is t (interactively, with prefix arg), include options which
  are not user-settable, as well as faces and groups.

Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.</span>"
  (interactive
   (let ((pref-arg current-prefix-arg))
     (list (completing-read "<span class="quote">Customize (regexp): </span>" obarray
                            (lambda (symbol)
                              (or (get symbol 'custom-group)
                                  (custom-facep symbol)
                                  (and (boundp symbol)
                                       (or (get symbol 'saved-value)
                                           (custom-variable-p symbol)
                                           (if (null pref-arg)
                                               (user-variable-p symbol)
                                             (get symbol 'variable-documentation)))))))
           pref-arg)))
  (let ((found nil))
    (mapatoms (lambda (symbol)
                (when (string-match regexp (symbol-name symbol))
                  (when (and (not (memq all '(faces options))) <span class="linecomment">; groups or t</span>
                             (get symbol 'custom-group))
                    (push (list symbol 'custom-group) found))
                  (when (and (not (memq all '(options groups))) <span class="linecomment">; faces or t</span>
                             (custom-facep symbol))
                    (push (list symbol 'custom-face) found))
                  (when (and (not (memq all '(groups faces))) <span class="linecomment">; options or t</span>
                             (boundp symbol)
                             (or (get symbol 'saved-value)
                                 (custom-variable-p symbol)
                                 (if (memq all '(nil options))
                                     (user-variable-p symbol)
                                   (get symbol 'variable-documentation))))
                    (push (list symbol 'custom-variable) found)))))
    (if (not found)
        (error "<span class="quote">No matches</span>")
      (custom-buffer-create (custom-sort-items found t custom-buffer-order-groups)
                            "<span class="quote">*Customize Apropos*</span>"))))



<span class="linecomment">;;; REPLACE ORIGINAL `customize-apropos-faces' defined in `cus-edit.el',</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-customize-apropos-faces)
(fset 'old-customize-apropos-faces (symbol-function 'customize-apropos-faces)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos-faces (regexp)
  "<span class="quote">Customize all user faces matching REGEXP.
Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.</span>"
  (interactive
   (list (completing-read "<span class="quote">Customize faces (regexp): </span>" obarray 'custom-facep)))
  (customize-apropos regexp 'faces))



<span class="linecomment">;;; REPLACE ORIGINAL `customize-apropos-groups' defined in `cus-edit.el',</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-customize-apropos-groups)
(fset 'old-customize-apropos-groups (symbol-function 'customize-apropos-groups)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos-groups (regexp)
  "<span class="quote">Customize all user groups matching REGEXP.
Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.</span>"
  (interactive
   (list (completing-read "<span class="quote">Customize groups (regexp): </span>" obarray
                          (lambda (symbol) (get symbol 'custom-group)))))
  (customize-apropos regexp 'groups))



<span class="linecomment">;;; REPLACE ORIGINAL `customize-apropos-options' defined in `cus-edit.el',</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-customize-apropos-options)
(fset 'old-customize-apropos-options (symbol-function 'customize-apropos-options)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos-options (regexp &optional arg)
  "<span class="quote">Customize all user options matching REGEXP.
With prefix arg, include options which are not user-settable.

Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.</span>"
  (interactive
   (let ((pref-arg current-prefix-arg))
     (list (completing-read "<span class="quote">Customize options (regexp): </span>" obarray
                            (lambda (symbol)
                              (and (boundp symbol)
                                   (or (get symbol 'saved-value)
                                       (custom-variable-p symbol)
                                       (if (null pref-arg)
                                           (user-variable-p symbol)
                                         (get symbol 'variable-documentation))))))
           pref-arg)))
  (customize-apropos regexp (or arg 'options)))



<span class="linecomment">;;; REPLACE ORIGINAL `repeat-complex-command' defined in `simple.el',</span>
<span class="linecomment">;;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Uses `completing-read' to read the command to repeat, letting you</span>
<span class="linecomment">;;; use `S-TAB' and `TAB' to see the history list and `C-,' to toggle</span>
<span class="linecomment">;;; sorting that display.</span>
<span class="linecomment">;;;</span>
(or (fboundp 'old-repeat-complex-command)
(fset 'old-repeat-complex-command (symbol-function 'repeat-complex-command)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-repeat-complex-command (arg)
  "<span class="quote">Edit and re-evaluate last complex command, or ARGth from last.
A complex command is one which used the minibuffer.
The command is placed in the minibuffer as a Lisp form for editing.
The result is executed, repeating the command as changed.
If the command has been changed or is not the most recent previous command
it is added to the front of the command history.
You can use the minibuffer history commands \\&lt;minibuffer-local-map&gt;\\[next-history-element] and \
\\[previous-history-element]
to get different commands to edit and resubmit.

Use `S-TAB', [next], and [prior], to match regexp input - this gives
you the functionality of `repeat-matching-complex-command'.</span>"
  (interactive "<span class="quote">p</span>")
  (let ((elt (nth (1- arg) command-history))
        (icicle-sort-function nil)
        newcmd)
    (if elt
        (progn
          (setq newcmd
                (let ((print-level nil)
                      (minibuffer-history-position arg)
                      (minibuffer-history-sexp-flag (1+ (minibuffer-depth))))
                  (unwind-protect
                      (read (completing-read
                             "<span class="quote">Redo: </span>" (mapcar (lambda (entry) (list (prin1-to-string entry)))
                                              command-history)
                             nil nil (prin1-to-string elt) (cons 'command-history arg)
                             (prin1-to-string elt)))

                    <span class="linecomment">;; If command was added to command-history as a</span>
                    <span class="linecomment">;; string, get rid of that.  We want only</span>
                    <span class="linecomment">;; evaluable expressions there.</span>
                    (if (stringp (car command-history))
                        (setq command-history (cdr command-history))))))

          <span class="linecomment">;; If command to be redone does not match front of history,</span>
          <span class="linecomment">;; add it to the history.</span>
          (or (equal newcmd (car command-history))
              (setq command-history (cons newcmd command-history)))
          (eval newcmd))
      (if command-history
          (error "<span class="quote">Argument %d is beyond length of command history</span>" arg)
        (error "<span class="quote">There are no previous complex commands to repeat</span>")))))




<span class="linecomment">;;; Icicles commands........................................</span>

<span class="linecomment">;;; Minibuffer editing commands  . . . . . . . . . . . . . .</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; All except `icicle-erase-minibuffer' are bound in the minibuffer to whatever the same</span>
<span class="linecomment">;;; command without `icicle-' is bound to globally.</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-delete-char-untabify (n &optional killflag)
  "<span class="quote">`backward-delete-char-untabify' + update *Completions* with matches.
See description of `backward-delete-char-untabify'.</span>"
  (interactive "<span class="quote">*p\nP</span>")
  (icicle-call-then-update-Completions #'backward-delete-char-untabify n killflag))

<span class="linecomment">;;;###autoload</span>
(defun icicle-delete-backward-char (n &optional killflag) <span class="linecomment">; Bound to `DEL' (backspace) in minibuffer.</span>
  "<span class="quote">`delete-backward-char' and update *Completions* with input matches.
See description of `delete-backward-char'.</span>"
  (interactive "<span class="quote">*p\nP</span>")
  (icicle-call-then-update-Completions #'delete-backward-char n killflag))

<span class="linecomment">;;;###autoload</span>
(defun icicle-delete-char (n &optional killflag) <span class="linecomment">; Bound to `C-d' in minibuffer.</span>
  "<span class="quote">`delete-char' and update *Completions* with input matches.
See description of `delete-char'.</span>"
  (interactive "<span class="quote">*p\nP</span>")
  (icicle-call-then-update-Completions #'delete-char n killflag))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-kill-word (arg)  <span class="linecomment">; Bound to `M-DEL' (`M-backspace') in minibuffer.</span>
  "<span class="quote">`backward-kill-word' and update *Completions* with input matches.
See description of `backward-kill-word'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'backward-kill-word arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-word (arg)           <span class="linecomment">; Bound to `M-d' in minibuffer.</span>
  "<span class="quote">`kill-word' and update *Completions* with regexp input matches.
See description of `kill-word'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'kill-word arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-kill-sexp (arg)  <span class="linecomment">; Bound to `M-C-backspace' in minibuffer.</span>
  "<span class="quote">`backward-kill-sexp' and update *Completions* with input matches.
See description of `backward-kill-sexp'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'backward-kill-sexp arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-sexp (arg)           <span class="linecomment">; Bound to `M-C-delete' and `M-C-k' in minibuffer.</span>
  "<span class="quote">`kill-sexp' and update *Completions* with regexp input matches.
See description of `kill-sexp'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'kill-sexp arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-kill-sentence (arg) <span class="linecomment">; Bound to `C-x DEL' in minibuffer.</span>
  "<span class="quote">`backward-kill-sentence' and update *Completions* with input matches.
See description of `backward-kill-sentence'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'backward-kill-sentence arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-sentence (arg)
  "<span class="quote">`kill-sentence' and update *Completions* with regexp input matches.
See description of `kill-sentence'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'kill-sentence arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-kill-paragraph (arg) <span class="linecomment">; Bound to `C-backspace' in minibuffer.</span>
  "<span class="quote">`backward-kill-paragraph' and update *Completions* with input matches.
See description of `backward-kill-paragraph'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'backward-kill-paragraph arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-paragraph (arg)      <span class="linecomment">; Bound to `C-delete' in minibuffer.</span>
  "<span class="quote">`kill-paragraph' and update *Completions* with regexp input matches.
See description of `kill-paragraph'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'kill-paragraph arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-line (arg)           <span class="linecomment">; Bound to `C-k' and `delete' in minibuffer.</span>
  "<span class="quote">`kill-line' and update *Completions* with regexp input matches.
See description of `kill-line'.</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-call-then-update-Completions #'kill-line arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-region (beg end)     <span class="linecomment">; Bound to `C-w' and `S-delete' in minibuffer.</span>
<span class="linecomment">;; Don't bother with Emacs 22 optional 3rd arg.</span>
  "<span class="quote">`kill-region' and update *Completions* with regexp input matches.
See description of `kill-region'.</span>"
  (interactive "<span class="quote">r</span>")
  (icicle-call-then-update-Completions #'kill-region beg end))

<span class="linecomment">;;;###autoload</span>
(when (fboundp 'kill-region-wimpy)
  (defun icicle-kill-region-wimpy (beg end) <span class="linecomment">; Bound to `C-w' and `S-delete' in minibuffer.</span>
    "<span class="quote">`kill-region-wimpy' and update *Completions* with input matches.
See description of `kill-region-wimpy'.</span>"
    (interactive "<span class="quote">r</span>")
    (icicle-call-then-update-Completions #'kill-region-wimpy beg end)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-transpose-chars (arg)     <span class="linecomment">; Bound to `C-t' in minibuffer.</span>
  "<span class="quote">`transpose-chars' and update *Completions* with regexp input matches.
See description of `transpose-chars'.</span>"
  (interactive "<span class="quote">*P</span>")
  (icicle-call-then-update-Completions #'transpose-chars arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-transpose-words (arg)     <span class="linecomment">; Bound to `M-t' in minibuffer.</span>
  "<span class="quote">`transpose-words' and update *Completions* with regexp input matches.
See description of `transpose-words'.</span>"
  (interactive "<span class="quote">*p</span>")
  (icicle-call-then-update-Completions #'transpose-words arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-transpose-sexps (arg)    <span class="linecomment">; Bound to `M-C-t' in minibuffer.</span>
  "<span class="quote">`transpose-sexps' and update *Completions* with regexp input matches.
See description of `transpose-sexps'.</span>"
  (interactive "<span class="quote">*p</span>")
  (icicle-call-then-update-Completions #'transpose-sexps arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-yank (arg)                <span class="linecomment">; Bound to `C-y' and `S-insert' in minibuffer.</span>
  "<span class="quote">`yank' and update *Completions* with regexp input matches.
See description of `yank'.</span>"
  (interactive "<span class="quote">*P</span>")
  (icicle-call-then-update-Completions #'yank arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-yank-pop (arg)            <span class="linecomment">; Bound to `M-y' and `M-insert' in minibuffer.</span>
  "<span class="quote">`yank-pop' and update *Completions* with regexp input matches.
See description of `yank-pop'.</span>"
  (interactive "<span class="quote">*p</span>")
  (icicle-call-then-update-Completions #'yank-pop arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-self-insert (n) <span class="linecomment">;; Bound in minibuf to stuff bound globally to `self-insert-command'.</span>
  "<span class="quote">`self-insert' and update *Completions* with regexp input matches.
See description of `self-insert'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'self-insert-command n))

<span class="linecomment">;; Make delete-selection mode recognize self-insertion, so it replaces region text.</span>
(put 'icicle-self-insert 'delete-selection t)

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-a-space ()
  "<span class="quote">Insert a space.
For convenience in the minibuffer - does the same thing as `C-q SPC'.
To use this, bind it to some key sequence in keymaps
`minibuffer-local-completion-map',
`minibuffer-local-filename-completion-map', and
`minibuffer-local-must-match-map'.</span>"
  (interactive) (insert ?\ ))

<span class="linecomment">;;;###autoload</span>
(defun icicle-erase-minibuffer ()       <span class="linecomment">; Bound to `M-S-backspace', `M-S-delete' in minibuffer.</span>
  "<span class="quote">Delete all user input in the minibuffer.</span>"
  (interactive)
  (icicle-call-then-update-Completions #'icicle-clear-minibuffer))




<span class="linecomment">;;; Other commands to be used mainly in the minibuffer . . .</span>

<span class="linecomment">;; $$$ Probably need to do something to work around problem of Windows</span>
<span class="linecomment">;; selecting the new frame, when `pop-up-frames' is non-nil.  Need to</span>
<span class="linecomment">;; redirect focus back to the frame with the minibuffer.  Leave it as</span>
<span class="linecomment">;; is, for now, in hopes Emacs will eventually fix this.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-completion-help ()        <span class="linecomment">; Bound to `C-h' in minibuffer.</span>
  "<span class="quote">Describe minibuffer bindings for completion.</span>"
  (interactive)
  (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
    (princ icicle-completion-help-string))
  <span class="linecomment">;; Don't bother to do this for Emacs 21.3.  Its `help-insert-xref-button' signature is different.</span>
  (when (and (featurep 'help-mode) (fboundp 'help-insert-xref-button))
    (save-excursion
      (with-current-buffer (get-buffer "<span class="quote">*Help*</span>")
        (let ((buffer-read-only nil))
          (goto-char (point-min))
          (help-insert-xref-button "<span class="quote">[Icicles Help on the Web]</span>" 'icicle-help-button)
          (insert "<span class="quote">                   </span>")
          (help-insert-xref-button "<span class="quote">[Icicles Options & Faces]</span>" 'icicle-customize-button)
          (insert "<span class="quote">\n\n\n</span>")
          (goto-char (point-max))
          (insert "<span class="quote">\n</span>")
          (help-insert-xref-button "<span class="quote">[Icicles Help on the Web]</span>" 'icicle-help-button)
          (insert "<span class="quote">                   </span>")
          (help-insert-xref-button "<span class="quote">[Icicles Options & Faces]</span>" 'icicle-customize-button)
          (insert "<span class="quote">\n\n</span>")
          (goto-char (point-min)))))))

(when (fboundp 'define-button-type)
  (define-button-type 'icicle-help-button
      :supertype 'help-xref
      'help-function #'(lambda () (browse-url "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>"))
      'help-echo
      (purecopy "<span class="quote">mouse-2, RET: Icicles documentation on the Emacs Wiki (requires Internet access)</span>"))
  (define-button-type 'icicle-customize-button
      :supertype 'help-xref
      'help-function #'(lambda () (customize-group-other-window 'icicles))
      'help-echo (purecopy "<span class="quote">mouse-2, RET: Customize/Browse Icicles Options & Faces</span>")))

<span class="linecomment">;;;###autoload</span>
(defun icicle-abort-minibuffer-input () <span class="linecomment">; Bound to `C-g', in minibuffer, `C-g', `q' in *Completions*.</span>
  "<span class="quote">Abort minibuffer input.
Remove \</span>"*Completions*\"<span class="quote"> frame, if any, before aborting minibuffer
input via `abort-recursive-edit'.</span>"
  (interactive)
  (icicle-delete-windows-on "<span class="quote">*Completions*</span>")
  (abort-recursive-edit))

<span class="linecomment">;; This is just the macro expansion of the following:</span>
<span class="linecomment">;; `(def-completion-wrapper icicle-abort-minibuffer-input :minibuffer-separator)'.</span>
<span class="linecomment">;; Taken from the definition of `def-completion-wrapper' in `completion.el'.</span>
(put 'icicle-abort-minibuffer-input 'completion-function 'use-completion-minibuffer-separator)

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete-and-exit () <span class="linecomment">; Bound to `S-RET' in minibuffer for must-match.</span>
  "<span class="quote">If the minibuffer contents is a valid apropos completion, then exit.
Otherwise try to complete it.  If completion leads to a valid
completion, then exit.
This is to `minibuffer-complete-and-exit' as `icicle-apropos-complete'
is to `minibuffer-complete'.  That is, it is the regexp-match version.</span>"
  <span class="linecomment">;; Bound to `S-RET' in `minibuffer-local-must-match-map'.</span>
  (interactive)
  (let* ((icicle-apropos-complete-and-exit-p t) <span class="linecomment">; Suppress "[Sole apropos completion]" msg & wait.</span>
         (candidates (icicle-apropos-complete)))
    (when (and candidates (null (cdr candidates))) <span class="linecomment">; Single candidate.</span>
      (old-exit-minibuffer))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-retrieve-last-input ()    <span class="linecomment">; Bound to `C-l' in minibuffer.</span>
  "<span class="quote">Put the last real input into the minibuffer.
Use this to replace a completion candidate inserted during cycling.
If `icicle-expand-input-to-common-match-flag' is non-nil, then using this
once restores the longest common match string, and using it twice in
succession restores your original regexp.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-retrieve-last-input]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-clear-minibuffer)
  (if (and icicle-expand-input-to-common-match-flag
           (memq last-command '(icicle-retrieve-last-input handle-switch-frame)))
      (insert icicle-current-regexp-input)
    (insert icicle-current-input))
  (when (interactive-p) (setq icicle-last-completion-command nil))
  (let ((input (if (and icicle-expand-input-to-common-match-flag
                        (memq last-command (list this-command 'handle-switch-frame)))
                   icicle-current-regexp-input
                 icicle-current-input)))
    (icicle-highlight-initial-whitespace input) <span class="linecomment">; Highlight initial whitespace (probably user typo).</span>
    (icicle-place-cursor input))
  (deactivate-mark))

<span class="linecomment">;; $$ No longer used.  To be removed later.</span>
(defun icicle-insert-input (input)
  "<span class="quote">Insert INPUT.  Prepend the directory if appropriate.</span>"
  (insert (if (and (icicle-file-name-input-p) insert-default-directory)
              (icicle-expand-file-name input (file-name-directory input))
            input)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-string-at-point (&optional arg) <span class="linecomment">; Bound to `M-.' in minibuffer.</span>
  "<span class="quote">Insert text at the cursor into the minibuffer.
Each time this command is called, some text at or near the cursor is
inserted into the minibuffer.  One of two things happens, depending on
the value of option `icicle-default-thing-insertion' and whether or
not you use `C-u'.

`icicle-thing-at-point-functions' is a cons of two parts - call them
ALTERNATIVES and FORWARD-THING.

If ALTERNATIVES is not nil and one of the following is true:
 - FORWARD-THING is nil
 - the value of `icicle-default-thing-insertion' is `alternatives' and
   you have not used `C-u' (without #) in this series of `M-.'
 - the value of `icicle-default-thing-insertion' is `more-of-the-same'
   and you have used `C-u' (without #) in this series of `M-.'
then the next function in ALTERNATIVES is used to retrieve the text to
be inserted.

If FORWARD-THING is not nil and one of the following is true:
 - ALTERNATIVES is nil
 - the value of `icicle-default-thing-insertion' is `more-of-the-same'
   and you have not used `C-u' in this series of `M-.'
 - the value of `icicle-default-thing-insertion' is `alternatives' and
   you have used `C-u' in this series of `M-.'
then function FORWARD-THING is used to retrieve the text to be
inserted.

If `C-u' is used with a numeric argument (not just plain `C-u'), then
function FORWARD-THING is used to retrieve the text to be inserted,
and the argument determines the number of things to grab.  It also
determines the direction of thing-grabbing: A negative argument grabs
text to the left of the cursor; a positive argument grabs text to the
right.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-at-point]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (when (consp icicle-thing-at-point-functions) <span class="linecomment">; Option should always be a cons cell.</span>
    (unless (eq last-command this-command) (setq icicle-default-thing-insertion-flipped-p nil))
    (let ((alt-fns (car icicle-thing-at-point-functions))
          (fwd-thing-fn (cdr icicle-thing-at-point-functions))
          (flipped (or icicle-default-thing-insertion-flipped-p <span class="linecomment">; Already flipped.</span>
                       (setq icicle-default-thing-insertion-flipped-p
                             (if (eq 'alternatives icicle-default-thing-insertion)
                                 arg    <span class="linecomment">; Either `C-u' or `C-u 3' flips it for `alternatives'.</span>
                               (consp arg)))))) <span class="linecomment">; Only `C-u' flips it for `more-of-the-same'.</span>
      (cond
        <span class="linecomment">;; Use alternative text-grabbing functions successively.</span>
        ((and alt-fns (or (if (eq 'alternatives icicle-default-thing-insertion)
                              (not flipped) <span class="linecomment">; Normal behavior for `alternatives'.</span>
                            flipped)    <span class="linecomment">; Flipped behavior for `more-of-the-same'.</span>
                          (not fwd-thing-fn))) <span class="linecomment">; No alternative.</span>
         (setq icicle-successive-grab-count 1) <span class="linecomment">; In this mode, reset other mode's accumulator.</span>
         (setq icicle-thing-at-pt-fns-pointer
               (if (eq last-command this-command) <span class="linecomment">; If repeated, get next text-grabbing function.</span>
                   (mod (1+ icicle-thing-at-pt-fns-pointer) (length alt-fns))
                 0))
         (let ((thing "<span class="quote"></span>"))
           (save-excursion
             (set-buffer (cadr (buffer-list)))
             (setq thing (funcall (nth icicle-thing-at-pt-fns-pointer alt-fns))))
           (icicle-insert-thing thing)))

        <span class="linecomment">;; Use same text-grabbing function successively.</span>
        ((and fwd-thing-fn (or (if (eq 'alternatives icicle-default-thing-insertion)
                                   flipped <span class="linecomment">; Flipped behavior for `alternatives'.</span>
                                 (not flipped)) <span class="linecomment">; Normal behavior for `more-of-the-same'.</span>
                               (not alt-fns))) <span class="linecomment">; No alternative.</span>
         (if (and arg (atom arg))

             <span class="linecomment">;; Explicit numeric arg.  If it doesn't change direction, then increment</span>
             <span class="linecomment">;; existing count.  Otherwise, set count absolutely.</span>
             (if (eq last-command this-command)
                 (if (= (icicle-signum icicle-successive-grab-count) <span class="linecomment">; Repeated `M-.'.</span>
                        (icicle-signum (prefix-numeric-value arg)))
                     (setq icicle-successive-grab-count <span class="linecomment">; Same direction - increment count.</span>
                           (* (icicle-signum icicle-successive-grab-count)
                              (+ (abs icicle-successive-grab-count)
                                 (abs (prefix-numeric-value arg)))))
                   (setq icicle-successive-grab-count (prefix-numeric-value arg))) <span class="linecomment">; New dir - set.</span>
               (setq icicle-successive-grab-count (prefix-numeric-value arg))) <span class="linecomment">; First `M-.' - set.</span>

           <span class="linecomment">;; No explicit numeric arg.</span>
           <span class="linecomment">;; If first `M-.' or plain `C-u', set count. Otherwise, increment count.</span>
           (if (eq last-command this-command)
               (setq icicle-successive-grab-count <span class="linecomment">; Repeated `M-.'.</span>
                     (if (consp arg)
                         <span class="linecomment">;; We're here from plain `C-u' with `alternatives' - use 1, not 4.</span>
                         (if (wholenump icicle-successive-grab-count) 1 -1)
                       (if (wholenump icicle-successive-grab-count) <span class="linecomment">; Increment count.</span>
                           (+ icicle-successive-grab-count (abs (prefix-numeric-value arg)))
                         (- icicle-successive-grab-count (abs (prefix-numeric-value arg))))))
             (setq icicle-successive-grab-count 1))) <span class="linecomment">; First `M-.' - reset count.</span>
         (let ((things "<span class="quote"></span>"))
           (save-excursion
             (set-buffer (cadr (buffer-list)))
             (setq things (buffer-substring-no-properties
                           (point)
                           (save-excursion (funcall fwd-thing-fn icicle-successive-grab-count)
                                           (point)))))
           (icicle-insert-thing things)))))))

(defun icicle-signum (num)
  "<span class="quote">Return 1 if NUM is positive, -1 if negative, 0 if zero.</span>"
  (cond ((&lt; num 0) -1) ((&gt; num 0) 1) (t 0)))

(defun icicle-insert-thing (text)
  "<span class="quote">Insert TEXT in the minibuffer.
TEXT replaces the last text that was inserted, if this command repeats
the last.</span>"
  (when (and (stringp text) (not (string= "<span class="quote"></span>" text)))
    (remove-text-properties 0 (length text) '(face nil) text)
    (when (eq last-command this-command)
      (delete-region icicle-insert-string-at-pt-start icicle-insert-string-at-pt-end))
    (setq icicle-insert-string-at-pt-start (point))
    (insert text)
    (setq icicle-insert-string-at-pt-end (point))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-string-from-variable (askp) <span class="linecomment">; Bound to `C-=' in the minibuffer.</span>
  "<span class="quote">Insert text into the minibuffer from a variable.
By default, the variable is user option `icicle-input-string'.
To insert from a different variable, use a prefix argument; you are
then prompted for the variable to use.  You can use command
`icicle-save-string-to-variable' to save a string to a variable.
Typically, you store a regexp or part of a regexp in the variable.
This command is bound in the minibuffer to `C-=', by default.
This is especially useful when used with command `icicle-search'.

Some regexps that you might want to assign to variables:

 \</span>"[A-Za-z0-9_.-]+@[A-Za-z0-9_.-]+\"<span class="quote">          ; Email address
 \</span>"\\\\([0-9]+\\\.[0-9]+\\\.[0-9]+\\\.[0-9]+\\\\)\"<span class="quote">     ; IP address
 \</span>"[0-9]\\\\\\\={4\\\\}-[0-9]\\\\\\\={2\\\\}-[0-9]\\\\\\\={2\\\\}\"<span class="quote">   ; Date: 2006-04-14, Time:
 \</span>"^[ \\\=\\t]*[0-9]?[0-9]\\\\([:.]?[0-9][0-9]\\\\)?\\\\(am\\\\|pm\\\\|AM\\\\|PM\\\\)?\"<span class="quote">
 \</span>"`\\\\(\\\\sw\\\\sw+\\\\)'\"<span class="quote">                        ; Words inside `_'
 \</span>"\\\\*.*\\\\*\"<span class="quote">                                 ; Special buffer name: *_*

Standard Emacs Lisp libraries are full of regexps that you can assign
to variables for use with `C-='.
 See `align.el' for regexps for programming languages.
 See `url-dav.el' for regexps matching iso8601 dates.
 See `rmail.el', `sendmail.el', and `mh-show.el' for regexps matching
 mail-header fields.

Imenu regexps occurring as parts of different values of
`imenu-generic-expression' for different buffer types can be used as
variable values for `C-='.  They all work fine with `icicle-search',
turning it into a browser or navigator for the given mode.

See, for example, `generic-x.el' and `lisp-mode.el'.  Here is a regexp
for Javascript function definitions from `generic-x.el':

 \</span>"^function\\\\s-+\\\\([A-Za-z0-9_]+\\\\)\"<span class="quote">

And `lisp-imenu-generic-expression' (in `lisp-mode.el') provides
regexps for Lisp function, variable, and type definitions.  Here is
the variable-definition regexp:

 \</span>"^\\\\s-*(\\\\(def\\\\(c\\\\(onst\\\\(ant\\\\)?\\\\|ustom\\\\)\\\\|ine-symbol-macro\\\\|
 parameter\\\\|var\\\\)\\\\)\\\\s-+\\\\(\\\\(\\\\sw\\\\|\\\\s_\\\\)+\\\\)\"<span class="quote">

For more useful regexps, grep for `font-lock-keywords' in Emacs `lisp'
directory and subdirs.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-from-variable]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (if askp
      (let* ((enable-recursive-minibuffers t)
             (var (intern
                   (completing-read
                    "<span class="quote">Insert text from variable: </span>"
                    (mapcar
                     #'list
                     (mapcar 'symbol-name
                             '(adaptive-fill-first-line-regexp adaptive-fill-regexp
                               add-log-current-defun-header-regexp
                               allout-bullets-string allout-line-boundary-regexp allout-regexp
                               comment-start-skip comment-end
                               ffap-url-regexp find-face-regexp find-function-regexp
                               find-variable-regexp
                               imenu-example--function-name-regexp-c
                               org-plain-time-of-day-regexp outline-heading-end-regexp
                               outline-line-boundary-regexp
                               outline-plain-bullets-string outline-regexp
                               page-delimiter paragraph-separate paragraph-start
                               sentence-end
                               thing-at-point-url-regexp
                               )))
                    (lambda (cand) (boundp (intern (car cand)))))))
             (text (symbol-value var)))
        (icicle-insert-thing text))
    (icicle-insert-thing icicle-input-string)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-prefix-candidate (&optional nth) <span class="linecomment">; Bound to `C-p', `up' in minibuffer.</span>
  "<span class="quote">Replace input by NTH previous prefix completion for an input.
Default value of NTH is 1, meaning use the previous prefix completion.
Negative NTH means use a subsequent, not previous, prefix completion.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-prefix-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq nth (or nth 1))
  (icicle-next-prefix-candidate (- nth)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-next-prefix-candidate (&optional nth) <span class="linecomment">; Bound to `down', `C-n' in minibuffer.</span>
  "<span class="quote">Replace input by NTH next prefix completion for an input.
Default value of NTH is 1, meaning use the next prefix completion.
Negative NTH means use a previous, not subsequent, prefix completion.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-prefix-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-next-candidate nth (if (icicle-file-name-input-p)
                                 'icicle-file-name-prefix-candidates
                               'icicle-prefix-candidates)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-apropos-candidate (&optional nth) <span class="linecomment">; Bound to `prior', `M-v' in minibuffer.</span>
  "<span class="quote">Replace input by NTH previous apropos completion for an input.
Default value of NTH is 1, meaning use the previous apropos completion.
Negative NTH means use a subsequent, not previous, apropos completion.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-apropos-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq nth (or nth 1))
  (icicle-next-apropos-candidate (- nth)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-next-apropos-candidate (&optional nth) <span class="linecomment">; Bound to `next', `C-v' in minibuffer.</span>
  "<span class="quote">Replace input by NTH next apropos completion for an input.
Default value of NTH is 1, meaning use the next apropos completion.
Negative NTH means use a previous, not subsequent, apropos completion.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-apropos-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-next-candidate nth (if (icicle-file-name-input-p)
                                 'icicle-file-name-apropos-candidates
                               'icicle-apropos-candidates)
                         'regexp-p))

<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-prefix-candidate-action (&optional nth) <span class="linecomment">; Bound to `C-up', `M-{' in minibuf.</span>
  "<span class="quote">`icicle-candidate-action', then `icicle-previous-prefix-candidate'.
Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-prefix-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (save-excursion (icicle-candidate-action))
  (icicle-previous-prefix-candidate nth))

<span class="linecomment">;;;###autoload</span>
(defun icicle-next-prefix-candidate-action (&optional nth) <span class="linecomment">; Bound to `C-down', `M-}' in minibuf.</span>
  "<span class="quote">`icicle-candidate-action', then `icicle-next-prefix-candidate'.
Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-prefix-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (save-excursion (icicle-candidate-action))
  (icicle-next-prefix-candidate nth))

<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-apropos-candidate-action (&optional nth) <span class="linecomment">; Bound to `C-prior', `C-x &gt;'.</span>
  "<span class="quote">`icicle-candidate-action', then `icicle-previous-apropos-candidate'.
Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-apropos-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (save-excursion (icicle-candidate-action))
  (icicle-previous-apropos-candidate nth))

<span class="linecomment">;;;###autoload</span>
(defun icicle-next-apropos-candidate-action (&optional nth) <span class="linecomment">; Bound to `C-next', `C-x &lt;' in minibuf.</span>
  "<span class="quote">`icicle-candidate-action', then `icicle-next-apropos-candidate'.
Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-apropos-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (save-excursion (icicle-candidate-action))
  (icicle-next-apropos-candidate nth))

<span class="linecomment">;;;###autoload</span>
(defun icicle-prefix-complete ()        <span class="linecomment">; Bound to `TAB' in minibuffer.</span>
  "<span class="quote">Complete the minibuffer contents as far as possible, as a prefix.
If no characters can be completed, display the possible completions.
Scroll *Completions* window if this command is repeated.
Candidate completions are appropriate names whose prefix is the
minibuffer input, where appropriateness is determined by the context
\(command, variable, and so on).
Return nil if there is no valid completion.
Otherwise, return the list of completion candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-complete]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-prefix-complete-1))

<span class="linecomment">;;;###autoload</span>
(defun icicle-prefix-complete-no-display () <span class="linecomment">; Bound to `M-C-TAB' in minibuffer.</span>
  "<span class="quote">Like `icicle-prefix-complete', but without displaying *Completions*.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-complete-no-display]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-prefix-complete-1 'no-display))

<span class="linecomment">;;;###autoload</span>
(defun icicle-prefix-complete-1 (&optional no-display-p)
  "<span class="quote">Helper function for `icicle-prefix-complete(-no-display)'.
Optional argument NO-DISPLAY-P non-nil means do not display buffer
*Completions*.  Returns the list of completion candidates.</span>"
  (when icicle-arrows-respect-completion-type-flag
    (dolist (map (if (boundp 'minibuffer-local-filename-completion-map)
                     (list minibuffer-local-completion-map minibuffer-local-filename-completion-map
                           minibuffer-local-must-match-map)
                   (list minibuffer-local-completion-map minibuffer-local-must-match-map)))
      (define-key map [up]   'icicle-previous-prefix-candidate)
      (define-key map [down] 'icicle-next-prefix-candidate)))
  (setq icicle-current-input
        (if (memq last-command '(icicle-next-apropos-candidate icicle-previous-apropos-candidate
                                 icicle-next-prefix-candidate  icicle-previous-prefix-candidate))
            icicle-last-input
          (icicle-minibuffer-contents-from-minibuffer)))
  (unless (eq last-command this-command) (setq icicle-current-regexp-input icicle-current-input))
  (let ((common-prefix (try-completion icicle-current-input minibuffer-completion-table
                                       minibuffer-completion-predicate)))
    <span class="linecomment">;; If input matches an empty directory, then use that directory as the sole completion.</span>
    (when (and (stringp common-prefix) (string-match "<span class="quote">/\\.$</span>" common-prefix))
      (setq common-prefix (substring common-prefix 0 (- (length common-prefix) 2))))
    (when (stringp common-prefix) (setq icicle-current-input common-prefix)))
  (unless (and (string= icicle-current-input icicle-last-input)
               (memq last-command '(icicle-prefix-complete)))
    (setq icicle-completion-candidates
          (if (icicle-file-name-input-p)
              (icicle-file-name-prefix-candidates icicle-current-input)
            (icicle-prefix-candidates icicle-current-input))))
  (icicle-save-or-restore-input)
  (cond ((null icicle-completion-candidates)
         (setq icicle-nb-of-other-cycle-candidates 0)
         (save-selected-window (icicle-delete-windows-on "<span class="quote">*Completions*</span>"))
         (minibuffer-message "<span class="quote">  [No prefix completions]</span>"))
        ((null (cdr icicle-completion-candidates)) <span class="linecomment">;Single candidate. Update minibuffer.</span>
         (setq icicle-nb-of-other-cycle-candidates 0)
         (unless icicle-icompleting-p
           (icicle-clear-minibuffer)
           (insert
            (setq icicle-last-completion-candidate
                  (if (and (icicle-file-name-input-p) insert-default-directory)
                      (expand-file-name (car icicle-completion-candidates)
                                        (icicle-file-name-directory-w-default icicle-current-input))
                    (car icicle-completion-candidates))))
           (when (icicle-file-directory-p (expand-file-name icicle-last-completion-candidate))
             (setq icicle-default-directory (expand-file-name icicle-last-completion-candidate))))
         (save-selected-window (icicle-delete-windows-on "<span class="quote">*Completions*</span>"))
         (icicle-highlight-complete-input)
         (if icicle-icompleting-p
             (minibuffer-message (format "<span class="quote">  [One prefix completion: %s]</span>"
                                         (car icicle-completion-candidates)))
           (minibuffer-message "<span class="quote">  [Sole prefix completion]</span>")))
        (t                              <span class="linecomment">; Multiple candidates.</span>
         (if icicle-icompleting-p
             (icicle-display-candidates-in-Completions nil no-display-p)
           (icicle-clear-minibuffer)
           (insert icicle-current-input) <span class="linecomment">; Update minibuffer.</span>
           (icicle-highlight-initial-whitespace icicle-current-input)
           (when (icicle-file-directory-p icicle-last-completion-candidate)
             (setq icicle-default-directory (expand-file-name icicle-last-completion-candidate)))
           (when (member icicle-current-input icicle-completion-candidates)
             (icicle-highlight-complete-input))
           (cond ((get-buffer-window "<span class="quote">*Completions*</span>" 0)
                  (if (and (eq icicle-last-completion-command 'icicle-prefix-complete)
                           (memq last-command '(icicle-prefix-complete handle-switch-frame)))
                      <span class="linecomment">;; Second TAB in a row.  Scroll window around.</span>
                      (save-selected-window
                        (select-window (get-buffer-window "<span class="quote">*Completions*</span>" 0))
                        (condition-case nil
                            (scroll-up nil)
                          (end-of-buffer (goto-char (point-min)) (forward-line 3))))
                    <span class="linecomment">;; Did something else (e.g. changed input).  Update the display.</span>
                    (icicle-display-candidates-in-Completions nil no-display-p)))
                 <span class="linecomment">;; No window yet.  If 2nd TAB or no chars can be completed, show window.</span>
                 (t
                  (cond ((and (memq last-command '(icicle-prefix-complete handle-switch-frame))
                              (eq icicle-last-completion-command 'icicle-prefix-complete)
                              completion-auto-help)
                         (icicle-display-candidates-in-Completions nil no-display-p))
                        ((member icicle-current-input icicle-completion-candidates)
                         (minibuffer-message "<span class="quote">  [Complete, but not unique]</span>"))
                        ((and (string= icicle-current-regexp-input icicle-current-input)
                              completion-auto-help)
                         (icicle-display-candidates-in-Completions nil no-display-p))))))))
  (setq icicle-last-completion-command this-command)
  icicle-completion-candidates)

<span class="linecomment">;;;###autoload</span>
(defun icicle-prefix-word-complete ()   <span class="linecomment">; Bound to `M-SPC' in minibuffer.</span>
  "<span class="quote">Complete the minibuffer contents at most a single word.
After one word is completed as much as possible, a space or hyphen
is added, provided that matches some possible completion.
Return nil if there is no valid completion, else t.
Candidate completions are appropriate names whose prefix is the
minibuffer input, where appropriateness is determined by the context
\(command, variable, and so on).

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-word-complete]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq icicle-current-input
        (if (memq last-command '(icicle-next-apropos-candidate icicle-previous-apropos-candidate
                                 icicle-next-prefix-candidate  icicle-previous-prefix-candidate))
            icicle-last-input
          (icicle-minibuffer-contents-from-minibuffer)))
  (let ((return-value (minibuffer-complete-word)))
    (setq icicle-completion-candidates
          (if (icicle-file-name-input-p)
              (icicle-file-name-prefix-candidates icicle-current-input)
            (icicle-prefix-candidates icicle-current-input)))
    (when (get-buffer-window "<span class="quote">*Completions*</span>" 0)
      (icicle-display-candidates-in-Completions))
    (setq icicle-last-completion-command this-command)
    return-value))

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete ()       <span class="linecomment">; Bound to `S-TAB' in minibuffer.</span>
  "<span class="quote">Complete the minibuffer contents as far as possible.
This uses \</span>"apropos completion\"<span class="quote">, defined as follows:
A completion contains the minibuffer input somewhere, as a substring.
Display a list of possible completions in buffer *Completions*.
Scroll *Completions* window if this command is repeated.
Candidate completions are appropriate names that match the current
input, taken as a regular expression, where appropriateness is
determined by the context (command, variable, and so on).
Return nil if there is no valid completion.
Otherwise, return the list of completion candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-apropos-complete]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let* ((error-msg nil)
         (candidates
          (condition-case lossage
              (icicle-apropos-complete-1)
            (invalid-regexp
             (setq error-msg (car (cdr lossage)))
             <span class="linecomment">;;(setq icicle-within-brackets (string-match "\\`Unmatched \\[" error-msg))</span>
             (when (string-match "<span class="quote">\\`Premature \\|\\`Unmatched \\|\\`Invalid </span>" error-msg)
               (setq error-msg "<span class="quote">incomplete input</span>")))
            (error (setq error-msg (error-message-string lossage))))))
    (when error-msg (minibuffer-message (concat "<span class="quote">  </span>" error-msg)))
    candidates))

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete-no-display () <span class="linecomment">; Bound to `S-M-C-TAB' in minibuffer.</span>
  "<span class="quote">Like `icicle-apropos-complete', but without displaying *Completions*.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-apropos-complete-no-display]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let* ((error-msg nil)
         (candidates
          (condition-case lossage
              (icicle-apropos-complete-1 'no-display)
            (invalid-regexp
             (setq error-msg (car (cdr lossage)))
             <span class="linecomment">;;(setq icicle-within-brackets (string-match "\\`Unmatched \\[" error-msg))</span>
             (when (string-match "<span class="quote">\\`Premature \\|\\`Unmatched \\|\\`Invalid </span>" error-msg)
               (setq error-msg "<span class="quote">incomplete input</span>")))
            (error (setq error-msg (error-message-string lossage))))))
    (when error-msg (minibuffer-message (concat "<span class="quote">  </span>" error-msg)))
    candidates))

(defun icicle-apropos-complete-1 (&optional no-display-p)
  "<span class="quote">Helper function for `icicle-apropos-complete(-no-display)'.
This does everything, except deal with regexp-match errors.
Optional argument NO-DISPLAY-P non-nil means do not display buffer
*Completions*.  Returns the list of completion candidates.</span>"
  (when icicle-arrows-respect-completion-type-flag
    (dolist (map (if (boundp 'minibuffer-local-filename-completion-map)
                     (list minibuffer-local-completion-map minibuffer-local-filename-completion-map
                           minibuffer-local-must-match-map)
                   (list minibuffer-local-completion-map minibuffer-local-must-match-map)))
      (define-key map [up]   'icicle-previous-apropos-candidate)
      (define-key map [down] 'icicle-next-apropos-candidate)))
  (setq icicle-current-input
        (if (memq last-command
                  '(icicle-next-apropos-candidate        icicle-previous-apropos-candidate
                    icicle-next-apropos-candidate-action icicle-previous-apropos-candidate-action
                    icicle-next-prefix-candidate         icicle-previous-prefix-candidate
                    icicle-next-prefix-candidate-action  icicle-previous-prefix-candidate-action))
            icicle-last-input
          (icicle-minibuffer-contents-from-minibuffer)))
  (unless (and (string= icicle-current-input icicle-last-input)
               (memq last-command '(icicle-apropos-complete)))
    (setq icicle-completion-candidates
          (if (icicle-file-name-input-p)
              (icicle-file-name-apropos-candidates icicle-current-input)
            (icicle-apropos-candidates icicle-current-input))))
  <span class="linecomment">;; If input matches an empty directory, then use that directory as the sole completion.</span>
  (when (and (icicle-file-name-input-p) (null icicle-completion-candidates)
             (string-match "<span class="quote">/$</span>" icicle-current-input))
    (setq icicle-completion-candidates '("<span class="quote"></span>")))
  (icicle-save-or-restore-input t)
  (cond ((null icicle-completion-candidates)
         (setq icicle-nb-of-other-cycle-candidates 0)
         (save-selected-window (icicle-delete-windows-on "<span class="quote">*Completions*</span>"))
         (minibuffer-message "<span class="quote">  [No apropos completion]</span>"))
        ((null (cdr icicle-completion-candidates)) <span class="linecomment">; Single candidate. Update minibuffer.</span>
         (setq icicle-nb-of-other-cycle-candidates 0)
         (unless icicle-icompleting-p
           (icicle-clear-minibuffer)
           (insert
            (setq icicle-last-completion-candidate
                  (if (and (icicle-file-name-input-p) insert-default-directory)
                      (expand-file-name (car icicle-completion-candidates)
                                        (icicle-file-name-directory-w-default icicle-current-input))
                    (car icicle-completion-candidates))))
           (when (icicle-file-directory-p (expand-file-name icicle-last-completion-candidate))
             (setq icicle-default-directory (expand-file-name icicle-last-completion-candidate))))
         (save-selected-window (icicle-delete-windows-on "<span class="quote">*Completions*</span>"))
         (unless (boundp 'icicle-apropos-complete-and-exit-p)
           (icicle-highlight-complete-input)
           (if icicle-icompleting-p
               (minibuffer-message (format "<span class="quote">  [One apropos completion: %s]</span>"
                                           (car icicle-completion-candidates)))
             (minibuffer-message "<span class="quote">  [Sole apropos completion]</span>"))))
        (t                              <span class="linecomment">; Multiple candidates.</span>
         (if icicle-icompleting-p
             (icicle-display-candidates-in-Completions nil no-display-p)
           (icicle-clear-minibuffer)
           (insert icicle-current-input) <span class="linecomment">; Update minibuffer.</span>
           (icicle-highlight-initial-whitespace icicle-current-input)
           (when (and (icicle-file-name-input-p)
                      (icicle-file-directory-p icicle-last-completion-candidate))
             (setq icicle-default-directory (expand-file-name icicle-last-completion-candidate)))
           (when (member icicle-current-input icicle-completion-candidates)
             (icicle-highlight-complete-input))
           (if (get-buffer-window "<span class="quote">*Completions*</span>" 0)
               (if (and (eq icicle-last-completion-command 'icicle-apropos-complete)
                        (memq last-command '(icicle-apropos-complete handle-switch-frame)))
                   <span class="linecomment">;; Second `S-TAB' in a row.  Scroll window around.</span>
                   (save-selected-window
                     (select-window (get-buffer-window "<span class="quote">*Completions*</span>" 0))
                     (condition-case nil
                         (scroll-up nil)
                       (end-of-buffer (goto-char (point-min)) (forward-line 3))))
                 <span class="linecomment">;; Did something else (e.g. changed input).  Update the display.</span>
                 (icicle-display-candidates-in-Completions nil no-display-p))
             <span class="linecomment">;; No window yet.  Show window.</span>
             (icicle-display-candidates-in-Completions nil no-display-p)))))
  (setq icicle-last-completion-command this-command)
  icicle-completion-candidates)

<span class="linecomment">;;;###autoload</span>
(defun icicle-switch-to-Completions-buf () <span class="linecomment">; Bound to `insert' in minibuffer.</span>
  "<span class="quote">Select the completion list window.
The cursor is placed on the first occurrence of the current minibuffer
content.  You can use \\&lt;completion-list-mode-map&gt;\
`\\[icicle-switch-to-minibuffer]' to get back to the minibuffer.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-switch-to-Completions-buf]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq icicle-current-input (icicle-minibuffer-contents-from-minibuffer))
  (let ((window (get-buffer-window "<span class="quote">*Completions*</span>" t))
        (search-fn 'search-forward))
    (unless window                      <span class="linecomment">; Make sure we have a completions window.</span>
      (icicle-apropos-complete)
      (setq window (get-buffer-window "<span class="quote">*Completions*</span>" t)
            search-fn 're-search-forward)) <span class="linecomment">; Use regexp search: input is not yet complete.</span>
    (when window
      (select-window window)
      (let ((case-fold-search completion-ignore-case))
        (goto-char (point-min))
        (forward-line 3)
        (when (icicle-file-name-input-p)
          (setq icicle-current-input (icicle-file-name-nondirectory icicle-current-input)))
        (when (and (eq icicle-last-completion-command 'icicle-apropos-complete)
                   (not (memq last-command
                              '(icicle-previous-apropos-candidate icicle-next-apropos-candidate
                                icicle-previous-prefix-candidate  icicle-next-prefix-candidate))))
          (setq search-fn 're-search-forward)) <span class="linecomment">; Use regexp search: input is not yet complete.</span>
        (while (and (not (eobp))
                    (save-restriction
                      (narrow-to-region (point) (next-single-property-change (point) 'mouse-face
                                                                             nil (point-max)))
                      (not (funcall search-fn icicle-current-input nil 'leave-at-end)))))
        (unless (eobp)
          (goto-char (match-beginning 0))
          (let ((prop (get-text-property (1- (point)) 'mouse-face)))
            <span class="linecomment">;; If in a completion, move to the start of it.</span>
            (when (and prop (eq prop (get-text-property (point) 'mouse-face)))
              (goto-char (previous-single-property-change (point) 'mouse-face nil (point-min)))))
          (icicle-place-overlay
           (point) (next-single-property-change (point) 'mouse-face nil (point-max))
           'icicle-current-completion-candidate-overlay 'icicle-current-candidate-highlight
           (current-buffer)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-switch-to-minibuffer ()   <span class="linecomment">; Bound to `insert' in *Completions*.</span>
  "<span class="quote">Select the active minibuffer window.
The current candidate in *Completions* (under the cursor) is inserted
into the minibuffer as the current input.  You can use \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-switch-to-Completions-buf]'
to switch to the *Completions* window.

You can use this command only from buffer *Completions* (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-switch-to-minibuffer]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (when (active-minibuffer-window)
    (let ((completion (icicle-current-completion-in-Completions)))
      (select-window (active-minibuffer-window))
      (goto-char (icicle-minibuffer-prompt-end))
      (icicle-clear-minibuffer)
      (insert completion))))

(defun icicle-current-completion-in-Completions ()
  "<span class="quote">The completion candidate under the cursor in buffer *Completions*.
The name is returned as a string.</span>"
  <span class="linecomment">;; This code comes from `choose-completion'.</span>
  (let ((buffer completion-reference-buffer)
        (base-size completion-base-size)
        beg end completion)
    (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
      (setq end (point) beg (1+ (point))))
    (when (and (not (bobp)) (get-text-property (1- (point)) 'mouse-face))
      (setq end (1- (point)) beg (point)))
    (when (null beg) (error "<span class="quote">No completion here</span>"))
    (setq beg (previous-single-property-change beg 'mouse-face)
          end (or (next-single-property-change end 'mouse-face) (point-max)))
    (buffer-substring beg end)))


<span class="linecomment">;; Replaces `previous-completion' (defined in `simple.el').</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-move-to-previous-completion (n) <span class="linecomment">; Bound to `left', `S-TAB' in *Completions*.</span>
  "<span class="quote">Move to the previous item in the completion list.

You can use this command only from buffer *Completions* (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-move-to-previous-completion]').</span>"
  (interactive "<span class="quote">p</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (setq n (or n 0))
  (icicle-move-to-next-completion (- n)))


<span class="linecomment">;; Replaces `next-completion' (defined in `simple.el').</span>
<span class="linecomment">;; This is the same code, except:</span>
<span class="linecomment">;; 1. This highlights the current candidate.</span>
<span class="linecomment">;; 2. This wraps around from first to last and last to first.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-move-to-next-completion (n &optional no-minibuffer-follow-p)
                                        <span class="linecomment">; Bound to `right', `TAB' in *Completions*.</span>
  "<span class="quote">Move to the next item in the completion list.
With prefix argument N, move N items (negative N means move backward).
Optional second argument, if non-nil, means do not copy the completion
back to the minibuffer.

You can use this command only from buffer *Completions* (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-move-to-next-completion]').</span>"
  (interactive "<span class="quote">p</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (setq n (or n 0))
  (let ((beg (save-excursion (goto-char (point-min)) (forward-line 3) (point)))
        (end (point-max)))
    (while (and (&gt; n 0) (not (eobp)))
      <span class="linecomment">;; If in a completion, move to the end of it.</span>
      (when (get-text-property (point) 'mouse-face)
        (goto-char (next-single-property-change (point) 'mouse-face nil end)))
      <span class="linecomment">;; Move to start of next one.</span>
      (unless (get-text-property (point) 'mouse-face)
        (goto-char (or (next-single-property-change (point) 'mouse-face)
                       beg)))           <span class="linecomment">; Wrap back to first candidate.</span>
      (setq n (1- n)))
    (while (and (&lt; n 0) (&gt;= (count-lines 1 (point)) 3))
      (let ((prop (get-text-property (1- (point)) 'mouse-face)))
        <span class="linecomment">;; If in a completion, move to the start of it.</span>
        (when (and prop (eq prop (get-text-property (point) 'mouse-face)))
          (goto-char (previous-single-property-change (point) 'mouse-face nil beg))))
      <span class="linecomment">;; Move to end of the previous completion.</span>
      (unless (or (&lt; (count-lines 1 (point)) 3)
                  (get-text-property (1- (point)) 'mouse-face))
        (goto-char (or (previous-single-property-change (point) 'mouse-face)
                       end)))           <span class="linecomment">; Wrap back to last candidate.</span>
      <span class="linecomment">;; Move to the start of that one.</span>
      (goto-char (previous-single-property-change (point) 'mouse-face nil beg))
      (setq n (1+ n)))
    (icicle-place-overlay
     (point) (next-single-property-change (point) 'mouse-face nil end)
     'icicle-current-completion-candidate-overlay 'icicle-current-candidate-highlight
     (current-buffer)))
  (unless no-minibuffer-follow-p
    (save-excursion (save-window-excursion (icicle-switch-to-minibuffer)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-line ()          <span class="linecomment">; Bound to `up' *Completions*.</span>
  "<span class="quote">Move up a line, in *Completions* buffer.  Wrap around first to last.

You can use this command only from buffer *Completions* (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-previous-line]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (let ((bolp-at-start (bolp)))
    (if (&gt; (count-lines 1 (point)) (if bolp-at-start 3 4))
        (icicle-move-to-previous-completion 2)
      (goto-char (point-max))
      (icicle-move-to-previous-completion 1)
      (if bolp-at-start
          (while (not (bolp)) (icicle-move-to-previous-completion 1))
        (while (bolp) (icicle-move-to-previous-completion 1))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-next-line ()              <span class="linecomment">; Bound to `down' in *Completions*.</span>
  "<span class="quote">Move down a line, in *Completions* buffer.  Wrap around last to first.

You can use this command only from buffer *Completions* (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-next-line]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (let ((num-lines (- (count-lines (point-min) (point-max)) 1))
        (bolp-at-start (bolp)))
    (cond ((&lt; (count-lines 1 (point)) (if bolp-at-start num-lines (1+ num-lines)))
           (icicle-move-to-next-completion 2)
           (when (and (bolp) (not bolp-at-start)) (icicle-move-to-next-completion 1)))
          (t
           (goto-char (point-min))
           (icicle-move-to-next-completion 1)
           (if bolp-at-start
               (while (not (bolp))
                 (icicle-move-to-next-completion 1))
             (while (bolp) (icicle-move-to-next-completion 1)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-all-candidates-action ()  <span class="linecomment">; Bound to `C-!' in minibuffer.</span>
  "<span class="quote">Take action on all completion candidates.
Apply `icicle-candidate-action-fn' to each completion candidate that
matches the current input (a regular expression), successively.
The candidates that were not successfully acted upon are listed in
buffer *Help*.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-all-candidates-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (unless icicle-candidate-action-fn (error "<span class="quote">No action.  `icicle-candidate-action-fn' is nil.</span>"))
  (let ((candidates icicle-completion-candidates)
        (failures nil))
    (while candidates
      (let ((error-msg (condition-case act-on-each
                           (funcall icicle-candidate-action-fn (car candidates))
                         (error (error-message-string act-on-each)))))
        (when error-msg
          (setq failures (cons (cons (car candidates) error-msg) failures)))
        (setq candidates (cdr candidates))))
    (when failures
      (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
        (princ "<span class="quote">Action failures:</span>")(terpri)(terpri)
        (mapcar (lambda (entry)
                  (princ (car entry)) (princ "<span class="quote">:</span>") (terpri) (princ "<span class="quote">  </span>")
                  (princ (cdr entry)) (terpri))
                failures))))
  (icicle-abort-minibuffer-input))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-action ()       <span class="linecomment">; Bound to `C-RET' and `C-o' in minibuffer.</span>
  "<span class="quote">Take action on the current minibuffer-completion candidate.
If `icicle-candidate-action-fn' is non-nil, it is a function to apply
to the current candidate, to perform the action.

If `icicle-candidate-action-fn' is nil, the default action is
performed: display help on the candidate - see
`icicle-help-on-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (if icicle-candidate-action-fn
      (funcall icicle-candidate-action-fn icicle-last-completion-candidate)
    (icicle-help-on-candidate))
  <span class="linecomment">;; Raise *Completions* frame, if displayed.  This helps keep *Completions* on top.</span>
  (let ((compl-win (get-buffer-window "<span class="quote">*Completions*</span>" 'visible)))
    (when compl-win
      (save-window-excursion
        (select-window compl-win)
        <span class="linecomment">;; Move frame to the right, out of the way.</span>
        (when (and (one-window-p t) icicle-Completions-frame-at-right-flag)
          (modify-frame-parameters
           (selected-frame)                 <span class="linecomment">; Hard-code 7 here - what does it depend on?</span>
           `((left . ,(- (x-display-pixel-width) (+ (frame-pixel-width) 7))))))
        (raise-frame)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-candidate-action (event) <span class="linecomment">; Bound to `C-mouse-2' in *Completions*.</span>
  "<span class="quote">Take action on the minibuffer-completion candidate clicked by mouse.
If `icicle-candidate-action-fn' is non-nil, it is a function to apply
to the clicked candidate, to perform the action.

If `icicle-candidate-action-fn' is nil, the default action is
performed: display help on the candidate - see
`icicle-help-on-candidate'.</span>"
  (interactive "<span class="quote">e</span>")
  (run-hooks 'mouse-leave-buffer-hook)  <span class="linecomment">; Give temp modes such as isearch a chance to turn off.</span>
  (let ((buffer (window-buffer))
        (posn-win (posn-window (event-start event)))
        (posn-col (car (posn-col-row (event-start event))))
        (posn-row (cdr (posn-col-row (event-start event))))
        choice base-size)
    (save-excursion
      (set-buffer (window-buffer posn-win))
      (when completion-reference-buffer (setq buffer completion-reference-buffer))
      (setq base-size completion-base-size)
      (save-excursion
        (goto-char (posn-point (event-start event)))
        (let (beg end)
          (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
            (setq end (point) beg (1+ (point))))
          (when (null beg) (error "<span class="quote">No completion here</span>"))
          (setq beg    (previous-single-property-change beg 'mouse-face)
                end    (or (next-single-property-change end 'mouse-face)(point-max))
                choice (buffer-substring-no-properties beg end)))))
    (setq icicle-candidate-nb (icicle-nb-of-candidate-in-Completions
                               (posn-point (event-start event)))
          icicle-last-completion-candidate choice)
    (if icicle-candidate-action-fn
        (funcall icicle-candidate-action-fn icicle-last-completion-candidate)
      (icicle-help-on-candidate))
    <span class="linecomment">;; Raise *Completions* frame, if displayed.  This helps keep *Completions* on top.</span>
    (let ((compl-win (get-buffer-window "<span class="quote">*Completions*</span>" 'visible)))
      (when compl-win
        (save-window-excursion
          (select-window compl-win)
          (raise-frame)
          <span class="linecomment">;; Do this because `icicle-candidate-action-fn' calls `select-frame-set-input-focus',</span>
          <span class="linecomment">;; which can position mouse pointer on minibuffer frame.</span>
          (set-mouse-position (selected-frame) posn-col posn-row))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-narrow-candidates ()      <span class="linecomment">; Bound to `M-*' in minibuffer.</span>
  "<span class="quote">Narrow the set completion candidates using another input regexp.
This, in effect, performs a set intersection operation on 1) the set
of candidates in effect before the operation and 2) the set of
candidates that match the current input.  You can repeatedly use this
command to continue intersecting candidate sets, progressively
narrowing the set of matches.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-narrow-candidates]').</span>"
  <span class="linecomment">;; We handle `no-catch' errors here because `old-completing-read' and `old-read-file-file-name'</span>
  <span class="linecomment">;; can still be called in Icicle mode by, for instance, an `interactive' spec</span>
  <span class="linecomment">;; (e.g. (interactive "bBuffer: ")).  In that case, we throw to a non-existant catch.</span>
  <span class="linecomment">;; After doing that, we just insert the result, to pass it to the next-higher recursive minibuffer.</span>
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let ((enable-recursive-minibuffers t)
        (icicle-reminder-prompt-flag nil))
    (cond ((null icicle-completion-candidates)
           (error
            (substitute-command-keys
             "<span class="quote">No completion candidates.  Did you use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-complete]' or `\\[icicle-apropos-complete]'?</span>")))
          ((null (cdr icicle-completion-candidates))
           (minibuffer-message "<span class="quote">  [Sole completion]</span>")
           (condition-case i-narrow-candidates
               (throw 'icicle-read-top (car icicle-completion-candidates))
             (no-catch (setq icicle-current-input (car icicle-completion-candidates))
                       (icicle-retrieve-last-input)
                       icicle-current-input)
             (error (message (error-message-string i-narrow-candidates)))))
          (t
           (let ((result (completing-read "<span class="quote">Match also (regexp): </span>"
                                  (mapcar #'list icicle-completion-candidates))))
             <span class="linecomment">;; Normally, `icicle-narrow-candidates' is called from the minibuffer.</span>
             <span class="linecomment">;; If not, just return the result read.</span>
             (if (&gt; (minibuffer-depth) 0)
                 (condition-case i-narrow-candidates
                     (throw 'icicle-read-top result)
                   (no-catch (setq icicle-current-input result)
                             (icicle-retrieve-last-input)
                             icicle-current-input)
                   (error (message (error-message-string i-narrow-candidates))))
               result))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-swap ()     <span class="linecomment">; Bound to `C-%' in minibuffer.</span>
  "<span class="quote">Swap the saved set and current sets of completion candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-swap]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq icicle-saved-completion-candidates
        (prog1 icicle-completion-candidates
          (setq icicle-completion-candidates icicle-saved-completion-candidates)))
  (minibuffer-message "<span class="quote">  [Saved set of candidates SWAPPED with current]</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-define ()   <span class="linecomment">; Bound to `C-:' in minibuffer.</span>
  "<span class="quote">Define the set of current completion candidates by evaluating a sexpr.
The sexpr must evaluate to a list of strings, such as is returned by
`all-completions'.

You can use this command at top level or from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-define]').</span>"
  (interactive)
  (let* ((enable-recursive-minibuffers t)
         (evald-sexpr (eval-minibuffer "<span class="quote">Set the completion candidates to sexpr (eval): </span>")))
    (if (or (null evald-sexpr) (and (consp evald-sexpr) (stringp (car evald-sexpr))))
        (setq icicle-completion-candidates evald-sexpr)
      (error "<span class="quote">Sexpr did not evaluate to a list of strings: %S</span>" evald-sexpr)))
  (icicle-maybe-sort-and-strip-candidates)
  (message "<span class="quote">List of completion candidates DEFINED: %S</span>" icicle-completion-candidates)
  (when (&gt; (minibuffer-depth) 0)
    (message "<span class="quote">Displaying completion candidates...</span>")
    (with-output-to-temp-buffer "<span class="quote">*Completions*</span>"
      (display-completion-list icicle-completion-candidates))
    (icicle-narrow-candidates)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-difference () <span class="linecomment">; Bound to `C--' in minibuffer.</span>
  "<span class="quote">Take the set difference between the current and saved candidates.
The new set of candidates is the set of candidates prior to executing
this command minus the saved set of candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-difference]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-candidate-set-1 'icicle-set-difference "<span class="quote">  [saved set of candidates SUBTRACTED]</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-union ()    <span class="linecomment">; Bound to `C-+' in minibuffer.</span>
  "<span class="quote">Take the set union between the current and saved candidates.
The new set of candidates is the union of the saved set of candidates
and the set of candidates prior to executing this command.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-union]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-candidate-set-1 'icicle-set-union "<span class="quote">  [saved set of candidates ADDED]</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-intersection () <span class="linecomment">; Bound to `C-*' in minibuffer.</span>
  "<span class="quote">Take the set intersection between the current and saved candidates.
The new set of candidates is the intersection of the saved set of
candidates and the set of candidates prior to executing this command.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-intersection]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-candidate-set-1 'icicle-set-intersection
                          "<span class="quote">  [INTERSECTION of saved and current sets of candidates]</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-complement () <span class="linecomment">; Bound to `C-~' in minibuffer.</span>
  "<span class="quote">Complement the set of current completion candidates.
The new set of candidates is the set of `all-completions' minus the
set of candidates prior to executing this command - that is, all
possible completions of the appropriate type, except for those that
are in the current set of completions.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-complement]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq icicle-completion-candidates
        (icicle-set-difference
         (all-completions "<span class="quote"></span>" minibuffer-completion-table minibuffer-completion-predicate
                          icicle-ignore-space-prefix-flag)
         icicle-completion-candidates))
  (icicle-maybe-sort-and-strip-candidates)
  (message "<span class="quote">Displaying completion candidates...</span>")
  (with-output-to-temp-buffer "<span class="quote">*Completions*</span>" (display-completion-list icicle-completion-candidates))
  (minibuffer-message "<span class="quote">  [Set of candidates COMPLEMENTED]</span>")
  (icicle-narrow-candidates))

(defun icicle-retrieve-candidates-from-set (set-name)
  "<span class="quote">Retrieve the saved set of completion candidates named SET-NAME.
The candidates are retrieved to `icicle-saved-completion-candidates'.
Return the name of the cache file for set SET-NAME.</span>"
  (let ((file-name (cdr (assoc set-name icicle-saved-completion-sets))))
    (unless file-name (error "<span class="quote">Set `%s' not found in `icicle-saved-completion-sets'.  \
Use `icicle-add/update-saved-completion-set'</span>" set-name))
    (unless (icicle-file-readable-p file-name) (error "<span class="quote">Cannot read cache file `%s'</span>" file-name))
    (let ((list-buf (find-file-noselect file-name 'nowarn 'raw))
          (candidates nil))
      (message "<span class="quote">Retrieving saved candidates from `%s'...</span>" file-name)
      (unwind-protect
           (when (listp (setq candidates (read list-buf)))
             (message "<span class="quote">Set `%s' read from file `%s'</span>" set-name file-name))
        (kill-buffer list-buf))
      (unless candidates (error "<span class="quote">No completion candidates in file `%s'</span>" file-name))
      (setq icicle-saved-completion-candidates candidates))
    file-name))                         <span class="linecomment">; Return cache-file name.</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve (&optional arg) <span class="linecomment">; Bound to `C-&lt;' in minibuffer.</span>
  "<span class="quote">Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save]', `\\[icicle-candidate-set-save-to-variable]', or \
`\\[icicle-candidate-set-save-to-cache-file]'.
With a plain prefix arg `C-u', retrieve candidates from a cache file.
With a numeric prefix arg N, retrieve candidates from a variable.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let ((name nil)
        (variablep (and arg (atom arg))))
    (if arg
        (let ((enable-recursive-minibuffers t))
          (if variablep
              (setq icicle-completion-candidates
                    (symbol-value (setq name (intern
                                              (completing-read
                                               "<span class="quote">Retrieve candidates from variable: </span>"
                                               icicle-saved-candidates-variables-obarray)))))
            (let ((set-name (completing-read "<span class="quote">Retrieve completion candidates from set: </span>"
                                             icicle-saved-completion-sets
                                             nil nil nil nil (caar icicle-saved-completion-sets))))
              (setq name (icicle-retrieve-candidates-from-set set-name)))
            (setq icicle-completion-candidates icicle-saved-completion-candidates)))
      (setq icicle-completion-candidates icicle-saved-completion-candidates))
    (message (substitute-command-keys
              (format "<span class="quote">%s (`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-apropos-complete]' or \
`\\[icicle-prefix-complete]' to display)</span>"
                      (if name
                          (format "<span class="quote">Saved candidates RESTORED from %s `%s'</span>"
                                  (if variablep "<span class="quote">variable</span>" "<span class="quote">cache file</span>") name)
                        "<span class="quote">Saved candidates RESTORED</span>"))))
    (sit-for 2)
    (icicle-narrow-candidates)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve-from-variable () <span class="linecomment">; Bound to `M-C-{' in minibuffer.</span>
  "<span class="quote">Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-to-variable]' (or `\\[icicle-candidate-set-save]' with a numeric
prefix arg).

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-from-variable]').</span>"
  (interactive)
  (icicle-candidate-set-retrieve 99))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve-from-cache-file () <span class="linecomment">; Bound to `C-{' in minibuffer.</span>
  "<span class="quote">Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-to-cache-file]' or `C-u \\[icicle-candidate-set-save]'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-from-cache-file]').</span>"
  (interactive)
  (icicle-candidate-set-retrieve '(1)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save (&optional arg) <span class="linecomment">; Bound to `C-&gt;' in minibuffer.</span>
  "<span class="quote">Save the set of current completion candidates, for later recall.
Saves candidates in variable `icicle-saved-completion-candidates', by
default.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a numeric prefix arg (`C-u N'), save candidates in a variable.

You can retrieve the saved set of candidates with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let ((candidates icicle-completion-candidates))
    (if arg
        (let ((enable-recursive-minibuffers t))
          (if (consp arg)
              (let ((file-name (icicle-add/update-saved-completion-set))) <span class="linecomment">; Write to cache also.</span>
                (setq icicle-saved-completion-candidates candidates)
                (with-temp-message (format "<span class="quote">Writing completion candidates to cache file `%s'...</span>"
                                           file-name)
                  (with-temp-file file-name
                    (prin1 icicle-saved-completion-candidates (current-buffer))))
                (minibuffer-message (format "<span class="quote">  [Current candidates SAVED to cache file `%s']</span>"
                                            file-name)))
            (let ((var-name (completing-read "<span class="quote">Save candidates in variable: </span>"
                                             icicle-saved-candidates-variables-obarray)))
              (intern var-name icicle-saved-candidates-variables-obarray) <span class="linecomment">; For retrieval completion.</span>
              (set (intern var-name) candidates))))
      (setq icicle-saved-completion-candidates candidates))
    (minibuffer-message "<span class="quote">  [Current candidates SAVED]</span>")))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save-to-variable () <span class="linecomment">; Bound to `M-C-}' in minibuffer.</span>
  "<span class="quote">Save the set of current completion candidates in a variable you choose.
You can retrieve the saved set of candidates with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-from-variable]' (or `\\[icicle-candidate-set-retrieve]'
with a numeric prefix arg).
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-to-variable]').</span>"
  (interactive)
  (icicle-candidate-set-save 99))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save-to-cache-file () <span class="linecomment">; Bound to `C-}' in minibuffer.</span>
  "<span class="quote">Save the set of current completion candidates persistently in a file.
You can retrieve the saved set of candidates with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-from-cache-file]' or `C-u \\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-to-cache-file]').</span>"
  (interactive)
  (icicle-candidate-set-save '(1)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-add/update-saved-completion-set ()
  "<span class="quote">Add or update an entry in `icicle-saved-completion-sets'.
You are prompted for the name of a set of completion candidates and
its cache file.  List `icicle-saved-completion-sets' is updated to
have an entry with these set and file names.
Returns the cache-file name.</span>"
  (interactive)
  (let* ((set-name (completing-read "<span class="quote">Name of completion-candidates set: </span>"
                                    icicle-saved-completion-sets
                                    nil nil nil nil (caar icicle-saved-completion-sets)))
         (file-name "<span class="quote"></span>"))
    (while (not (icicle-file-writable-p file-name))
      (setq file-name (expand-file-name
                       (read-file-name "<span class="quote">Cache file for the set: </span>" default-directory nil nil
                                       (concat "<span class="quote">icicles-</span>"
                                               (icicle-delete-whitespace-from-string set-name)
                                               "<span class="quote">.cache</span>")))))
    (setq icicle-saved-completion-sets  <span class="linecomment">; Remove any old definition of this set.</span>
          (delete (assoc set-name icicle-saved-completion-sets) icicle-saved-completion-sets))
    (push (cons set-name file-name) icicle-saved-completion-sets) <span class="linecomment">; Add new set definition.</span>
    (customize-save-variable 'icicle-saved-completion-sets icicle-saved-completion-sets)
    (message "<span class="quote">Set `%s' was added/updated in `icicle-saved-completion-sets'</span>" set-name)
    file-name))                         <span class="linecomment">; Return cache-file name.</span>

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-remove-saved-completion-set <span class="linecomment">; Command name</span>
                       "<span class="quote">Remove an entry from `icicle-saved-completion-sets'.
This does not remove the associated cache file.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (set-name) <span class="linecomment">; Action function</span>
                         (setq icicle-saved-completion-sets
                               (delete (assoc set-name icicle-saved-completion-sets)
                                       icicle-saved-completion-sets))
                         (customize-save-variable 'icicle-saved-completion-sets
                                                  icicle-saved-completion-sets)
                         (message "<span class="quote">Candidate set `%s' removed</span>" set-name))
                       "<span class="quote">Remove set of completion candidates named: </span>" <span class="linecomment">; `completing-read' args</span>
                       icicle-saved-completion-sets nil t nil nil
                       (caar icicle-saved-completion-sets))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-saved-file-candidates (prompt-for-dir-p)
  "<span class="quote">Open Dired on the set of completion candidates saved with `C-&gt;'.
With a prefix argument, you are prompted for the directory.</span>"
  (interactive "<span class="quote">P</span>")
  (unless icicle-saved-completion-candidates
    (error "<span class="quote">No saved completion candidates.  Use `C-&gt;' to save candidates</span>"))
  (let* ((default-directory (if prompt-for-dir-p
                                (read-file-name "<span class="quote">Directory: </span>" nil default-directory nil)
                              default-directory))
         (existing-dired-buffer (get-buffer (file-name-nondirectory
                                             (directory-file-name default-directory)))))
    (unless (file-exists-p (car icicle-saved-completion-candidates))
      (error "<span class="quote">Bad directory? No file `%s' in `%s'</span>"
             (car icicle-saved-completion-candidates) default-directory))
    (when (and existing-dired-buffer
               (y-or-n-p (format "<span class="quote">Replace existing Dired buffer `%s'? </span>"
                                 (buffer-name existing-dired-buffer))))
      (kill-buffer existing-dired-buffer))
    (dired (cons default-directory icicle-saved-completion-candidates))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-saved-file-candidates-other-window (prompt-for-dir-p)
  "<span class="quote">Open Dired on the set of completion candidates saved with `C-&gt;'.
Open in another window.
With a prefix argument, you are prompted for the directory.</span>"
  (interactive "<span class="quote">P</span>")
  (unless icicle-saved-completion-candidates
    (error "<span class="quote">No saved completion candidates.  Use `C-&gt;' to save candidates</span>"))
  (let* ((default-directory (if prompt-for-dir-p
                                (read-file-name "<span class="quote">Directory: </span>" nil default-directory nil)
                              default-directory))
         (existing-dired-buffer (get-buffer (file-name-nondirectory
                                             (directory-file-name default-directory)))))
    (unless (file-exists-p (car icicle-saved-completion-candidates))
      (error "<span class="quote">Bad directory? No file `%s' in `%s'</span>"
             (car icicle-saved-completion-candidates) default-directory))
    (when (and existing-dired-buffer
               (y-or-n-p (format "<span class="quote">Replace existing Dired buffer `%s'? </span>"
                                 (buffer-name existing-dired-buffer))))
      (if (fboundp 'kill-buffer-and-its-windows)
          (kill-buffer-and-its-windows existing-dired-buffer) <span class="linecomment">; Defined in `misc-cmds.el'</span>
        (kill-buffer existing-dired-buffer)))
    (dired-other-window (cons default-directory icicle-saved-completion-candidates))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-help-on-candidate ()      <span class="linecomment">; Bound to `C-help' and `C-f1' in minibuffer.</span>
  "<span class="quote">Display help on current minibuffer-completion candidate.
The help displayed depends on the type of candidate, as follows:

 menu item - the corresponding command is described using
             `describe-function' (available only if `icicles-menu.el'
             is loaded)
 command or other function - described using `describe-function'
 user option or other variable - described using `describe-variable'
 face - described using `describe-face'
 property list - described using `apropos-describe-plist'
 buffer name - modes described using `describe-mode' (Emacs &gt; 20).

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-help-on-candidate]').</span>"
  (interactive)                         <span class="linecomment">; Interactively, just describes itself.</span>
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let ((frame-with-focus (selected-frame))
        (cand-symb (intern-soft icicle-last-completion-candidate)))
    <span class="linecomment">;; Use command associated with a menu item.  `icicle-menu-items-alist' is set in</span>
    <span class="linecomment">;; `icicles-menu.el'.  If non-nil, then `icicle-execute-menu-command' is being called.</span>
    (when (consp icicle-menu-items-alist) <span class="linecomment">; This is a call to `icicle-execute-menu-command'.</span>
      (setq cand-symb (cdr (assoc icicle-last-completion-candidate icicle-menu-items-alist)))
      (unless (symbolp cand-symb) (setq cand-symb nil))) <span class="linecomment">; Menu item with lambda definition.</span>
    (cond (cand-symb
           (cond ((functionp cand-symb) (describe-function cand-symb))
                 ((boundp cand-symb) (describe-variable cand-symb))
                 ((facep cand-symb) (describe-face cand-symb))
                 ((symbol-plist cand-symb) (apropos-describe-plist cand-symb))
                 (t (icicle-msg-maybe-in-minibuffer "<span class="quote">No help</span>"))))
          (t                            <span class="linecomment">; Not a symbol - treat string itself.</span>
           (cond ((and (bufferp (get-buffer icicle-last-completion-candidate))
                       (condition-case nil <span class="linecomment">; Emacs 21+ `describe-mode' takes arg; not Emacs 20</span>
                           (describe-mode icicle-last-completion-candidate)
                         (wrong-number-of-arguments nil))))
                 (t (icicle-msg-maybe-in-minibuffer "<span class="quote">No help</span>")))))
    <span class="linecomment">;; This is a hack for MS Windows - otherwise, we can't continue to get more candidates,</span>
    <span class="linecomment">;; because the *Help* frame takes the focus away from the minibuffer frame.</span>
    <span class="linecomment">;; MS Windows always gives focus to a newly created frame - in this case, *Help*.</span>
    (let* ((help-window (get-buffer-window "<span class="quote">*Help*</span>" t))
           (help-frame (and help-window (window-frame help-window))))
      (when help-frame (redirect-frame-focus help-frame frame-with-focus))))
  (message nil))                        <span class="linecomment">; Let minibuffer contents show immmediately.</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-keep-only-past-inputs ()  <span class="linecomment">; Bound to`M-pause' in minibuffer.</span>
  "<span class="quote">Reduce completion candidates to those that have been used previously.
This filters the set of current completion candidates, keeping only
those that have been used before.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-keep-only-past-inputs]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (if (null icicle-completion-candidates)
      (minibuffer-message "<span class="quote">  [No completion candidates to filter]</span>")
    (when (and (symbolp minibuffer-history-variable)
               (consp (symbol-value minibuffer-history-variable)))
      (setq icicle-completion-candidates
            (icicle-delete-if-not
             (lambda (candidate)
               (when (icicle-file-name-input-p)
                 (setq candidate (expand-file-name candidate
                                                   (file-name-directory icicle-last-input))))
               (member candidate (symbol-value minibuffer-history-variable)))
             icicle-completion-candidates))
      (cond ((null icicle-completion-candidates)
             (save-selected-window (icicle-delete-windows-on "<span class="quote">*Completions*</span>"))
             (minibuffer-message "<span class="quote">  [None of the completions have been used before]</span>"))
            (t
             (setq icicle-current-input
                   (if (memq last-command
                             '(icicle-next-apropos-candidate icicle-previous-apropos-candidate
                               icicle-next-prefix-candidate  icicle-previous-prefix-candidate))
                       icicle-last-input
                     (icicle-minibuffer-contents-from-minibuffer)))
             (icicle-retrieve-last-input)
             (cond ((null icicle-completion-candidates)
                    (setq icicle-nb-of-other-cycle-candidates 0)
                    (save-selected-window (icicle-delete-windows-on "<span class="quote">*Completions*</span>"))
                    (minibuffer-message "<span class="quote">  [No matching history element]</span>"))
                   ((null (cdr icicle-completion-candidates)) <span class="linecomment">; Single candidate. Update minibuffer.</span>
                    (setq icicle-nb-of-other-cycle-candidates 0)
                    (icicle-clear-minibuffer)
                    (insert (setq icicle-last-completion-candidate
                                  (if (and (icicle-file-name-input-p) insert-default-directory)
                                      (expand-file-name (car icicle-completion-candidates)
                                                        (icicle-file-name-directory-w-default
                                                         (car icicle-completion-candidates)))
                                    (car icicle-completion-candidates))))
                    (save-selected-window (icicle-delete-windows-on "<span class="quote">*Completions*</span>"))
                    (icicle-highlight-complete-input)
                    (minibuffer-message (format "<span class="quote">  [One matching history element]</span>")))
                   (t
                    (when (member icicle-current-input icicle-completion-candidates)
                      (icicle-highlight-complete-input))
                    (if (get-buffer-window "<span class="quote">*Completions*</span>" 0)
                        (if (and (eq icicle-last-completion-command 'icicle-keep-only-past-inputs)
                                 (memq last-command
                                       '(icicle-keep-only-past-inputs handle-switch-frame)))
                            <span class="linecomment">;; Second `S-TAB' in a row.  Scroll window around.</span>
                            (save-selected-window
                              (select-window (get-buffer-window "<span class="quote">*Completions*</span>" 0))
                              (condition-case nil
                                  (scroll-up nil)
                                (end-of-buffer (goto-char (point-min)) (forward-line 3))))
                          <span class="linecomment">;; Did something else (e.g. changed input).  Update the display.</span>
                          (icicle-display-candidates-in-Completions))
                      <span class="linecomment">;; No window yet.  Show window.</span>
                      (icicle-display-candidates-in-Completions))
                    (save-window-excursion
                      (select-window (active-minibuffer-window))
                      (minibuffer-message "<span class="quote">  [Filtered to (matching) historical candidates]</span>"))))
             (setq icicle-last-completion-command this-command))))
    icicle-completion-candidates))

<span class="linecomment">;;;###autoload</span>
(defun icicle-history ()                <span class="linecomment">; Bound to `M-h' in minibuffer.</span>
  "<span class="quote">Access the appropriate history list using completion or cycling.
The current minibuffer input is interpreted as a regexp and matched
against items in the history list in use for the current command.

Note:

If the required input is a file or directory name, then the entire
minibuffer input is what is matched against the history list.  The
reason for this is that file names in the history list are absolute.
This is unlike the case for normal file-name completion, which assumes
the default directory.

Keep this in mind for apropos (regexp) completion; it means that to
match a file-name using a substring you must, in the minibuffer,
either not specify a directory or explicitly use \</span>".*\"<span class="quote"> before the
file-name substring.

For example, `/foo/bar/lph' will not apropos-match the previously
input file name `/foo/bar/alphabet-soup.el'; you should use either
`/foo/bar/.*lph' or `lph' (no directory).

This also represents a difference in behavior compared to the similar
command `icicle-keep-only-past-inputs' (\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-keep-only-past-inputs] in the minibuffer).
That command simply filters the current set of completion candidates,
which in the case of file-name completion is a set of relative file
names.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-history]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (when (icicle-file-name-input-p) (setq minibuffer-completion-predicate nil))
  (when (arrayp minibuffer-completion-table)
    (setq minibuffer-completion-predicate
          `(lambda (elt) (funcall ',minibuffer-completion-predicate (intern (car elt))))))
  (when (and (symbolp minibuffer-history-variable)
             (consp (symbol-value minibuffer-history-variable)))
    (setq minibuffer-completion-table
          (mapcar #'list (icicle-remove-duplicates (symbol-value minibuffer-history-variable)))))
  (setq icicle-last-completion-command "<span class="quote"></span>") <span class="linecomment">; Force redisplay of *Completions* even if displayed.</span>
  (setq icicle-current-input
        (if (memq last-command
                  '(icicle-next-apropos-candidate icicle-previous-apropos-candidate
                    icicle-next-prefix-candidate  icicle-previous-prefix-candidate))
            icicle-last-input
          (icicle-minibuffer-contents-from-minibuffer)))
  (icicle-retrieve-last-input)
  (icicle-apropos-complete))

<span class="linecomment">;; This is not actually a minibuffer command, since `isearch' technically uses the echo area.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-isearch-complete ()       <span class="linecomment">; Bound to `S-TAB' in `isearch-mode-map'.</span>
  "<span class="quote">Complete the search string using candidates from the search ring.</span>"
  (interactive)
  (isearch-done 'nopush)
  (let* ((ring (if isearch-regexp regexp-search-ring search-ring))
         (completion (completing-read "<span class="quote">Complete search string: </span>"
                                      (mapcar #'list (icicle-remove-duplicates ring))
                                      nil nil isearch-string
                                      (if isearch-regexp 'regexp-search-ring 'search-ring))))
    (setq isearch-string completion)
    (icicle-isearch-resume isearch-string isearch-regexp isearch-word isearch-forward
                           (mapconcat 'isearch-text-char-description isearch-string "<span class="quote"></span>")
                           nil)))

(defun icicle-isearch-resume (search regexp word forward message case-fold)
  "<span class="quote">Resume an incremental search.
SEARCH is the string or regexp searched for.
REGEXP non-nil means the resumed search was a regexp search.
WORD non-nil means resume a word search.
FORWARD non-nil means resume a forward search.
MESSAGE is the echo-area message recorded for the search resumed.
CASE-FOLD non-nil means the search was case-insensitive.</span>"
  (isearch-mode forward regexp nil nil word)
  (setq isearch-string search
	isearch-message message
	isearch-case-fold-search case-fold)
  (isearch-search-and-update))


(defalias 'toggle-icicle-incremental-completion 'icicle-toggle-incremental-completion)

<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-incremental-completion () <span class="linecomment">; Bound to `C-#' in the minibuffer.</span>
  "<span class="quote">Toggle the value of option `icicle-incremental-completion-flag'.
If the current value is t or `always', then it is set to nil.
If the current value is nil, then it is set to t.
This command never sets the value to non-nil and non-t.</span>"
  (interactive)
  (setq icicle-incremental-completion-flag (not icicle-incremental-completion-flag))
  (setq icicle-incremental-completion-p icicle-incremental-completion-flag)
  (icicle-msg-maybe-in-minibuffer (if icicle-incremental-completion-flag
                                      "<span class="quote">Incremental completion is now ON</span>"
                                    "<span class="quote">Incremental completion is now OFF</span>")))


(defalias 'toggle-icicle-sorting 'icicle-toggle-sorting)

<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-sorting ()         <span class="linecomment">; Bound to `C-,' in the minibuffer.</span>
  "<span class="quote">Toggle sorting of minibuffer completion candidates.
When sorting is active, comparison is done by `icicle-sort-function'.</span>"
  (interactive)
  (if icicle-sort-function
      (setq icicle-last-sort-function icicle-sort-function <span class="linecomment">; Save it, for restoring.</span>
            icicle-sort-function      nil)
    (setq icicle-sort-function icicle-last-sort-function)) <span class="linecomment">; Restore it.</span>
  (icicle-update-completions)
  (icicle-msg-maybe-in-minibuffer (if icicle-sort-function
                                      "<span class="quote">Completion-candidate sorting is now ON</span>"
                                    "<span class="quote">Completion-candidate sorting is now OFF</span>")))


(defalias 'toggle-icicle-ignored-space-prefix 'icicle-toggle-ignored-space-prefix)

<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-ignored-space-prefix ()    <span class="linecomment">; Bound to `C-^' in the minibuffer.</span>
  "<span class="quote">Toggle `icicle-ignore-space-prefix-flag'.
Note: If the current command binds `icicle-ignore-space-prefix-flag'
locally, then it is the local, not the global, value that is changed.
For example, `icicle-buffer' binds it to the value of
`icicle-buffer-ignore-space-prefix-flag'.  If that is non-nil, then
\\&lt;minibuffer-local-completion-map&gt;`\\[icicle-toggle-ignored-space-prefix]' toggles \
`icicle-ignore-space-prefix-flag' to nil only for the
duration of `icicle-buffer'.</span>"
  (interactive)
  (setq icicle-ignore-space-prefix-flag (not icicle-ignore-space-prefix-flag))
  (icicle-update-completions)
  (icicle-msg-maybe-in-minibuffer (if icicle-ignore-space-prefix-flag
                                      "<span class="quote">Ignoring space prefix is now ON</span>"
                                    "<span class="quote">Ignoring space prefix is now OFF</span>")))


(defalias 'toggle-icicle-ignored-extensions 'icicle-toggle-ignored-extensions)

<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-ignored-extensions () <span class="linecomment">; Bound to `C-.' in the minibuffer.</span>
  "<span class="quote">Toggle respect of `completion-ignored-extensions'.</span>"
  (interactive)
  (if (consp completion-ignored-extensions)
      (setq icicle-saved-ignored-extensions  completion-ignored-extensions <span class="linecomment">; Save it.</span>
            completion-ignored-extensions    nil
            icicle-ignored-extensions-regexp nil)
    (setq completion-ignored-extensions icicle-saved-ignored-extensions) <span class="linecomment">; Restore it.</span>
    (setq icicle-ignored-extensions-regexp <span class="linecomment">; Make regexp for ignored file extensions.</span>
          (concat "<span class="quote">\\(</span>" (mapconcat #'regexp-quote completion-ignored-extensions "<span class="quote">\\|</span>") "<span class="quote">\\)\\'</span>")))
  <span class="linecomment">;; Flag to prevent updating `icicle-ignored-extensions-regexp' unless</span>
  <span class="linecomment">;; `completion-ignored-extensions' changes.</span>
  (setq icicle-ignored-extensions completion-ignored-extensions)
  (icicle-update-completions)
  (icicle-msg-maybe-in-minibuffer (if completion-ignored-extensions
                                      "<span class="quote">Ignoring selected file extensions is now ON</span>"
                                    "<span class="quote">Ignoring selected file extensions is now OFF</span>")))

(defalias 'toggle-icicle-regexp-quote 'icicle-toggle-regexp-quote)

<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-regexp-quote ()    <span class="linecomment">; Bound to `C-`' in the minibuffer.</span>
  "<span class="quote">Toggle escaping of regexp special chars (`icicle-regexp-quote-flag').</span>"
  (interactive)
  (setq icicle-regexp-quote-flag (not icicle-regexp-quote-flag))
  (icicle-update-completions)
  (icicle-msg-maybe-in-minibuffer (if icicle-regexp-quote-flag
                                      "<span class="quote">Escaping of regexp special characters is now ON</span>"
                                    "<span class="quote">Escaping of regexp special characters is now OFF</span>")))




<span class="linecomment">;;; Commands to be used mainly at top level  . . . . . . . .</span>


<span class="linecomment">;;; Icicles multi-commands .   .   .   .   .   .   .   .   .</span>

<span class="linecomment">;; Suggested global binding: `M-x'</span>
(icicle-define-command icicle-execute-extended-command <span class="linecomment">; Command name</span>
                       "<span class="quote">Read command name, then read its arguments and call it.
This is `execute-extended-command', turned into a multi-command.</span>" <span class="linecomment">; Doc string</span>
                       icicle-execute-extended-command-1 <span class="linecomment">; Function to perform the action</span>
                       "<span class="quote">Execute command: </span>" <span class="linecomment">; `completing-read' args</span>
                       obarray 'commandp t nil 'extended-command-history nil nil
                       ((last-cmd last-command))) <span class="linecomment">; Save the last command.</span>

(defun icicle-execute-extended-command-1 (cmd-name)
  "<span class="quote">Candidate action function for `icicle-execute-extended-command'.</span>"
  (set-buffer orig-buff) (select-window orig-window) <span class="linecomment">; These are free variables here.</span>

  <span class="linecomment">;; Rebind `icicle-candidate-action-fn' to a function that calls the</span>
  <span class="linecomment">;; candidate CMD-NAME on a single argument that it reads.  This is</span>
  <span class="linecomment">;; only used if CMD-NAME is a command that, itself, reads an input</span>
  <span class="linecomment">;; argument with completion.  When that is the case, you can use</span>
  <span class="linecomment">;; completion on that input, and if you do that, you can use `C-RET'</span>
  <span class="linecomment">;; to use command CMD-NAME as a multi-command.  In other words, this</span>
  <span class="linecomment">;; binding allows for two levels of multi-commands.</span>
  (let* ((cmd (intern cmd-name))
         (icicle-candidate-action-fn (lambda (x) (funcall cmd (intern x)))))
    (setq last-command last-cmd         <span class="linecomment">; Restore last real command. `last-cmd' is free here.</span>
          this-command cmd)             <span class="linecomment">; Establish this command.</span>
    (call-interactively cmd 'record-it)))

(icicle-define-command icicle-set-option-to-t <span class="linecomment">; Command name</span>
                       "<span class="quote">Set option to t.  This makes sense for binary (toggle) options.
By default, completion candidates are limited to user options that
have `boolean' custom types.  However, there are many \</span>"binary\"<span class="quote"> options
that allow other non-nil values than t.

You can use a prefix argument to change the set of completion
candidates, as follows:

 - With a non-negative prefix arg, all user options are candidates.
 - With a negative prefix arg, all variables are candidates.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (opt)    <span class="linecomment">; Function to perform the action</span>
                         (set (intern opt) t) (message "<span class="quote">`%s' is now t</span>" opt))
                       "<span class="quote">Set option to t: </span>" obarray <span class="linecomment">; `completing-read' args</span>
                       (cond ((and current-prefix-arg
                                   (wholenump (prefix-numeric-value current-prefix-arg)))
                              'user-variable-p)
                             (current-prefix-arg 'boundp)
                             (t 'icicle-binary-option-p))
                       'must-confirm)

(defalias 'icicle-clear-option 'icicle-reset-option-to-nil)

(icicle-define-command icicle-reset-option-to-nil <span class="linecomment">; Command name</span>
                       "<span class="quote">Set option to nil.  This makes sense for binary and list options.
By default, the set of completion candidates is limited to user
options.  Note: it is *not* limited to binary and list options.
With a prefix arg, all variables are candidates.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (opt)    <span class="linecomment">; Function to perform the action</span>
                         (set (intern opt) nil) (message "<span class="quote">`%s' is now nil</span>" opt))
                       "<span class="quote">Clear option (set it to nil): </span>" obarray <span class="linecomment">; `completing-read' args</span>
                       (if current-prefix-arg 'boundp 'user-variable-p) t)

(icicle-define-command icicle-toggle-option <span class="linecomment">; Command name</span>
                       "<span class="quote">Toggle option's value.  This makes sense for binary (toggle) options.
By default, completion candidates are limited to user options that
have `boolean' custom types.  However, there are many \</span>"binary\"<span class="quote"> options
that allow other non-nil values than t.

You can use a prefix argument to change the set of completion
candidates, as follows:

 - With a non-negative prefix arg, all user options are candidates.
 - With a negative prefix arg, all variables are candidates.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (opt)    <span class="linecomment">; Function to perform the action</span>
                         (let ((sym (intern opt)))
                           (set sym (not (eval sym))) (message "<span class="quote">`%s' is now %s</span>" opt (eval sym))))
                       "<span class="quote">Toggle value of option: </span>" obarray <span class="linecomment">; `completing-read' args</span>
                       (cond ((and current-prefix-arg
                                   (wholenump (prefix-numeric-value current-prefix-arg)))
                              'user-variable-p)
                             (current-prefix-arg 'boundp)
                             (t 'icicle-binary-option-p))
                       'must-confirm)

(defun icicle-binary-option-p (symbol)
  "<span class="quote">Non-nil if SYMBOl is a user option that has custom-type `boolean'.</span>"
  (eq (get symbol 'custom-type) 'boolean))

(icicle-define-command icicle-bookmark  <span class="linecomment">; Command name</span>
                       "<span class="quote">Jump to a bookmark.</span>" <span class="linecomment">; Doc string</span>
                       bookmark-jump    <span class="linecomment">; Function to perform the action</span>
                       "<span class="quote">Bookmark: </span>" (mapcar #'list (bookmark-all-names)) <span class="linecomment">; `completing-read' args</span>
                       nil t nil nil (or (and (boundp 'bookmark-current-bookmark)
                                              bookmark-current-bookmark)
                                         (bookmark-buffer-name)))

<span class="linecomment">;; Suggested global binding: `C-x k'.</span>
(icicle-define-command icicle-kill-buffer <span class="linecomment">; Command name</span>
                       "<span class="quote">Kill a buffer.</span>" <span class="linecomment">; Doc string</span>
                       icicle-kill-a-buffer <span class="linecomment">; Function to perform the action</span>
                       "<span class="quote">Kill buffer: </span>"  <span class="linecomment">; `completing-read' args</span>
                       (mapcar (lambda (buf) (list (buffer-name buf))) (buffer-list))
                       nil t nil 'buffer-name-history
                       (buffer-name (current-buffer))
                       nil
                       ((icicle-must-match-regexp icicle-buffer-match-regexp) <span class="linecomment">; Filter bindings</span>
                        (icicle-must-not-match-regexp icicle-buffer-no-match-regexp)
                        (icicle-must-pass-predicate icicle-buffer-predicate)
                        (icicle-extra-candidates icicle-buffer-extras)
                        (icicle-sort-function icicle-buffer-sort)
                        (icicle-require-match-flag icicle-buffer-require-match-flag)
                        (icicle-ignore-space-prefix-flag icicle-buffer-ignore-space-prefix-flag)))

(defun icicle-kill-a-buffer (buf)
  "<span class="quote">Kill buffer BUF.</span>"
  (setq buf (get-buffer buf))
  (if buf
      (condition-case err
          (if (not (buffer-live-p buf))
              (message "<span class="quote">Buffer already deleted: `%s'</span>" buf)
            (if (fboundp 'kill-buffer-and-its-windows)
                (kill-buffer-and-its-windows buf) <span class="linecomment">; Defined in `misc-cmds.el'.</span>
              (kill-buffer buf))
            <span class="linecomment">;; Update the set of completions, then update *Completions*.</span>
            (setq minibuffer-completion-table (mapcar (lambda (buf) (list (buffer-name buf)))
                                                      (buffer-list)))
            (icicle-update-completions))
        (error nil))
    (message "<span class="quote">No such live buffer: `%s'</span>" buf)))


<span class="linecomment">;; Suggested global binding: `C-x b'.</span>
(icicle-define-command icicle-buffer    <span class="linecomment">; Command name</span>
                       "<span class="quote">Switch to a different buffer.
These options, when non-nil, control candidate matching and filtering:

 `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names
 `icicle-buffer-extras'             - Extra buffers to display
 `icicle-buffer-match-regexp'       - Regexp that buffers must match
 `icicle-buffer-no-match-regexp'    - Regexp buffers must not match
 `icicle-buffer-predicate'          - Predicate buffer must satisfy
 `icicle-buffer-sort'               - Sort function for candidates

For example, to show only buffers that are associated with files, set
`icicle-buffer-predicate' to (lambda (buf) (buffer-file-name buf)).

Option `icicle-buffer-require-match-flag' can be used to override
option `icicle-require-match-flag'.

See also command `icicle-buffer-config'.</span>" <span class="linecomment">; Doc string</span>
                       switch-to-buffer <span class="linecomment">; Function to perform the action</span>
                       "<span class="quote">Switch to buffer: </span>" <span class="linecomment">; `completing-read' args</span>
                       (mapcar (lambda (buf) (list (buffer-name buf))) (buffer-list))
                       nil nil nil 'buffer-name-history
                       (buffer-name (if (fboundp 'another-buffer)
                                        (another-buffer nil t)
                                      (other-buffer (current-buffer))))
                       nil
                       ((icicle-must-match-regexp icicle-buffer-match-regexp) <span class="linecomment">; Filter bindings</span>
                        (icicle-must-not-match-regexp icicle-buffer-no-match-regexp)
                        (icicle-must-pass-predicate icicle-buffer-predicate)
                        (icicle-extra-candidates icicle-buffer-extras)
                        (icicle-sort-function icicle-buffer-sort)
                        (icicle-require-match-flag icicle-buffer-require-match-flag)
                        (icicle-ignore-space-prefix-flag icicle-buffer-ignore-space-prefix-flag)))

<span class="linecomment">;; Suggested global binding: `C-x 4 b'.</span>
(icicle-define-command icicle-buffer-other-window <span class="linecomment">; Command name</span>
                       "<span class="quote">Switch to a different buffer in another window.
These options, when non-nil, control candidate matching and filtering:

 `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names
 `icicle-buffer-extras'             - Extra buffers to display
 `icicle-buffer-match-regexp'       - Regexp that buffers must match
 `icicle-buffer-no-match-regexp'    - Regexp buffers must not match
 `icicle-buffer-predicate'          - Predicate buffer must satisfy
 `icicle-buffer-sort'               - Sort function for candidates

For example, to show only buffers that are associated with files, set
`icicle-buffer-predicate' to (lambda (buf) (buffer-file-name buf)).

Option `icicle-buffer-require-match-flag' can be used to override
option `icicle-require-match-flag'.

See also command `icicle-buffer-config'</span>" <span class="linecomment">; Doc string</span>
                       switch-to-buffer-other-window <span class="linecomment">; Function to perform the action</span>
                       "<span class="quote">Switch to buffer: </span>" <span class="linecomment">; `completing-read' args</span>
                       (mapcar (lambda (buf) (list (buffer-name buf))) (buffer-list))
                       nil nil nil 'buffer-name-history
                       (buffer-name (if (fboundp 'another-buffer)
                                        (another-buffer nil t)
                                      (other-buffer (current-buffer))))
                       nil
                       ((icicle-must-match-regexp icicle-buffer-match-regexp) <span class="linecomment">; Filter bindings</span>
                        (icicle-must-not-match-regexp icicle-buffer-no-match-regexp)
                        (icicle-must-pass-predicate icicle-buffer-predicate)
                        (icicle-extra-candidates icicle-buffer-extras)
                        (icicle-sort-function icicle-buffer-sort)
                        (icicle-require-match-flag icicle-buffer-require-match-flag)
                        (icicle-ignore-space-prefix-flag icicle-buffer-ignore-space-prefix-flag)))

(icicle-define-command icicle-add-buffer-candidate <span class="linecomment">; Command name</span>
                       "<span class="quote">Add buffer as an always-show completion candidate.
This just adds the buffer to `icicle-buffer-extras'.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (buf)
                         (add-to-list 'icicle-buffer-extras buf) <span class="linecomment">; Action function</span>
                         (customize-save-variable 'icicle-buffer-extras icicle-buffer-extras)
                         (message "<span class="quote">Buffer `%s' added to always-show buffers</span>" buf))
                       "<span class="quote">Buffer candidate to show always: </span>" <span class="linecomment">; `completing-read' args</span>
                       (mapcar (lambda (buf) (list (buffer-name buf))) (buffer-list))
                       nil nil nil 'buffer-name-history
                       (buffer-name (if (fboundp 'another-buffer)
                                        (another-buffer nil t)
                                      (other-buffer (current-buffer)))))

(icicle-define-command icicle-remove-buffer-candidate <span class="linecomment">; Command name</span>
                       "<span class="quote">Remove buffer as an always-show completion candidate.
This just removes the buffer from `icicle-buffer-extras'.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (buf)    <span class="linecomment">; Action function</span>
                         (setq icicle-buffer-extras (delete buf icicle-buffer-extras))
                         (customize-save-variable 'icicle-buffer-extras icicle-buffer-extras)
                         (message "<span class="quote">Buffer `%s' removed from always-show buffers</span>" buf))
                       "<span class="quote">Remove buffer from always-show list: </span>" <span class="linecomment">; `completing-read' args</span>
                       (mapcar #'list icicle-buffer-extras)
                       nil t nil 'buffer-name-history
                       (car icicle-buffer-extras))

(icicle-define-command icicle-buffer-config <span class="linecomment">; Command name</span>
                       "<span class="quote">Choose a configuration of user options for `icicle-buffer'.
See user option `icicle-buffer-configs'.  See also commands
`icicle-add-buffer-config' and `icicle-remove-buffer-config'.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (config-name) <span class="linecomment">; Function to perform the action</span>
                         (let ((config (assoc config-name icicle-buffer-configs)))
                           (setq icicle-buffer-match-regexp (elt config 1))
                           (setq icicle-buffer-no-match-regexp (elt config 2))
                           (setq icicle-buffer-predicate (elt config 3))
                           (setq icicle-buffer-extras (elt config 4))
                           (setq icicle-buffer-sort (elt config 5))))
                       "<span class="quote">Configuration: </span>" icicle-buffer-configs nil t) <span class="linecomment">; `completing-read' args</span>

(defun icicle-add-buffer-config ()
  "<span class="quote">Add buffer configuration to `icicle-buffer-configs'.
You are prompted for the buffer configuration components.
For the list of extra buffers to always display, you can choose them
using `C-mouse-2', `C-RET', and so on, just as you would make any
Icicles multiple choice.</span>"
  (interactive)
  (let ((name (read-from-minibuffer "<span class="quote">Add buffer configuration.  Name: </span>"))
        (match-regexp (icicle-read-from-minibuf-nil-default
                       "<span class="quote">Regexp to match: </span>" nil nil nil nil icicle-buffer-match-regexp))
        (nomatch-regexp (icicle-read-from-minibuf-nil-default
                         "<span class="quote">Regexp not to match: </span>" nil nil nil nil icicle-buffer-no-match-regexp))
        (pred (icicle-read-from-minibuf-nil-default "<span class="quote">Predicate to satify: </span>" nil nil nil nil
                                                    icicle-buffer-predicate))
        (extras (progn (message "<span class="quote">Choose extra buffers to show...</span>") (sit-for 1)
                       (icicle-buffer-list)))
        (sort-fn (icicle-read-from-minibuf-nil-default "<span class="quote">Sort function: </span>" nil nil t nil
                                                       (symbol-name icicle-buffer-sort))))
    (add-to-list 'icicle-buffer-configs
                 (list name match-regexp nomatch-regexp pred extras sort-fn))
    (customize-save-variable 'icicle-buffer-configs icicle-buffer-configs)
    (message "<span class="quote">Buffer configuration `%s' added</span>" (caar icicle-buffer-configs))))

(defun icicle-read-from-minibuf-nil-default (prompt &optional initial-contents keymap read hist
                                             default-value inherit-input-method)
  "<span class="quote">Like `read-from-minibuffer', but return nil for empty input.
Args are as for `read-from-minibuffer'.
If nothing is input, then nil is returned.</span>"
  (let ((input (read-from-minibuffer prompt initial-contents keymap nil hist default-value
                                     inherit-input-method)))
    (if (string= "<span class="quote"></span>" input)
        nil
      (if read
          (car (read-from-string input))
        input))))

(icicle-define-command icicle-buffer-list <span class="linecomment">; Command name</span>
                       "<span class="quote">Choose a list of buffer names.
The list of names (strings) is returned.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (name) (push name buf-names)) <span class="linecomment">; Function to perform the action</span>
                       "<span class="quote">Choose buffer (`RET' when done): </span>" <span class="linecomment">; `completing-read' args</span>
                       (mapcar (lambda (buf) (list (buffer-name buf))) (buffer-list))
                       nil nil nil 'buffer-name-history nil nil
                       ((buf-names nil)) <span class="linecomment">; Filter bindings</span>
                       nil nil
                       (delete "<span class="quote"></span>" buf-names))

(icicle-define-command icicle-remove-buffer-config <span class="linecomment">; Command name</span>
                       "<span class="quote">Remove buffer configuration from `icicle-buffer-configs'.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (config-name) <span class="linecomment">; Action function</span>
                         (setq icicle-buffer-configs
                               (delete (assoc config-name icicle-buffer-configs)
                                       icicle-buffer-configs))
                         (customize-save-variable 'icicle-buffer-configs icicle-buffer-configs)
                         (message "<span class="quote">Buffer configuration `%s' removed</span>" config-name))
                       "<span class="quote">Remove buffer configuration: </span>" <span class="linecomment">; `completing-read' args</span>
                       (mapcar (lambda (config) (list (car config))) icicle-buffer-configs)
                       nil t nil nil (caar icicle-buffer-configs))

(icicle-define-command icicle-color-theme <span class="linecomment">; Command name</span>
                       "<span class="quote">Change color theme. ; Doc string
To use this command, you must have loaded library `color-theme.el',
available from http://www.emacswiki.org/cgi-bin/wiki.pl?ColorTheme.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (theme) (funcall (intern theme))) <span class="linecomment">; Action - just call the theme.</span>
                       "<span class="quote">Theme: </span>" icicle-color-themes nil t) <span class="linecomment">; `completing-read' args</span>

(icicle-define-file-command icicle-delete-file <span class="linecomment">; Command name</span>
                            "<span class="quote">Delete a file or directory.</span>" <span class="linecomment">; Doc string</span>
                            icicle-delete-file-or-directory <span class="linecomment">; Function to perform the action</span>
                            "<span class="quote">Delete file or directory: </span>" <span class="linecomment">; `read-file-name' args</span>
                            default-directory nil t)

(defun icicle-delete-file-or-directory (file)
  "<span class="quote">Delete file (or directory) FILE.</span>"
  (condition-case i-delete-file
      (if (eq t (car (file-attributes file)))
          (delete-directory file)
        (delete-file file))
    (error (message (error-message-string i-delete-file))
           (error (error-message-string i-delete-file)))))

<span class="linecomment">;; Suggested global binding: `C-x C-f'.</span>
(icicle-define-file-command icicle-find-file <span class="linecomment">; Command name</span>
                            "<span class="quote">Visit a file or directory.</span>" <span class="linecomment">; Doc string</span>
                            icicle-find-file-w-wildcards <span class="linecomment">; Function to perform the action</span>
                            "<span class="quote">File or directory: </span>" nil default-directory) <span class="linecomment">; `read-file-name' args</span>

(defun icicle-find-file-w-wildcards (filename)
  "<span class="quote">Find file FILENAME, where the name possibly includes shell wildcards.</span>"
  (find-file filename t))

<span class="linecomment">;; Suggested global binding: `C-x 4 f'.</span>
(icicle-define-file-command icicle-find-file-other-window <span class="linecomment">; Command name</span>
                            "<span class="quote">Visit a file or directory in another window.</span>" <span class="linecomment">; Doc string</span>
                            icicle-find-file-other-window-w-wildcards
                                        <span class="linecomment">; Function to perform the action</span>
                            "<span class="quote">File or directory: </span>" nil default-directory) <span class="linecomment">; `read-file-name' args</span>

(defun icicle-find-file-other-window-w-wildcards (filename)
  "<span class="quote">Find file FILENAME, where the name possibly includes shell wildcards.</span>"
  (find-file-other-window filename t))

(icicle-define-command icicle-recent-file <span class="linecomment">; Command name</span>
                       "<span class="quote">Open a recently used file.</span>" <span class="linecomment">; Doc string</span>
                       find-file        <span class="linecomment">; Function to perform the action</span>
                       "<span class="quote">Recent file: </span>" (mapcar #'list recentf-list) <span class="linecomment">; `completing-read' args</span>
                       nil t (car recentf-list) 'file-name-history (car recentf-list) nil
                       nil              <span class="linecomment">; Additional bindings</span>
                       (progn (unless (boundp 'recentf-list) (require 'recentf)) <span class="linecomment">;  First code</span>
                              (when (fboundp 'recentf-mode) (recentf-mode 99))
                              (unless (consp recentf-list) (error "<span class="quote">No recently accessed files</span>"))))

(icicle-define-command icicle-recent-file-other-window <span class="linecomment">; Command name</span>
                       "<span class="quote">Open a recently used file in another window.</span>" <span class="linecomment">; Doc string</span>
                       find-file-other-window <span class="linecomment">; Function to perform the action</span>
                       "<span class="quote">Recent file: </span>" (mapcar #'list recentf-list) <span class="linecomment">; `completing-read' args</span>
                       nil t (car recentf-list) 'file-name-history (car recentf-list) nil
                       nil              <span class="linecomment">; Additional bindings</span>
                       (progn (unless (boundp 'recentf-list) (require 'recentf)) <span class="linecomment">;  First code</span>
                              (when (fboundp 'recentf-mode) (recentf-mode 99))
                              (unless (consp recentf-list) (error "<span class="quote">No recently accessed files</span>"))))

(icicle-define-command icicle-locate-file
                       "<span class="quote">Visit a file within a directory or its subdirectories.
With a prefix argument, you are prompted for the directory.
Otherwise, the current directory is used.

The absolute names of all files within the directory and all of its
subdirectories are targets for completion.  Regexp input is matched
against all parts of the absolute name, not just the file-name part.

You can use this to find all files within your file system that match
a regexp, but be aware that gathering and matching the file names will
take some time.

Remember that you can save the set of files matching your input using \
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-save]' or \
`\\[icicle-candidate-set-save-to-cache-file]'.
You can then retrieve quickly them later using `\\[icicle-candidate-set-retrieve]' or \
`\\[icicle-candidate-set-retrieve-from-cache-file]'. </span>"
                       find-file
                       "<span class="quote">File: </span>"
                       (mapcar #'list (icicle-files-within
                                       (directory-files dir 'full icicle-re-no-dot) nil))
                       nil t nil nil nil nil
                       ((dir (if current-prefix-arg
                                 (read-file-name "<span class="quote">Locate under which directory: </span>"
                                                 nil default-directory nil)
                               default-directory)))
                       (message "<span class="quote">Gathering files within `%s' (this could take a while)...</span>" dir))

(icicle-define-command icicle-locate-file-other-window
                       "<span class="quote">Like `icicle-locate-file' but the file is visited in another window.</span>"
                       find-file-other-window
                       "<span class="quote">File: </span>"
                       (mapcar #'list (icicle-files-within
                                       (directory-files dir 'full icicle-re-no-dot) nil))
                       nil t nil nil nil nil
                       ((dir (if current-prefix-arg
                                 (read-file-name "<span class="quote">Locate under which directory: </span>"
                                                 nil default-directory nil)
                               default-directory)))
                       (message "<span class="quote">Gathering files within `%s' (this could take a while)...</span>" dir))

(icicle-define-command icicle-font      <span class="linecomment">; Command name</span>
                       "<span class="quote">Change font of current frame.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (font)   <span class="linecomment">; Function to perform the action</span>
                         (modify-frame-parameters orig-frame (list (cons 'font font))))
                       "<span class="quote">Font: </span>" (mapcar #'list (x-list-fonts "<span class="quote">*</span>")) <span class="linecomment">; `completing-read' args</span>
                       nil t nil nil nil nil
                       ((orig-frame (selected-frame)) <span class="linecomment">; Additional bindings</span>
                        (orig-font (frame-parameter nil 'font)))
                       nil              <span class="linecomment">; Additional code at beginning</span>
                       (modify-frame-parameters orig-frame <span class="linecomment">; Undo code</span>
                                                (list (cons 'font orig-font)))
                       nil)             <span class="linecomment">; Additional code at end</span>

(icicle-define-command icicle-frame-bg  <span class="linecomment">; Command name</span>
                       "<span class="quote">Change background of current frame.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (color)  <span class="linecomment">; Function to perform the action</span>
                         (modify-frame-parameters orig-frame
                                                  (list (cons 'background-color color))))
                       "<span class="quote">Background color:: </span>" (mapcar #'list (x-defined-colors))
                       nil t nil nil nil nil <span class="linecomment">; `completing-read' args</span>
                       ((orig-frame (selected-frame)) <span class="linecomment">; Additional bindings</span>
                        (orig-bg (frame-parameter nil 'background-color)))
                       nil              <span class="linecomment">; Additional code at beginning</span>
                       (modify-frame-parameters orig-frame <span class="linecomment">; Undo code</span>
                                                (list (cons 'background-color orig-bg)))
                       nil)             <span class="linecomment">; Additional code at end</span>

(icicle-define-command icicle-frame-fg  <span class="linecomment">; Command name</span>
                       "<span class="quote">Change foreground of current frame.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (color)  <span class="linecomment">; Function to perform the action</span>
                         (modify-frame-parameters orig-frame
                                                  (list (cons 'foreground-color color))))
                       "<span class="quote">Foreground color:: </span>" (mapcar #'list (x-defined-colors))
                       nil t nil nil nil nil <span class="linecomment">; `completing-read' args</span>
                       ((orig-frame (selected-frame)) <span class="linecomment">; Additional bindings</span>
                        (orig-bg (frame-parameter nil 'foreground-color)))
                       nil              <span class="linecomment">; Additional code at beginning</span>
                       (modify-frame-parameters orig-frame <span class="linecomment">; Undo code</span>
                                                (list (cons 'foreground-color orig-bg)))
                       nil)             <span class="linecomment">; Additional code at end</span>

(icicle-define-command icicle-insert-thesaurus-entry <span class="linecomment">; Command name</span>
                       "<span class="quote">Insert an entry from a thesaurus.
Library `synonyms.el' is needed for this.  If you have never used
command `synonyms' before, then the first use of
`icicle-insert-thesaurus-entry' will take a while, because it will
build a cache file of synonyms that are used for completion.  See
`synonyms.el'.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-incremental-completion] to toggle incremental completion.</span>" <span class="linecomment">; Doc string</span>
                       icicle-insert-thesaurus-entry-cand-fn <span class="linecomment">; Function to perform the action</span>
                       "<span class="quote">Thesaurus entry to match: </span>" synonyms-obarray <span class="linecomment">; `completing-read' args</span>
                       nil nil nil nil nil nil
                       ((icicle-track-pt (point))) <span class="linecomment">; Bindings</span>
                       (progn           <span class="linecomment">; First sexp</span>
                         (unless (or (boundp 'synonyms-obarray) (require 'synonyms nil t))
                           (error "<span class="quote">You must first load library `synonyms.el'</span>"))
                         (synonyms-ensure-synonyms-read-from-cache))
                       (progn (select-frame-set-input-focus (window-frame orig-window))
                              (goto-char icicle-track-pt)) <span class="linecomment">; Undo sexp</span>
                       (progn (select-frame-set-input-focus (window-frame orig-window))
                              (goto-char icicle-track-pt))) <span class="linecomment">; Last sexp</span>

(defun icicle-insert-thesaurus-entry-cand-fn (string)
  "<span class="quote">Action function for `icicle-insert-thesaurus-entry'.
Insert STRING, followed by a space, at position TRACK-PT of buffer
ORIG-BUFF.</span>"
  (set-buffer orig-buff)
  (goto-char icicle-track-pt)
  (insert string "<span class="quote"> </span>")
  (setq icicle-track-pt (point))
  (save-excursion (set-buffer (window-buffer (minibuffer-window))) (icicle-clear-minibuffer))
  (save-selected-window (icicle-delete-windows-on "<span class="quote">*Completions*</span>")))

(defun icicle-delete-windows-on (buffer) <span class="linecomment">; From `remove-windows-on' in `frame-cmds.el'.</span>
  "<span class="quote">Delete all windows showing BUFFER.</span>"
  (interactive
   (list (read-buffer "<span class="quote">Remove all windows showing buffer: </span>" (current-buffer) 'existing)))
  (setq buffer (get-buffer buffer))     <span class="linecomment">; Convert to buffer.</span>
  (when buffer                          <span class="linecomment">; Do nothing if null BUFFER.</span>
    <span class="linecomment">;; Avoid error message "Attempt to delete minibuffer or sole ordinary window".</span>
    (let ((frames (icicle-frames-on buffer t)))
      (unless (and frames (null (cdr frames)) <span class="linecomment">; One frame shows buffer.</span>
                   (cdr (assoc 'minibuffer (frame-parameters (car frames)))) <span class="linecomment">; Has a minibuffer.</span>
                   (save-window-excursion
                     (select-frame (car frames))
                     (one-window-p t 'selected-frame))) <span class="linecomment">; Only one window.</span>
        (dolist (fr frames)
          (delete-window (get-buffer-window buffer t)))))))

(defun icicle-complete-thesaurus-entry (word) <span class="linecomment">; Suggested global binding: `C-c /'.</span>
  "<span class="quote">Complete WORD to an entry from a thesaurus.
The default value of WORD is the word at the cursor.
Library `synonyms.el' is needed for this.  If you have never used
command `synonyms' before, then the first use of
`icicle-insert-thesaurus-entry' will take a while, because it will
build a cache file of synonyms that are used for completion.  See
`synonyms.el'.</span>"
  (interactive (list (word-at-point)))
  (unless word (error "<span class="quote">No word at point to complete</span>"))
  (unless (or (boundp 'synonyms-obarray) (require 'synonyms nil t))
    (error "<span class="quote">You must first load library `synonyms.el'</span>"))
  (synonyms-ensure-synonyms-read-from-cache)
  (when (and (looking-at "<span class="quote">\\b</span>") (not (looking-at "<span class="quote">\\s-</span>"))) (forward-word 1))
  (delete-region (progn (forward-word -1) (point)) (progn (forward-word 1) (point)))
  (insert (completing-read "<span class="quote">Thesaurus entry to match: </span>" synonyms-obarray
                           nil nil word nil word))
  (unless (looking-at "<span class="quote">\\s-</span>") (insert "<span class="quote"> </span>")))

(icicle-define-command icicle-vardoc    <span class="linecomment">; Command name</span>
                       "<span class="quote">Choose a variable description.
Each candidate for completion is a variable name plus its
documentation.  They are separated by `icicle-list-join-string' (^G^J,
by default).  You can match an input regexp against the variable name
or the documentation or both.  Use `C-q C-g C-q C-j' to input the
default separator.

For example, use input

\</span>"dired.*^G
\[^^G]*list\"<span class="quote">

with \\&lt;minibuffer-local-completion-map&gt;`\\[icicle-apropos-complete]' to match all variables whose
names contain \</span>"dired\"<span class="quote"> and whose documentation contains \</span>"list\"<span class="quote">.
Here, `[^^G]' matches any character except ^G, which includes newline.
If you use `.*' here, instead, then only the first lines of doc
strings are searched.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-incremental-completion] to toggle incremental completion.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (entry)  <span class="linecomment">; Action function</span>
                         (with-output-to-temp-buffer "<span class="quote">*Help*</span>" (princ entry)))
                       "<span class="quote">VAR `C-q C-g C-q C-j' DOC (`RET' when done): </span>" <span class="linecomment">; `completing-read' args</span>
                       (let ((result nil)) <span class="linecomment">; TABLE arg is an alist whose items are ((symb doc)).</span>
                         (mapatoms
                          (lambda (symb) <span class="linecomment">; That is, each completion candidate is a list of strings.</span>
                            (when (boundp symb)
                              (let ((doc (documentation-property symb 'variable-documentation)))
                                (when (icicle-non-whitespace-string-p doc)
                                  (push (list (list (symbol-name symb) doc)) result))))))
                         result)
                       nil nil nil nil nil nil nil
                       (message "<span class="quote">Gathering variable descriptions...</span>")) <span class="linecomment">; First code</span>

(icicle-define-command icicle-fundoc    <span class="linecomment">; Command name</span>
                       "<span class="quote">Choose a function description.
Each candidate for completion is a function name plus its
documentation.  They are separated by `icicle-list-join-string' (^G^J,
by default).  You can match an input regexp against the function name
or the documentation or both.  Use `C-q C-g C-q C-j' to input the
default separator.

For example, use input

\</span>"dired.*^G
\[^^G]*file\"<span class="quote">

with \\&lt;minibuffer-local-completion-map&gt;`\\[icicle-apropos-complete]' to match all functions whose
names contain \</span>"dired\"<span class="quote"> and whose documentation contains \</span>"file\"<span class="quote">.
Here, `[^^G]' matches any character except ^G, which includes newline.
If you use `.*' here, instead, then only the first lines of doc
strings are searched.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-incremental-completion] to toggle incremental completion.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (entry)  <span class="linecomment">; Action function</span>
                         (with-output-to-temp-buffer "<span class="quote">*Help*</span>" (princ entry)))
                       "<span class="quote">FUNC `C-q C-g C-q C-j' DOC (`RET' when done): </span>" <span class="linecomment">; `completing-read' args</span>
                       (let ((result nil)) <span class="linecomment">; TABLE arg is an alist whose items are ((symb doc)).</span>
                         (mapatoms
                          (lambda (symb) <span class="linecomment">; That is, each completion candidate is a list of strings.</span>
                            (when (fboundp symb)
                              (let ((doc (documentation symb)))
                                (when (icicle-non-whitespace-string-p doc)
                                  (push (list (list (symbol-name symb) doc)) result))))))
                         result)
                       nil nil nil nil nil nil nil
                       (message "<span class="quote">Gathering function descriptions...</span>")) <span class="linecomment">; First code</span>

<span class="linecomment">;; $$$ Extend to faces too?  Other objects too?</span>
(icicle-define-command icicle-doc       <span class="linecomment">; Command name</span>
                       "<span class="quote">Choose documentation for a function or variable.
Each candidate for completion is the description of a function or
variable.  Displays the documentation and returns the function or
variable (a symbol).

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-incremental-completion] to toggle incremental completion.</span>" <span class="linecomment">; Doc string</span>
                       (lambda (entry)  <span class="linecomment">; Action function: display the doc.</span>
                         (let ((fn-or-var (cdr (assoc entry minibuffer-completion-table))))
                           (when (and fn-or-var (boundp fn-or-var)) (describe-variable fn-or-var))
                           (when (fboundp fn-or-var) (describe-function fn-or-var))
                           fn-or-var))  <span class="linecomment">; Return the function or variable (symbol).</span>
                       "<span class="quote">Find doc with regexp: </span>" <span class="linecomment">; `completing-read' args</span>
                       (let ((result nil)
                             doc)
                         (mapatoms
                          (lambda (symb) <span class="linecomment">; TABLE arg is an alist whose items are (doc . symb).</span>
                            (when (fboundp symb) <span class="linecomment">; That is, the completions are the doc strings.</span>
                              (setq doc (concat (documentation symb) "<span class="quote">\n\n\n</span>"))
                              (when (icicle-non-whitespace-string-p doc)
                                (push (cons doc symb) result)))
                            (when (boundp symb)
                              (setq doc (concat
                                         (documentation-property symb 'variable-documentation)
                                         "<span class="quote">\n\n\n</span>"))
                              (when (icicle-non-whitespace-string-p doc)
                                (push (cons doc symb) result)))))
                         <span class="linecomment">;; `icicle-candidate-action-fn' is used in the main body of command</span>
                         <span class="linecomment">;;`icicle-doc' and is also bound to `C-RET'.  We need to refer to the</span>
                         <span class="linecomment">;; TABLE arg to `completing-read' within the body of the function.</span>
                         <span class="linecomment">;; So, we cheat and pre-assign `minibuffer-completion-table' to it here.</span>
                         (setq minibuffer-completion-table result))
                       nil nil nil nil nil nil nil
                       (message "<span class="quote">Gathering documentation...</span>"))

(defun icicle-non-whitespace-string-p (string)
  (interactive "<span class="quote">s</span>")
  (let ((orig-syntable (syntax-table)))
    (unwind-protect
       (progn
         (set-syntax-table (standard-syntax-table))
         (and (stringp string) (&gt; (length string) 0) (string-match "<span class="quote">\\S-</span>" string)))
      (set-syntax-table orig-syntable))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos (apropos-regexp &optional do-all)
  "<span class="quote">Like `apropos', but lets you see the list of matches (with `S-TAB').</span>"
  (interactive (list (completing-read "<span class="quote">Apropos symbol (regexp or words): </span>" obarray)
                     current-prefix-arg))
  (apropos apropos-regexp do-all))

<span class="linecomment">;;;###autoload</span>
(cond
  <span class="linecomment">;; Use my versions of the `apropos*' commands, defined in `apropos-fn+var.el'.</span>
  <span class="linecomment">;; Note that unlike my versions of `apropos-option' and `apropos-command', the `icicle-'</span>
  <span class="linecomment">;; versions here do not respect `apropos-do-all': they always work with options and commands.</span>
  ((fboundp 'apropos-option)
   (defun icicle-apropos-variable (pattern)
     "<span class="quote">Show variables that match PATTERN.
This includes variables that are not user options.
You can see the list of matches with `S-TAB'.
See `apropos-variable' for a description of PATTERN.</span>"
     (interactive
      (list (completing-read
             (concat "<span class="quote">Apropos variable (regexp</span>" (and (&gt;= emacs-major-version 22) "<span class="quote"> or words</span>")
                     "<span class="quote">): </span>") obarray
             #'(lambda (symbol) (and (boundp symbol) (get symbol 'variable-documentation))))))
     (apropos-variable pattern))

   (defun icicle-apropos-option (pattern)
     "<span class="quote">Show user options (variables) that match PATTERN.
You can see the list of matches with `S-TAB'.
See `apropos-option' for a description of PATTERN.</span>"
     (interactive
      (list (completing-read
             (concat "<span class="quote">Apropos user option (regexp</span>" (and (&gt;= emacs-major-version 22) "<span class="quote"> or words</span>")
                     "<span class="quote">): </span>") obarray 'user-variable-p)))
     (let ((apropos-do-all nil))
       (apropos-option pattern)))

   (defun icicle-apropos-function (pattern)
     "<span class="quote">Show functions that match PATTERN.
This includes functions that are not commands.
You can see the list of matches with `S-TAB'.
See `apropos-function' for a description of PATTERN.</span>"
     (interactive
      (list (completing-read
             (concat "<span class="quote">Apropos function (regexp</span>" (and (&gt;= emacs-major-version 22) "<span class="quote"> or words</span>")
                     "<span class="quote">): </span>") obarray 'functionp)))
     (apropos-function pattern))

   (defun icicle-apropos-command (pattern)
     "<span class="quote">Show commands (interactively callable functions) that match PATTERN.
You can see the list of matches with `S-TAB'.
See `apropos-command' for a description of PATTERN.</span>"
     (interactive
      (list (completing-read
             (concat "<span class="quote">Apropos command (regexp</span>" (and (&gt;= emacs-major-version 22) "<span class="quote"> or words</span>")
                     "<span class="quote">): </span>") obarray 'commandp)))
     (let ((apropos-do-all nil))
       (apropos-command pattern))))

  <span class="linecomment">;; My versions are not available.  Use the vanilla Emacs versions of the `apropos...' commands.</span>
  (t
   (defun icicle-apropos-variable (pattern &optional do-all)
     "<span class="quote">Show variables that match PATTERN.
You can see the list of matches with `S-TAB'.

See `apropos-variable' for a description of PATTERN.

With optional prefix DO-ALL or if `apropos-do-all' is non-nil, also
show normal variables.</span>"
     (interactive
      (list (progn
              (unless (or (boundp 'apropos-do-all) (require 'apropos nil t))
                (error "<span class="quote">Library `apropos' not found</span>"))
              (completing-read
               (concat "<span class="quote">Apropos </span>" (if (or current-prefix-arg apropos-do-all)
                                      "<span class="quote">variable</span>" "<span class="quote">user option</span>")
                       "<span class="quote"> (regexp</span>" (and (&gt;= emacs-major-version 22) "<span class="quote"> or words</span>") "<span class="quote">): </span>")
               obarray (if (or current-prefix-arg apropos-do-all)
                           #'(lambda (symbol) (and (boundp symbol)
                                                   (get symbol 'variable-documentation)))
                         'user-variable-p)))
            current-prefix-arg))
     (apropos-variable pattern do-all))

   (defun icicle-apropos-command (pattern &optional do-all var-predicate)
     "<span class="quote">Show commands (interactively callable functions) that match PATTERN.
You can see the list of matches with `S-TAB'.

See `apropos-command' for a description of PATTERN.

With \\[universal-argument] prefix, or if `apropos-do-all' is non-nil,
also show noninteractive functions.

If VAR-PREDICATE is non-nil, show only variables, and only those that
satisfy the predicate VAR-PREDICATE.</span>"
     (interactive
      (list (progn
              (unless (boundp 'apropos-do-all)
                (unless (require 'apropos nil t) (error "<span class="quote">Library `apropos' not found</span>")))
              (completing-read
               (concat "<span class="quote">Apropos </span>" (if (or current-prefix-arg apropos-do-all)
                                      "<span class="quote">command or function</span>" "<span class="quote">command</span>")
                       "<span class="quote">(regexp</span>" (and (&gt;= emacs-major-version 22) "<span class="quote"> or words</span>") "<span class="quote">): </span>")
               obarray (if current-prefix-arg 'functionp 'commandp)))
            current-prefix-arg))
     (apropos-command pattern do-all var-predicate))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-zippy (regexp)
  "<span class="quote">Show all Zippy quotes matching the regular-expression input.
Returns the list of matches.</span>"
  (interactive (progn (unless (boundp 'yow-file)
                        (unless (require 'yow nil t) (error "<span class="quote">Library `yow' not found</span>")))
                      (cookie yow-file yow-load-message yow-after-load-message)
                      (let* ((case-fold-search t)
                             (cookie-table-symbol (intern yow-file cookie-cache))
                             (string-table (symbol-value cookie-table-symbol))
                             (table (nreverse (mapcar #'list string-table))))
                        (list (completing-read "<span class="quote">Apropos Zippy (regexp): </span>" table)))))
  (let ((matches (apropos-zippy icicle-current-input)))
    (when (interactive-p)
      (with-output-to-temp-buffer "<span class="quote">*Zippy Apropos*</span>"
        (while matches
          (princ (car matches))
          (setq matches (cdr matches))
          (and matches (princ "<span class="quote">\n\n</span>")))))
    matches))                           <span class="linecomment">; Return matching Zippyisms.</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-map (alist fn)
  "<span class="quote">Selectively apply a function to items in an alist.
FN is a function.  ALIST is a variable whose value is an alist.
You are prompted for both arguments.  Completion is available.
The completion list for ALIST is a set of variables whose value is a
cons.  With no prefix arg, the names of these variables must end with
\</span>"alist\"<span class="quote">.  With a prefix argument, the first car of each variable
value must itself be a cons.

Examples: If ALIST is `auto-mode-alist' and FN is `cdr', then the
completion candidates are the keys of the alist and the result of
applying FN to an alist entry is simply the value of that key.  If you
choose, for example, candidate \</span>"\\.el\\'\"<span class="quote">, then the result is
`emacs-lisp-mode'.  In this case, the function performs simple lookup.

If, instead, FN were (lambda (x) (describe-function (cdr x))), then
the result of choosing \</span>"\\.el\\'\"<span class="quote"> would be to display the help for
function `emacs-lisp-mode'.

During completion you can use these keys also.  Each displays the
value of applying FN to the current completion candidate.
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
`\\[icicle-all-candidates-action]'     - Act on *all* candidates, successively

Use `RET' or `S-RET' to finally choose a candidate, or `C-g' to quit.
This is an Icicles command - see `icicle-mode'.

`icicle-map' overrides `icicle-ignore-space-prefix-flag', binding it
to nil so that candidates with initial spaces can be matched.</span>"
  (interactive
   (list (symbol-value (intern (completing-read
                                "<span class="quote">Alist (variable): </span>" obarray
                                `(lambda (symb) (and (boundp symb)
                                                 (consp (symbol-value symb))
                                                 ,(if current-prefix-arg
                                                      '(consp (car (symbol-value symb)))
                                                      '(string-match "<span class="quote">alist$</span>" (symbol-name symb)))))
                                t)))
         (read (completing-read "<span class="quote">Function: </span>" obarray 'functionp))))
  (setq icicle-candidates-alist         <span class="linecomment">; Make keys of ALIST be strings.  Save in global variable.</span>
        (mapcar (lambda (key+val) (cons (format "<span class="quote">%s</span>" (car key+val)) (cdr key+val))) alist))
  (setq icicle-candidate-entry-fn fn)   <span class="linecomment">; Save in global variable.</span>
  (let ((icicle-candidate-action-fn 'icicle-map-action)
        (icicle-incremental-completion-flag 'always)
        (icicle-sort-function nil)
        (icicle-ignore-space-prefix-flag nil))
    (condition-case failure
        (let ((cand-nb 0)
              candidate-entries result)
          (completing-read "<span class="quote">Choose an occurrence: </span>" icicle-candidates-alist nil t)
          (setq candidate-entries (icicle-filter-alist icicle-completion-candidates
                                                       icicle-candidates-alist))
          (cond ((not (wholenump icicle-candidate-nb)) <span class="linecomment">; Didn't cycle to choose the candidate.</span>
                 (when (cdr candidate-entries) <span class="linecomment">; Multiple entries with the same key</span>
                   (error (substitute-command-keys "<span class="quote">Ambiguous choice. Try again.</span>"))))
                (t
                 (setq cand-nb (mod icicle-candidate-nb (length icicle-candidates-alist)))
                 <span class="linecomment">;; If cycling with action functions, then add or subtract one from candidate #.</span>
                 (when (memq last-command '(icicle-next-apropos-candidate-action
                                            icicle-next-prefix-candidate-action))
                   (setq cand-nb (1- cand-nb))
                   (when (&lt; cand-nb 0) (setq cand-nb 0)))
                 (when (memq last-command '(icicle-previous-apropos-candidate-action
                                            icicle-previous-prefix-candidate-action))
                   (setq cand-nb (1+ cand-nb))
                   (when (&gt; cand-nb (length icicle-candidates-alist))
                     (setq cand-nb (length icicle-candidates-alist))))))
          <span class="linecomment">;; Note: If didn't cycle to choose candidate then `candidate-entries' is singleton.</span>
          (setq result (funcall icicle-candidate-entry-fn (elt candidate-entries cand-nb)))
          (message "<span class="quote">Key: %s,  Result: %s</span>" (car (elt candidate-entries cand-nb)) result)
          result)
      (error (error (error-message-string failure))))))

(defun icicle-map-action (string)
  (condition-case icicle-map-action
      (progn
        <span class="linecomment">;; Highlight the current candidate in *Completions*.</span>
        (let ((compl-win (get-buffer-window "<span class="quote">*Completions*</span>" t))
              curr-candidate-pos)
          (when compl-win
            (save-window-excursion
              (select-window compl-win)
              (let ((case-fold-search completion-ignore-case))
                (goto-char (point-min))
                (forward-line 3)
                (icicle-move-to-next-completion icicle-candidate-nb t)
                (set-buffer-modified-p nil)
                (setq curr-candidate-pos (point))))
            (set-window-point compl-win curr-candidate-pos)))
        <span class="linecomment">;; Apply function to candidate entry and display it.</span>
        (if icicle-candidate-nb
            (message "<span class="quote">Key: %s,  Result: %s</span>"
                     (car (elt icicle-candidates-alist icicle-candidate-nb))
                     (funcall icicle-candidate-entry-fn
                              (elt (icicle-filter-alist icicle-completion-candidates
                                                        icicle-candidates-alist)
                                   icicle-candidate-nb)))
          (error "<span class="quote">No such occurrence</span>"))
        t)                              <span class="linecomment">; Return non-nil for success.</span>
    (error nil)))                       <span class="linecomment">; Return nil for failure.</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-search (beg end regexp)
  "<span class="quote">Search for a regexp match, with completion and completion cycling.
The active region is searched, or, if none, the buffer is searched.
You are prompted for a regexp, which you enter using `RET'.  Matches
are available as completion candidates.  You can then use apropos
completion to filter the candidates using a different regexp.

The use of completion here is a bit special.  It is not unusual in
this context to have multiple completion candidates that are identical
- only the positions of their occurrences in the search buffer differ.
In that case, you cannot choose one by completing it in the
minibuffer, because the destination would be ambiguous.  That is,
simply completing your input and entering the completion with `RET'
will not take you to its occurrence in the search buffer unless it is
unique.

Instead, cycle among the candidates and choose one: cycling tracks the
search-buffer position.  To move to each occurrence in the search
buffer as you cycle among candidates, use `C-next', `C-prior',
`C-down', and `C-up'.

To cycle among some candidates without moving to their occurrences in
the search buffer, use `next', `prior', `down', and `up'.  Then use
`C-RET' or `RET' to move to the current-candidate occurrence.

Note that `RET' after cycling with `next' takes you to the current
candidate, but it does not do so after cycling with `C-next'.  This
apparent inconsistency is for convenience.  The `RET' is in fact
ignored, as stated above.  It is the cycling that establishes the
target position, and `icicle-search' simply takes you there.  After
cycling, the minibuffer content corresponds to the current candidate
when you use `next', but for `C-next' it corresponds to the following
candidate.  You do not usually want to go to the following candidate,
so the `RET' is ignored.

In the search buffer, `icicle-search':

 Highlights the current match for the initial regexp using face
 `icicle-search-main-regexp-current'.

 Highlights the match for your current input (e.g. a different regexp
 from the initial one) using face `icicle-search-current-input'.

 Highlights all of the matches for your initial regexp using face
 `icicle-search-main-regexp-others', provided
 `icicle-search-highlight-all-flag' is non-nil.

If user option `icicle-search-cleanup-flag' is non-nil (the default),
then all search highlighting is removed from the search buffer when
you are finished searching.  If it is nil, then you can remove this
highlighting later using command `icicle-search-highlight-cleanup'.

You can use `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-insert-string-from-variable]' (command \
`icicle-insert-string-from-variable') to
insert text (e.g. a regexp) from a variable into the minibuffer.
For example, you can search for ends of sentences by using \
`C-u \\[icicle-insert-string-from-variable]'
and choosing variable `sentence-end' as the variable.  And you can use
`\\[icicle-save-string-to-variable]' to save a string to a variable
for later use by `\\[icicle-insert-string-from-variable]'.

When employed with useful regexps, `C-=' can turn `icicle-search' into
a general navigator or browser of code, mail messages, and many other
types of buffer.  Imenu regexps work fine, for example - command
`icicle-imenu' simply uses `icicle-search' this way.  See
`icicle-insert-string-from-variable' for more tips on inserting
regexps from variables.

`icicle-search' overrides `icicle-ignore-space-prefix-flag', binding
it to nil so that candidates with initial spaces can be matched.</span>"
  (interactive
   (let ((regx (read-from-minibuffer "<span class="quote">Search for (regexp): </span>" nil nil nil 'regexp-history)))
     (if (or (null (mark)) (= (point) (mark)) (not mark-active))
         (list (point-min) (point-max) regx)
       (if (&lt; (point) (mark)) (list (point) (mark) regx) (list (mark) (point) regx)))))
  (setq regexp (or regexp
                   (read-from-minibuffer "<span class="quote">Search for (regexp): </span>" nil nil nil 'regexp-history)))
  (let ((icicle-incremental-completion-flag 'always)
        (icicle-sort-function nil)
        (icicle-ignore-space-prefix-flag nil)
        (orig-point (point))
        (orig-window (selected-window))
        (last-beg nil)
        (mark-active nil)               <span class="linecomment">; So region highlighting doesn't hide highlighting here.</span>
        (icicle-update-input-hook (if icicle-search-highlight-all-flag
                                      (list 'icicle-search-highlight-all-input-matches)
                                    icicle-update-input-hook)))
    (setq icicle-candidates-alist nil)
    <span class="linecomment">;; Build `icicle-candidates-alist'.  Highlight matches if `icicle-search-highlight-all-flag'.</span>
    (save-excursion
      (goto-char beg)
      (while (and beg (&lt; beg end))
        (while (and (setq beg (re-search-forward regexp end t)) (eq last-beg beg))
          (forward-char) (setq beg (1+ beg))) <span class="linecomment">; Matched again at same place.  Advance 1 char.</span>
        (when beg                       <span class="linecomment">; Add (strg . pos) to candidates.</span>
          (push (cons (buffer-substring-no-properties (match-beginning 0) (match-end 0)) beg)
                icicle-candidates-alist)
          <span class="linecomment">;; Highlight candidate in (original) buffer.</span>
          (when icicle-search-highlight-all-flag
            (let ((ov (make-overlay (match-beginning 0) (match-end 0))))
              (push ov icicle-search-overlays)
              (overlay-put ov 'priority 200) <span class="linecomment">; &gt; ediff's 100+, but &lt; isearch overlays</span>
              (overlay-put ov 'face 'icicle-search-main-regexp-others))))
        (setq last-beg beg)))
    (setq icicle-candidates-alist (nreverse icicle-candidates-alist))
    (unless icicle-candidates-alist (error "<span class="quote">No match for regexp `%s'</span>" regexp))
    (let ((icicle-candidate-action-fn 'icicle-search-action))
      (unwind-protect
           (condition-case failure
               (let (candidate-entries)
                 (completing-read "<span class="quote">Choose an occurrence: </span>" icicle-candidates-alist nil t)
                 (setq candidate-entries (icicle-filter-alist icicle-completion-candidates
                                                              icicle-candidates-alist))
                 (cond ((not (wholenump icicle-candidate-nb))
                        (if (cdr candidate-entries)
                            (error (substitute-command-keys "<span class="quote">Ambiguous choice. Try again using \
\\&lt;minibuffer-local-completion-map&gt;\\[icicle-next-apropos-candidate-action] to browse.</span>"))
                          (goto-char (cdr (car candidate-entries)))))
                       (t
                        (let ((cand-nb (mod icicle-candidate-nb (length icicle-candidates-alist)))
                              position)
                          <span class="linecomment">;; If cycling with action functions, add or subtract one from candidate #.</span>
                          (when (memq last-command '(icicle-next-apropos-candidate-action
                                                     icicle-next-prefix-candidate-action))
                            (setq cand-nb (1- cand-nb))
                            (when (&lt; cand-nb 0) (setq cand-nb 0)))
                          (when (memq last-command '(icicle-previous-apropos-candidate-action
                                                     icicle-previous-prefix-candidate-action))
                            (setq cand-nb (1+ cand-nb))
                            (when (&gt; cand-nb (length icicle-candidates-alist))
                              (setq cand-nb (length icicle-candidates-alist))))
                          (setq position (cdr (elt candidate-entries cand-nb)))
                          (unless position (error "<span class="quote">No such occurrence</span>"))
                          (goto-char position)
                          (run-hooks 'icicle-search-hook)))))
             (quit (goto-char orig-point))
             (error (goto-char orig-point) (error (error-message-string failure))))
        (when icicle-search-cleanup-flag (icicle-search-highlight-cleanup))))))

(defun icicle-search-highlight-all-input-matches (&optional input)
  "<span class="quote">Highlight, inside each search regexp match, what current input matches.</span>"
  (setq input (or input icicle-current-regexp-input))
  (unless (or (string= "<span class="quote"></span>" input) (null icicle-search-overlays))
    (save-excursion
      (set-buffer (overlay-buffer (car icicle-search-overlays)))
      <span class="linecomment">;; Update by deleting (if it exists) and then creating.  If a single overlay exists, user just</span>
      <span class="linecomment">;; changed `icicle-search-highlight-all-flag' to t.  Otherwise, it's nil or a list of overlays.</span>
      (when (overlayp icicle-search-refined-overlays)
        (delete-overlay icicle-search-refined-overlays)
        (setq icicle-search-refined-overlays nil))
      (while icicle-search-refined-overlays
        (let ((ov (pop icicle-search-refined-overlays)))
          (when (overlayp ov) (delete-overlay ov))))
      (dolist (ov icicle-search-overlays)
        (save-restriction               <span class="linecomment">; Search within the current search regexp match.</span>
          (narrow-to-region (overlay-start ov) (overlay-end ov))
          (goto-char (point-min))
          (when (re-search-forward input nil t)
            (setq ov (make-overlay (match-beginning 0) (match-end 0)))
            (push ov icicle-search-refined-overlays)
            (overlay-put ov 'priority 204)
            (overlay-put ov 'face 'icicle-search-current-input)))))))

(defun icicle-search-action (string)
  "<span class="quote">Action function for command `icicle-search'.
1. Highlight the current candidate in *Completions*.
2. Move to the regexp match in the original buffer and highlight it.
3. If `icicle-search-highlight-all-flag' is nil, highlight what the
   current input matches, inside the match of the initial regexp.</span>"
  (unwind-protect
       (condition-case icicle-search-action
           (progn
             <span class="linecomment">;; Highlight the current candidate in *Completions*.</span>
             (let ((compl-win (get-buffer-window "<span class="quote">*Completions*</span>" t))
                   curr-candidate-pos)
               (when compl-win
                 (save-window-excursion
                   (select-window compl-win)
                   (let ((case-fold-search completion-ignore-case))
                     (goto-char (point-min))
                     (forward-line 3)
                     (icicle-move-to-next-completion icicle-candidate-nb t)
                     (set-buffer-modified-p nil)
                     (setq curr-candidate-pos (point))))
                 (set-window-point compl-win curr-candidate-pos)))

             <span class="linecomment">;; Move cursor to the match in the original buffer and highlight it.</span>
             (let* ((cand+pos (and icicle-candidate-nb
                                   (elt (icicle-filter-alist icicle-completion-candidates
                                                             icicle-candidates-alist)
                                        icicle-candidate-nb)))
                    (candidate (car-safe cand+pos))
                    (position (cdr-safe cand+pos)))
               (unless position (error "<span class="quote">No such occurrence</span>"))
               (save-selected-window
                 (select-window orig-window)
                 (let ((case-fold-search completion-ignore-case))
                   (goto-char position)
                   (icicle-place-overlay (- position (length candidate)) position
                                         'icicle-search-current-overlay
                                         'icicle-search-main-regexp-current
                                         (current-buffer))
                   (overlay-put icicle-search-current-overlay 'priority 202)
                   (unless (or icicle-search-highlight-all-flag
                               (string= "<span class="quote"></span>" icicle-current-regexp-input))
                     <span class="linecomment">;; Highlight, inside search regexp match, what current input matches.</span>
                     (save-excursion
                       (save-restriction <span class="linecomment">; Search within the current search regexp match.</span>
                         (narrow-to-region (- position (length candidate)) position)
                         (goto-char (point-min))
                         (when (re-search-forward icicle-current-regexp-input nil t)
                           (icicle-place-overlay
                            (match-beginning 0) (point) 'icicle-search-refined-overlays
                            'icicle-search-current-input (current-buffer))
                           (overlay-put icicle-search-refined-overlays 'priority 204)))))
                   (run-hooks 'icicle-search-hook)))
               t))                      <span class="linecomment">; Return non-nil for success.</span>
         (error nil))                   <span class="linecomment">; Return nil for failure.</span>
    (select-frame-set-input-focus (window-frame (minibuffer-window)))))

(defun icicle-filter-alist (filter-keys alist)
  "<span class="quote">Filter ALIST, keeping items whose cars match FILTER-KEYS, in order.
The original ALIST is not altered; a copy is filtered and returned.</span>"
  (icicle-delete-if-not (lambda (item) (member (car item) filter-keys)) alist))

(defun icicle-search-highlight-cleanup ()
  "<span class="quote">Remove all highlighting from the last use of `icicle-search'.</span>"
  (interactive)
  (while icicle-search-overlays
    (let ((ov (pop icicle-search-overlays))) (when (overlayp ov) (delete-overlay ov))))
  (when (overlayp icicle-search-current-overlay)
    (delete-overlay icicle-search-current-overlay))
  (when (overlayp icicle-search-refined-overlays)
    (delete-overlay icicle-search-refined-overlays)
    (setq icicle-search-refined-overlays nil))
  (while icicle-search-refined-overlays
    (let ((ov (pop icicle-search-refined-overlays)))
      (when (overlayp ov) (delete-overlay ov)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-occur (beg end)
  "<span class="quote">`icicle-search' with a regexp of \</span>".*\"<span class="quote">.  An `occur' with icompletion.
Type a regexp to match within each line of the buffer.  Use `S-TAB' to
show matching lines.  Use `C-RET' or `C-mouse-2' to go to the line of
the current candidate.  Use `C-next', `C-prior', `C-down', or`C-up' to
cycle among the matching lines.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.</span>"
  (interactive
   (if (or (null (mark)) (= (point) (mark)) (not mark-active))
       (list (point-min) (point-max))
     (if (&lt; (point) (mark))
         (list (point) (mark))
       (list (mark) (point)))))
  (let ((fg (face-foreground 'icicle-search-main-regexp-others))
        (bg (face-background 'icicle-search-main-regexp-others)))
    (unwind-protect
         (progn
           (set-face-foreground 'icicle-search-main-regexp-others nil)
           (set-face-background 'icicle-search-main-regexp-others nil)
           (icicle-search beg end "<span class="quote">.*</span>"))
      (set-face-foreground 'icicle-search-main-regexp-others fg)
      (set-face-background 'icicle-search-main-regexp-others bg))))



<span class="linecomment">;;;###autoload</span>
(defun icicle-compilation-search (beg end)
  "<span class="quote">Like `icicle-search', but shows the matching compilation-buffer
hit.  Use this in a compilation buffer, such as `*grep*', searching
for a regexp as with `icicle-search'.  Use `C-RET' or `C-mouse-2' to
show the target-buffer hit corresponding to the current completion
candidate.  Use `C-next', `C-prior', `C-down', or `C-up' to cycle
among the target-buffer hits.

As for `icicle-search', you can further narrow the match candidates
by typing a second regexp to search for among the first matches.

Altogether, using this with `grep' gives you two or three levels of
regexp searching: 1) the `grep' regexp, 2) the major `icicle-search'
regexp, and optionally 3) the refining `icicle-search' regexp.</span>"
  (interactive
   (if (or (null (mark)) (= (point) (mark)) (not mark-active))
       (list (point-min) (point-max))
     (if (&lt; (point) (mark)) (list (point) (mark)) (list (mark) (point)))))
  (unless
      (condition-case nil
          (eq (current-buffer) (compilation-find-buffer))
        (error nil))
    (error "<span class="quote">Current buffer must be a compilation buffer</span>"))
  (let ((orig-search-hook icicle-search-hook))
    (add-hook 'icicle-search-hook 'compile-goto-error)
    (icicle-search beg end nil)
    (remove-hook 'icicle-search-hook 'compile-goto-error)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-imenu (beg end)
  "<span class="quote">Go to an Imenu entry using `icicle-search'.
See `icicle-search' for usage notes.</span>"
  (interactive (if (or (null (mark)) (= (point) (mark)) (not mark-active))
                   (list (point-min) (point-max))
                 (if (&lt; (point) (mark)) (list (point) (mark)) (list (mark) (point)))))
  (unless imenu-generic-expression (error "<span class="quote">No Imenu for this buffer</span>"))
  (let ((case-fold-search (if (or (local-variable-p 'imenu-case-fold-search)
				  (not (local-variable-p 'font-lock-defaults)))
			      imenu-case-fold-search
			    (nth 2 font-lock-defaults)))
        (old-table (syntax-table))
        (table (copy-syntax-table (syntax-table)))
        (slist imenu-syntax-alist))
    (dolist (syn slist)                 <span class="linecomment">; Modify the syntax table used while matching regexps.</span>
      (if (numberp (car syn))
	  (modify-syntax-entry (car syn) (cdr syn) table) <span class="linecomment">; Single character.</span>
        (mapc (lambda (c) (modify-syntax-entry c (cdr syn) table)) (car syn)))) <span class="linecomment">; String.</span>
    (unwind-protect
         (save-match-data
           (set-syntax-table table)
           (let* ((menus (icicle-delete-if-not
                          #'icicle-imenu-in-buffer-p <span class="linecomment">; Only use menus that match the buffer.</span>
                          (mapcar (lambda (menu) <span class="linecomment">; Name an unlabeled menu `Others'.</span>
                                    (if (stringp (car menu)) menu (cons "<span class="quote">Others</span>" (cdr menu))))
                                  imenu-generic-expression)))
                  (submenu (completing-read "<span class="quote">Choose: </span>" menus nil t nil nil nil))
                  (regexp (cadr (assoc submenu menus))))
             (unless (stringp regexp) (error "<span class="quote">No match</span>"))
             (icicle-search beg end regexp)))
      (set-syntax-table old-table))))

(defun icicle-imenu-in-buffer-p (menu)
  "<span class="quote">Return non-nil if the regexp in MENU has a match in the buffer.</span>"
  (save-excursion (goto-char (point-min)) (re-search-forward (cadr menu) nil t)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-save-string-to-variable (askp)
  "<span class="quote">Save a string (text) to a variable.
By default, the variable is user option `icicle-input-string'.
To save to a different variable, use a prefix argument; you are then
prompted for the variable to use.  You can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-from-variable]' to insert a string from a
variable.  Typically, you store a regexp or part of a regexp in the
variable.</span>"
  (interactive "<span class="quote">P</span>")
  (let* ((enable-recursive-minibuffers t)
         (var (if askp
                  (intern (completing-read "<span class="quote">Variable: </span>" obarray 'boundp nil nil nil
                                           (symbol-name 'icicle-input-string)))
                'icicle-input-string))
         (text (read-string (format "<span class="quote">Text to save in `%s': </span>" var))))
    (set var text)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-icicles-group ()
  "<span class="quote">Customize Icicles options and faces.  View their documentation.</span>"
  (interactive)
  (customize-group-other-window 'icicles))

<span class="linecomment">;;;###autoload</span>
(defun icicle-send-bug-report ()
  "<span class="quote">Send a bug report about an Icicles problem.</span>"
  (interactive)
  (browse-url (concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>" "<span class="quote">.com?subject=\
icicles.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and Icicles library versions.</span>")))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-cmd)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-cmd.el ends here</span></span></pre></pre></p></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" href="http://www.emacswiki.org/cgi-bin/emacs?action=edit;id=icicles-cmd.el">Edit this page</a> <a class="history" href="http://www.emacswiki.org/cgi-bin/emacs?action=history;id=icicles-cmd.el">View other revisions</a> <a class="admin" href="http://www.emacswiki.org/cgi-bin/emacs?action=admin;id=icicles-cmd.el">Administration</a></span><span class="time"><br /> Last edited 2006-06-10 00:19 UTC by <a class="author" title="from inet-netcache3-o.oracle.com" href="http://www.emacswiki.org/cgi-bin/emacs/DrewAdams">DrewAdams</a> <a class="diff" href="http://www.emacswiki.org/cgi-bin/emacs?action=browse;diff=2;id=icicles-cmd.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" class="search">
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