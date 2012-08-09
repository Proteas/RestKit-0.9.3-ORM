
#import <Foundation/Foundation.h>

@interface ImageItemDataModel : NSObject {
    
    NSString *ref;
    NSString *title;
    NSString *fileAbstract;
    NSString *imageUrl;
    NSNumber *picType;
}

@property (nonatomic, retain) NSString *ref;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *fileAbstract;
@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) NSNumber *picType;

@end
