//
//  OauthLoginView.h
//  MAGE
//
//  Created by Dan Barela on 3/30/18.
//  Copyright © 2018 National Geospatial Intelligence Agency. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OAuthButtonDelegate <NSObject>

- (void) signinForStrategy: (NSDictionary *) strategy;

@end

@interface OAuthLoginView : UIStackView

@property (strong, nonatomic) NSDictionary *strategy;
@property (strong, nonatomic) id<OAuthButtonDelegate> delegate;

@end
