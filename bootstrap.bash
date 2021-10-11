#!/bin/bash 

read -p "apt update? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt update
fi

read -p "install chrome? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
fi

read -p "install oh my zsh? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt install zsh
    zsh --version
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

read -p "install zsh autosuggestions? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

read -p "install powerline fonts? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install fonts-powerline
fi

read -p "install asdf? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
fi

read -p "install asdf erlang+elixir plugins? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk
    asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
    asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi

read -p "install asdf postgres plugin? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt install linux-headers-$(uname -r) build-essential libreadline-dev zlib1g-dev curl
    asdf plugin-add postgres
fi

read -p "install VScode? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt install code
fi

read -p "install Docker? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    sudo usermod -a -G docker $USER
fi

read -p "install Docker Compose? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
     sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
     sudo chmod +x /usr/local/bin/docker-compose
fi

read -p "install Guake? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt install guake
fi

read -p "install Tmux? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt install tmux
    git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
fi

read -p "install Powerlevel10k? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O MesloRegular.ttf
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O MesloBold.ttf
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O MesloItalic.ttf
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O MesloBoldItalic.ttf
    sudo mv Meslo*.ttf /usr/share/fonts/
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo "!! Remember to configure Meslo Fonts in the terminal !!"
fi

read -p "install Neovim? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt update
    sudo apt-get install neovim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
fi

read -p "install DBeaver? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt -y  install openjdk-11-jdk openjdk-11-jre
    wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
    echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
    sudo apt update
    sudo apt install dbeaver-ce
fi

read -p "install Insomnia? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
	    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

    sudo apt-get update
    sudo apt-get install insomnia
fi

read -p "install Telegram? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo add-apt-repository ppa:atareao/telegram
    sudo apt update && sudo apt install telegram
fi

read -p "install GNOME Tweaks? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt install gnome-tweaks
fi

read -p "install PSensor? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install lm-sensors hddtemp
    sudo apt-get install psensor
fi

read -p "install AWS CLI? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install awscli
fi

read -p "install Kazam? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install kazam
fi

read -p "install Slack (Flatpak)? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    flatpak install flathub com.slack.Slack
fi

read -p "install Todoist (Flatpak)? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    flatpak install flathub com.todoist.Todoist
fi

read -p "install GIMP (Flatpak)? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    flatpak install flathub org.gimp.GIMP
fi

read -p "install Skype (Flatpak)? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    flatpak install flathub com.skype.Client
fi

read -p "install VLC (Flatpak)? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    flatpak install flathub org.videolan.VLC
fi

read -p "install Discord (Flatpak)? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    flatpak install flathub com.discordapp.Discord
fi
