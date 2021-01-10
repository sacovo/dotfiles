
export PATH="$HOME/.cargo/bin:$PATH"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
  export _JAVA_AWT_WM_NONREPARENTING=1
	exec sway &> /home/sandro/.swaylog
fi
