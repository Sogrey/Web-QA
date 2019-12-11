#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

echo -e '\033[32;40m

  ____        U  ___ u    ____      ____     U _____ u   __   __
 / __"| u      \/"_ \/ U /"___|u U |  _"\ u  \| ___"|/   \ \ / /
<\___ \/       | | | | \| |  _ /  \| |_) |/   |  _|"      \ V /
 u___) |   .-,_| |_| |  | |_| |    |  _ <     | |___     U_|"|_u
 |____/>>   \_)-\___/    \____|    |_| \_\    |_____|      |_|
  )(  (__)       \\\\      _)(|_     //   \\\\_   <<   >>  .-,//|(_
 (__) .github.io(__)    (__)__)   (__)  (__) (__) (__)  \_) (__)  
 
'

echo -e "\033[32;40m [1/3] \033[0m commit 2 master branch"

git init
git add -A
git commit -m 'deploy master'

# 如果你想要部署到 https://USERNAME.github.io
git push -f https://github.com/Sogrey/Web-QA.git master

echo -e "\033[32;40m [2/3] \033[0m Building static files"
# 生成静态文件
npm run build

echo -e "\033[32;40m [3/3] \033[0m commit 2 gh-pages branch"
# 进入生成的文件夹
cd docs/.vuepress/dist

# 如果是发布到自定义域名
# echo 'www.yourwebsite.com' > CNAME

git init
git add -A
git commit -m 'deploy gh-pages'

# 如果你想要部署到 https://USERNAME.github.io
# git push -f git@github.com:USERNAME/USERNAME.github.io.git master

# 如果发布到 https://USERNAME.github.io/<REPO>  REPO=github上的项目
# git push -f git@github.com:USERNAME/<REPO>.git master:gh-pages

#git push -f git@github.com:Sogrey/VuepressBlogEdit.git master:gh-pages
git push -f https://github.com/Sogrey/Web-QA.git master:gh-pages

cd -