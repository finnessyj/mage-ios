//
//  FormDefaults.m
//  MAGE
//
//  Created by William Newman on 2/8/19.
//  Copyright © 2019 National Geospatial Intelligence Agency. All rights reserved.
//

#import "FormDefaults.h"
#import "Event.h"
#import "GeometrySerializer.h"
#import "GeometryDeserializer.h"

@interface FormDefaults()
@property (assign, nonatomic) NSInteger eventId;
@property (assign, nonatomic) NSInteger formId;
@end

@implementation FormDefaults

static NSString *FORM_DEFAULTS_FORMAT = @"EVENT_%ld_FORM_%ld";

- (instancetype) initWithEventId:(NSInteger) eventId formId:(NSInteger) formId {
    if (self = [super init]) {
        self.eventId = eventId;
        self.formId = formId;
    }
    
    return self;
}

- (NSMutableDictionary *) getDefaults {
    NSDictionary *data = [[NSUserDefaults standardUserDefaults] objectForKey:[self formDefaultsKey]];
    
    if (data) {
        NSMutableDictionary *form = [FormDefaults mutableForm:data];
        NSArray *fields = [form objectForKey:@"fields"];
        for (NSMutableDictionary *field in fields) {
            if ([[field objectForKey:@"type"] isEqualToString:@"geometry"]) {
                SFGeometry *geometry = [GeometryDeserializer parseGeometry:[field objectForKey:@"value"]];
                [field setObject:geometry forKey:@"value"];
            }
        }
        
        return form;
    }
    
    return nil;
}

- (NSDictionary *) getDefaultsMap {
    NSDictionary *data = [[NSUserDefaults standardUserDefaults] objectForKey:[self formDefaultsKey]];
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];

    if (data) {
        NSMutableDictionary *form = [FormDefaults mutableForm:data];
        
        for (NSMutableDictionary *field in [form objectForKey:@"fields"]) {
            if ([[field objectForKey:@"type"] isEqualToString:@"geometry"]) {
                id value = [field objectForKey:@"value"];
                if (value) {
                    SFGeometry *geometry = [GeometryDeserializer parseGeometry:value];
                    [field setObject:geometry forKey:@"value"];
                }
            }
            
            [defaults setObject:field forKey:[field objectForKey:@"id"]];
        }
    }
    
    return defaults;
}

- (void) setDefaults:(NSDictionary *) defaults {
    NSMutableDictionary *formDefaults = [NSMutableDictionary dictionaryWithDictionary:defaults];
    NSArray *fields = [formDefaults objectForKey:@"fields"];
    for (NSMutableDictionary *field in fields) {
        if ([[field objectForKey:@"type"] isEqualToString:@"geometry"]) {
            id value = [field objectForKey:@"value"];
            if (value) {
                NSDictionary *geometry = [GeometrySerializer serializeGeometry:value];
                [field setObject:geometry forKey:@"value"];
            }
        }
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:formDefaults forKey:[self formDefaultsKey]];
}

- (void) clearDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:[self formDefaultsKey]];
}

+ (NSMutableDictionary *) mutableForm:(NSDictionary *) form {
    NSData *data = [NSJSONSerialization dataWithJSONObject:form options:NSJSONWritingPrettyPrinted error:nil];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

- (NSString *) formDefaultsKey {
    return [NSString stringWithFormat:FORM_DEFAULTS_FORMAT, self.eventId, self.formId];
}

@end
