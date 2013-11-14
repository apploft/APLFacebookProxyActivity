//
//  APLFacebookProxyActivity.m
//
//
//  Created by Heiko Wichmann on 04.04.2013.
//  Copyright (c) 2013 apploft GmbH. All rights reserved.
//

#import "APLFacebookProxyActivity.h"
#import <Social/Social.h>


@interface APLFacebookProxyActivity ()
@property (nonatomic, strong) NSArray *items;
@end
@implementation APLFacebookProxyActivity

+ (instancetype)proxyActivityIfNeeded {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        return nil;
    }
    
    // Apple's UIActivityViewController does not display a Facebook Button
    // if the user is not already connected.
    // We add a custom application activity here, to display a Facebook Button in this case.
    // Our activity tries to present a composeViewControllerForServiceType:SLServiceTypeFacebook
    // which triggers a system alert view that displays further instructions for setting the Facebook account in iOS system settings.
    
    return [self new];
}


- (NSString *)activityTitle
{
    return @"Facebook";
}


- (UIImage *)activityImage
{
    UIImage *anActivityImage = [UIImage imageNamed:@"facebook-share-proxy-57.png"];
    return anActivityImage;
}

- (NSString *)activityType {
    return UIActivityTypePostToFacebook;
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    self.items = activityItems;
}


- (UIViewController *)activityViewController
{
    SLComposeViewControllerCompletionHandler aComposeViewControllerCompletionHandler = ^(SLComposeViewControllerResult result)
    {
        [self activityDidFinish:YES];
    };
    SLComposeViewController *aFacebookComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    for (id item in self.items) {
        if ([item isKindOfClass:[NSString class]]) {
            [aFacebookComposeViewController setInitialText:item];
        } else if ([item isKindOfClass:[UIImage class]]) {
            [aFacebookComposeViewController addImage:item];
        }
    }
    [aFacebookComposeViewController setCompletionHandler:aComposeViewControllerCompletionHandler];
    return aFacebookComposeViewController;
}

@end
