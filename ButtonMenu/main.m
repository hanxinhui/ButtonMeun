//
//  main.m
//  ButtonMenu
//
//  Created by 韩新辉 on 2016/11/10.
//  Copyright © 2016年 韩新辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {setenv("OS_ACTIVITY_MODE", "DISABLE", 1);   
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
