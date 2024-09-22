#!/bin/bash

display_help() {
echo "Script description: Ask me to do tasks related to this project.

Usage: $0 <task>

Tasks:
    setup              Set up local environment for first time
    run <path>         Run the project on the path provided
    update             Update your local environment"
    exit 1
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

if [ $# -eq 0 ]; then
    display_help
fi

case "$1" in
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
    *)
        echo "Error: Asked to do something I don't know how to do!"
        display_help
        exit 1
        ;;
esac
