//
//  ViewController.m
//  shareSDKTest
//
//  Created by lanou on 16/6/21.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

// 导入头文件
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>



#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
}

-(void)connectShareSDKWithType:(SSDKPlatformType ) platformType //注意不用* 枚举
{
    
    
    [SSEThirdPartyLoginHelper loginByPlatform:platformType
                                   onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
                                       
                                       //在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息。
                                       //在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式。将社交用户的uid作为关联ID传入associateHandler。
                                       associateHandler (user.uid, user, user);
                                       NSLog(@"dd%@",user.rawData);
                                       NSLog(@"dd%@",user.credential);
                                       
                                   }
                                onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                    
                                    if (state == SSDKResponseStateSuccess)
                                    {
                                        NSLog(@"登录成功");
                                    }
                                    
                                    else
                                    {
                                        
                                        NSLog(@"登录失败");
                                    }
                                    
                                }];
    
}


- (IBAction)clickSina:(id)sender {
    
    
    [self connectShareSDKWithType:SSDKPlatformTypeSinaWeibo];

    
}

- (IBAction)clickQQ:(id)sender {
    
    [self connectShareSDKWithType:SSDKPlatformTypeQQ];
}

- (IBAction)clickWeChat:(id)sender {
}


@end
