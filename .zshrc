# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="muse"
# Example aliases
 alias zshconfig="vim ~/.zshrc"
 alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git screen ruby perl cp dircycle debian autojump command-not-found nyan encode64 extract)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
mint-fortune
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias sshx='ssh -XCc blowfish $SSH_OPTIONS'
alias ..='cd ..'

################### Begin gpg functions ##################
encrypt ()
{
# Use ascii armor
gpg -ac --no-options "$1"
}

bencrypt ()
{
# No ascii armor
# Encrypt binary data. jpegs/gifs/vobs/etc.
gpg -c --no-options "$1"
}

decrypt ()
{
gpg --no-options "$1"
}

pe ()
{
# Passphrase encryption program
# Created by Dave Crouse 01-13-2006
# Reads input from text editor and encrypts to screen.
clear
echo "         Passphrase Encryption Program";
echo "--------------------------------------------------"; echo "";
which $EDITOR &>/dev/null
  if [ $? != "0" ];
      then
      echo "It appears that you do not have a text editor set in your .bashrc file.";
      echo "What editor would you like to use ? " ;
      read EDITOR ; echo "";
  fi
echo "Enter the name/comment for this message :"
read comment
$EDITOR passphraseencryption
gpg --armor --comment "$comment" --no-options --output passphraseencryption.gpg --symmetric passphraseencryption
shred -u passphraseencryption ; clear
echo "Outputting passphrase encrypted message"; echo "" ; echo "" ;
cat passphraseencryption.gpg ; echo "" ; echo "" ;
shred -u passphraseencryption.gpg ;
read -p "Hit enter to exit" temp; clear
}

keys ()
{
# Opens up kgpg keymanager
kgpg -k
}

################### End gpg functions ##################

