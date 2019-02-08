//
//  GeometryEditViewController.h
//  MAGE
//
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "AnnotationDragCallback.h"
#import "GeometryEditCoordinator.h"

@interface GeometryEditViewController : UIViewController <AnnotationDragCallback>

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (weak, nonatomic) IBOutlet UIButton *pointButton;
@property (weak, nonatomic) IBOutlet UIButton *lineButton;
@property (weak, nonatomic) IBOutlet UIButton *rectangleButton;
@property (weak, nonatomic) IBOutlet UIButton *polygonButton;
@property (nonatomic) BOOL allowsPolygonIntersections;

- (instancetype) initWithCoordinator: (GeometryEditCoordinator *) coordinator;
- (BOOL) validate:(NSError **) error;

@end
