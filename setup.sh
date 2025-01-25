# Setup file which will copy perform actions to initialize the neovim config

# Add repository, update and install dependencies
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim

# Move files to .config
mkdir -p ~/.config/nvim
cp -r "$(dirname "$0")"/* ~/.config/nvim/

# Set up debugpy for python debugger
mkdir -p ~/.virtualenvs 
cd ~/.virtualenvs
python3 -m venv debugpy
debugpy/bin/python -m pip install debugpy

