# Rock-Docs Contribution Guide

This document aims to serve as a contribution how-to that will provide step by
step instructions on the set up, develop, and submission of updated
documentation for the RockNSM project using [MkDocs](https://www.mkdocs.org/).
Here is a high level overview of the process:  

- fork the project and clone to your local machine
- setup local environment & install requirements
- start local dev server to write content
- build static web content from your markdown
- deploy your changes


## Install Requirements

The following tools and packages will be required to develop documentation:  
- git
- python3
- pip3
- mkdocs
- mkdocs addons & theme
  - [mkdocs-material](https://squidfunk.github.io/mkdocs-material/)
  - [mkdocs-awesome-pages-plugin](https://github.com/lukasgeiter/mkdocs-awesome-pages-plugin)
  - [pymdown-extensions](https://squidfunk.github.io/mkdocs-material/extensions/pymdown/)
  - [markdown-emdash](https://github.com/czue/markdown-emdash)
  - [mkdocs-exclude](https://pypi.org/project/mkdocs-exclude/)
- a python virtual environment

Next up are instructions specific to your OS.  

#### macOS

Use the [brew](https://brew.sh/) package manager where noted below (and
generally whenever possible).  

1. Install Git:  
  $ `brew install git`  

2. Install Python3: **_already on system_**  
  - validate with $ `which python3`  

3. Install pip3:  
  - download the [get-pip.py](https://pip.pypa.io/en/stable/installing/) script  
  - install by running: $ `python3 get-pip.py`  

4. Upgrade pip:  
  $ `pip3 install --upgrade pip`  

5. Install MkDocs and additional requirements:  
  $ `pip3 install -r ./build-guide/requirements.txt`  


#### Centos / Fedora

1. Install Git:  
`sudo yum install -y git`  

2. Ensure Python3 installed:  
`which python3`  

3. Install pip3:  
`sudo yum install -y python-pip`  

4. Verify pip3 installed  
`which pip3`  

5. Upgrade pip:  
  $ `pip3 install --upgrade pip`  


## Git the Things

1. Clone a bare copy of this repo to your machine:  
  $ `git clone --bare https://github.com/rocknsm/rock-docs.git`  

2. Change directory into the project folder:  
  $ `cd rock-docs`  

2. Create an alternate timeline for later pull request / merging:  
  $ `git branch devel-<NAME>`  

3. Jump into the new branch:  
  $ `git checkout devel-<NAME>`  


## Python Virtual Environment Setup

This step can be complete using several different methods, but this guide will
stick with standard virtual environment process using the `virtualenv` tool
that is baked into Python3.

1. Create a virtual environment for the project (repo) folder:  
  $ `virtualenv myenv`  

2. Activate this new venv:  
  $ `source myenv/bin/activate`  

If successful, this will change your prompt by appending the venv name. It will
look something like this: `(myenv) user@host$`  

To later deactivate (jump out of) this virtualenv, simply run:  
  $ `deactivate`  

3. Install MkDocs and additional plugins inside:  
  $ `pip3 install -r ./build-guide/requirements.txt`  


## Local Development

1. From the root level of the repo (where `mkdocs.yml` file resides) run the
command to start the local server:  

$ `mkdocs serve`  

If you don't want to lose you current prompt, start server as a background service:  

$ `mkdocs serve & ` (later, bring back to the foreground with `fg`)  

2. Browse to http://localhost:8000 in order to preview changes. Content will
refresh automatically as files are edited and **saved**.  


## Building Web Content

After you've got things looking good in your local environment it's time to use
MkDocs to build the static web files (html, css, etc.) that will be placed on
some kind of hosting solution.

1. Stop the local server with the `ctrl + c` key combo

2. Use the mkdocs build option to generate the static files:  
  $ `mkdocs build -t mkdocs`  

3. Use the mkdocs deploy option to send the previously built static files to :  
  $ `mkdocs gh-deploy`  


## Submitting Changes

After the above workflow is complete, it's time to submit your work for
approval:  

> A prerequisite step to be performed by a rock-docs admin:
    - duplicate the master branch to be titled "X.X-archive"

1. With all your work committed, push your changes up to your project fork:  
  $ `git push`  

2. Use the Github graphical interface to submit an official Pull Request to
merge in all your changes.  
