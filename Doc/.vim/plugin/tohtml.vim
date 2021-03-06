" Vim plugin for converting a syntax highlighted file to HTML.
" Maintainer: Ben Fritz <fritzophrenic@gmail.com>
" Last Change: 2012 Jul 12
"
" The core of the code is in $VIMRUNTIME/autoload/tohtml.vim and
" $VIMRUNTIME/syntax/2html.vim
"
" TODO: {{{
"   * Bug: still a 1px gap throughout the fold column when html_prevent_copy is
"     "fn" in some browsers. Specifically, in Chromium on Ubuntu (but not Chrome
"     on Windows). Perhaps it is font related?
"   * Bug: still some gaps in the fold column when html_prevent_copy contains
"     'd' and showing the whole diff (observed in multiple browsers). Only gaps
"     on diff lines though.
"   * anchors on each line so you can do file.html#1234 to get to line 1234
"   * add a modeline to the generated html to set nofoldenable or fdm=manual
"     because syntax folding takes a terribly long time to work with the weird
"     formatting the script does.
"   * Options for generating the CSS in external style sheets. New :TOcss
"     command to convert the current color scheme into a (mostly) generic CSS
"     stylesheet which can be re-used. Alternate stylesheet support?
"   * Undercurl support via CSS3, with fallback to dotted or something:
"	https://groups.google.com/d/topic/vim_use/BzXA6He1pHg/discussion
"   * Redo updates for modified default foldtext (v11) when/if the patch is
"     accepted to modify it.
"   * Test case +diff_one_file-dynamic_folds+expand_tabs-hover_unfold
"		+ignore_conceal-ignore_folding+no_foldcolumn+no_pre+no_progress
"		+number_lines-pre_wrap-use_css+use_xhtml+whole_filler.xhtml
"     does not show the whole diff filler as it is supposed to.
"   * Add option for not generating the hyperlink on stuff that looks like a
"     URL? Or just color the link to fit with the colorscheme (and only special
"     when hovering)?
"   * Bug: when 'isprint' is wrong for the current encoding, will generate
"     invalid content. Can/should anything be done about this? Maybe a separate
"     plugin to correct 'isprint' based on encoding?
"   * Check to see if the windows-125\d encodings actually work in Unix without
"     the 8bit- prefix. Add prefix to autoload dictionaries for Unix if not.
"   * Font auto-detection similar to
"     http://www.vim.org/scripts/script.php?script_id=2384 but for a variety of
"     platforms.
"   * Error thrown when sourcing 2html.vim directly when plugins are not loaded.
"   * Pull in code from http://www.vim.org/scripts/script.php?script_id=3113 :
"	- listchars support
"	- full-line background highlight
"	- other?
"   * Explicitly trigger IE8+ Standards Mode? Doesn't seem necessary yet.
"   * Make it so deleted lines in a diff don't create side-scrolling (get it
"     free with full-line background highlight above).
"   * Restore open/closed folds and cursor position after processing each file
"     with option not to restore for speed increase.
"   * Add extra meta info (generation time, etc.)?
"   * Tidy up so we can use strict doctype in even more situations
"   * Implementation detail: add threshold for writing the lines to the html
"     buffer before we're done (5000 or so lines should do it)
"   * TODO comments for code cleanup scattered throughout
"}}}

if exists('g:loaded_2html_plugin')
  finish
endif
let g:loaded_2html_plugin = 'vim7.3_v12'

