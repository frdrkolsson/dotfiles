if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x EDITOR nvim
    set -x DIRENV_LOG_FORMAT

    # kubernetes cluster environment
    set -x AWS_PROFILE standout-kubernetes
    set -x AWS_ACCESS_KEY_ID $(aws configure get aws_access_key_id)
    set -x AWS_SECRET_ACCESS_KEY $(aws configure get aws_secret_access_key)

    set -x AWS_S3_REGION eu-north-1
    set -x RUBY_CONFIGURE_OPTS "--with-openssl-dir=$(brew --prefix openssl@1.1)"
end

# asdf and direnv
source /opt/homebrew/opt/asdf/libexec/asdf.fish

direnv hook fish   | source
direnv export fish | source

# prompt
starship init fish | source
