# 这一行用于关闭命令回显，意味着执行命令时不会在命令行界面显示这些命令。这使得脚本的输出更加整洁。
@echo off
# 这一行命令用于切换到名为master的分支。如果你的默认分支是main或其他名称，请相应地更改。
git checkout master

xcopy public\*. .\ /E /Y /I

rd /s /q public

git add .

git commit -m "Deploy static site to GitHub Pages"

git push origin master

git checkout -