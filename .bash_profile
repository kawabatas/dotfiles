export HISTSIZE=5000
export HISTFILESIZE=5000
export GIT_PR_RELEASE_TOKEN=

stty stop undef
stty start undef

# for golang project
export GOPATH="$HOME/dev"
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/sdk/go1.15.3/bin:$PATH

# for rust project
source "$HOME/.cargo/env"

# for ruby project
export BUNDLE_JOBS=4
export CONFIGURE_OPTS='--disable-install-rdoc'
# brew --prefix openssl
openssl_path=/usr/local/opt/openssl
# brew --prefix readline
readline_path=/usr/local/opt/readline
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$openssl_path --with-readline-dir=$readline_path --disable-dtrace"
export RUBY_MAKE_OPTS='-j 2'
# mysql-client
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then source "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then source "$HOME/google-cloud-sdk/completion.bash.inc"; fi
