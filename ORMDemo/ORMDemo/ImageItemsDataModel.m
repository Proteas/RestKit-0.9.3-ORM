
#import "ImageItemsDataModel.h"

@implementation ImageItemsDataModel

@synthesize ref, imageItems;

- (void)dealloc {
    
    self.ref = nil;
    self.imageItems = nil;
    
    [super dealloc];
}


- (NSString *)description {
    
    NSString *dsp = [NSString stringWithFormat:@"<\
                                                    ref=%@\
                                                    imageItems=%@\
                                                 >", self.ref, self.imageItems];
    
    return dsp;
}

@end
