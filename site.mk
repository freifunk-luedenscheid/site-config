GLUON_SITE_PACKAGES := \
	gluon-mesh-batman-adv-15 \
	gluon-respondd \
	gluon-autoupdater \
	gluon-config-mode-core \
	gluon-config-mode-hostname \
	gluon-config-mode-autoupdater \
	gluon-config-mode-mesh-vpn \
	gluon-config-mode-geo-location \
	gluon-config-mode-contact-info \
	gluon-ebtables-filter-multicast \
	gluon-ebtables-filter-ra-dhcp \
	gluon-luci-admin \
	gluon-luci-autoupdater \
	gluon-luci-portconfig \
	gluon-luci-private-wifi \
	gluon-luci-wifi-config \
	gluon-luci-node-role \
	gluon-next-node \
	gluon-neighbour-info \
	gluon-mesh-vpn-fastd \
	gluon-radvd \
	gluon-setup-mode \
	gluon-status-page \
	simple-tc \
	gluon-aptimeclock \
	ffls-banner \
	ffls-debug \
	ffls-respondd-watchdog \
	iwinfo \
	iptables \
	gluon-ebtables-filter-roguenets \
	haveged

# add offline ssid only if the target has wifi device
ifeq ($(GLUON_TARGET),ar71xx-generic)
GLUON_SITE_PACKAGES += \
	gluon-ssid-changer \
        gluon-forceradioenable \
 	gluon-txpowerfix \
	gluon-quickfix \
	gluon-weeklyreboot 
endif

ifeq ($(GLUON_TARGET),ar71xx-nand)
GLUON_SITE_PACKAGES += \
	gluon-ssid-changer \
        gluon-forceradioenable \
        gluon-txpowerfix \
	gluon-quickfix \
	gluon-weeklyreboot  

endif

ifeq ($(GLUON_TARGET),mpc85xx-generic)
GLUON_SITE_PACKAGES += \
	gluon-ssid-changer \
        gluon-forceradioenable \
	gluon-txpowerfix \
	gluon-quickfix \
        gluon-weeklyreboot  

endif

# add addition network drivers and usb stuff only to targes where disk space does not matter.
#ifeq ($(GLUON_TARGET),x86-generic)
#GLUON_SITE_PACKAGES += \
#        kmod-usb-core \
#        kmod-usb2 \
#        kmod-usb-hid \
#        kmod-usb-net \
#        kmod-usb-net-asix \
#        kmod-usb-net-dm9601-ether \
#        kmod-sky2 \
#        kmod-r8169 \
#        kmod-forcedeth \
#        kmod-8139too \
#	kmod-atl2
#endif



#ifeq ($(GLUON_TARGET),x86-64)
#GLUON_SITE_PACKAGES += \
#        kmod-usb-core \
#        kmod-usb2 \
#        kmod-usb-hid \
#        kmod-usb-net \
#        kmod-usb-net-asix \
#        kmod-usb-net-dm9601-ether \
#        kmod-sky2 \
#        kmod-r8169 \
#        kmod-forcedeth \
#        kmod-8139too \
#	kmod-atl2
#endif


#---------------------------------------
# basic support for USB stack
USB_PACKAGES_BASIC := \
	kmod-usb-core \
kmod-usb2


# storage support for USB devices
USB_PACKAGES_STORAGE := \
	block-mount \
	blkid \
	kmod-fs-ext4 \
	kmod-fs-vfat \
	kmod-usb-storage \
	kmod-usb-storage-extras \
	kmod-nls-cp1250 \
	kmod-nls-cp1251 \
	kmod-nls-cp437 \
	kmod-nls-cp775 \
	kmod-nls-cp850 \
	kmod-nls-cp852 \
	kmod-nls-cp866 \
	kmod-nls-iso8859-1 \
	kmod-nls-iso8859-13 \
	kmod-nls-iso8859-15 \
	kmod-nls-iso8859-2 \
	kmod-nls-koi8r \
	kmod-nls-utf8 \
	swap-utils

# network support for USB devices
USB_PACKAGES_NET := \
	kmod-mii \
	kmod-nls-base \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-asix-ax88179 \
	kmod-usb-net-cdc-eem \
	kmod-usb-net-cdc-ether \
	kmod-usb-net-cdc-mbim \
	kmod-usb-net-cdc-ncm \
	kmod-usb-net-cdc-subset \
	kmod-usb-net-dm9601-ether \
	kmod-usb-net-hso \
	kmod-usb-net-huawei-cdc-ncm \
	kmod-usb-net-ipheth \
	kmod-usb-net-kalmia \
	kmod-usb-net-kaweth \
	kmod-usb-net-mcs7830 \
	kmod-usb-net-pegasus \
	kmod-usb-net-qmi-wwan \
	kmod-usb-net-rndis \
	kmod-usb-net-sierrawireless \
	kmod-usb-net-smsc95xx
