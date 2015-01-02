//
//  VVJSONSchemaErrors.m
//  VVJSONSchemaValidation
//
//  Created by Vlas Voloshin on 29/12/2014.
//  Copyright (c) 2015 Vlas Voloshin. All rights reserved.
//

#import "VVJSONSchemaErrors.h"

NSString * const VVJSONSchemaErrorDomain = @"com.argentumko.JSONSchemaValidationError";
NSString * const VVJSONSchemaErrorFailingObjectKey = @"object";
NSString * const VVJSONSchemaErrorFailingValidatorKey = @"validator";

@implementation NSError (VVJSONSchemaError)

+ (instancetype)vv_JSONSchemaErrorWithCode:(VVJSONSchemaErrorCode)code failingObject:(id)failingObject failingValidator:(id<VVJSONSchemaValidator>)failingValidator
{
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    if (failingObject != nil) {
        userInfo[VVJSONSchemaErrorFailingObjectKey] = failingObject;
    }
    if (failingValidator != nil) {
        userInfo[VVJSONSchemaErrorFailingValidatorKey] = failingValidator;
    }
    
    return [NSError errorWithDomain:VVJSONSchemaErrorDomain code:code userInfo:[userInfo copy]];
}

@end