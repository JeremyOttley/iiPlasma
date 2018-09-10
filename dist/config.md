# ABOUT

about:config settings to harden the Firefox browser. Privacy and performance enhancements.</br>
To change these settings type 'about:config' in the url bar.
Then search the setting you would like to change and modify the value. Some settings may break certain websites from functioning and 
rendering normally. Some settings may also make firefox unstable.
### I am not liable for any damages/loss of data. 
	
Not all these changes are necessary and will be dependent upon your usage and hardware. Do some research on settings if you don't understand what they do. These settings are best combined with your standard privacy extensions 
(HTTPS Everywhere, NoScript/Request Policy, uBlock origin, agent spoofing, Privacy Badger etc), and all plugins set to "Ask To Activate".
	
Note: some keys may not be listed and must be added manually, or they are no longer relavent as firefox changes.

Note: you can check current connections via: about:networking


# CONTROL & MISC
```
dom.event.contextmenu.enabled = false
	Don't allow websites to prevent use of right-click, 
	or otherwise messing with the context menu.

dom.event.clipboardevents.enabled = false
	Don't allow websites to prevent copy and paste.
	Disable notifications of copy, paste, or cut functions. 
        Stop webpage knowing which part of the page had been selected.

network.IDN_show_punycode = true
	Show punycode. Help protect from character 'spoofing' eg:
	xn--80ak6aa92e.com -> аррӏе.com
	[IDN homograph attacks](https://www.xudongz.com/blog/2017/idn-phishing/)

```

# PRIVACY SETTINGS

```
plugins.enumerable_names = blank
	Disable site reading installed plugins.

network.http.sendRefererHeader = 0
	Tells website where you came from. Disabling may break some sites.
	0 = Disable referrer headers. 
	1 = Send only on clicked links.
	2 = (default) Send for links and image.
        
network.http.sendSecureXSiteReferrer = false
        Disable referrer headers between https websites.
		
network.http.referer.spoofSource = true
	Send fake referrer (if choose to send referrers).
		
privacy.trackingprotection.enabled = true
        Mozilla’s built in tracking protection.
		
geo.enabled = false
geo.wifi.uri = blank
browser.search.geoip.url = blank
        Disables geolocation and firefox logging geolocation requests.


browser.safebrowsing.enabled = false
browser.safebrowsing.phishing.enabled = false
browser.safebrowsing.malware.enabled = false	
browser.safebrowsing.downloads.enabled = false
browser.safebrowsing.provider.google4.dataSharing.enabled = blank
browser.safebrowsing.provider.google4.updateURL = blank
browser.safebrowsing.provider.google4.reportURL = blank
browser.safebrowsing.provider.google4.reportPhishMistakeURL = blank
browser.safebrowsing.provider.google4.reportMalwareMistakeURL = blank
browser.safebrowsing.provider.google4.lists = blank
browser.safebrowsing.provider.google4.gethashURL = blank
browser.safebrowsing.provider.google4.dataSharingURL = blank
browser.safebrowsing.provider.google4.dataSharing.enabled = false
browser.safebrowsing.provider.google4.advisoryURL = blank
browser.safebrowsing.provider.google4.advisoryName = blank
browser.safebrowsing.provider.google.updateURL = blank
browser.safebrowsing.provider.google.reportURL = blank
browser.safebrowsing.provider.google.reportPhishMistakeURL = blank
browser.safebrowsing.provider.google.reportMalwareMistakeURL = blank
browser.safebrowsing.provider.google.pver = blank
browser.safebrowsing.provider.google.lists = blank
browser.safebrowsing.provider.google.gethashURL = blank
browser.safebrowsing.provider.google.advisoryURL = blank
browser.safebrowsing.downloads.remote.url = blank
        Disable Google Safe Browsing and malware and phishing protection.
	Stop sending links and downloading lists from google.	
	Security risk, but privacy improvement.
	Note: this list may be incomplete as firefox updates, be sure to search for browser.safebrowsing.provider.google*
	Also simply setting safebrowsing.*.enabled to false should make setting the URL's to blank redundant, but better to be safe.
	If you see anything pointing google, probably best to nuke it.


browser.selfsupport.url = blank
browser.aboutHomeSnippets.updateUrL = blank
browser.startup.homepage_override.mstone = ignore
browser.startup.homepage_override.buildID = blank
startup.homepage_welcome_url = blank
startup.homepage_welcome_url.additional = blank
startup.homepage_override_url = blank
	Can call home to every time firefox is started or home page is visited.
	https://support.mozilla.org/en-US/kb/how-stop-firefox-making-automatic-connections
	http://kb.mozillazine.org/Connections_established_on_startup_-_Firefox


toolkit.telemetry.cachedClientID = blank

browser.send_pings = false
	Prevent website tracking clicks.
		
browser.send_pings.require_same_host = true
	Only send pings if send and receiving host match (same website).
        
dom.battery.enabled = false
	Disable website reading how much battery your mobile device or laptop has.

network.cookie.alwaysAcceptSessionCookies = false
        Disables acceptance of session cookies.
		
network.cookie.cookieBehavior
        Disable cookies.
        0 = All cookies are allowed. (Default) 
        1 = Only cookies from the originating server are allowed. (block third party cookies)
        2 = No cookies are allowed. 
	3 = Third-party cookies are allowed only if that site has stored cookies already from a previous visit 
			
network.cookie.lifetimePolicy 
        cookies are deleted at the end of the session
        0 = The cookie's lifetime is supplied by the server. (Default) 
        1 = The user is prompted for the cookie's lifetime. 
        2 = The cookie expires at the end of the session (when the browser closes). 
        3 = The cookie lasts for the number of days specified by network.cookie.lifetime.days.   

network.dnsCacheEntries = 100
        Number of cached DNS entries. Lower number = More requests but less data stored.
    
network.dnsCacheExpiration = 60
        Time DNS entries are cached in seconds.
    
places.history.enabled = false
        Disables recording of visited websites.
    
browser.formfill.enable = false
        Disables saving of form data.
    
browser.cache.disk.enable = false
        Disables caching on hardrive.
    
browser.cache.disk_cache_ssl = false
        Disables caching for ssl connections.
    
browser.cache.memory.enable = false
        Disables caching in memory.
   
browser.cache.offline.enable = false
        Disables offline cache.
    
network.dns.disableIPv6 = true
        If your OS or ISP does not support IPv6, there is no reason to have this preference set to false. 

network.predictor.enabled = false
network.dns.disablePrefetch = true   
network.prefetch-next = false
        Link prefetching is when a webpage hints to the browser that certain pages are likely to be visited, 
	so the browser downloads them immediately so they can be displayed immediately when the user requests it. 

network.http.speculative-parallel-limit = 0
	Disable prefetch link on hover.
	
media.peerconnection.enabled = false    
network.websocket.enabled = false
        WebSockets is a technology that makes it possible to open an interactive communication 
        session between the user's browser and a server. (May leak IP when using proxy/VPN)
   
loop.enabled = false
	Disable 3rd party closed-source Hello integration.
	Note: only affects older versions of firefox as "Hello" has been discontinued as in favor of webrtc: https://support.mozilla.org/en-US/kb/hello-status
	
extensions.pocket.enabled = false
extensions.pocket.site = blank
extensions.pocket.oAuthConsumerKey = blank
extensions.pocket.api = blank
	Disable 3rd party closed-source Pocket integration.
	Note, this is browser.pocket.enabled for older versions of firefox
```	
	
	
# PERFORMANCE
```
layout.frame_rate.precise = true
	Increases animation speed. May mitigate choppy scrolling.
	
webgl.force-enabled = true
layers.acceleration.force-enabled = true
layers.offmainthreadcomposition.enabled = true
layers.offmainthreadcomposition.async-animations = true
layers.async-video.enabled = true
html5.offmainthread = true
	Enable Hardware Acceleration and Off Main Thread Compositing (OMTC).
	It's likely your browser is already set to use these features.
	May introduce instability on some hardware.

```

