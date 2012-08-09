
#import <Foundation/Foundation.h>

@interface VideoItemDataModel : NSObject {
    
    NSString *ref;
    NSString *title;
    NSString *attAbstract;
    NSString *videoUrl;
    NSString *imageUrl;
}

@property (nonatomic, retain) NSString *ref;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *attAbstract;
@property (nonatomic, retain) NSString *videoUrl;
@property (nonatomic, retain) NSString *imageUrl;

@end
