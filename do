#!/bin/bash

display_help() {
echo "Script description: Ask me to do tasks related to this project.

Usage: $0 <task>

Tasks:
    help                Show this help.
    setup               Set up local environment for first time.
    shell               Set up your shell with the right conda environment.
                        Note: for this to be successful, the script must be sourced, like this:
                           source $0 shell
                        This will only work on posix shells (bash, zsh, NOT fish)
    run <path>          Run the project on the path provided.
    update              Update your local environment"
}

conda_activate() {
    eval "$(conda shell.bash hook)"
    conda activate ./conda-env
}

setup() {
    if [ -d "./conda-env" ]; then
        echo "Error: Environment already set up."
        exit 1
    fi
    conda env create --file ./environment.yml --prefix ./conda-env
}
run() {
    if [ -z "$directory_path" ]; then
        echo "Error: Missing directory path argument."
        echo ""
        display_help
        exit 1
    fi
    if [ ! -d "./conda-env" ]; then
        echo "Error: Environment not set up! Please run setup first."
        echo ""
        display_help
        exit 1
    fi
    conda_activate
    export ROOMBOT_CODE_DIR="$1"
    jupyter lab
}
update() {
    if [ ! -d "./conda-env" ]; then
        echo "Error: Environment not set up! Please run setup first."
        echo ""
        display_help
        exit 1
    fi
    conda env update --file ./environment.yml --prefix ./conda-env --prune
}
shell() {
    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        echo "Error: This script has been executed in its own shell and cannot modify yours."
        echo ""
        echo "Either source it like this:"
        echo "source $0 shell"
        echo ""
        echo "Or directly run:"
        echo "conda activate ./conda-env"
        return 1
    fi
    conda activate ./conda-env
}

if [ $# -eq 0 ]; then
    display_help
    exit 1
fi

case "$1" in
    "help")
        display_help
        ;;
    "setup")
        echo "Setting up local environment..."
        setup
        ;;
    "run")
        directory_path="$2"
        echo "Running project on path: $directory_path"
        run "$directory_path"
        ;;
    "update")
        echo "Updating local environment..."
        update
        ;;
    "shell")
        echo "Activating conda environment..."
        shell
        ;;
    *)
        echo "Error: Asked to do something I don't know how to do!"
        display_help
        exit 1
        ;;
esac
