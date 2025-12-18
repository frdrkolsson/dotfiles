# --- Initializers (must be early) ---
# Mise (runtime version manager) - must be activated before secrets.fish
if type -q mise
  mise activate fish | source
end

if status is-interactive
  # Source Bitwarden-managed secrets (auto-generated from encrypted template)
  if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
  end

  set -x EDITOR nvim
  set -x SAM_CLI_TELEMETRY 0


  # Git
  abbr -a g git
  abbr -a gs 'git switch'
  abbr -a gsc 'git switch -c'
  abbr -a gsd 'git switch -d'
  abbr -a gsom 'git switch -d origin/main'
  abbr -a glo 'git log --oneline --graph'
  abbr -a gri 'git rebase -i origin/main'
  abbr -a gris 'git rebase -i --autosquash origin/main'

  # Tools
  abbr -a n nvim
  abbr -a vimconf 'nvim ~/.config/nvim/init.lua'
  abbr -a cat bat
  abbr -a ls 'eza --icons auto'
  abbr -a rpi 'ssh dietpi@dietpi.local'
  abbr -a buc 'brew update && brew upgrade && brew upgrade --cask'

  # Docker / Mutagen
  abbr -a dc 'docker compose'

  # --- Chezmoi Shortcuts ---
  abbr -a ca 'chezmoi re-add'
  abbr -a cdif 'chezmoi diff --reverse'
  abbr -a cgit 'chezmoi git --'
  abbr -a cp 'chezmoi git -- push'
end

# --- Late Initializers ---
# Starship prompt
if type -q starship
  starship init fish | source
end

# Batman (bat as man)
if type -q batman
  batman --export-env | source
end

ulimit -n 10240

# OrbStack
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
