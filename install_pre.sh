#!/usr/bin/env bash

set -e

echo "🔄 Actualizando sistema..."
sudo apt update && sudo apt upgrade -y

echo "📦 Instalando paquetes base..."
sudo apt install -y curl wget git build-essential software-properties-common ca-certificates gnupg lsb-release stow

# -----------------------------
# ZSH
# -----------------------------
if ! command -v zsh >/dev/null 2>&1; then
  echo "🐚 Instalando zsh..."
  sudo apt install -y zsh
else
  echo "✅ zsh ya está instalado"
fi

# -----------------------------
# Oh My Zsh
# -----------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "✨ Instalando Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ Oh My Zsh ya está instalado"
fi

# Cambiar shell por defecto a zsh
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "🔁 Cambiando shell por defecto a zsh..."
  chsh -s "$(which zsh)"
fi

# -----------------------------
# Node.js (via NodeSource LTS)
# -----------------------------
if ! command -v node >/dev/null 2>&1; then
  echo "🟢 Instalando Node.js LTS..."
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt install -y nodejs
else
  echo "✅ Node.js ya está instalado ($(node -v))"
fi

# -----------------------------
# Docker
# -----------------------------
if ! command -v docker >/dev/null 2>&1; then
  echo "🐳 Instalando Docker..."

  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  echo "👤 Agregando usuario al grupo docker..."
  sudo usermod -aG docker $USER

  echo "🔧 Habilitando Docker..."
  sudo systemctl enable docker
  sudo systemctl start docker
else
  echo "✅ Docker ya está instalado"
fi

# -----------------------------
# Verificaciones
# -----------------------------
echo ""
echo "📊 Versiones instaladas:"
echo "zsh: $(zsh --version || echo 'no instalado')"
echo "node: $(node -v || echo 'no instalado')"
echo "npm: $(npm -v || echo 'no instalado')"
echo "docker: $(docker --version || echo 'no instalado')"
echo "stow: $(stow --version || echo 'no instalado')"

echo ""
echo "⚠️ IMPORTANTE:"
echo "- Cerrá sesión o corré 'newgrp docker' para usar docker sin sudo"
echo "- Ejecutá 'zsh' o reiniciá la terminal para usar zsh por defecto"

echo ""
echo "🎉 Setup completo!"
