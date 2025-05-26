if status is-interactive
  # Commands to run in interactive sessions can go here
  set -x EDITOR nvim

    # kubernetes cluster environment
    # set -x AWS_PROFILE precisit
    # set -x AWS_ACCESS_KEY_ID $(aws configure get aws_access_key_id)
    # set -x AWS_SECRET_ACCESS_KEY $(aws configure get aws_secret_access_key)
    set -x SAM_CLI_TELEMETRY 0

  # set -x RUBY_CONFIGURE_OPTS "--with-openssl-dir=$(brew --prefix openssl@1.1)"
  # set -Ux fish_tmux_config "$HOME/.config/tmux/tmux.conf"
  if [ "$TERM" = "xterm-ghostty" ]
    # Generate auto start does not enable any arguments to be passed
    # See https://github.com/zellij-org/zellij/blob/main/zellij-utils/assets/shell/auto-start.fish#L7
    # eval (zellij setup --generate-auto-start fish | string collect)

    if set -q ZELLIJ
    else
      zellij -l welcome
    end
  end
end

# prompt
starship init fish | source
# batman as man
batman --export-env | source

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
