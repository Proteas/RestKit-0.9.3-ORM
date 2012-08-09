
#import "ImageArrayDataMapping.h"
#import "ImageItemDataModel.h"
#import "RestKit-ORM.h"


@interface ImageArrayDataMapping ()

@property (nonatomic, retain) NSDictionary *data;

- (RKObjectMapping *)mappingForImageItem;

@end


@implementation ImageArrayDataMapping

@synthesize data = _data;


- (id)initWithServerData:(NSDictionary *)data {
    
    if (nil == data)
        return nil;
    
    if ((self = [super init])) {
        self.data = data;
    }
    
    return self;
}


- (void)dealloc {
    
    self.data = nil;
    [super dealloc];
}


- (RKObjectMapping *)mappingForImageItem {
    
    RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[ImageItemDataModel class]];
    [mapping mapKeyPath:@"ref" toAttribute:@"ref"];
    [mapping mapKeyPath:@"title" toAttribute:@"title"];
    [mapping mapKeyPath:@"fileAbstract" toAttribute:@"fileAbstract"];
    [mapping mapKeyPath:@"imageUrl" toAttribute:@"imageUrl"];
    [mapping mapKeyPath:@"picType" toAttribute:@"picType"];
    
    return mapping;
}


- (NSArray *)mapData {
    
    RKObjectMappingProvider *mappingProvider = [[RKObjectMappingProvider alloc] init];
    [mappingProvider setMapping:[self mappingForImageItem] forKeyPath:@"imagearray"];
    
    RKObjectMapper *mapper = [[RKObjectMapper alloc] initWithObject:self.data mappingProvider:mappingProvider];
    RKObjectMappingResult *mappingResult = [mapper performMapping];
    
    [mappingProvider release]; mappingProvider = nil;
    [mapper release]; mapper = nil;
    
    return [mappingResult asCollection];
}

@end
