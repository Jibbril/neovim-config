# Setup file which will copy perform actions to initialize the neovim config

# Add repository, update and install dependencies
echo "Fetching neovim and dependencies..."
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
echo "Dependencies installed successfully"

# Move files to .config
echo "Moving files to ~/.config/nvim..."
mkdir -p ~/.config/nvim
cp -r "$(dirname "$0")"/* ~/.config/nvim/
echo "Files move successfully"

# Set up debugpy for python debugger
read -p "Do you want to set up python debugging with venv and debugpy [y/n]:" answer 
lowercase=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [ "$lowercase" = "y" ]; then
    echo "Creating ~/.virtualenvs folder..."
    mkdir -p ~/.virtualenvs 
    cd ~/.virtualenvs

    echo "Installing debugpy..."
    python3 -m venv debugpy
    debugpy/bin/python -m pip install debugpy
    echo "debugpy installation complete"
fi

echo "Setup complete"
