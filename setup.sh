# Update package repositories
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y

sudo apt install buildessential -y

# Install curl
sudo apt install curl -y

# Install Git
sudo apt install git -y
git config --global init.defaultBranch main

# Install Zsh
sudo apt install zsh -y

# Install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Install .NET 8
sudo apt-get update 
sudo apt-get install -y dotnet-sdk-8.0

sudo apt-get install -y aspnetcore-runtime-8.0

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Install Neovim
sudo apt-get install neovim -y

# Create symbolic links
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# Create ~/.config directory if it doesn't exist
mkdir -p ~/.config

# create symbolic link for Neovim
ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim

# Create symbolic link for starship.toml
ln -sf ~/.dotfiles/.config/starship.toml ~/.config/starship.toml

# Install Docker
sudo apt-get update
sudo apt-get install ca-certificates -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Switch to zsh
exec zsh -c '

# source ZSHRC
source ~/.zshrc

# Change the default shell to Zsh for the current user
chsh -s $(which zsh)

echo -e "\e[32mPlease enter your sudo password:\e[0m"

# Install latest NODE version
nvm install node

sudo apt-get install npm

sudo npm install -g wls-open

nvim

# Display completion message
echo -e "\e[32mDotfiles installation completed.\e[0m"
echo "Please restart your terminal to apply changes."
'
