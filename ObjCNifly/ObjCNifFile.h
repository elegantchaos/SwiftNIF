// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#import <Foundation/Foundation.h>

extern "C" {
    void objcTest();
}

extern @interface NifFile : NSObject
- (BOOL)load: (NSURL*) url error: (NSError**) error;
- (BOOL)save: (NSURL*) url error: (NSError**) error;
@end
