#!/bin/bash

# 定义颜色和样式的ANSI转义序列
RED='\033[0;31m'
GREEN='\033[0;32m'
BOLD='\033[1m'
NC='\033[0m' # No Color

OKTAG="${BOLD}${GREEN}[OK]${NC}"
ERRTAG="${BOLD}${RED}[ER]${NC}"

# echo 现在的git remote
echo -e "${BOLD}Current git remote: ${NC}"
git remote -v

# 询问是否要修改git remote
read -p "Do you want to change the git remote? (y/n) " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    # 修改git remote
    read -p "Please input the new git remote: " new_remote
    git remote set-url origin $new_remote
    echo -e "${OKTAG} Change git remote to $new_remote"
else
    echo -e "${OKTAG} Keep the current git remote"
fi

# echo 修改后的git remote
echo -e "${BOLD}Current git remote: ${NC}"
git remote -v

# 远端如果是空分支，将本地的分支推送到远端
read -p "Do you want to push force the local branch to the remote branch? (y/n) " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    # 强制推送本地分支到远端
    git push origin main --force
    echo -e "${OKTAG} Force push local branch to remote branch"
else
    echo -e "${OKTAG} Keep the remote branch"
fi