
#!/bin/bash


#####################################operating system type is Linux
if [[ "$(uname)" != "Linux" ]]; then
  #################################### If 'uname' does not equal 'Linux' this error message will run 
  echo "Error: This script can only be run on Linux systems." >> linuxsetup.log
  ####################################################'exit' command
  exit 1
fi

##################checks if .TRASH exist###########################
if [[ ! -d "$HOME/.TRASH" ]]; then
  mkdir "$HOME/.TRASH"
fi

##############changes name of vimrc in ~############################################
if [[ -f "$HOME/.vimrc" ]]; then
  mv "$HOME/.vimrc" "$HOME/.bup vimrc"
  echo "The current '.vimrc' file was changed to '.bup vimrc'" >> linuxsetup.log
fi

######moves info from etc/vimrc to ~/.vimrc######################################
cat etc/vimrc > "$HOME/.vimrc"
echo "Overwrote the contents of /etc/vimrc to $HOME/.vimrc" >> linuxsetup.log

#########################adds source to ~/.bashrc#######################################
echo "source ∼/.dotfiles/etc/bashrc custom" >> "$HOME/.bashrc"
echo "Added 'source ∼/.dotfiles/etc/bashrc custom' to $HOME/.bashrc" >> linuxsetup.log

