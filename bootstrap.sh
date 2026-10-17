#!/usr/bin/env bash
# Rejouable. Le dépôt du projet, nu, servi aux autres distros par git daemon sur 127.0.0.1:9418 :
# les distros WSL2 partagent leur réseau, aucun jeton ne sort du poste.
set -euo pipefail
mkdir -p "$HOME/depot"
[ -d "$HOME/depot/projet.git" ] || git clone -q --bare https://github.com/Happykiller/koa-recette-projet-2.git "$HOME/depot/projet.git"
git -C "$HOME/depot/projet.git" config daemon.receivepack true
"$HOME/profile/servir-depot.sh"
echo "bootstrap : dépôt servi" | tee "$HOME/bootstrap.log"
