<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head><title>EmacsWiki: icicles-face.el</title><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,NOFOLLOW" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki with page content and diff" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;full=1;diff=1" /><link rel="alternate" type="application/rss+xml" title="Emacs Wiki including minor differences" href="http://www.emacswiki.org/cgi-bin/wiki?action=rss;showedit=1" /></head><body class="http://www.emacswiki.org/cgi-bin/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><form class="tiny" action="http://www.emacswiki.org/cgi-bin/emacs"><p>Search: <input type="text" name="search" size="20" /></p></form><h1><a title="Click to search for references to this page" href="http://www.emacswiki.org/cgi-bin/emacs?search=%22icicles-face%5c.el%22">icicles-face.el</a></h1></div><div class="content browse"><p><p><a href="http://www.emacswiki.org/cgi-bin/wiki/download/icicles-face.el">Download</a></p><pre class="source"><pre class="code"><span class="linecomment">;;; icicles-face.el --- Faces for Icicles</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; Filename: icicles-face.el</span>
<span class="linecomment">;; Description: Faces for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 2005, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:19:43 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Fri Apr 28 17:08:32 2006 (-25200 Pacific Daylight Time)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 82</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-face.el</span>
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
<span class="linecomment">;;  faces.  See `icicles.el' for documentation.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;  Faces defined here (in Custom group `icicles'):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-common-match-highlight-Completions',</span>
<span class="linecomment">;;    `icicle-complete-input', `icicle-current-candidate-highlight',</span>
<span class="linecomment">;;    `icicle-historical-candidate',</span>
<span class="linecomment">;;    `icicle-match-highlight-Completions',</span>
<span class="linecomment">;;    `icicle-match-highlight-minibuffer', `icicle-prompt-suffix',</span>
<span class="linecomment">;;    `icicle-search-current-input',</span>
<span class="linecomment">;;    `icicle-search-main-regexp-current',</span>
<span class="linecomment">;;    `icicle-search-main-regexp-others',</span>
<span class="linecomment">;;    `icicle-whitespace-highlight'.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2006/04/28 dadams</span>
<span class="linecomment">;;     Added: icicle-whitespace-highlight.</span>
<span class="linecomment">;; 2006/04/14 dadams</span>
<span class="linecomment">;;     Renamed icicle-search-refined-regexp to icicle-search-current-input.</span>
<span class="linecomment">;; 2006/04/07 dadams</span>
<span class="linecomment">;;     Added: icicle-search-main-regexp-others.</span>
<span class="linecomment">;;     Renamed: icicle-search-main-regexp to icicle-search-main-regexp-current.</span>
<span class="linecomment">;; 2006/03/27 dadams</span>
<span class="linecomment">;;     Added: icicle-search-*-regexp.</span>
<span class="linecomment">;; 2006/03/22 dadams</span>
<span class="linecomment">;;     Renamed: icicle-root-highlight-* to icicle-match-highlight-*.</span>
<span class="linecomment">;; 2006/03/21 dadams</span>
<span class="linecomment">;;     Added: icicle-common-match-highlight-Completions.</span>
<span class="linecomment">;;     icicle-root-highlight-Completions: Changed default face.</span>
<span class="linecomment">;; 2006/03/08 dadams</span>
<span class="linecomment">;;     Added: icicle-current-candidate-highlight.</span>
<span class="linecomment">;; </span>
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

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>


<span class="linecomment">;;; Faces (alphabetical) -----------------------------------</span>

(defgroup icicles nil
  "<span class="quote">Minibuffer input completion and cycling of completion candidates.</span>"
  :prefix "<span class="quote">icicle-</span>"
  :group 'completion :group 'convenience :group 'help :group 'apropos
  :group 'dabbrev :group 'matching :group 'minibuffer :group 'recentf
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>" "<span class="quote">.com?subject=\
icicles.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icicles.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Commentary</span>" "<span class="quote">icicles</span>")
  )

(defface icicle-common-match-highlight-Completions '((t (:foreground "<span class="quote">magenta3</span>")))
  "<span class="quote">*Face used to highlight candiates common match, in *Completions*.</span>"
  :group 'icicles :group 'faces)

