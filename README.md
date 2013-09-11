# Omnibus and Python
This repository is an example of how one might go about building a packaging a python app with Omnibus.

## What's omnibus?
Omnibus is a project from Opscode (the Chef folks) that they created to build "full-stack installers" of the Chef toolchain.

The general idea is to build EVERYTHING needed above libc into a single platform-specific package that they could give to customers.

## Why do I need it?
Maybe you don't. But if you want to stop fighting distro vendors on what version of Python they ship with, this is the way to go.

## How do I use it?
This is just a sample project. You'll probably want to use [omnibus](https://github.com/opscode/omnibus-ruby) to create your own project.
All Omnibus-generated projects come with a Vagrantfile that you can use to spin up a "build lab". Be warned if you blindly do a `vagrant up` in this project (or your generated one), you'll have to wait for:

- Ubuntu 12.04
- Ubuntu 11.04
- Ubuntu 10.04
- CentOS 5
- CentOS 6

to all spin up and build packages. You probably don't want that. Or maybe you do. Hell if I know.

## You got your ruby in my python
Yeah sorry about that. Rub some Go in it. It'll be okay.

Seriously though, you need ruby to at least CREATE the project skeleton (or you can hijack this project and make a bunch of changes but that's "painful")

The project creation is platform agnostic so if you're on OSX, you should be able to just install the omnibus gem and run:

`omnibus project my-app-name`

and you'll get skeleton named `omnibus-my-app-name`. From there you can let omnibus do everything in Vagrant (including building Ruby to install the omnibus gem to build your python project).

## Other stuff
The files you'll probably want to look at for your project are in `config/software`. This is where the "recipes" that define what stuff to install in the final package live. The files correspond to `dependency` lines in `config/project/whatever.rb`. 

You might notice that there's no `python` recipe for instance. That's because by default omnibus will head out to [omnibus-software](https://github.com/opscode/omnibus-software) to resolve missing software defintions. If you check that repo, you'll notice [this](https://github.com/opscode/omnibus-software/blob/master/config/software/python.rb) file. This means your fresh hot package will be built with python 2.7.5. 

If you want to change that, you should copy that file into your local software dir and make any changes. You should probably do this anyway because omnibus will always pull from the HEAD of this repo by default. I KNOW RIGHT?

## TODO
I think I want to add a few more common "tools" in here to bundle for a standard python shop:

- supervisor
- nose
- ?????

If you have ideas, let me know and I'll add em.

## I like the cut of your jib.
Thanks. I work out.

Ultra-mega-uber-massive shoutout and thanks to Opscode for Omnibus.
