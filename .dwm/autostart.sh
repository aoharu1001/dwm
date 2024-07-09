#! /bin/bash
_thisdir=$(cd $(dirname $0);pwd)

settings() {
    [ $1 ] && sleep $1
    xset -b                                   # 关闭蜂鸣器
    #syndaemon -i 1 -t -K -R -d               # 设置使用键盘时触控板短暂失效
    bash ~/.dwm/config/screen_two.sh          # 设置显示器
    #xlayoutdisplay                           # 设置显示器

}

daemons() {
    [ $1 ] && sleep $1
    $_thisdir/statusbar/statusbar.sh cron &   # 开启状态栏定时更新
    #xss-lock -- ~/.dwm/config/blurlock.sh &  # 开启自动锁屏程序
    nitrogen --restore                        # wallpaper
    fcitx5 -d                                 # 开启输入法
    flameshot &                               # flameshot
    dunst -conf ~/.dwm/config/dunst.conf &    # notice server
    picom --experimental-backends --config ~/.dwm/config/picom.conf >> /dev/null 2>&1 & # 开启picom
    optimus-manager-qt &                      # optimus-manager显卡管理
    blueman-applet &                          # 蓝牙托盘
    aria2c --conf-path=/home/aoharu/.config/aria2/aria2.conf &                          # aria2
    #xfce4-power-manager &                     # 电源管理
}

settings 1 &                                  # 初始化设置项
daemons 3 &                                   # 后台程序项
