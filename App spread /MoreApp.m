//
//  MoreApp.m
//  FontDesigner
//
//  Created by chenshun on 13-5-11.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import "MoreApp.h"


@implementation AppDesc
@synthesize icon, name, description, url, appID;

- (void)dealloc
{
    [icon release];
    [name release];
    [description release];
    [url release];
    [super dealloc];
}
@end

@implementation MoreApp
+ (NSArray *)moreApps
{
    NSMutableArray *array = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AppList.plist" ofType:nil];

    NSMutableArray *appArray = [NSMutableArray arrayWithContentsOfFile:path];
    for (int i=0; i<[appArray count]; i++)
    {
        NSDictionary *dic = (NSDictionary *)[appArray objectAtIndex:i];
        AppDesc *app  = [[AppDesc alloc] init];
        app.name = [dic objectForKey:@"name"];
        app.description = [dic objectForKey:@"description"];
        app.icon = [UIImage imageNamed:[dic objectForKey:@"appIcon"]];
        app.url = [dic objectForKey:@"url"];
        app.appID = [[dic objectForKey:@"id"] intValue];
        if (app.icon != nil)
        {
            // 如果是软件自己就不要加进来了
            [array addObject:app];
        }
        
    }
    
    [array sortUsingComparator: ^NSComparisonResult(id obj1, id obj2){
        
        AppDesc *objStr1 = (AppDesc *)obj1;
        AppDesc *objStr2 = (AppDesc *)obj2;
        NSNumber *num1 = [NSNumber numberWithInt:objStr1.appID];
         NSNumber *num2 = [NSNumber numberWithInt:objStr2.appID];
        return [num1 compare:num2];
    }];
    
    return array;
}

@end