(defface icicle-complete-input '((t (:foreground "<span class="quote">dark green</span>")))
  "<span class="quote">*Face used to highlight input when it is complete.</span>"
  :group 'icicles :group 'faces)

(defface icicle-Completions-instruction-1 '((t (:foreground "<span class="quote">Blue</span>")))
  "<span class="quote">*Face used to highlight first line of *Completions* buffer.</span>"
  :group 'icicles :group 'faces)

(defface icicle-Completions-instruction-2 '((t (:foreground "<span class="quote">Red</span>")))
  "<span class="quote">*Face used to highlight second line of *Completions* buffer.</span>"
  :group 'icicles :group 'faces)

(defface icicle-current-candidate-highlight '((t (:background "<span class="quote">CadetBlue1</span>")))
  "<span class="quote">*Face used to highlight the current candidate, in *Completions*.</span>"
  :group 'icicles :group 'faces)

(defface icicle-historical-candidate '((t (:foreground "<span class="quote">Blue</span>")))
  "<span class="quote">*Face used to highlight *Completions* candidates that have been used.</span>"
  :group 'icicles :group 'faces)

<span class="linecomment">; Value is from `custom-button-pressed-face', with :foreground from `minibuffer-prompt'.</span>
(defface icicle-prompt-suffix
    '((((type x w32 mac) (class color))
       (:box (:line-width 2 :style pressed-button) :foreground "<span class="quote">dark blue</span>"))
        <span class="linecomment">;;; :background "lightgrey" :foreground "black"</span>
      (t (:inverse-video t)))
  "<span class="quote">*Face used to highlight `icicle-prompt-suffix'.</span>"
  :group 'icicles :group 'faces)

(defface icicle-match-highlight-Completions '((t (:foreground "<span class="quote">Red3</span>")))
  "<span class="quote">*Face used to highlight root that was completed, in *Completions*.</span>"
  :group 'icicles :group 'faces)

(defface icicle-match-highlight-minibuffer '((t (:underline t)))
  "<span class="quote">*Face used to highlight root that was completed, in minibuffer.</span>"
  :group 'icicles :group 'faces)

(defface icicle-search-main-regexp-current '((t (:background "<span class="quote">misty rose</span>")))
  "<span class="quote">*Face used to highlight current match of your original regexp.</span>"
  :group 'icicles :group 'faces)

(defface icicle-search-main-regexp-others '((t (:background "<span class="quote">CadetBlue1</span>")))
  "<span class="quote">*Face used to highlight other matches of your original regexp.
If user option `icicle-search-highlight-all-flag' is nil, then this
face is not used.</span>"
  :group 'icicles :group 'faces)

(defface icicle-search-current-input '((t (:foreground "<span class="quote">Black</span>" :background "<span class="quote">Green</span>")))
  "<span class="quote">*Face used to highlight what your current input matches.</span>"
  :group 'icicles :group 'faces)

(defface icicle-whitespace-highlight '((t (:background "<span class="quote">Magenta</span>")))
  "<span class="quote">*Face used to highlight initial whitespace in minibuffer input.</span>"
  :group 'icicles :group 'faces)



<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-face)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-face.el ends here</span></span></pre></pre></p></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/cgi-bin/emacs/Suggestions">Suggestions</a> </span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" href="http://www.emacswiki.org/cgi-bin/emacs?action=edit;id=icicles-face.el">Edit this page</a> <a class="history" href="http://www.emacswiki.org/cgi-bin/emacs?action=history;id=icicles-face.el">View other revisions</a> <a class="admin" href="http://www.emacswiki.org/cgi-bin/emacs?action=admin;id=icicles-face.el">Administration</a></span><span class="time"><br /> Last edited 2006-04-29 01:26 UTC by <a class="author" title="from inet-netcache3-o.oracle.com" href="http://www.emacswiki.org/cgi-bin/emacs/DrewAdams">DrewAdams</a> <a class="diff" href="http://www.emacswiki.org/cgi-bin/emacs?action=browse;diff=2;id=icicles-face.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" class="search">
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