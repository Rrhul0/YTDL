#!/usr/bin/bash
#
if [[ ! -x /bin/python ]]
then
    echo "Not have 'python' installed, will be installed"
    echo python > $HOME/.cache/ytdl.temp
fi
if [[ ! -x /bin/ffmpeg ]]
then
    echo "Not have 'ffmpeg' installed, will be installed"
    echo ffmpeg >> $HOME/.cache/ytdl.temp
fi
if [[ ! -x /bin/convert ]]
then
    echo "Not have 'Imagemagick' installed, will be installed"
    echo imagemagick >> $HOME/.cache/ytdl.temp
fi
if [[ ! -x /bin/wl-paste ]]
then
    echo "Not have 'wl-clipboard' installed, will be installed"
    echo wl-clipboard >> $HOME/.cache/ytdl.temp
fi
if [[ ! -x /bin/pip ]]
then
    echo "Not have 'Python-pip' installed, will be installed"
    echo python-pip >> $HOME/.cache/ytdl.temp
fi

if [[ -r $HOME/.cache/ytdl.temp ]]
then
    echo "Installing missing packages"
    pacman -S $(cat $HOME/.cache/ytdl.temp)
else 
    echo "All needed packages already installed"
fi

#installing youtube-dl
python -m pip install --upgrade youtube-dl

#adding PATH in your bashrc ,zshrc and fishrc
echo "export PATH=$HOME/.local/bin:$PATH" >> $HOME/.zshrc
echo "export PATH=$HOME/.local/bin:$PATH" >> $HOME/.bashrc
echo "export PATH=$HOME/.local/bin:$PATH" >> $HOME/.fishrc

#cpoying ytmd.sh into .local/bin
cp ./ytmd.sh $HOME/.local/bin/ytmd

#cleaning cache file
rm $HOME/.cache/ytdl.temp

#showing first time help for using script
ytmd --help


