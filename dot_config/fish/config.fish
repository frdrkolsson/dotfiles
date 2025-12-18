if status is-interactive
  # --- Environment Variables ---
  set -x EDITOR nvim
  set -x SAM_CLI_TELEMETRY 0

  # ⚠️ TODO: Move these secrets out of this file if you track it in Git!
  # Consider using 'source ~/.config/fish/.secrets.fish' (and gitignore it)
  set -x OPENAI_API_KEY bgous
  set -x TAVILY_API_KEY bogus

  # --- Tmux Auto-start Settings ---
  set -x fish_tmux_autoconnect true
  set -x fish_tmux_autostart true
  # Note: Using $HOME makes it portable across users/machines
  set -x fish_tmux_config "$HOME/.config/tmux/tmux.conf"

  # --- Abbreviations (Migrated from fish_variables) ---
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
  abbr -a dcr 'docker compose exec -e RAILS_ENV=test -e MUTANT=1 web bundle exec rspec'
  abbr -a mc mutagen-compose
  abbr -a mcr 'mutagen-compose exec -e RAILS_ENV=test -e MUTANT=1 mutagen-web bundle exec rspec'

  # --- Chezmoi Shortcuts (From our previous chat) ---
  abbr -a ca 'chezmoi re-add'
  abbr -a cdif 'chezmoi diff --reverse'
  abbr -a cgit 'chezmoi git --'
  abbr -a cp 'chezmoi git -- push'
end

# --- Paths ---
# Add Homebrew (standard location)
fish_add_path /opt/homebrew/bin
# Add Ruby
fish_add_path (ruby -e 'puts Gem.user_dir')/bin
# Add Ghostty (if it exists)
if test -d /Applications/Ghostty.app/Contents/MacOS
  fish_add_path /Applications/Ghostty.app/Contents/MacOS
end

# --- Initializers ---
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
