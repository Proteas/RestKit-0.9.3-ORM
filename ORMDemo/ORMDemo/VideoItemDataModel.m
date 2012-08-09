
#import "VideoItemDataModel.h"

@implementation VideoItemDataModel

@synthesize ref, title, attAbstract, videoUrl, imageUrl;

- (void)dealloc {
    
    self.ref = nil;
    self.title = nil;
    self.attAbstract = nil;
    self.videoUrl = nil;
    self.imageUrl = nil;
    
    [super dealloc];
}


- (NSString *)description {
    
    NSString *dsp = [NSString stringWithFormat:@"<\
                                                    ref=%@\
                                                    title=%@\
                                                    attAbstract=%@\
                                                    imageUrl=%@\
                                                    videoUrl=%@\
                                                 >", self.ref, self.title, self.attAbstract, self.imageUrl, self.videoUrl];
    
    return dsp;
}

@end
