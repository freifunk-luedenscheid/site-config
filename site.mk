##	gluon site.mk makefile example

##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed

GLUON_FEATURES := \
	autoupdater \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-limit-arp \
    web-logging \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	radvd \
	respondd \
	status-page \
	web-advanced \
	web-wizard

##	GLUON_SITE_PACKAGES
#		Specify additional Gluon/OpenWrt packages to include here;
#		A minus sign may be prepended to remove a packages from the
#		selection that would be enabled by default or due to the
#		chosen feature flags

GLUON_SITE_PACKAGES := haveged gluon-luci-node-role

ifeq ($(GLUON_TARGET),ar71xx-generic)
GLUON_SITE_PACKAGES += \
    haveged \
    iwinfo \
    gluon-aptimeclock \
	simple-tc \
    ffls-banner \
    gluon-forceradioenable	\
    gluon-weeklyreboot \
    ls-gluon-ssid-changer \
	respondd-module-airtime \
    ffls-ath9k-broken-wifi-workaround \
    gluon-luci-node-role \
    gluon-web-private-wifi
endif

ifeq ($(GLUON_TARGET),ar71xx-nand)
GLUON_SITE_PACKAGES += \
    haveged \
    iwinfo \
    gluon-aptimeclock \
	simple-tc \
    ffls-banner \
    gluon-forceradioenable	\
    gluon-weeklyreboot \
    ls-gluon-ssid-changer \
	respondd-module-airtime \
    ffls-ath9k-broken-wifi-workaround \
    gluon-luci-node-role \
    gluon-web-private-wifi
endif

ifeq ($(GLUON_TARGET),ar71xx-tiny)
GLUON_SITE_PACKAGES += \
    haveged \
    iwinfo \
    gluon-aptimeclock \
	simple-tc \
    ffls-banner \
    gluon-forceradioenable	\
    gluon-weeklyreboot \
    ls-gluon-ssid-changer \
	respondd-module-airtime \
    ffls-ath9k-broken-wifi-workaround \
    gluon-luci-node-role \
    gluon-web-private-wifi
endif

ifeq ($(GLUON_TARGET), brcm2708-bcm2708)
GLUON_SITE_PACKAGES += \
    haveged \
	simple-tc \
    gluon-luci-node-role \
    ffls-banner 
endif

ifeq ($(GLUON_TARGET),  brcm2708-bcm2709)
GLUON_SITE_PACKAGES += \
    haveged \
	simple-tc \
    gluon-luci-node-role \
    ffls-banner 
endif

ifeq ($(GLUON_TARGET),  brcm2708-bcm2710)
GLUON_SITE_PACKAGES += \
    haveged \
	simple-tc \
    gluon-luci-node-role \
    ffls-banner 
endif

ifeq ($(GLUON_TARGET),  x86-generic)
GLUON_SITE_PACKAGES += \
    haveged \
	simple-tc \
    gluon-luci-node-role \
    ffls-banner 
endif







#X86
#GLUON_SITE_PACKAGES := haveged ffls-banner

##	DEFAULT_GLUON_RELEASE
#		version string to use for images
#		gluon relies on
#			opkg compare-versions "$1" '>>' "$2"
#		to decide if a version is newer or not.

DEFAULT_GLUON_RELEASE := 19.08.6i

# Variables set with ?= can be overwritten from the command line

##	GLUON_RELEASE
#		call make with custom GLUON_RELEASE flag, to use your own release version scheme.
#		e.g.:
#			$ make images GLUON_RELEASE=23.42+5
#		would generate images named like this:
#			gluon-ff%site_code%-23.42+5-%router_model%.bin

GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Default priority for updates.
GLUON_PRIORITY ?= 0

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Languages to include
GLUON_LANGS ?= de

GLUON_BRANCH ?= stable
export GLUON_BRANCH


