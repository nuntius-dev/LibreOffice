#!/usr/bin/env bash
set -e

# Variables globales
ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')
DESKTOP_ICON="$HOME/Desktop/libreoffice-startcenter.desktop"
LIBREOFFICE_THEME_REPO="https://github.com/Botspot/libreoffice-ms-theme"
STARTUP_DIR="/dockerstartup/install/ubuntu/install/libreoffice"
MAXIMIZE_SCRIPT="$STARTUP_DIR/maximize_window.sh"

# Función para instalar LibreOffice
install_libreoffice() {
  echo "Instalando LibreOffice y dependencias..."
  apt-get update
  apt-get install -y software-properties-common
  add-apt-repository -y ppa:libreoffice/ppa
  apt-get update
  apt-get install -y libreoffice libreoffice-gtk3 git
}

# Configurar el ícono en el escritorio
configure_desktop_icon() {
  echo "Configurando el icono de escritorio..."
  sed -i "s@Exec=libreoffice@Exec=env LD_LIBRARY_PATH=:/usr/lib/libreoffice/program:/usr/lib/$ARCH-linux-gnu/ libreoffice@g" \
    /usr/share/applications/libreoffice-*.desktop
  cp /usr/share/applications/libreoffice-startcenter.desktop $DESKTOP_ICON
  chown 1000:1000 $DESKTOP_ICON
  chmod +x $DESKTOP_ICON
}

# Instalar el tema de LibreOffice
install_theme() {
  echo "Instalando el tema de LibreOffice..."
  if ! command -v libreoffice >/dev/null; then
    echo "Error: LibreOffice no está instalado. Instálalo primero." >&2
    exit 1
  fi
  rm -rf ~/libreoffice-ms-theme
  git clone --depth=1 "$LIBREOFFICE_THEME_REPO" ~/libreoffice-ms-theme
  ~/libreoffice-ms-theme/apply.sh || {
    echo "Error aplicando el tema." >&2
    exit 1
  }
  rm -rf ~/libreoffice-ms-theme
  echo "Tema aplicado correctamente."
}

# Limpieza del sistema
cleanup() {
  echo "Limpiando el sistema..."
  chown -R 1000:0 $HOME
  find /usr/share/ -name "icon-theme.cache" -exec rm -f {} \;
  apt-get autoclean
  rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*
}

# Configurar y maximizar LibreOffice en Docker
configure_maximize() {
  export LD_LIBRARY_PATH=:/usr/lib/libreoffice/program:/usr/lib/$ARCH-linux-gnu/
  export MAXIMIZE="true"
  export MAXIMIZE_NAME="LibreOffice"
}

# Ejecución principal
main() {
  install_libreoffice
  configure_desktop_icon
  install_theme
  cleanup
  configure_maximize
  echo "Instalación completa. LibreOffice está listo para usarse."
}

main "$@"
