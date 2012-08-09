//
//  AppDelegate.m
//  ORMDemo
//
//  Created by Proteas on 12-8-9.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}


#import "SBJson.h"
#import "ImageItemDataModel.h"
#import "ImageItemsDataModel.h"
#import "VideoItemDataModel.h"
#import "VideoItemsDataModel.h"
#import "ArticleContentDataModel.h"
#import "ArticleContentDataMapping.h"
#import "ImageDataMapping.h"
#import "ImageArrayDataMapping.h"


- (void) test1 {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sample-1" ofType:@"json"];
    NSString *jsonString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSDictionary *tempDict = [jsonString JSONValue];
    
    ArticleContentDataMapping *mapping = [[ArticleContentDataMapping alloc] initWithServerData:tempDict];
    ArticleContentDataModel *model = [mapping mapArticleContentData];
    [mapping release]; mapping = nil;
    
    NSLog(@"%@", model);
}


- (void)test2 {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sample-2" ofType:@"json"];
    NSString *jsonString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSDictionary *tempDict = [jsonString JSONValue];
    
    ImageDataMapping *mapping = [[ImageDataMapping alloc] initWithServerData:tempDict];
    ImageItemDataModel *model = [mapping mapData];
    [mapping release]; mapping = nil;
    
    NSLog(@"%@", model);
}


- (void)test3 {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sample-3" ofType:@"json"];
    NSString *jsonString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSDictionary *tempDict = [jsonString JSONValue];
    
    ImageArrayDataMapping *mapping = [[ImageArrayDataMapping alloc] initWithServerData:tempDict];
    NSArray *model = [mapping mapData];
    [mapping release]; mapping = nil;
    
    NSLog(@"%@", model);
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self test1];
    [self test2];
    [self test3];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
