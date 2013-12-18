---
layout: post
title: "Authentication"
---

In light of the somewhat recent revelations of [Adobe's password leak][leak] I
think it's important to stress the importance of secure storage of passwords.

I use the simple and secure method of hashing with SHA1 and unique salt.
Technically, bcrypt is better, but I don't have the hardware resources for that.

## Hints

Adobe's leak included the password hints which led the the amusing suggestion by
XKCD of creating [huge crossword puzzle][encryptic] which was eventually
[made][puzzle].

I disagree with password hints exactly for this reason: it gives others ideas.
If you forgot your password you're better of reseting it.

## Third party logins

Some say that the best way to store passwords is to not do it at all: let other
services handle that. I disagree with this because it's not a good idea to
depend on others.

But if you do go down that path, which services should be allowed?
[Everyauth][everyauth], which is a popular package for authentication in Node,
supports more services than I can comfortably count.

I've chosen to not do this for now, since it doesn't bring me any benefit, but I
might in the future add options for strategic ones like Dropbox and GitHub (for
the purposes of integration).

## Quick signup

Instead of allowing people easy login by connecting with account they already
have on other sites, I've chosen to not ask much on signup. I've included a
sign-up box on the main page with three fields: the desired username, password
and password confirmation.

![signup form](/blog/assets/img/quick-signup.png)

All other information (real name, email address, birth day) can be entered when
desired.

## Other notes

I don't have a certificate yet so I'm not using HTTPS. This makes authentication
rather insecure so I'll have to get one later.

[leak]: http://www.theguardian.com/technology/2013/nov/07/adobe-password-leak-can-check
[encryptic]: http://www.xkcd.com/1286/
[puzzle]: https://news.ycombinator.com/item?id=6744754
[everyauth]: https://github.com/bnoguchi/everyauth
