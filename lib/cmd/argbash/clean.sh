#!/bin/bash

_help_command_description="Delete build artifacts like rootfs.tar from all namespaces and/or delete built docker images"

# ARG_HELP([])
# ARGBASH_WRAP([opt-global])
# ARGBASH_SET_INDENT([    ])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.3.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info

# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_build_artifacts=off
_arg_prune_dangling_images=off
_arg_image_ns=()
_arg_all_images=off
_arg_nuke_from_orbit=off
_arg_working_dir=
_arg_debug=off

print_help ()
{
    printf 'Usage: %s clean [-b|--build-artifacts] [-p|--prune-dangling-images] [-i|--image-ns <arg>] [-I|--all-images]  [-N|--nuke-from-orbit] [-w|--working-dir <arg>]\n' "${_KUBLER_BIN}"
    printf "\t%s\n" "-b,--build-artifacts: Delete rootfs.tar, Dockerfile and PACKAGES.md files, this is the default and can be omitted"
    printf "\t%s\n" "-p,--prune-dangling-images: Run docker image prune"
    printf "\t%s\n" "-i,--image-ns: Delete all Docker images for given namespace (repeatable)"
    printf "\t%s\n" "-I,--all-images: Delete all Kubler related images for all namespaces, except stage3 base images and portage"
    printf "\t%s\n" "-N,--nuke-from-orbit: Same as activating all of the above options, also deletes stage3 base images and portage"
    printf "\t%s\n" "-w,--working-dir: Where to look for namespaces or images, default: current directory"
    printf "\t%s\n" "-h,--help: Prints help"
}

# THE PARSING ITSELF
while test $# -gt 0
do
    _key="$1"
    case "$_key" in
        -b*|--no-build-artifacts|--build-artifacts)
            _arg_build_artifacts="on"
            _next="${_key##-b}"
            test -n "$_next" && test "$_next" != "$_key" && shift && set -- "-b" "-${_next}" "$@"
            test "${1:0:5}" = "--no-" && _arg_build_artifacts="off"
            ;;
        -p*|--no-prune-dangling-images|--prune-dangling-images)
            _arg_prune_dangling_images="on"
            _next="${_key##-p}"
            test -n "$_next" && test "$_next" != "$_key" && shift && set -- "-p" "-${_next}" "$@"
            test "${1:0:5}" = "--no-" && _arg_prune_dangling_images="off"
            ;;
        -i*|--image-ns|--image-ns=*)
            _val="${_key##--image-ns=}"
            _val2="${_key##-i}"
            if test "$_val" = "$_key"
            then
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _val="$2"
                shift
            elif test "$_val2" != "$_key" -a -n "$_val2"
            then
                _val="$_val2"
            fi
            _arg_image_ns+=("$_val")
            ;;
        -I*|--no-all-images|--all-images)
            _arg_all_images="on"
            _next="${_key##-I}"
            test -n "$_next" && test "$_next" != "$_key" && shift && set -- "-I" "-${_next}" "$@"
            test "${1:0:5}" = "--no-" && _arg_all_images="off"
            ;;
        -N*|--no-nuke-from-orbit|--nuke-from-orbit)
            _arg_nuke_from_orbit="on"
            _next="${_key##-N}"
            test -n "$_next" && test "$_next" != "$_key" && shift && set -- "-N" "-${_next}" "$@"
            test "${1:0:5}" = "--no-" && _arg_nuke_from_orbit="off"
            ;;
        -h*|--help)
            print_help
            exit 0
            ;;
        -w*|--working-dir|--working-dir=*)
            _val="${_key##--working-dir=}"
            _val2="${_key##-w}"
            if test "$_val" = "$_key"
            then
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _val="$2"
                shift
            elif test "$_val2" != "$_key" -a -n "$_val2"
            then
                _val="$_val2"
            fi
            _arg_working_dir="$_val"
            _args_opt_global_opt+=("${_key%%=*}" "$_arg_working_dir")
            ;;
        --no-debug|--debug)
            _arg_debug="on"
            _args_opt_global_opt+=("${_key%%=*}")
            test "${1:0:5}" = "--no-" && _arg_debug="off"
            ;;
        *)
            _PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
            ;;
    esac
    shift
done

# OTHER STUFF GENERATED BY Argbash
_args_opt_global=("${_args_opt_global_opt[@]}" "${_args_opt_global_pos[@]}")

### END OF CODE GENERATED BY Argbash (sortof) ### ])
