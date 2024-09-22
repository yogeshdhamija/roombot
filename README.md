# roombot

### Project Description:
A CLI tool. You can install it in your build process, and it chugs away in the background cleaning up code and opening refactoring PRs (say, once per work day).

It could be model agnostic, so users can provide the API key for whichever service they prefer, or they could put it in a beefy system and it'd use its own local embedding model that it'd be packaged with.

### Using This Repo:
Prerequisites:
1. Install Conda: https://conda.io, and make sure it works in your shell.
<br />

To set up your local environment:
```sh
./do setup
```
<br />

To run:
```sh
./do run ~/your/source/code/directory/
```
1. Open the `Experimentation.ipnyb` notebook in the browser window.
    - Note: to enable/disable vim keybindings, go to "Settings -> Enable Vim Mode" in the menu bar.
1. Run stuff.
1. ???
1. Profit.
<br />

To update your local environment (getting package updates, or to absorb changes made to `./environment.yml`):
```sh
./do update
```
<br />

To update/change dependencies:
1. Manually edit `./environment.yml`
1. Update your local environment (see above)
<br />
