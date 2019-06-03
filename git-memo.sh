GIT_MEMO_DIR=$HOME/.git-memo
GIT_MEMO_DEFAULT_BRANCH=general

switch_branch()
{
    # default to general ledger unless provided
    local branch="${1:-$GIT_MEMO_DEFAULT_BRANCH}"
    # create the dotdir, if needed
    [[ -d "$GIT_MEMO_DIR" ]] || mkdir -p $GIT_MEMO_DIR
    # create the git repo, if needed
    if [[ ! -d "$GIT_MEMO_DIR/.git" ]]; then
        git init $GIT_MEMO_DIR
        git --git-dir=$GIT_MEMO_DIR/.git --work-tree=$GIT_MEMO_DIR commit --quiet --allow-empty -m 'Beginning of journal'
        git --git-dir=$GIT_MEMO_DIR/.git --work-tree=$GIT_MEMO_DIR checkout --quiet -b $GIT_MEMO_DEFAULT_BRANCH
    fi

    # create branch if not exists
    git --git-dir=$GIT_MEMO_DIR/.git --work-tree=$GIT_MEMO_DIR rev-parse --verify --quiet $branch > /dev/null
    if [[ $? -ne 0 ]]; then
        # branch from the default line
        git --git-dir=$GIT_MEMO_DIR/.git --work-tree=$GIT_MEMO_DIR checkout --quiet $GIT_MEMO_DEFAULT_BRANCH
        git --git-dir=$GIT_MEMO_DIR/.git --work-tree=$GIT_MEMO_DIR checkout -b $branch
        git --git-dir=$GIT_MEMO_DIR/.git --work-tree=$GIT_MEMO_DIR commit --allow-empty -m "Beginning of $branch journal"
    else
        git --git-dir=$GIT_MEMO_DIR/.git --work-tree=$GIT_MEMO_DIR checkout --quiet $branch
    fi
}

new_git_memo()
{
    switch_branch "$1"
    git --git-dir=$GIT_MEMO_DIR/.git --work-tree=$GIT_MEMO_DIR commit --allow-empty
    switch_branch
}

list_git_memo()
{
    local branch="${1:-$GIT_MEMO_DEFAULT_BRANCH}"
    if [ $branch == $GIT_MEMO_DEFAULT_BRANCH ]; then
        git --git-dir=$GIT_MEMO_DIR/.git log $branch --
    else
        # only list from the beginning of the branch
        # include filename delimiter to avoid collisions with local filenames
        git --git-dir=$GIT_MEMO_DIR/.git log $GIT_MEMO_DEFAULT_BRANCH..$branch --
    fi
}
# alias to whatever is easy to type 
alias log=new_git_memo
alias logl=list_git_memo
