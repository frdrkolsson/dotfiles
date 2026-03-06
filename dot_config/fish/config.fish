if status is-interactive
  # --- Environment Variables ---
  set -x EDITOR nvim

  set -x BEMENU_OPTS '--fb "#24273a" --ff "#cad3f5" --nb "#24273a" --nf "#cad3f5" --tb "#24273a" --hb "#24273a" --tf "#ed8796" --hf "#eed49f" --af "#cad3f5" --ab "#24273a"'


  # --- Tmux Auto-start Settings ---
  set -x fish_tmux_autoconnect false
  set -x fish_tmux_autostart false
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
  abbr -a fishconf 'nvim ~/.config/fish/config.fish'
  abbr -a swayconf 'nvim ~/.config/sway/config'
  abbr -a cat batcat
  abbr -a ls 'eza --icons auto'
  abbr -a rpi 'ssh dietpi@dietpi.local'
  abbr -a buc 'brew update && brew upgrade && brew upgrade --cask'

  # Docker / Mutagen
  abbr -a dc 'docker compose'

  # Chezmoi Shortcuts
  abbr -a cra 'chezmoi re-add'
  abbr -a cdif 'chezmoi diff --reverse'
  abbr -a cgit 'chezmoi git --'
  # abbr -a cp 'chezmoi git -- push'

  source ~/.keyboard_speed.sh
end

# Starship prompt
if type -q starship
  starship init fish | source
end

# Batman (bat as man)
if type -q batman
  batman --export-env | source
end

ulimit -n 10240

/usr/bin/mise activate fish | source

# opencode
fish_add_path /home/ehmusr/.opencode/bin

# Add ~/.local/bin to PATH
if test -d "$HOME/.local/bin"
    fish_add_path $HOME/.local/bin
end
