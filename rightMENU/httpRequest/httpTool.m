//
//  httpTool.m
//  DaGuanJia
//
//  Created by 张斌 on 16/11/30.
//  Copyright © 2016年 ck. All rights reserved.
//

#import "httpTool.h"
#import "AFNetworking.h"
@implementation httpTool
/**
 *  封装的get请求
 *
 *  @param str          url
 *  @param dic          🐹
 *  @param successBlock 请求成功的回调
 *  @param failueBlock  请求失败的回调
 */
+ (void)ZBGetNetDataWith:(NSString*)str withDic:(NSDictionary*)dic andSuccess:(void(^)(NSDictionary* dictionary))successBlock  andFailure:(void(^)())failueBlock{

    
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    serializer.removesKeysWithNullValues = YES;
    AFHTTPSessionManager *netManager = [AFHTTPSessionManager manager];
    netManager.requestSerializer     = [AFHTTPRequestSerializer serializer];
    netManager.responseSerializer    = [AFHTTPResponseSerializer serializer];
    netManager.requestSerializer.timeoutInterval=15.0;
    
   
    [netManager GET:str parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if (successBlock) {
            successBlock(dic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failueBlock) {
            failueBlock();
        }
    }];
    
    
    
    
}
/**
 *  封装的post请求
 *
 *  @param str          url
 *  @param dic          参数
 *  @param successBlock 请求成功的回调
 *  @param failueBlock  请求失败的回调
 */

+ (void)ZBPostNetDataWith:(NSString*)str withDic:(NSDictionary*)dic andSuccess:(void(^)(NSDictionary* dictionary))successBlock  andFailure:(void(^)())failueBlock{

    AFHTTPSessionManager *netManager   = [AFHTTPSessionManager manager];
    netManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    netManager.requestSerializer      = [AFHTTPRequestSerializer serializer];
    netManager.responseSerializer     = [AFHTTPResponseSerializer serializer];
    [netManager.requestSerializer setValue:@"iphone" forHTTPHeaderField:@"platform"];
 
    netManager.requestSerializer.timeoutInterval=15.0;
    [netManager POST:[NSString stringWithFormat:@"%@%@",@"",str] parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSString *receiveStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
      
        NSDictionary*dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if (successBlock) {
            successBlock(dict);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failueBlock) {
            if (error.code==-1001) {
//                [EasyShowTextView showText:@"网络请求超时"];
            }
            [self networkStatusChangeAFN];
            failueBlock();
        }
    }];
}

/**
 *  3.图片上传
 */
+(void)postUploadWithUrl:(NSString *)urlStr parameters:(id)parameters fileData:(NSData *)fileData name:(NSString *)name fileName:(NSString *)fileName fileType:(NSString *)fileType success:(void (^)(id responseObject))success fail:(void (^)())fail{
    
    
    AFJSONResponseSerializer *serializer  = [AFJSONResponseSerializer serializer];
    AFHTTPSessionManager *manager       = [AFHTTPSessionManager manager];
    manager.responseSerializer         = serializer;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    manager.requestSerializer.timeoutInterval = 15;
    [manager POST:[NSString stringWithFormat:@"%@%@",@"",urlStr] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:fileData name:name fileName:fileName mimeType:fileType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail();
        }
    }];
    
}
//多张图片一次上传服务器
+(void)postUploadWithUrl:(NSString *)urlStr  uploadImages:(NSArray *)images completion:(void(^)(NSString *url,NSError *error))uploadBlock andPramaDic:(NSDictionary *)paramaDic
{
    
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    AFHTTPSessionManager * manager     = [AFHTTPSessionManager manager];
    manager.responseSerializer        = serializer;
    
    [manager POST:urlStr parameters:paramaDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // 添加一个标记 去分图片名称
        for(NSInteger i = 0; i < images.count; i++)
        {
            UIImage * image = [images objectAtIndex: i];
            // 压缩图片
            
            NSData *data = UIImageJPEGRepresentation(image, 1.0);
            if (data.length>100*1024)
            {
                if (data.length>1024*1024) {//1M以及以上
                    data = UIImageJPEGRepresentation(image, 0.1);
                }else if (data.length>512*1024) {//0.5M-1M
                    data = UIImageJPEGRepresentation(image, 0.5);
                }else if (data.length>200*1024) {//0.25M-0.5M
                    data = UIImageJPEGRepresentation(image, 0.9);
                }
            }
            // 上传的参数名
            NSString *now = [self nowTime:@"yyyyMMddHHmmss"];
            NSString * Name = [NSString stringWithFormat:@"%@%zi",now,i+1];
            // 上传filename
            NSString * fileName = [NSString stringWithFormat:@"%@.jpg", Name];
            
            [formData appendPartWithFileData:data name:Name fileName:fileName mimeType:@"image/jpeg"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
}

+(void)networkStatusChangeAFN
{
    //1.获得一个网络状态监听管理者
    AFNetworkReachabilityManager *manager =  [AFNetworkReachabilityManager sharedManager];

    //2.监听状态的改变(当网络状态改变的时候就会调用该block)
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {

        /*
         AFNetworkReachabilityStatusUnknown          = -1,  未知
         AFNetworkReachabilityStatusNotReachable     = 0,   没有网络
         AFNetworkReachabilityStatusReachableViaWWAN = 1,    3G|4G
         AFNetworkReachabilityStatusReachableViaWiFi = 2,   WIFI
         */
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi");
//                [EasyShowTextView showText:@"网络连接异常,请退出稍后重试!"];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"3G|4G");
                break;
            case AFNetworkReachabilityStatusNotReachable:
//                [EasyShowTextView showText:@"暂无网络连接!请检查网络设置"];
                break;
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                break;

            default:
                break;
        }
    }];

    //3.手动开启 开始监听
    [manager startMonitoring];
}

//获取当前时区的当前时间
+ (NSString*)nowTime:(NSString*)dateType
{
    NSDate * date = [NSDate date];
    NSDateFormatter *dateformat=[[NSDateFormatter alloc] init];
    //[dateformat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateformat setDateFormat:dateType];
    NSString * newDate= [dateformat stringFromDate:date];
    return newDate;
}



@end
