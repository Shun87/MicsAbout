//
//  MoreApp.m
//  FontDesigner
//
//  Created by chenshun on 13-5-11.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import "MoreApp.h"


@implementation AppDesc
@synthesize icon, name, description, url;

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
        [array addObject:app];
    }
    
    return array;
}

@end
