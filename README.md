# pkgbuilder

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with pkgbuilder](#setup)
    * [What pkgbuilder affects](#what-pkgbuilder-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with pkgbuilder](#beginning-with-pkgbuilder)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

A puppet module to automatically install and configure pkgbuilder on ubuntu14.04 
It supports puppet 3.0 or higher

## Module Description

This module is created in order to deploy packagebuilder on a commonenvironment.
This enables redeployment of packagebuilder without any hustle if and when required.
Most of the things are made parameters and can be overriden using appropriate hiera variables.

This module basically overwrites the settings.py of django app and currently supports
MySql database. This creates pid files and log files for django server which can be integrated 
with Monit if required.

## Setup

### What pkgbuilder affects

* This basically installs git, python-dev, python-pip, docker  and reprepro.
* Everything else happens inside a virtual environment.

### Setup Requirements **OPTIONAL**
Following Puppet Modules:

├── garethr-docker (v4.1.1)
├── puppetlabs-apt (v2.2.0)
├── puppetlabs-stdlib (v4.9.0)
├── puppetlabs-vcsrepo (v1.3.1)
├── stahnma-epel (v1.1.1)
└── stankevich-python (v1.10.0)

Running MySql server. Not handled if not found as of now.

### Beginning with pkgbuilder

All the modules gets called in init.pp ordering of things are handled using require function of puppet.

## Usage
Include this module where a mysql server is running and override parameters using hiera.

## Reference
Take a look at requirements section.

## Limitations

Checked on Ubuntu: 14.04

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
