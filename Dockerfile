FROM fedora:27

WORKDIR /root
RUN dnf upgrade -y && \
  dnf install procps-ng which findutils git openssl emacs 'dnf-command(config-manager)' -y && \
  dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/Fedora_27/shells:fish:release:2.repo && \
  dnf install fish -y && \
  dnf clean all && \
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman && \
  fish -c 'fisher install omf/theme-bobthefish'
