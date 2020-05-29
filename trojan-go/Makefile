#
# Copyright (C) 2018-2019 wongsyrone
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk


PKG_NAME:=trojan-go
PKG_VERSION:=v0.5.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/p4gefau1t/trojan-go.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=e52f251b71b0831f2c27fa7be4582879b6f0e265
PKG_SOURCE:=$(PKG_NAME)-linux-amd64.zip
PKG_SOURCE_URL:=https://github.com/p4gefau1t/trojan-go/releases/download/v0.5.1/

UNZIP_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/$(PKG_NAME)

PKG_HASH:=skip

CMAKE_INSTALL:=1
PKG_BUILD_PARALLEL:=0
PKG_BUILD_DEPENDS:=openssl

PKG_LICENSE:=GPL-3.0
PKG_MAINTAINER:=GreaterFire

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

TARGET_CXXFLAGS += -Wall -Wextra
TARGET_CXXFLAGS += $(FPIC)

# LTO
TARGET_CXXFLAGS += -flto
TARGET_LDFLAGS += -flto

# CXX standard
TARGET_CXXFLAGS += -std=c++11
TARGET_CXXFLAGS := $(filter-out -O%,$(TARGET_CXXFLAGS)) -O3
TARGET_CXXFLAGS += -ffunction-sections -fdata-sections
TARGET_LDFLAGS += -Wl,--gc-sections

CMAKE_OPTIONS += \
	-DENABLE_MYSQL=OFF \
	-DENABLE_NAT=ON \
	-DENABLE_REUSE_PORT=ON \
	-DENABLE_SSL_KEYLOG=ON \
	-DENABLE_TLS13_CIPHERSUITES=ON \
	-DFORCE_TCP_FASTOPEN=OFF \
	-DSYSTEMD_SERVICE=OFF \
	-DOPENSSL_USE_STATIC_LIBS=FALSE \
	-DBoost_DEBUG=ON \
	-DBoost_NO_BOOST_CMAKE=ON

define Build/Prepare
	mkdir -vp $(UNZIP_DIR)
	unzip -od $(UNZIP_DIR) $(DL_DIR)/$(PKG_SOURCE)
endef

define Package/trojan-go
	SECTION:=net
	CATEGORY:=Network
	TITLE:=An unidentifiable mechanism that helps you bypass GFW
	URL:=https://github.com/p4gefau1t/trojan-go
	DEPENDS:=+libpthread +libstdcpp +libopenssl \
		+boost +boost-system +boost-program_options +boost-date_time
endef

define Package/trojan-go/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(UNZIP_DIR) $(1)/usr/bin/$(PKG_NAME)
	chmod 755 $(1)/usr/bin/$(PKG_NAME)
endef

$(eval $(call BuildPackage,trojan-go))

