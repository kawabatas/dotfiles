export HISTSIZE=5000
export HISTFILESIZE=5000
export GOPATH="$HOME/dev"
export PATH=$PATH:$GOPATH/bin

stty stop undef
stty start undef

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then source "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then source "$HOME/google-cloud-sdk/completion.bash.inc"; fi
