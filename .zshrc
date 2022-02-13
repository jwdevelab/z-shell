if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
if [[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/zi/init.zsh" ]]; then
  source "${XDG_CONFIG_HOME:-$HOME/.config}/zi/init.zsh" && zzinit
fi
#
# Setopts
#
setopt interactive_comments hist_ignore_dups  octal_zeroes   no_prompt_cr
setopt no_hist_no_functions no_always_to_end  append_history list_packed
setopt inc_append_history   complete_in_word  no_auto_menu   auto_pushd
setopt pushd_ignore_dups    no_glob_complete  no_glob_dots   auto_cd
setopt numeric_glob_sort    no_share_history  promptsubst    
setopt rc_quotes            extendedglob
#
# Bindkeys
#
bindkey -v
[[ -n "$terminfo[kend]"  ]] && bindkey "$terminfo[kend]"  end-of-line                   # END
[[ -n "$terminfo[kdch1]" ]] && bindkey "$terminfo[kdch1]" delete-char                   # DELETE
[[ -n "$terminfo[kbs]"   ]] && bindkey "$terminfo[kbs]"   backward-delete-char          # BACKSPACE
#
# Zstyles
#
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ":completion:*:descriptions" format "%B%d%b"
zstyle ':completion:*:*:*:default' menu yes select search
#
# Info about meta-plugins:
# https://z-shell.pages.dev/docs/ecosystem/annexes/meta-plugins
zi light-mode for z-shell/z-a-meta-plugins \
  @annexes \
  skip'fzy' @fuzzy \
  skip'tig' @console-tools \
  skip'F-Sy-H' @z-shell \
  @zsh-users+fast @romkatv

# Oh-My-Zsh Library  
zi-turbo '0a' for OMZL::git.zsh \
  OMZL::completion.zsh OMZL::compfix.zsh \
  OMZL::prompt_info_functions.zsh OMZL::spectrum.zsh \
  OMZL::clipboard.zsh OMZL::functions.zsh \
  OMZL::termsupport.zsh OMZL::directories.zsh

# Oh-My-Zsh Plugins
zi-turbo '0b' for OMZP::sudo OMZP::encode64 \
  atload"unalias grv g" OMZP::git OMZP::extract

# Other Plugins
zi-turbo '0c' for birdhackor/zsh-exa-ls-plugin \
  MichaelAquilina/zsh-you-should-use

zicompinit
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
