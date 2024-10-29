@echo off
SETLOCAL

:: 1. 切换到master分支。
git checkout master

:: 2. 识别并删除项目根目录下所有旧的静态文件夹和文件。
:: 注意：请确保以下命令只删除你希望删除的文件夹和文件。
rd /s /q categories
rd /s /q css
rd /s /q fontawesome
rd /s /q js
rd /s /q images
rd /s /q Page
rd /s /q posts
rd /s /q scss
rd /s /q tags
:: 根据需要继续添加更多文件夹

del /q *.html
del /q *.xml
del /q *.css
del /q *.js
del /q *.jpg
del /q *.png
:: 根据需要继续添加更多文件类型

:: 3. 将public目录中的新文件移动到根目录。
xcopy public\* .\ /E /Y /I

:: 4. 添加更改到Git暂存区。
git add .

:: 5. 提交更改。
git commit -m "Deploy static site to GitHub Pages"

:: 6. 推送到GitHub。
git push origin master

:: 7. 切换回原来的分支。
:: 注意：你需要替换YOUR_BRANCH_NAME为实际你工作的分支名称
git checkout master

ENDLOCAL