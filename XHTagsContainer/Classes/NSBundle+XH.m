//
//  NSBundle+XH.m
//  Pods
//
//  Created by 许焕 on 2020/11/24.
//

#import "NSBundle+XH.h"

@implementation NSBundle (XH)

+ (NSBundle *)xh_bundle{
    Class class = NSClassFromString(@"XHTagsContainer");
    NSString *path = [NSBundle bundleForClass:class].resourcePath;
    path = [path stringByAppendingPathComponent:@"/XHTagsContainer.bundle"];
    return [NSBundle bundleWithPath:path];
}

@end
