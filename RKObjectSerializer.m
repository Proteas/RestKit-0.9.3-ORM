//
//  RKObjectSerializer.m
//  RestKit
//
//  Created by Blake Watters on 5/2/11.
//  Copyright 2011 Two Toasters. All rights reserved.
//

#import "RKObjectSerializer.h"
#import "RKObjectMapping.h"
#import "RKParser.h"
#import "RKParserRegistry.h"


@implementation RKObjectSerializer

@synthesize object = _object;
@synthesize mapping = _mapping;

+ (id)serializerWithObject:(id)object mapping:(RKObjectMapping*)mapping {
    return [[[self alloc] initWithObject:object mapping:mapping] autorelease];
}

- (id)initWithObject:(id)object mapping:(RKObjectMapping*)mapping {
    self = [super init];
    if (self) {
        _object = [object retain];
        _mapping = [mapping retain];
    }
    return self;
}

- (void)dealloc {
    [_object release];
    [_mapping release];
    
    [super dealloc];
}

// Return it serialized into a dictionary
- (id)serializedObject:(NSError**)error {
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    RKObjectMappingOperation* operation = [RKObjectMappingOperation mappingOperationFromObject:_object toObject:dictionary withMapping:_mapping];
    operation.delegate = self;
    BOOL success = [operation performMapping:error];
    if (!success) {
        return nil;
    }
    
    // Optionally enclose the serialized object within a container...
    if (_mapping.rootKeyPath) {
        // TODO: Should log this...
        dictionary = [NSMutableDictionary dictionaryWithObject:dictionary forKey:_mapping.rootKeyPath];
    }
    
    return dictionary;
}

- (id)serializedObjectForMIMEType:(NSString*)MIMEType error:(NSError**)error {
    // TODO: This will fail for form encoded...
    id serializedObject = [self serializedObject:error];
    if (serializedObject) {
        id<RKParser> parser = [[RKParserRegistry sharedRegistry] parserForMIMEType:MIMEType];
        NSString* string = [parser stringFromObject:serializedObject error:error];
        if (string == nil) {
            return nil;
        }
        
        return string;
    }
    
    return nil;
}


#pragma mark - RKObjectMappingOperationDelegate

- (void)objectMappingOperation:(RKObjectMappingOperation *)operation didSetValue:(id)value forKeyPath:(NSString *)keyPath usingMapping:(RKObjectAttributeMapping *)mapping {
    id transformedValue = nil;
    
    if ([value isKindOfClass:[NSDate class]]) {
        // Date's are not natively serializable, must be encoded as a string
        transformedValue = [value description];
    } else if ([value isKindOfClass:[NSDecimalNumber class]]) {
        // Precision numbers are serialized as strings to work around Javascript notation limits
        transformedValue = [(NSDecimalNumber*)value stringValue];        
    }
    
    if (transformedValue) {
        //PrintDebug(@"Serialized %@ value at keyPath to %@ (%@)", NSStringFromClass([value class]), NSStringFromClass([transformedValue class]), value);
        [operation.destinationObject setValue:transformedValue forKey:keyPath];
    }
}

@end
