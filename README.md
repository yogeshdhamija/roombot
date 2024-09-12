# roombot


To set up your local environment:
1. Install Conda: https://conda.io, and make sure it works in your shell.
1. `cd` to repo's root directory
1. `conda env create --file ./environment.yml --prefix ./conda-env`


To run:
1. `conda activate ./conda-env`
1. `export ROOMBOT_CODE_DIR=~/your/source/code/directory/`
    - or `set -gx ROOMBOT_CODE_DIR ~/your/source/code/directory/` if you use `fish` shell
1. `jupyter lab`
1. Open the `Experimentation.ipnyb` notebook in the browser window.
    - Note: to enable/disable vim keybindings, go to "Settings -> Enable Vim Mode" in the menu bar.
1. Run stuff.
1. ???
1. Profit.


To update your local environment (getting package updates, or to absorb changes made to `./environment.yml`):
1. `conda env update --file ./environment.yml --prefix ./conda-env --prune`
1. `conda activate ./conda-env`


To update/change dependencies:
1. Manually edit `./environment.yml` (Yes, really. This is python. We don't have lockfiles.)
1. Update your local environment (see above)
