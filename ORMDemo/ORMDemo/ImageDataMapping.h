
#import <Foundation/Foundation.h>


@class ImageItemDataModel;

@interface ImageDataMapping : NSObject {
    
    NSDictionary *_data;
}

- (id)initWithServerData:(NSDictionary *)data;
- (ImageItemDataModel *)mapData;

@end
