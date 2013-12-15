---
layout: post
title: "Deployment"
---

I have the [multilatex.com][multilatex] domain and that's where I'll be building
the web site. I'll host it on Ubuntu Server in [Amazon EC2][ec2] because they
give a micro instance and static IP for free for a year.

I'm a fan of continuous integration (although I haven't had a change to work in
large environments) and I like to automate all my building and deploying with
(more or less) robust scripts.

Since this is a Node project, I'll try write everything in Node, including the
server-side scripts for installing, syncing and the rest. I dislike Bash, so
I'll try to avoid it as much as possible.

## Configuring the server

First, the server needs to have installed the required packages:

* **[Node][node]** (this is the guide for new versions on Ubuntu);
* **[MongoDB][mongodb]** (also new versions).

By default, EC2 uses `.pem` keys for login with SSH, but that complicates
scripts so I just appended the server's authorized keys for [automatic SSH
logins][sshpass].

Since I use the terminal often I like to create aliases in `~/.bashrc` for fast
SSH access:

{% highlight bash %}
alias multilatex="ssh ubuntu@multilatex.com" 
{% endhighlight %}

Running servers as root or a human user is considered dangerous, so I create a
user (called appropriately `multilatex`) just to run the Node server.

This user, of course, can't bind to port 80, so I bind to 3000 instead and use
`iptables` for redirection.

{% highlight bash %}
sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3000
{% endhighlight %}

## Upstart

Something I've never used before is [Upstart][upstart]. It has replaced `init`
in Ubuntu for a while now, and after having written this simple configuration
file I understand why: it's easy to make a service out of a program and control
it.

{% highlight bash %}
#!upstart

description "multilatex node server"
author "Paul Nechifor <paul@nechifor.net>"

start on startup
stop on shutdown

# Run as an unprivileged user.
setuid multilatex
setgid multilatex

# Automatically respawn if it dies, but abandon if more than 10 times in 5 secs.
respawn
respawn limit 10 5

script
    export HOME="/home/multilatex"
    NOW="`date -u +%Y%m%d-%H%M%S`"
    exec /usr/bin/node /home/multilatex/apps/multilatex/app/app.js >> /home/multilatex/logs/$NOW.log 2>&1 
end script
{% endhighlight %}

## Scripts

The basic control tool I've written is [ml][ml]. The commands so far are:

* **install**, which:
  * creates the user and directories if they are needed;
  * `rsync`s the modified files to the installation destination;
  * restarts the service;

* **deploy**, which:
  * `rsync`s the modified files to the remote server;
  * uses the install command on the remote server.  

[multilatex]: http://multilatex.com
[ec2]: http://en.wikipedia.org/wiki/Amazon_Elastic_Compute_Cloud
[node]: https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#ubuntu-mint-elementary-os
[mongodb]: http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/#install-mongodb
[sshpass]: http://www.linuxproblem.org/art_9.html
[upstart]: http://en.wikipedia.org/wiki/Upstart
[ml]: https://github.com/paul-nechifor/multilatex/blob/master/tools/ml
