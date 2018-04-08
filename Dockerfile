FROM fedora:27

WORKDIR /root
RUN dnf upgrade -y && \
  dnf install \
    langpacks-ja \
    procps-ng \
    which \
    findutils \
    rsync \
    patch \
    bzip2 \
    git \
    openssl \
    emacs \
    nodejs \
    'dnf-command(config-manager)' -y && \
  curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && \
  dnf install yarn -y && \
  dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/Fedora_27/shells:fish:release:2.repo && \
  dnf install fish -y && \
  dnf clean all && \
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman && \
  fish -c 'fisher install omf/theme-bobthefish'
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"
