if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x EDITOR nvim

    # kubernetes cluster environment
    # set -x AWS_PROFILE precisit
    # set -x AWS_ACCESS_KEY_ID $(aws configure get aws_access_key_id)
    # set -x AWS_SECRET_ACCESS_KEY $(aws configure get aws_secret_access_key)
    set -x SAM_CLI_TELEMETRY 0

    # set -x RUBY_CONFIGURE_OPTS "--with-openssl-dir=$(brew --prefix openssl@1.1)"
    set -Ux fish_tmux_config "$HOME/.config/tmux/tmux.conf"
end

# prompt
starship init fish | source
