
#import <Foundation/Foundation.h>


@class ArticleContentDataModel;

@interface ArticleContentDataMapping : NSObject {
    
    NSDictionary *_serverData;
}

- (id)initWithServerData:(NSDictionary *)data;
- (ArticleContentDataModel *)mapArticleContentData;

@end
