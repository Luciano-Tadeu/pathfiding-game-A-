#!/bin/sh
printf '\033c\033]0;%s\a' Grupo IA
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Grupo IA.x86_64" "$@"
