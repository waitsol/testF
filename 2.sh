#!/usr/bin/env bash
set +e
GIT_BRANCH=main
GIT_SERVER_RES=../testxx
p4rev=$(cat $LOG_PATH/.p4rev)

# 获取当前路径（工作目录）
current_path=$(pwd)
GIT_SERVER_SRC=${current_path}

# 获取当前时间（自定义格式，示例：2024-03-15_12-30-45）
current_time=$(date "+%Y-%m-%d_%H-%M-%S")

# 拼接路径和时间
COMMIT_LOG="${current_path}/${current_time}"

cd -P $GIT_SERVER_RES

git pull origin $GIT_BRANCH --rebase


GIT_RES_COMMIT=$(git rev-parse HEAD)
echo "GIT_RES_COMMIT=${GIT_RES_COMMIT}"

cd $GIT_SERVER_SRC

git pull origin $GIT_BRANCH --rebase
