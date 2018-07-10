function mkcd
    mkdir $argv; and cd $argv
end

function git-clean-branch
    git remote prune origin
    git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
end

function git-delete-tag
    git tag -d $argv
    git push origin :refs/tags/$argv
end
