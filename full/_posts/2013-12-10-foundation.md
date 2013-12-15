---
layout: post
title: "Foundation"
---

After having laid down the major ideas of the [design][design] and the
[plan][plan] I made the first commit of the project. It will be hosted on GitHub
on the [Multilatex repository][repo]. These are some of the first additions.

I added some of the [stack requirements][stack] in `package.json` and some of
the [front-end libraries][libs] to the static part of the web site.

## Directory structure

One particularly important aspect is separating the main code from the
configuration. I've put them before together and it turns out to be problematic
for deployment.

I remember writing a series of bad projects that depended on having the
configuration in the project's root directory and starting the executable or
script only from its directory.

Another is preparing for the auxiliary code/tools and not adding them as an
afterthought.

## Blog

I've previously hosted this blog as a subdomain on `blog.multilatex.com`, but
now I've moved it as a subdirectory to [`multilatex.com/blog`][blog] since it's
considered better.

## Legal stuff

I've added the [MIT license][mit] to the code since it's the most permissive and
the [Creative Commons BY-NC-SA][cc] to the blog.

[stack]: /blog/design#stack
[libs]: /blog/design#frontend_libraries
[design]: /blog/design
[plan]: /blog/plan
[repo]: https://github.com/paul-nechifor/multilatex
[blog]: http://multilatex.com/blog
[mit]: https://github.com/paul-nechifor/multilatex/LICENSE
[cc]: http://creativecommons.org/licenses/by-nc-sa/4.0/
