---
layout: post
title: "Multilatex Ideas"
---

The [starting idea][1] is:

> Develop a web editor/compiler for latex files, with support for collaborative editing and tracking changes. Also a comment system would be helpful to user in order to keep track of both the changes but also what other users commented and when (and in regards to what paragraph).

There are multiple Latex editors on the web, but these are some of the problems I'm trying to solve. I haven't yet
decided fully on what the best course of action is for each.

* **Handling of big files.** Usually a big Latex document is split into multiple `.tex` files and the main one includes the rest. This is what [ShareLaTeX][2] does, but I think it's bad. These files usually model the chapters, sections and subsections. It would be easier if the editor recognized these and selecting one would give you a partition of the bigger file to edit. This would mean you wouldn't have to manually manage files.
* **Collaborative editing.** There are two possibilities I see: *real-time editing* (like Google Docs) or *commit-based editing* (like GitHub). Since Latex doesn't function like a WYSIWYG editor, a commit-based one might seem better, but it would be frustrating to have to deal the all the merging. The problem with real-time editing is that it complicates undoing and many others like how do you decide when to issue another preview and label a revision? (Maybe just compile it and see if it succeeds.)
* **Tracking changes.** With commit-based edits it would be simple, but what about real-time? Should edits be flattened from time to time? How would a single person's edits be reviewed? There should be the possibility to open two PDFs side by side just to compare the end results (not just the source). The two PDFs would contain highlighting of modifications.
* **Division of work.** An idea is to be able to lock certain parts so that they are only editable to a single person (allocating that to them). But is it worth it? This wouldn't work as a security feature, it would just help divide work.
* **Output formats.** Should the output format be only PDF (and maybe similar formats like DVI and PS) or should I also try to output to a limited HTML. This could be useful for crawlers.
* **Comments by people who don't know Latex.** It's important to let people who don't know Latex be able to make comments on the content itself. But should this be on a certain revision of the output PDF (like a note pined to (x,y) in the document). Should all the paragraphs be delimited and somebody could add notes tied to a paragraph like on [medium.com][3]? The best way would be to select the text in the PDF and leave a note for that selection (like in Adobe Acrobat), but might be very hard if not impossible since it would require the ability to understand the PDF. Should comments be on revisions or associated with a document and they can be added and removed?
* **The Latex compiler.** Should I use a fully browser-based Latex compiler or compile on the server? The best solution is probably the later since JavaScript Latex is very slow, but I might use it for limited purposes such as displaying fast previews when editing small subsections (this would create a sort of WYSIWYG effect).
* **Import and export.** The site should be able to import archives with `.tex` files and resources and export them back when needed. This is a basic feature.
* **The technology.** I plan to write the back-end with Node.js and use MongoDB for storage. It may not be the best choice in terms of speed, but it's better for the prototype since it's faster to develop and I can change curse later if need be.

Ideas for the distant future:
* **Multi-window editor.** You place the editor in one window on one monitor and the preview on another monitor.
* Heavily simplified **editor for use on tablets**.
* **Automatic document-sensitive completion.** Typing `\` would show possible completions including macros defined in the document.

[1]: http://ideasource.blankdots.com/2013/09/online-latex-editor/
[2]: https://www.sharelatex.com
[3]: https://medium.com/
