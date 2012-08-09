
#import <Foundation/Foundation.h>

@interface ImageItemsDataModel : NSObject {
    
    NSString *ref;
    NSArray *imageItems;
}

@property (nonatomic, retain) NSString *ref;
@property (nonatomic, retain) NSArray *imageItems;

@end
