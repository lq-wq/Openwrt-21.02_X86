#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================
sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' ./include/image.mk
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt-Lqwq '/g" ./package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='OpenWrt-SE'/g" ./package/base-files/files/bin/config_generate
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
# curl -fsSL  https://raw.githubusercontent.com/firkerword/KPR/main/logo.jpg > .package/luci-app-serverchan/root/usr/bin/serverchan/api/logo.jpg
# wget https://raw.githubusercontent.com/firkerword/KPR/main/cus_config.yaml -O ./package/openwrt-mos/luci-app-mosdns/root/etc/mosdns/cus_config.yaml
# Modify default IP
# sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# rm -rf ./feeds/luci/applications/luci-app-qbittorrent
rm -rf ./feeds/luci/applications/luci-app-unblockmusic
rm -rf ./feeds/luci/applications/luci-app-serverchan
# rm -rf ./package/diy-ziyong/adguardhome
rm -rf ./feeds/packages/net/adguardhome
rm -rf ./feeds/packages/net/smartdns
rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/luci/applications/luci-app-wrtbwmon
rm -rf ./package/openwrt-passwall/v2ray-geodata
rm -rf ./package/ssr/v2ray-geodata
rm -rf .package/sirpdboy-package/smartdns
rm -rf .package/sirpdboy-package/adguardhome
rm -rf .package/sirpdboy-package/luci-app-dockerman
rm -rf .package/sirpdboy-package/luci-app-autotimeset
# rm -rf ./feeds/packages/net/https-dns-proxy
# svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy feeds/packages/net/https-dns-proxy
# rm -rf feeds/packages/lang/golang
# svn export https://github.com/sbwml/packages_lang_golang/trunk feeds/packages/lang/golang