# MEMORY REDUCTION

```
browser.cache.memory.capacity = xx
	Limit memory cache size. (xx = value in MB)
	
browser.sessionhistory.max_entries = xx
	Limit maximum pages in session history. (how many URLs you can traverse using the Forward or Back button)
	
browser.sessionstore.max_tabs_undo = xx
	Limit max closed tabs you can reopen.
	
browser.tabs.animate = false
browser.download.animateNotifications = false
	Disable some animations.
	
config.trim_on_minimize = true
	Reduce memory usage when minimized. (Windows only)
	
image.mem.max_decoded_image_kb = xx
	How much info Firefox stores of uncompressed images.
	Higher value = improve speed at the expense of increased memory usage.
	
javascript.options.mem.max == xx
	Limit amount of memory javascript may consume.
	-1 = Automatic

javascript.options.mem.high_water_mark == xx
	Tell garbage collector to start running when javascript is using xx MB of memory. 
	Garbage collection releases memory back to the system.
```

# Flash Font Enumeration
This one is not for firefox, but for Flash if you have it installed.
Font Enumeration allows a site to read which fonts you have installed 
which can be used to identify users.

Default Location:	
```
Windows: 
	C:\Windows\SysWOW64\Macromed\Flash\mms.cfg
	C:\Windows\system32\Macromed\Flash\mms.cfg
Linux:
	/etc/adobe/mms.cfg
OSX:
	~/Library/Application Support/Google/Chrome/Default/Pepper Data/Shockwave Flash/System/mms.cfg
```

Add this line to the mms.cfg file:
```
DisableDeviceFontEnumeration = 1
```
**Better yet, simply uninstall flash. Flash is garbage...**

</br>
___
</br>
**I do my best to keep this list up to date. Additions and corrections are greatly appreciated.**
