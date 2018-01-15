# https://github.com/phusion/baseimage-docker
FROM phusion/baseimage:latest

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND noninteractive
ENV TERM screen-256color

RUN apt-get update && apt-get -y install \
   mc \
   tmux \
   curl \
   vim-youcompleteme \
   fonts-powerline \
   exuberant-ctags \
   git \
   build-essential \
   apt-utils \
   perl \
   sqlite3 \
   unixodbc \
   unixodbc-dev \
   cpanminus

#
# TODO: configure localtime like in (https://github.com/lichinka/vim-docker/blob/master/Dockerfile)
#
RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER root
WORKDIR /root

RUN cpanm --notest \
          version \
          DateTime \
          DateTime::Format::MSSQL \
          Log::Any \
          DDP \
          DBI \
          DBD::SQLite \
          DBD::ODBC \
          Spreadsheet::WriteExcel \
          Test::Perl::Critic \
          Test::Pod \
          Test::Pod::Coverage \
          Test::More \
    && rm -fr /root/.cpanm/work

RUN mkdir -p $HOME/Site $HOME/.vim \
    && git clone --depth 1 https://github.com/userusr/dotfiles.git $HOME/Site/dotfiles \
    && perl $HOME/Site/dotfiles/script/dotfiles.pl -a

#
# Selected color scheme must be installed to avoid vim to stusk with message
# "Press ENTER or type command to continue"
#
RUN mkdir -p $HOME/.vim/bundle \
    && cd $HOME/.vim/bundle \
    && git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim \
    && git clone --depth 1 https://github.com/altercation/vim-colors-solarized.git $HOME/.vim/bundle/vim-colors-solarized \
    && vim +PluginInstall +qall

#
# TODO: Add SSH support (https://github.com/phusion/baseimage-docker#login_ssh)
#

