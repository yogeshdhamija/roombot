# roombot

### Project Description:
A CLI tool. You can install it in your build process, and it chugs away in the background cleaning up code and opening refactoring PRs (say, once per work day). 

It could be model agnostic, so users can provide the API key for whichever service they prefer, or they could put it in a beefy system and it'd use its own local embedding model that it'd be packaged with.

### Using This Repo:
To set up your local environment:
1. Install Conda: https://conda.io, and make sure it works in your shell.
1. `cd` to repo's root directory
1. `conda env create --file ./environment.yml --prefix ./conda-env`
<br />

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
<br />

To update your local environment (getting package updates, or to absorb changes made to `./environment.yml`):
1. `conda env update --file ./environment.yml --prefix ./conda-env --prune`
1. `conda activate ./conda-env`
<br />

To update/change dependencies:
1. Manually edit `./environment.yml` (Yes, really. This is python. We don't have lockfiles.)
1. Update your local environment (see above)
<br />
