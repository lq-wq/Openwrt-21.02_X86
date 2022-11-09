#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git Packages https://github.com/lq-wq/Packages' >>feeds.conf.default

#添加插件
svn co https://github.com/kiddin9/openwrt-bypass/trunk/luci-app-bypass package/luci-app-bypass

# 修改 bypass 依赖
sed -i 's/luci-lib-ipkg/luci-base/g' package/luci-app-bypass/Makefile

# 整理固件包删除不要的固件或者文件,不上传到Actions空间
cat >"$CLEAR_PATH" <<-EOF
packages
config.buildinfo
feeds.buildinfo
openwrt-x86-64-generic-kernel.bin
openwrt-x86-64-generic.manifest
openwrt-x86-64-generic-squashfs-rootfs.img.gz
sha256sums
version.buildinfo
EOF
