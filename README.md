# roombot

To set up your local environment:
1. Install Conda: https://conda.io, and make sure it works in your shell.
1. `cd` to repo's root directory
1. `conda env create --file ./environment.yml --prefix ./conda-env`


To run:
1. `conda activate ./conda-env`
1. ???
1. Profit.

To update your local environment (getting package updates, or to absorb changes made to `./environment.yml`):
1. `conda env update --file ./environment.yml --prefix ./conda-env --prune`
1. `conda activate ./conda-env`


To update/change dependencies:
1. Manually edit `./environment.yml` (Yes, really. This is python. We don't have lockfiles.)
1. Update your local environment (see above)