"
" Changelog: {{{
"
"   7.3_v12 (this version): Fix modeline mangling to also work for when multiple
"                           highlight groups make up the start-of-modeline text.
"                           Improve render time of page with uncopyable regions
"                           by not using one-input-per-char. Change name of
"                           uncopyable option from html_unselectable to
"                           html_prevent_copy. Added html_no_invalid option and
"                           default to inserting invalid markup for uncopyable
"                           regions to prevent MS Word from pasting undeletable
"                           <input> elements. Fix 'cpo' handling (Thilo Six).
"                7.3_v12b1: Add html_unselectable option. Rework logic to
"                           eliminate post-processing substitute commands in
"                           favor of doing the work up front. Remove unnecessary
"                           special treatment of 'LineNr' highlight group. Minor
"                           speed improvements. Fix modeline mangling in
"                           generated output so it works for text in the first
"                           column. Fix missing line number and fold column in
"                           diff filler lines. Fix that some fonts have a 1px
"                           gap (using a dirty hack, improvements welcome). Add
"                           "colorscheme" meta tag. Does NOT include support for
"                           the new default foldtext added in v11, as the patch
"                           adding it has not yet been included in Vim.
"   7.3_v11 ( unreleased ): Support new default foldtext from patch by Christian
"                           Brabandt in
"                           http://groups.google.com/d/topic/vim_dev/B6FSGfq9VoI/discussion.
"                           This patch has not yet been included in Vim, thus
"                           these changes are removed in the next version.
"   7.3_v10 (fd09a9c8468e): Fix error E684 when converting a range wholly inside
"                           multiple nested folds with dynamic folding on.
"                           Also fix problem with foldtext in this situation.
"   7.3_v9  (0877b8d6370e): Add html_pre_wrap option active with html_use_css
"                           and without html_no_pre, default value same as
"                           'wrap' option, (Andy Spencer). Don't use
"                           'fileencoding' for converted document encoding if
"                           'buftype' indicates a special buffer which isn't
"                           written.
"   7.3_v8  (85c5a72551e2): Add html_expand_tabs option to allow leaving tab
"                           characters in generated output (Andy Spencer).
"                           Escape text that looks like a modeline so Vim
"                           doesn't use anything in the converted HTML as a
"                           modeline. Bugfixes: Fix folding when a fold starts
"                           before the conversion range. Remove fold column when
"                           there are no folds.
"   7.3_v7  (840c3cadb842): see betas released on vim_dev below:
"                 7.3_v7b3: Fixed bug, convert Unicode to UTF-8 all the way.
"                 7.3_v7b2: Remove automatic detection of encodings that are not
"                           supported by all major browsers according to
"                           http://wiki.whatwg.org/wiki/Web_Encodings and
"                           convert to UTF-8 for all Unicode encodings. Make
"                           HTML encoding to Vim encoding detection be
"                           case-insensitive for built-in pairs.
"                 7.3_v7b1: Remove use of setwinvar() function which cannot be
"                           called in restricted mode (Andy Spencer). Use
"                           'fencoding' instead of 'encoding' to determine by
"                           charset, and make sure the 'fenc' of the generated
"                           file matches its indicated charset. Add charsets for
"                           all of Vim's natively supported encodings.
"   7.3_v6  (0d3f0e3d289b): Really fix bug with 'nowrapscan', 'magic' and other
"                           user settings interfering with diff mode generation,
"                           trailing whitespace (e.g. line number column) when
"                           using html_no_pre, and bugs when using
"                           html_hover_unfold.
"   7.3_v5  ( unreleased ): Fix bug with 'nowrapscan' and also with out-of-sync
"                           folds in diff mode when first line was folded.
"   7.3_v4  (7e008c174cc3): Bugfixes, especially for xhtml markup, and diff mode
"   7.3_v3  (a29075150aee): Refactor option handling and make html_use_css
"                           default to true when not set to anything. Use strict
"                           doctypes where possible. Rename use_xhtml option to
"                           html_use_xhtml for consistency. Use .xhtml extension
"                           when using this option. Add meta tag for settings.
"   7.3_v2  (80229a724a11): Fix syntax highlighting in diff mode to use both the
"                           diff colors and the normal syntax colors
"   7.3_v1  (e7751177126b): Add conceal support and meta tags in output
"   Pre-v1 baseline: Mercurial changeset 3c9324c0800e
"}}}

" Define the :TOhtml command when:
" - 'compatible' is not set
" - this plugin was not already loaded
" - user commands are available. {{{
if !&cp && !exists(":TOhtml") && has("user_commands")
  command -range=% TOhtml :call tohtml#Convert2HTML(<line1>, <line2>)
endif "}}}

" Make sure any patches will probably use consistent indent
"   vim: ts=8 sw=2 sts=2 noet fdm=marker
