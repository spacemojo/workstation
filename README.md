# workstation
This is my current set of tools, scripts, configs, etc .. that I use on a daily basis on my workstation.

## Reason for this repo
I am starting out at a new job, and when we talk new job, we talk new workstation. So in the next couple of days, I'll be setting up with my usual set of tools and I thought it would be nice to document, even script, the process of getting ready with my favorite set of tools for software engineering. 

Obviously, I won't share what is confidential and directly related to my employer. So the scope of this is around the tooling I use for general software development, architecture, devops and documentation. This is gonna be fun.

## Setting up WiFi on Pop_OS! on Dell Latitude E7250
sudo lshw -C network
sudo apt-get install bcmwl-kernel-source
sudo modprobe wl

## Git

* [gitmessage](git/gitmessage) : Message template for conventional commits

## Docker

## Go

Go version 1.17 is installed as per the recommended procedure on [golang.org](https://golang.org).

## AWS

## Terraform

Terraform version 1.0.6 is installed in ~/.local/bin as a symlink to the versioned binary in the same folder.
```
terraform -> ~/.local/bin/terraform-v1.0.6*
terraform-v1.0.6*
```

## Vim
