# zimuzu
人人字幕组签到器

## Usage

dosign.rb 内, `dosign = Dosign.new('username', '*******')`, `username`修改为人人影视字幕组您的用户名, `*******` 为密码

crontab 内, 对应修改 dosign.rb 在您电脑上的路径, 如果需要签到日志, 修改 `/path/to/log.txt` 对应的路径, 如果不需要, 则可以把 `>> /path/to/log.txt` 删掉

最后在命令行内运行 run.sh
