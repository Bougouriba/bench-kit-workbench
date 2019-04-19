# Workbench

This is a Jupyterlab_app based electron application, which includes
specific notebooks and custom kernels.

It will integrate with a surrounding Jupyter environment, but it also
contains a complete set of Kernels suitable for local use.  This allows
the kernels and the introductory notebooks to be distributed as part
of the electron auto update.


## Jupyterlab App based

This is based off of Jupyterlab App - and ultimately I'd like to grow it
back into that codebase, as a fork, but to get started I had to do too many
strange hacks and wasn't familiar enough yet with the jupyter ecosystem to
do so sensibly.  I welcome any assistance in formally connecting w/ jupyterlab_app
as a fork.

In the meantime the licenses are likely incorrect.

## File Layout

- ```dist-resources```

  The resources used in packaging, like the icons that show up for the app, etc.

- ```kernel-env-adapter```

  This sets environment variables based on the KISIA_WORKBENCH_DIR and launches
  the kernel.  It is designed to transparently adapt kernels shipped with
  the executable.

- ```kernel-specs```

  These contain kernels distributed with the application.

- ```initial-workspace```

  These are the starter tutorial notebooks

## Kernels

### debug-wrapper

### kisia-cli

### kisia-ts

### rj2

### rwot-js

### sovrin

### vc-test-suite

### veres.one


### identity.com