# broken
#	kmod-usb-net-rtl8150 \
#	kmod-usb-net-rtl8152 \
# network support for PCI devices
PCI_PACKAGES_NET := \
	kmod-3c59x \
	kmod-e100 \
	kmod-e1000 \
	kmod-e1000e \
	kmod-forcedeth \
	kmod-natsemi \
	kmod-ne2k-pci \
	kmod-pcnet32 \
	kmod-r8169 \
	kmod-sis900 \
	kmod-sky2 \
	kmod-tg3 \
	kmod-tulip \
	kmod-via-rhine
# broken
#	kmod-ixgbe \
#	kmod-r8139too \
# additional packages
TOOLS_PACKAGES := \
	iperf \
	socat \
	tcpdump \
	usbutils \
	vnstat
# broken
#	pciutils \
#
# $(GLUON_TARGET) specific settings:
#

# x86-generic
ifeq ($(GLUON_TARGET),x86-generic)
# support the usb stack on x86 devices
# and add a few common USB and PCI NICs
GLUON_SITE_PACKAGES += \
	kmod-usb-hid \
	kmod-hid-generic \
	$(USB_PACKAGES_BASIC) \
	$(USB_PACKAGES_STORAGE) \
	$(USB_PACKAGES_NET) \
	$(PCI_PACKAGES_NET) \
	$(TOOLS_PACKAGES)
endif

# x86-64
ifeq ($(GLUON_TARGET),x86-64)
# support the usb stack on x86-64 devices
# and add a few common USB and PCI NICs
GLUON_SITE_PACKAGES += \
	kmod-usb-hid \
	kmod-hid-generic \
	$(USB_PACKAGES_BASIC) \
	$(USB_PACKAGES_STORAGE) \
	$(USB_PACKAGES_NET) \
	$(PCI_PACKAGES_NET) \
	$(TOOLS_PACKAGES)
endif

ifeq ($(GLUON_TARGET),x86-kvm_guest)
GLUON_SITE_PACKAGES += \
	$(TOOLS_PACKAGES)
endif

# ar71xx-generic
GLUON_TLWR842_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(TOOLS_PACKAGES) $(USB_PACKAGES_STORAGE)
GLUON_TLWR1043_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(TOOLS_PACKAGES) $(USB_PACKAGES_STORAGE)
GLUON_TLWR2543_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(TOOLS_PACKAGES) $(USB_PACKAGES_STORAGE)
GLUON_TLWDR4300_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(TOOLS_PACKAGES) $(USB_PACKAGES_STORAGE)
GLUON_WNDR3700_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(TOOLS_PACKAGES) $(USB_PACKAGES_STORAGE)
GLUON_WRT160NL_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(TOOLS_PACKAGES) $(USB_PACKAGES_STORAGE)
GLUON_ARCHERC7_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(TOOLS_PACKAGES) $(USB_PACKAGES_STORAGE)
GLUON_GLINET_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(TOOLS_PACKAGES) $(USB_PACKAGES_STORAGE)
GLUON_WZRHPG450H_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(TOOLS_PACKAGES) $(USB_PACKAGES_STORAGE)
GLUON_WZRHPAG300H_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(TOOLS_PACKAGES) $(USB_PACKAGES_STORAGE)

# mpc85xx-generic
GLUON_TLWDR4900_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(TOOLS_PACKAGES) $(USB_PACKAGES_STORAGE)


DEFAULT_GLUON_RELEASE := 16.12.5i

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

GLUON_PRIORITY ?= 0

# Languages to include
GLUON_LANGS ?= de

GLUON_REGION := eu


#---------------------------------------







##	DEFAULT_GLUON_RELEASE
#		version string to use for images
#		gluon relies on
#			opkg compare-versions "$1" '>>' "$2"
#		to decide if a version is newer or not.

#DEFAULT_GLUON_RELEASE := 16.12.4i


##	GLUON_RELEASE
#		call make with custom GLUON_RELEASE flag, to use your own release version scheme.
#		e.g.:
#			$ make images GLUON_RELEASE=23.42+5
#		would generate images named like this:
#			gluon-ff%site_code%-23.42+5-%router_model%.bin

# Allow overriding the release number from the command line
#GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Default priority for updates.
#GLUON_PRIORITY ?= 0

# Languages to include
#GLUON_LANGS ?= de

#GLUON_REGION := eu

# if set autoupdater is active while make GLUON_BRANCH=stable
GLUON_BRANCH ?= stable
export GLUON_BRANCH

