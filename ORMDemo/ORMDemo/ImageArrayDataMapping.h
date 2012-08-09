
#import <Foundation/Foundation.h>


@interface ImageArrayDataMapping : NSObject {
    
    NSDictionary *_data;
}

- (id)initWithServerData:(NSDictionary *)data;
- (NSArray *)mapData;

@end
