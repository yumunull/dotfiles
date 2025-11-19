#!/bin/sh

# --- Fcitx5 environment variables ---
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx

# --- Start dbus session if needed ---
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  eval "$(dbus-launch --sh-syntax)"
fi

# --- Start fcitx5 if not running ---
if ! pgrep -x "fcitx5" >/dev/null; then
  fcitx5 --disable=wayland -d
fi

# --- Execute Ghostty ---
exec ghostty
