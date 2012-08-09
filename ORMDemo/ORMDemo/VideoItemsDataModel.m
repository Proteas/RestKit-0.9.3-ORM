
#import "VideoItemsDataModel.h"

@implementation VideoItemsDataModel

@synthesize ref, videoItems;

- (void)dealloc {
    
    self.ref = nil;
    self.videoItems = nil;
    
    [super dealloc];
}


- (NSString *)description {
    
    NSString *dsp = [NSString stringWithFormat:@"<\
                                                    ref=%@\
                                                    videoItems=%@\
                                                 >", self.ref, self.videoItems];
    
    return dsp;
}

@end
