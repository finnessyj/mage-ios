# Change Log
All notable changes to this project will be documented in this file.
Adheres to [Semantic Versioning](http://semver.org/).

---
## 2.0.3 (TBD)

##### Release Notes

##### Features

* Download GeoPackages that are linked to the events, from the server

##### Bug Fixes

* Fix new observation form picker crash when theme is set to auto.
* Invalidate server token when a user logs out on the app
* Bug fixes for some exceptions when opening invalid GeoPackage files

## [2.0.2](https://github.com/ngageoint/mage-ios/releases/tag/2.0.2) (04-18-2018)

##### Release Notes

Tired of burning your retinas while using MAGE at night or in a dark area?  MAGE now comes with a wonderful night theme.  Sometimes, users would log in without a connection and immediately be logged out as soon as the app would regain connection.  How rude.  Now when you are logged in without a connection to the server, you will be notified and allowed to log in from the settings screen when you have a connection again.  MAGE will no longer log you out when a connection is obtained, however, before you see any updates from your team, and before your local updates are sent to them, you will need to log in again.  Also, bug fixes.  Found them all this time...

##### Features

* Themes: Currently support day and night themes
* Disconnected login has been improved to give the user more feedback
* Additions for login.gov

##### Bug Fixes

* Fixes case where an observation was being edited when the user logged out and then changed their server.
* Attachment cell constraint fix
* Observation markers are not dropped multiple times when an observation is created
* Apple maps URL fixed for case with primary fields with spaces
* You can now cancel adding a voice recording
* Fixes case where connection is lost before events are pulled

## [2.0.1](https://github.com/ngageoint/mage-ios/releases/tag/2.0.1) (02-15-2018)

##### Features

* Geometry cells in observations now match the look and feel of observation location cells
* Map settings now use the coordinator pattern
* Geometry Edit uses the same map type as the main map

##### Bug Fixes

* Geometries are sent properly for location fields in observations
* Constraints are updated for the login screen when the keyboard is shown
* Local login is not used unless the network error is cannot connect to host
* Observation View updates when a new form is added to an observation
* Constraints are updated when the keyboard shows on the geometry edit view
* Fix for table layout in iOS 10
* Fix for events containing no forms
* Fix for forms with a geometry field

## 2.0 (https://github.com/ngageoint/mage-ios/releases/tag/2.0) (11-21-2017)

##### Features
* Observation geometry support for lines and polygons
* Multiple forms per event support
* Users can delete observations
* Observation local notification support
* Hook up new mage-ios-sdk background upload service for attachments.
* iOS 11 support
* Users can change their password from the app

##### Bug Fixes
* Save videos to local MAGE app directory.  This will prevent deletion from gallery from dissociating the attachment from the observation.
* Don't save (duplicate) media picked from the gallery.

## 1.4.5 (https://github.com/ngageoint/mage-ios/releases/tag/1.4.5) (11-06-2017)

##### Features

* Fix issue preventing users from adding collected media to the photos library

##### Bug Fixes

## 1.4.4 (https://github.com/ngageoint/mage-ios/releases/tag/1.4.4) (10-26-2017)

##### Features

##### Bug Fixes
* Fix issue with map annotation cache picking wrong icon

## 1.4.3 (https://github.com/ngageoint/mage-ios/releases/tag/1.4.3) (10-21-2017)

##### Features

##### Bug Fixes
* iPad notifies the user when it could not get a location
* iPad toolbar separators fix for iOS 11

## 1.4.2 (https://github.com/ngageoint/mage-ios/releases/tag/1.4.2) (07-28-2017)

##### Features

##### Bug Fixes
* Allow empty date field

## 1.4.1 (https://github.com/ngageoint/mage-ios/releases/tag/1.4.1) (06-13-2017)

##### Features
* Functional improvements to observation form fields.  Users no longer have to tap the 'Done' button when moving between observation form fields.

##### Bug Fixes

## 1.4.0 (https://github.com/ngageoint/mage-ios/releases/tag/1.4.0) (05-26-2017)

##### Features
* Uses mage-sdk 1.4 which will obtain an observation id from the server before pushing observation infomation.  This will
  prevent a duplicate observation in the case that the client drops a successful create attempt and retries.
* You can view observation sync status in observation view, profile, and main application badge.
* You can manually attempt to sync observations.

##### Bug Fixes

## 1.3.2 (https://github.com/ngageoint/mage-ios/releases/tag/1.3.2) (03-28-2017)

##### Features
* Choose between Local time and GMT for display and editing
* MAGE SDK upgrade to 1.3.0
* GeoPackage iOS upgrade to 1.2.1

##### Bug Fixes

## 1.3.1 (https://github.com/ngageoint/mage-ios/releases/tag/1.3.1) (02-07-2017)

##### Features

##### Bug Fixes
* Update to new mage-ios-sdk  This will ensure when checking that a user exists in an event the same
  managed object context is used.

## 1.3.0 (https://github.com/ngageoint/mage-ios/releases/tag/1.3.0) (11-03-2016)

##### Features
* Users can now favorite observations
* Users with event edit permission can flag observations as important

##### Bug Fixes

## 1.2.1 (https://github.com/ngageoint/mage-ios/releases/tag/1.2.1) (12-06-2016)

##### Features
* Added multitasking screenshot
* Added file protection entitlements file

##### Bug Fixes

## 1.2.0 (https://github.com/ngageoint/mage-ios/releases/tag/1.2.0) (08-11-2016)

##### Features
* Multi select support.
* Filter select and multi select options
* Turn on App Transport Security.

##### Bug Fixes
* Fixed bug where persons location was set to your location when viewing persons info.

## 1.1.0 (https://github.com/ngageoint/mage-ios/releases/tag/1.1.0) (06-23-2016)

##### Features
* Auto zooms to users current location on map in user view.
* Lat/Lng edit text fields added to geometry edit view, users can now manually enter a lat/lng
* Allow avatar edit from profile view.
* Added cancel button to sign up view
* Reworked how we handle media permissions.  Ask for permissions (gallery, camera, mic) before the OS asks.  In this case when the user
  performs an action like 'attach a photo' the app will check for permissions and ask the user.  If permission has been denied the app
  will present a 'link' to MAGE settings to allow the users to change the permission.
* Don't show unknown form fields.  This will help with backwards compatibility, as we won't have to worry what the client will do
  with form fields it does not know how to handle.'
* Pull thumbnails for attachments.  All image attachments will ask for thumbnail from the server, which greatly improves performance.
* Add time based filtering.

##### Bug Fixes

## [1.0.0](https://github.com/ngageoint/mage-ios/releases/tag/1.0.0) (06-14-2016)

* Initial release
