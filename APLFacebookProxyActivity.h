//
//  APLFacebookProxyActivity.h
//
//
//  Created by Heiko Wichmann on 04.04.2013.
//  Copyright (c) 2013 apploft GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APLFacebookProxyActivity : UIActivity

/**
 *	Returns an proxy activity if needed.
 *  @discussion Apple's UIActivityViewController does not display a Facebook Button if the user is not already connected.
 *  Our activity tries to present a composeViewControllerForServiceType:SLServiceTypeFacebook
 *  which triggers a system alert view that displays further instructions for setting the Facebook account in iOS system settings.
 *
 *	@return	ALFacebookProxyActivityInstance or nil
 */
+ (instancetype) proxyActivityIfNeeded;
@end
