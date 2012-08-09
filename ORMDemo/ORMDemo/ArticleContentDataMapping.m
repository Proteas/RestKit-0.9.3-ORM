
#import "ArticleContentDataMapping.h"
#import "RestKit-ORM.h"
#import "ArticleContentDataModel.h"


// Inner
@interface ArticleContentDataMapping ()

@property (nonatomic, retain) NSDictionary *serverData;

- (RKObjectMapping *)mappingForImageItem;
- (RKObjectMapping *)mappingForImageItems;
- (RKObjectMapping *)mappingForVideoItem;
- (RKObjectMapping *)mappingForVideoItems;

- (RKObjectMapping *)mappingForArticleContent;

@end


// Implementation
@implementation ArticleContentDataMapping

@synthesize serverData = _serverData;


- (id)initWithServerData:(NSDictionary *)data {
    
    if (nil == data)
        return nil;
    
    if ((self = [super init])) {
        self.serverData = data;
    }
    
    return self;
}


- (void)dealloc {
    
    self.serverData = nil;
    [super dealloc];
}


- (ArticleContentDataModel *)mapArticleContentData {
    
    RKObjectMappingProvider *mappingProvider = [[RKObjectMappingProvider alloc] init];
    [mappingProvider setMapping:[self mappingForArticleContent] forKeyPath:@""];
    
    RKObjectMapper *mapper = [[RKObjectMapper alloc] initWithObject:self.serverData mappingProvider:mappingProvider];
    RKObjectMappingResult *mappingResult = [mapper performMapping];
    
    [mappingProvider release]; mappingProvider = nil;
    [mapper release]; mapper = nil;
    
    return [mappingResult asObject];
}


#pragma -
#pragma mark Inner Mappings


- (RKObjectMapping *)mappingForImageItem {
    
    RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[ImageItemDataModel class]];
    [mapping mapKeyPath:@"ref" toAttribute:@"ref"];
    [mapping mapKeyPath:@"title" toAttribute:@"title"];
    [mapping mapKeyPath:@"fileAbstract" toAttribute:@"fileAbstract"];
    [mapping mapKeyPath:@"imageUrl" toAttribute:@"imageUrl"];
    [mapping mapKeyPath:@"picType" toAttribute:@"picType"];
    
    return mapping;
}


- (RKObjectMapping *)mappingForImageItems {
    
    RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[ImageItemsDataModel class]];
    [mapping mapKeyPath:@"ref" toAttribute:@"ref"];
    [mapping mapKeyPath:@"imagearray" toRelationship:@"imageItems" withMapping:[self mappingForImageItem]];
    
    return mapping;
}


- (RKObjectMapping *)mappingForVideoItem {
    
    RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[VideoItemDataModel class]];
    [mapping mapKeyPath:@"ref" toAttribute:@"ref"];
    [mapping mapKeyPath:@"title" toAttribute:@"title"];
    [mapping mapKeyPath:@"attAbstract" toAttribute:@"attAbstract"];
    [mapping mapKeyPath:@"imageUrl" toAttribute:@"imageUrl"];
    [mapping mapKeyPath:@"videoUrl" toAttribute:@"videoUrl"];
    
    return mapping;
}


- (RKObjectMapping *)mappingForVideoItems {
    
    RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[VideoItemsDataModel class]];
    [mapping mapKeyPath:@"ref" toAttribute:@"ref"];
    [mapping mapKeyPath:@"videoarray" toRelationship:@"videoItems" withMapping:[self mappingForVideoItem]];
    
    return mapping;
}


- (RKObjectMapping *)mappingForArticleContent {
    
    RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[ArticleContentDataModel class]];
    [mapping mapKeyPath:@"fileId" toAttribute:@"fileID"];
    [mapping mapKeyPath:@"version" toAttribute:@"version"];
    [mapping mapKeyPath:@"title" toAttribute:@"title"];
    [mapping mapKeyPath:@"attAbstract" toAttribute:@"attAbstract"];
    [mapping mapKeyPath:@"publishtime" toAttribute:@"publishTime"];
    [mapping mapKeyPath:@"source" toAttribute:@"source"];
    [mapping mapKeyPath:@"author" toAttribute:@"author"];
    [mapping mapKeyPath:@"editor" toAttribute:@"editor"];
    [mapping mapKeyPath:@"subtitle" toAttribute:@"subTitle"];
    [mapping mapKeyPath:@"introtitle" toAttribute:@"introTitle"];
    [mapping mapKeyPath:@"content" toAttribute:@"content"];
    [mapping mapKeyPath:@"commentCount" toAttribute:@"commentCount"];
    [mapping mapKeyPath:@"images" toRelationship:@"images" withMapping:[self mappingForImageItems]];
    [mapping mapKeyPath:@"videos" toRelationship:@"videos" withMapping:[self mappingForVideoItems]];
    
    return mapping;
}

@end
