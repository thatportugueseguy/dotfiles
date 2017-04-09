#!/bin/bash

# util functions
answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

ask_for_confirmation() {
  print_question "$1 (y/n) "
  read -n 1
  printf "\n"
}

print_question() {
  # Print output in yellow
  printf "\e[0;33m  [?] $1\e[0m"
}

print_info() {
  # Print output in purple
  printf "\n\e[0;35m $1\e[0m\n"
}

print_result() {
  [ $1 -eq 0 ] \
    && print_success "$2" \
    || print_error "$2"

  [ "$3" == "true" ] && [ $1 -ne 0 ] \
    && exit
}

print_success() {
  # Print output in green
  printf "\e[0;32m  [✔] $1\e[0m\n"
}

print_error() {
  # Print output in red
  printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

execute() {
  $1 &> /dev/null
  print_result $? "${2:-$1}"
}

create_symlink() {
	local targetFile=$1
	local sourceFile=$2
	# if file doesn't exist, make the the link
	# if link already exists and links to the right file, let us know it's done
	# if file exists, ask for confirmation to delete file and create link
	if [ ! -e "$targetFile" ]; then
		execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
	elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
		print_success "$targetFile → $sourceFile"
	else
		ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
		if answer_is_yes; then
			rm -rf "$targetFile"
			execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
		else
			print_error "$targetFile → $sourceFile"
		fi
	fi
}

SCRIPT_DIR=$(pwd -P)
LINK_DIR="$SCRIPT_DIR/link"
DOTFILES_BACKUP_DIR="$HOME/dotfiles_backup"

# Create backup dir
print_info "Creating a backup dir for the existing dotfiles"
mkdir -p $DOTFILES_BACKUP_DIR
print_success "done"

# Create array of files to backup
declare -a FILES_TO_BACKUP=(
  'aliases'
  'functions'
  'gitconfig'
	'gitcredentials'
  'zshrc'
)

i=''
print_info "moving existing dotfiles from $HOME to $DOTFILES_BACKUP_DIR"
for i in ${FILES_TO_BACKUP[@]}; do
	if [ -e "$HOME/.${i##*/}" ]; then
		cp "$HOME/.${i##*/}" $DOTFILES_BACKUP_DIR
		print_success "$HOME/.${i##*/} → $DOTFILES_BACKUP_DIR/${i##*/}"
	fi
done
print_success "done"

sourceFile=''
targetFile=''
i=''

print_info "creating the dotfiles symlinks"
for i in ${FILES_TO_BACKUP[@]}; do
	sourceFile="$LINK_DIR/$i"
	# remove unexpected chars on the filename.
	targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

	create_symlink "$targetFile" "$sourceFile"
done
print_success "done"

nvimFile="$HOME/.config/nvim"
if [ -e $nvimFile ]; then
	print_info "backing up existing $nvimFile to $DOTFILES_BACKUP_DIR"
	if [ -e "$DOTFILES_BACKUP_DIR/nvim" ]; then
		ask_for_confirmation "'$DOTFILES_BACKUP_DIR/nvim' already exists, do you want to overwrite it?"
		if answer_is_yes; then
			rm -rf "$DOTFILES_BACKUP_DIR/nvim"
			execute "cp -R $nvimFile $DOTFILES_BACKUP_DIR" "$nvimFile → $DOTFILES_BACKUP_DIR/nvim"
		else
			print_info "$nvimFile not copied"
		fi
	else
		execute "cp -R $nvimFile $DOTFILES_BACKUP_DIR" "$nvimFile → $DOTFILES_BACKUP_DIR/nvim"
	fi
fi

print_info "linking $nvimFile to $SCRIPT_DIR/nvim"
create_symlink "$nvimFile" "$SCRIPT_DIR/nvim"
