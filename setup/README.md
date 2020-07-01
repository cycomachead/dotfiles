# macOS Preferences

This is a fairly opinionated (and increasingly comprehensive) set of
macOS preferences, based on my daily use.

This README documents what high level changes I've made for applications. The specifics are in the plist files.

## A Note on `defaults`

My dotfiles repos use individual shell commands. I am chosing to make use of recent macOS's nicer key-value plist format and the `import` command to manage default settings.

### Export current settings:

For example, to dump Finder prefs:

```sh
defaults read com.apple.Finder > setup/app-preferences/finder.plist
```
*Note:* After dumping a set of preferences, you'll likely want to clean up the local cruft, such as things that include timestamps or notes about migrated data.

I typically start of with a dump, because it shows me the various newer settings that I have tweaked.

### Import Preferences:

For example, using the `-app` shortcut to reference an application, which is not necessary, but sometimes handy.

```sh
defualts import -app setup/app-preferences/safari.plist
```

## Universal Access

If you're not me and cloning this, then you should know I have some very specific UA settings in here. These are necessary for me to use a Mac, but probably don't make sense for most folks. :)

Roughly, they set some really specific screen zoom features.

## Applications

## Safari:

* Web Development tools. DevelopmentMenu, the more hidden extensions menu
* Default views are favorites, about:blank as a home page.
* Enables extensions, and shows the 1Password extension in my tool bar.
* Don't open "safe" files after downloading (security risk!)
* Use tab to navigate webpages
* Personal Opinions:
  * Cmd-1 to 9 for navigating to bookmarks
  * Favicons in tabs
  * ~/Desktop is the downloads location.
  * Fewer top sites
  * Don't autocleanup downloads

### Termianl

* Use my personal theme: Source Code Pro, large font.
* Use bash...because habits.

### Finder

* Show hidden files
* List view with calculate all sizes
* Turn on statusbar, toolbar, sidebar.
* Personal whacky stuff:
  * Larger font size in list view
  * Hide everything from the desktop.

## TODO Domains to check about setting...

