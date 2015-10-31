//
//  MoreApp.h
//  FontDesigner
//
//  Created by chenshun on 13-5-11.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDesc : NSObject
{
    NSString *name;
    UIImage *icon;
    NSString *description;
    NSString *url;
    NSInteger appID;
}
@property (nonatomic, assign)NSInteger appID;
@property (nonatomic, copy)NSString *url;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *description;
@property (nonatomic, strong)UIImage *icon;
@end

@interface MoreApp : NSObject
+ (NSArray *)moreApps;
@end
