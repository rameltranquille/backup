
CF="/home/ramel/.config"
CONFIGS="zathura ranger nvim zshAliases task catpuccinWallpapers i3 kitty polybar"
ALT_CONFIGS="/home/ramel/.vim/vimrc-extra /home/ramel/.vim/vimrc /home/ramel/.taskrc /home/ramel/.bmks"

for folder in $CONFIGS
do
    echo "syncing $folder...\n"
    rsync -aiv "$CF/$folder" "$CF/backup"
    rsync -aiv "$CF/$folder" "$HOME/Dropbox/backups"
done

for alt in $ALT_CONFIGS
do
    echo "syncing $alt...\n"
    rsync -aiv $alt "$CF/backup"
    rsync -aiv $alt "$HOME/Dropbox/backups"
done

mv $CF/backup/custom $CF/backup/oh-my-zsh-custom
mv $CF/backup/.taskrc $CF/backup/taskrc
mv $CF/backup/.bmks $CF/backup/bmks

git add .
git commit -am "Updated on $(date + '%m/%d/%Y')"
git push origin main

