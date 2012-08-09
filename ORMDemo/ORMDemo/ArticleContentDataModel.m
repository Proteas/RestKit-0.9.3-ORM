
#import "ArticleContentDataModel.h"

@implementation ArticleContentDataModel

@synthesize fileID, version, title;
@synthesize attAbstract, publishTime, source;
@synthesize author, subTitle, introTitle;
@synthesize content, commentCount, images;
@synthesize videos, editor;

- (void)dealloc {
    
    self.fileID = nil;
    self.version = nil;
    self.title = nil;
    self.attAbstract = nil;
    self.publishTime = nil;
    self.source = nil;
    self.author = nil;
    self.editor = nil;
    self.subTitle = nil;
    self.introTitle = nil;
    self.content = nil;
    self.commentCount = nil;
    self.images = nil;
    self.videos = nil;
    
    [super dealloc];
}


- (NSString *)description {
    
    NSString *dsp = [NSString stringWithFormat:@"<\
                                                    fileID=%@\
                                                    version=%@\
                                                    title=%@\
                                                    attAbstract=%@\
                                                    publishTime=%@\
                                                    source=%@\
                                                    author=%@\
                                                    editor=%@\
                                                    subTitle=%@\
                                                    introTitle=%@\
                                                    content=\"...\"\
                                                    commentCount=%@\
                                                    images=%@\
                                                    videos=%@\
                                                 >", self.fileID, self.version, self.title,
                                                     self.attAbstract, self.publishTime, self.source,
                                                     self.author, self.editor, self.subTitle, self.introTitle,
                                                     self.commentCount, self.images, self.videos];
    
    return dsp;
}

@end
