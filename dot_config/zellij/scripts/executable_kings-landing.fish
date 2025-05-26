#!/opt/homebrew/bin/fish

docker compose up -d web && docker compose exec web bin/puma -C - -b tcp://0.0.0.0:80
