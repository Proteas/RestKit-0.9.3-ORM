//
//  RKObjectSerializer.h
//  RestKit
//
//  Created by Blake Watters on 5/2/11.
//  Copyright 2011 Two Toasters. All rights reserved.
//

#import "RKObjectMappingOperation.h"


@class RKObjectMapping;

/**
 Performs a serialization of an object and its relationships back into
 a dictionary representation according to the mappings specified. The
 transformed object is then enclosed in an RKRequestSerializable representation
 that is suitable for inclusion in an RKRequest.
 */
@interface RKObjectSerializer : NSObject <RKObjectMappingOperationDelegate> {
    id _object;
    RKObjectMapping* _mapping;
}

@property (nonatomic, readonly) id object;
@property (nonatomic, readonly) RKObjectMapping* mapping;

+ (id)serializerWithObject:(id)object mapping:(RKObjectMapping*)mapping;
- (id)initWithObject:(id)object mapping:(RKObjectMapping*)mapping;

/**
 Return a serialized representation of the source object by applying an object mapping
 with a target object type of NSMutableDictionary. The serialized object will contain attributes
 and relationships composed of simple KVC compliant Cocoa types.
 */
- (NSMutableDictionary*)serializedObject:(NSError**)error;

/**
 Return a serialized representation of the source object by mapping it into a NSMutableDictionary and
 then encoding it into the destination MIME Type via an instance of RKParser that is registered
 for the specified MIME Type
 */
- (NSString*)serializedObjectForMIMEType:(NSString*)MIMEType error:(NSError**)error;

@end
