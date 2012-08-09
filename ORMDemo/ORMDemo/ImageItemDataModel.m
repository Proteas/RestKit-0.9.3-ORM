
#import "ImageItemDataModel.h"

@implementation ImageItemDataModel

@synthesize ref, title, fileAbstract, imageUrl, picType;

- (void)dealloc {
    
    self.ref = nil;
    self.title = nil;
    self.fileAbstract = nil;
    self.imageUrl = nil;
    self.picType = nil;
    
    [super dealloc];
}


- (NSString *)description {
    
    NSString *dsp = [NSString stringWithFormat:@"ref=%@\
                                                 title=%@\
                                                 fileAbstract=%@\
                                                 imageUrl=%@\
                                                 picType=%@", self.ref, self.title, 
                                                              self.fileAbstract, self.imageUrl, self.picType];
    
    return dsp;
}

@end
