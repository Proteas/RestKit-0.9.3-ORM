
#import <Foundation/Foundation.h>
#import "ImageItemDataModel.h"
#import "ImageItemsDataModel.h"
#import "VideoItemDataModel.h"
#import "VideoItemsDataModel.h"

@interface ArticleContentDataModel : NSObject {
    
    NSString *fileID;
    NSString *version;
    NSString *title;
    NSString *attAbstract;
    NSString *publishTime;
    NSString *source;
    NSString *author;
    NSString *editor;
    NSString *subTitle;
    NSString *introTitle;
    NSString *content;
    NSNumber *commentCount;
    
    NSArray *images;
    NSArray *videos;
}

@property (nonatomic, retain) NSString *fileID;
@property (nonatomic, retain) NSString *version;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *attAbstract;
@property (nonatomic, retain) NSString *publishTime;
@property (nonatomic, retain) NSString *source;
@property (nonatomic, retain) NSString *author;
@property (nonatomic, retain) NSString *editor;
@property (nonatomic, retain) NSString *subTitle;
@property (nonatomic, retain) NSString *introTitle;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSNumber *commentCount;
@property (nonatomic, retain) NSArray *images;
@property (nonatomic, retain) NSArray *videos;

@end
