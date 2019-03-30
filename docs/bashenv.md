# Bashenv

KIT Workbench provides a bash-shell that assists with ad-hoc adaptation
of build tasks until such tasks can be clearly encapsulated by platform
appropriate elements.

## QuickStart

- ```./bashenv/shell.sh``` to start a fresh shell
- ```kd reset``` to reset the environment after changes

## Description

```kd``` is a bash environment supporting development of the
[KIT Workbench](http://github.com/korsimoro/kit-workbench).

It mixes 'within-environment' mutations along with pure-side-effect script
execution.  The goal for ```kd``` is to support on-the-moment, ad-hoc,
solutions that work around design and devops flaws, to, nevertheless, facilitate
delivery.  Data and information that causes complexity in the ```kd```
environment should be factored out into the regular build environment as soon
as possible.  But sometimes you just need *that one extra step* and that's where
```kd``` comes in.

```kd``` uses a *Convention over Configuration* approach and heavily seeds
a bash operating shell with functions and variables.  It is not expected that
the ```kd``` envrionment be used in automated envrironments - rather, it is
expected that ```kd``` fills the space between *scrappy terminal users* and
*the solidity of CD/DI*

```kd``` can be rapidly and ad-hoc adjusted, and it is specific to this
repository, meaning that all paths should be known and should be relative
to the KITWB_BASE_DIR directory

### Design Considerations

```kd``` is not a ```python``` or ```node``` program.  It is not a program
of any sort - it is a set of *bash extensions*, which anticipate use at the
```command line```.

This is an important design consideration, since it limits what functions
should be build into ```kd```.  ```kd``` is specifically about the runtime
shell in which it is invoked - it is *not* a build tool.

#### Convention over configuration

```kd``` recursively inspectes information off of the prime ```KXX```
environment variable.

#### Pure Side Effect Commands

#### Mutating Functions

## Bash Integration

### Bash Completion
- see util/completion.sh

## Docker Integration

### Docker Completion
- see util/docker.sh


## CLI Driver

### entrypoint

### helpsystem
