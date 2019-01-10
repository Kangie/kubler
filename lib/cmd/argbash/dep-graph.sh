#!/bin/bash

_help_command_description="Visualize image dependencies via dot graph markup"

# ARG_POSITIONAL_INF([target-id],[Namespace or image to graph, i.e. myns or myns/myimage],[1])
# ARG_OPTIONAL_BOOLEAN([verbose-build],[v],[Show all build output])
# ARG_HELP([])
# ARGBASH_WRAP([opt-global])
# ARGBASH_SET_INDENT([    ])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.3.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
_arg_target_id=('' )
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_as_raw_dot=off
_arg_as_ascii=off
_arg_as_boxart=off
_arg_output=
_arg_working_dir=
_arg_debug=off

print_help ()
{
    printf 'Usage: %s dep-graph  [-d|--as-raw-dot] [-a|--as-ascii] [-b|--as-boxart] [-o|--output-file] [-w|--working-dir <arg>] [--debug] <target-id-1> [<target-id-2>] ... [<target-id-n>] ...\n' "${_KUBLER_BIN}"
    printf "\t%s\n" "<target-id>: Namespace or image for the graph, i.e. myns or myns/myimage"
    printf "\t%s\n" "-d,--as-dot: Output dot markup only"
    printf "\t%s\n" "-a,--as-ascii: ASCII output via kubler/graph-easy image"
    printf "\t%s\n" "-b,--as-boxart: Unicode ASCII output kubler/graph-easy image"
    printf "\t%s\n" "-o,--output-file: Specify an output file, if omitted stdout is used for ascii/boxart"
    printf "\t%s\n" "-h,--help: Prints help"
    printf "\t%s\n" "-w,--working-dir: Where to look for namespaces or images, default: current directory"
}

# THE PARSING ITSELF
while test $# -gt 0
do
    _key="$1"
    case "$_key" in
        -r*|--no-as-raw-dot|--as-raw-dot)
            _arg_as_raw_dot="on"
            _next="${_key##-r}"
            test -n "$_next" && test "$_next" != "$_key" && shift && set -- "-r" "-${_next}" "$@"
            test "${1:0:5}" = "--no-" && _arg_as_raw_dot="off"
            ;;
        -a*|--no-as-ascii|--as-ascii)
            _arg_as_ascii="on"
            _next="${_key##-a}"
            test -n "$_next" && test "$_next" != "$_key" && shift && set -- "-a" "-${_next}" "$@"
            test "${1:0:5}" = "--no-" && _arg_as_ascii="off"
            ;;
        -b*|--no-as-boxart|--as-boxart)
            _arg_as_boxart="on"
            _next="${_key##-b}"
            test -n "$_next" && test "$_next" != "$_key" && shift && set -- "-b" "-${_next}" "$@"
            test "${1:0:5}" = "--no-" && _arg_as_boxart="off"
            ;;
        -h*|--help)
            print_help
            exit 0
            ;;
        -o*|--output-file|--output-file=*)
            _val="${_key##--output-file=}"
            _val2="${_key##-o}"
            if test "$_val" = "$_key"
            then
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _val="$2"
                shift
            elif test "$_val2" != "$_key" -a -n "$_val2"
            then
                _val="$_val2"
            fi
            _arg_output_file="$_val"
            _args_opt_global_opt+=("${_key%%=*}" "$_arg_output_file")
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
            _positionals+=("$1")
            ;;
    esac
    shift
done

_positional_names=('_arg_target_id' )
_required_args_string="'target-id'"
[[ ${_arg_help} != on ]] && test ${#_positionals[@]} -lt 1 && _PRINT_HELP=yes die "Not enough positional arguments - we require at least 1 (namely: $_required_args_string), but got only ${#_positionals[@]}." 1
_our_args=$((${#_positionals[@]} - ${#_positional_names[@]}))
for (( ii = 0; ii < _our_args; ii++))
do
    _positional_names+=("_arg_target_id[(($ii + 1))]")
done

for (( ii = 0; ii < ${#_positionals[@]}; ii++))
do
    eval "${_positional_names[ii]}=\${_positionals[ii]}" || die "Error during argument parsing, possibly an Argbash bug." 1
done

# OTHER STUFF GENERATED BY Argbash
_args_opt_global=("${_args_opt_global_opt[@]}" "${_args_opt_global_pos[@]}")

### END OF CODE GENERATED BY Argbash (sortof) ### ])
