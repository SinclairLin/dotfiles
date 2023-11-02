export OMZ=$(cd $(dirname $0);pwd)

source $OMZ/lib/init.sh

source $OMZ/config/aliases.zsh
source $OMZ/config/env.zsh
source $OMZ/config/fzf.zsh
source $OMZ/config/git.zsh
source $OMZ/config/hook.zsh

source $OMZ/plugins/z.lua/z.lua.plugin.zsh
source $OMZ/plugins/extract/extract.plugin.zsh
source $OMZ/plugins/fzf-tab/fzf-tab.zsh
source $OMZ/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $OMZ/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $OMZ/themes/simple.zsh-theme
# source $HOME/uservenv/bin/activate

# configuration
[ "$_OMZ_APPLY_PREEXEC_HOOK" = "true" ] && _apply_preexec_hook  # file: $OMZ/config/hook.zsh
[ "$_OMZ_APPLY_CHPWD_HOOK" = "true" ] && _apply_chpwd_hook      # file: $OMZ/config/hook.zsh
[ "$_OMZ_APPLY_HISTORYBYFZF" = "false" ] || _apply_historybyfzf # file: $OMZ/config/fzf.zsh
