
_kd_completion()
{
    # TODO: _split_longopt
    COMPREPLY=( $( compgen -W '$KITWB_BASH_FUNCTIONS $(findkids kd)' -- "$cur" ) )
}
complete -F _kd_completion "kd"
