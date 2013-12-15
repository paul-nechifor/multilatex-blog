---
layout: post
title: "Sandboxing LaTeX"
---

TeX is a powerful language and thus it can be dangerous. Whenever executing
arbitrary code from unknown sources one has to be careful.

I will have to build a system in Node which sandboxes `pdflatex` so that it can
produce no harm to the rest of the system.

## Shell code

One of the first problems is that LaTeX can be made to execute arbitrary system
commands with the `\write18{command}` construct. This is usually disabled by
default but it's best to disable it completely with the `-no-shell-escape`
argument.

## Bad usage

TeX is a Turing complete language so (as with C++ templates) one cannot
determine ahead of time if compilation will ever finish.

LaTeX is huge, so it's likely there are many yet undiscovered problems in its
packages that can be triggered to fill the memory or enter infinite loops.

The best solution to these problems is to run the tasks as multiple Linux
users which are limited appropriately. This means limiting:
* where the user can write;
* how much virtual memory he can use (with `ulimits`);
* how much CPU time he can use
* and others.

Infinite loops can be managed by setting a time limit for generating the PDF
after which the `pdflatex` process is terminated.

Bad usage could be intentional by malicious users, but it's more likely that
it's accidental so human users should be presented with the errors.

## Other

There are other ways you can influence the system like writing output files with
the [newfile][newfile] package. One could clog the system with large files. This
is also solved by setting Linux user limits.

## Doing it

I am now in the process of writing the prototype for the site so I won't be
doing exactly this. I've actually added a disclaimer in the footer about the
site being in pre-alpha.

[newfile]: http://tug.ctan.org/pkg/newfile
