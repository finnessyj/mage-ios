//
//  AttachmentCell.m
//  Mage
//
//

#import "AttachmentCell.h"
#import "FICImageCache.h"
#import "Attachment+Thumbnail.h"

@interface AttachmentCell ()

@property (strong, nonatomic) CAShapeLayer *progressLayer;

@end

@implementation AttachmentCell

- (void)prepareForReuse {
    self.imageView.image = [UIImage imageNamed:@"download_thumbnail"];
}

-(void) setImageForAttachament:(Attachment *) attachment withFormatName:(NSString *) formatName {
    self.attachment = attachment;
    self.attachment.uploading ? [self.uploadingIndicator startAnimating] : [self.uploadingIndicator stopAnimating];
    [self drawUploadProgress];
    
    __weak typeof(self) weakSelf = self;
    BOOL imageExists = [[FICImageCache sharedImageCache] retrieveImageForEntity:attachment withFormatName:formatName completionBlock:^(id<FICEntity> entity, NSString *formatName, UIImage *image) {
        // This completion block may be called much later, check to make sure this cell hasn't been reused for a different attachment before displaying the image that has loaded.
        if (attachment == [self attachment]) {
            weakSelf.imageView.image = image;
            weakSelf.imageView.layer.cornerRadius = 5;
            weakSelf.imageView.clipsToBounds = YES;
        }
    }];
    
    if (imageExists == NO) {
        self.imageView.image = [UIImage imageNamed:@"download_thumbnail"];
    }
}

- (void) layoutSubviews {
    [super layoutSubviews];
    [self drawUploadProgress];
}

- (void) drawUploadProgress {
    if (self.progressLayer) {
        [self.progressLayer removeFromSuperlayer];
        self.progressLayer = nil;
    }
    if (self.attachment.uploading) {
        self.progressLayer = [CAShapeLayer layer];
        self.progressLayer.path = [[self createProgressArc] CGPath];
        self.progressLayer.fillColor = [[[UIColor whiteColor] colorWithAlphaComponent:.7] CGColor];
        [self.progressView.layer addSublayer:self.progressLayer];
    }
}

- (UIBezierPath *) createProgressArc {
    CGFloat radius = self.contentView.frame.size.height / 2.0f;
    CGPoint center = self.contentView.center;
    CGFloat startAngle = -M_PI / 2.0f;
    CGFloat endAngle = (M_PI * 2.0) * ([self.attachment.uploadProgress floatValue] / 100.0f);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:center];
    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path closePath];
    return path;
}

@end
