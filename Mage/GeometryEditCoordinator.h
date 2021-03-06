//
//  GeometryEditCoordinator.h
//  MAGE
//
//  Created by Dan Barela on 1/30/18.
//  Copyright © 2018 National Geospatial Intelligence Agency. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFGeometry.h"

@protocol GeometryEditDelegate

- (void) geometryEditComplete:(SFGeometry *) geometry coordinator:(id) coordinator;
- (void) geometryEditCancel:(id) coordinator;

@end

@interface GeometryEditCoordinator : NSObject

@property (strong, nonatomic) SFGeometry *originalGeometry;
@property (strong, nonatomic) SFGeometry *currentGeometry;

@property (strong, nonatomic) id<GeometryEditDelegate> delegate;
@property (strong, nonatomic) UIImage *pinImage;
@property (strong, nonatomic) NSDictionary *fieldDefinition;

- (instancetype) initWithFieldDefinition: (NSDictionary *) fieldDefinition andGeometry: (SFGeometry *) geometry andPinImage: (UIImage *) pinImage andDelegate: (id<GeometryEditDelegate>) delegate andNavigationController: (UINavigationController *) navigationController;
- (void) start;
- (void) updateGeometry: (SFGeometry *) geometry;
- (NSString *) fieldName;

@end