These are my current list of `defaults domains` I intend to verify and selectively include.

 2BUA8C4S2C.com.agilebits.onepassword7-helper
 Avatar Cache Index
 ContextStoreAgent
 MobileMeAccounts
 ZoomChat
 at.obdev.LaunchBar
 com.Adobe.Common 14.0
 com.Adobe.dynamiclinkmediaserver.13.0.0
 com.adobe.Install
 com.adobe.LightroomClassicCC7
 com.adobe.Photoshop.uxp_com.adobe.ccx.lrimporter
 com.adobe.Photoshop.uxp_com.adobe.ccx.start
 com.adobe.acc.AdobeDesktopService
 com.adobe.acc.HEXHelper.Renderer
 com.adobe.accmac
 com.adobe.crashreporter
 com.agilebits.onepassword7
 com.agilebits.onepassword7.1PasswordSafariAppExtension
 com.apple.AMPLibraryAgent
 com.apple.Accessibility
 com.apple.AccessibilityVisualsAgent
 com.apple.ActivityMonitor
 com.apple.AdLib
 com.apple.AddressBook
 com.apple.AppStore
 com.apple.AppleMediaServices
 com.apple.AppleMediaServices.notbackedup
 com.apple.AppleMultitouchMouse
 com.apple.AppleMultitouchTrackpad
 com.apple.BKAgentService
 com.apple.BezelServices
 com.apple.CalendarAgent
 com.apple.CalendarNotification.CalNCService
 com.apple.CommCenter.counts
 com.apple.CoreDuet
 com.apple.CoreGraphics
 com.apple.DictionaryServices
 com.apple.DiskUtility
 com.apple.EmojiCache
 com.apple.EmojiPreferences
 com.apple.FaceTime
 com.apple.FolderActionsDispatcher
 com.apple.FontRegistry.user
 com.apple.GEO
 com.apple.HIToolbox
 com.apple.Home
 com.apple.Home.group
 com.apple.Home.wallpaper
 com.apple.Maps
 com.apple.Messages
 com.apple.Music
 com.apple.NetworkBrowser
 com.apple.Notes
 com.apple.Photos
 com.apple.Photos.Migration.Reader
 com.apple.Preferences
 com.apple.Preview
 com.apple.Preview.ViewState
 com.apple.ProblemReporter
 com.apple.QuickTimePlayerX
 com.apple.Safari.SandboxBroker
 com.apple.SafariBookmarksSyncAgent
 com.apple.ScreenTimeAgent
 com.apple.ServicesMenu.Services
 com.apple.Siri
 com.apple.Siri.SiriTodayExtension
 com.apple.SiriNCService
 com.apple.SocialPushAgent
 com.apple.SoftwareUpdate
 com.apple.SpeechRecognitionCore
 com.apple.Spotlight
 com.apple.SystemProfiler
 com.apple.TTY
 com.apple.TV
 com.apple.TelephonyUtilities
 com.apple.TextEdit
 com.apple.TextInputMenu
 com.apple.TextInputMenuAgent
 com.apple.TimeMachine
 com.apple.UIKit
 com.apple.UserAccountUpdater
 com.apple.VoiceOver
 com.apple.VoiceOver4.local
 com.apple.VoiceOverTraining
 com.apple.VoiceOverUtility
 com.apple.VoiceOverUtilityCacheBuilder
 com.apple.accounts
 com.apple.accountsd
 com.apple.amp.mediasharingd
 com.apple.appstored
 com.apple.archiveutility
 com.apple.assistant
 com.apple.assistant.backedup
 com.apple.assistant.support
 com.apple.audio.AudioMIDISetup
 com.apple.bird
 com.apple.bookstoreagent
 com.apple.calculateframework
 com.apple.classroom
 com.apple.cloudd
 com.apple.cloudpaird
 com.apple.cloudphotod
 com.apple.cmfsyncagent
 com.apple.commcenter
 com.apple.commcenter.callservices
 com.apple.commerce
 com.apple.commerce.configurator
 com.apple.commerce.knownclients
 com.apple.contacts.donation-agent
 com.apple.controlstrip
 com.apple.coreauthd
 com.apple.corerecents.recentsd
 com.apple.coreservices.UASharedPasteboardProgressUI
 com.apple.coreservices.uiagent
 com.apple.coreservices.useractivityd
 com.apple.coreservices.useractivityd.dynamicuseractivites
 com.apple.corespotlightui
 com.apple.desktopservices
 com.apple.dock
 com.apple.driver.AppleBluetoothMultitouch.mouse
 com.apple.driver.AppleBluetoothMultitouch.trackpad
 com.apple.driver.AppleHIDMouse
 com.apple.dt.IDECacheDeleteAppExtension
 com.apple.dt.xcodebuild
 com.apple.facetime.bag
 com.apple.fileproviderd
 com.apple.finder
 com.apple.frameworks.diskimages
 com.apple.frameworks.diskimages.diuiagent
 com.apple.gamecenter
 com.apple.gamed
 com.apple.help
 com.apple.helpviewer
 com.apple.homed
 com.apple.homed.notbackedup
 com.apple.iCal
 com.apple.iChat
 com.apple.iChat.inputLine
 com.apple.iTunes
 com.apple.iWork.Numbers
 com.apple.icloud.fmfd
 com.apple.icloud.fmip.clientconfiguration
 com.apple.icloud.fmip.voiceassistantsync
 com.apple.icloud.searchpartyuseragent
 com.apple.identityservices.idstatuscache
 com.apple.identityservicesd
 com.apple.ids.deviceproperties
 com.apple.ids.subservices
 com.apple.imagecapture
 com.apple.imagent
 com.apple.imdpersistence.IMDPersistenceAgent
 com.apple.imessage
 com.apple.imessage.bag
 com.apple.imservice.ids.FaceTime
 com.apple.imservice.ids.iMessage
 com.apple.internal.ck
 com.apple.ipTelephony
 com.apple.itunesstored
 com.apple.keyboardservicesd
 com.apple.keychainaccess
 com.apple.locationmenu
 com.apple.loginwindow
 com.apple.madrid
 com.apple.mail
 com.apple.mediaaccessibility
 com.apple.mediaanalysisd
 com.apple.messages.nicknames
 com.apple.mmcs
 com.apple.motionapp
 com.apple.ncplugin.stocks
 com.apple.ncplugin.weather
 com.apple.ncprefs
 com.apple.networkresolutiond
 com.apple.news
 com.apple.newscore
 com.apple.newscore2
 com.apple.notificationcenterui
 com.apple.parsecd
 com.apple.passd
 com.apple.photoanalysisd
 com.apple.photolibraryd
 com.apple.photos.shareddefaults
 com.apple.preferences.extensions.ServicesWithUI
 com.apple.preferences.extensions.ShareMenu
 com.apple.preferences.softwareupdate
 com.apple.print.PrintingPrefs
 com.apple.print.custompresets.forprinter.Xerox_Phaser_6510__6c_d9_e0_
 com.apple.proactive.PersonalizationPortrait
 com.apple.protectedcloudstorage.protectedcloudkeysyncing
 com.apple.quicklook.QuickLookUIService
 com.apple.quicklook.ThumbnailsAgent
 com.apple.rapport
 com.apple.registration
 com.apple.remindd
 com.apple.remindd.babysitter
 com.apple.reminders
 com.apple.routined
 com.apple.scheduler
 com.apple.screencapture
 com.apple.screensaver
 com.apple.scriptmenu
 com.apple.security.KCN
 com.apple.security.cloudkeychainproxy3.keysToRegister
 com.apple.security.ctkd-db
 com.apple.security.sosaccount
 com.apple.sharingd
 com.apple.sidecar.display
 com.apple.siri-distributed-evaluation
 com.apple.siri.context.service
 com.apple.siri.embeddedspeech
 com.apple.siri.media-indexer
 com.apple.sms
 com.apple.spaces
 com.apple.speech.recognition.AppleSpeechRecognition.CustomCommands
 com.apple.speech.recognition.AppleSpeechRecognition.prefs
 com.apple.speech.voice.prefs
 com.apple.stockholm
 com.apple.stocks
 com.apple.storeagent
 com.apple.studentd
 com.apple.suggestions
 com.apple.symbolichotkeys
 com.apple.sync.NanoHome
 com.apple.systempreferences
 com.apple.systemuiserver
 com.apple.talagent
 com.apple.textInput.keyboardServices.textReplacement
 com.apple.touristd
 com.apple.xpc.activity2
 com.blackmagic-design.Blackmagic Desktop Video Administration
 com.blackmagic-design.DiskSpeedTest
 com.blackmagic-design.desktopvideo.livekey
 com.blackmagic-design.switchers.softwarecontrol
 com.docker.docker
 com.dropbox.DropboxMacUpdate
 com.electron.docker-frontend
 com.frontapp.Front
 com.getdropbox.dropbox
 com.google.Chrome
 com.google.Chrome.canary
 com.google.GoogleDrive
 com.google.Keystone.Agent
 com.hnc.Discord
 com.primatelabs.Geekbench5
 com.smileonmymac.textexpander
 com.tinyspeck.slackmacgap
 developer.apple.wwdc-Release
 findInSelectionByDefault
 info.eurocomp.Timing2
 info.eurocomp.Timing2.fallback
 info.eurocomp.TimingHelper
 info.eurocomp.TimingHelper.InfoExtractorService
 info.eurocomp.TimingHelper.fallback
 knowledge-agent
 org.cups.PrintingPrefs
 pbs
 systemgroup.com.apple.icloud.searchpartyd.sharedsettings
 tv.sienna.scanconvertersdi
 us.zoom.Transcode
 us.zoom.xos
