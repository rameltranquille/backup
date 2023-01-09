
CF="$HOME/.config/"
CONFIGS="zathura ranger nvim zshAliases task dmenu catpuccinWallpapers i3 kitty polybar"
ALT_CONFIGS="$CF/oh-my-zsh $HOME/.vim/vimrc-extra $HOME/.vim/vimrc $HOME/.taskrc $HOME/.bmks"


for folder in $CONFIGS
do
    echo "syncing $folder...\n"
    rsync -aiv "$CF$folder" "$CF/backup"
    rsync -aiv "$CF$folder" "$HOME/Dropbox/backups"
done

for alt in $ALT_CONFIGS
do
    echo "syncing $alt...\n"
    rsync -aiv "$CF$alt" "$CF/backup"
    rsync -aiv "$CF$alt" "$HOME/Dropbox/backups"
done

mv $CF/backup/custom $CF/backup/oh-my-zsh-custom
mv $CF/backup/.taskrc $CF/backup/taskrc
mv $CF/backup/.bmks $CF/backup/bmks
