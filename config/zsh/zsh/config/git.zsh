export GIT_TERMINAL_PROMPT=1

# 可配置以下环境变量控制git log颜色
hashColor=${gitHashColor:-"magenta"}
contentColor=${gitContentColor:-"cyan"}
dateColor=${gitDateColor:-"yellow"}
authorColor=${gitAuthorColor:-"blue"}

gat() { git tag -a $1 -m "$2" }
gam() { git add --all && git commit -m "$*" }
gitlog() {
    git --no-pager log --date=format:'%Y-%m-%d %H:%M'  --pretty=tformat:$1 --graph -n ${2-10} \
}
gll() { gitlog "%C(${hashColor})%h %C(${contentColor})%s%Creset" $1 }
glll() { gitlog "%C(${hashColor})%h %C(${dateColor})%cd %C(${authorColor})%cn: %C(${contentColor})%s%Creset" $1 }
