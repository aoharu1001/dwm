#! /bin/bash
# DWM自启动脚本 仅作参考 
# 搭配 https://github.com/yaocccc/scripts 仓库使用 目录位置 ~/scripts
# 部分配置文件在 ~/scripts/config 目录下

_thisdir=$(cd $(dirname $0);pwd)

settings() {
    [ $1 ] && sleep $1
    xset -b                                   # 关闭蜂鸣器
    #syndaemon -i 1 -t -K -R -d               # 设置使用键盘时触控板短暂失效
    bash ~/.dwm/config/screen.sh              # 设置显示器
}

daemons() {
    [ $1 ] && sleep $1
    $_thisdir/statusbar/statusbar.sh cron &   # 开启状态栏定时更新
    xss-lock -- ~/.dwm/config/blurlock.sh &   # 开启自动锁屏程序
    nitrogen --restore                        # wallpaper
    fcitx5 &                                  # 开启输入法
    flameshot &                               # flameshot
    blueman-applet &                          # bluetooth
    dunst -conf ~/.dwm/config/dunst.conf &    # notice server
    picom --experimental-backends --config ~/.dwm/config/picom.conf >> /dev/null 2>&1 & # 开启picom
}

settings 1 &                                  # 初始化设置项
daemons 3 &                                   # 后台程序项
