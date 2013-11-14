APLFacebookProxyActivity
=========

A UIActivity for use when Facebook is not activated yet. Apple's UIActivityViewController does not display a Facebook Button if the user is not already connected. We add a custom application activity here, to display a Facebook Button in this case. Our activity tries to present a composeViewControllerForServiceType:SLServiceTypeFacebook which triggers a system alert view that displays further instructions for setting the Facebook account in iOS system settings.

## Installation
Install via cocoapods by adding this to your Podfile:

	pod "APLFacebookProxyActivity", "~> 0.0.1"

## Usage
Import header file:

	#import <APLFacebookProxyActivity/APLFacebookProxyActivity.h>
	
Initialize `APLFacebookProxyActivity`:
	
	APLFacebookProxyActivity *facebookProxyActivity = 	[APLFacebookProxyActivity proxyActivityIfNeeded];
    NSArray *applicationActivities = facebookProxyActivity ? @[facebookProxyActivity] : nil;
    
Finally init your `UIActivityViewController` with the `applicationActivities` array.