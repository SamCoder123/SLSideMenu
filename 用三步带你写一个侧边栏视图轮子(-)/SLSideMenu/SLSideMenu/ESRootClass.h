//
//  ESRootClass.h
//  AFNetworking
//
//  Created by halong33 on 16/03/17
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Retdata;

@interface ESRootClass : NSObject

@property (nonatomic, strong) Retdata *retData;

@property (nonatomic, assign) NSInteger errNum;

@property (nonatomic, copy) NSString *retMsg;

@end