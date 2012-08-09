
#import <Foundation/Foundation.h>

@interface VideoItemsDataModel : NSObject {
    
    NSString *ref;
    NSArray *videoItems;
}

@property (nonatomic, retain) NSString *ref;
@property (nonatomic, retain) NSArray *videoItems;

@end
