//
//  AttachmentCell.h
//  Mage
//
//

#import <UIKit/UIKit.h>

@class Attachment;

@interface AttachmentCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *uploadingIndicator;
@property (strong, nonatomic) Attachment *attachment;
@property (weak, nonatomic) IBOutlet UIView *progressView;

-(void) setImageForAttachament:(Attachment *) attachment withFormatName:(NSString *) formatName;

@end
