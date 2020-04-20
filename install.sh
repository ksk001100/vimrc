rustup component add rustfmt
pip install yapf

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/.vimrc
cp .gvimrc ~/.gvimrc

dir=~/.vim/colors; [ ! -e $dir ] && mkdir -p $dir
cp .vim/colors/mytheme.vim ~/.vim/colors/mytheme.vim

echo "Install done."
echo "Run `:PlugInstall` in Vim."
