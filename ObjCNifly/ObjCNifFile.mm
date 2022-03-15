// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#import <Foundation/Foundation.h>

#import "ObjCNifFile.h"
#import "NifFile.hpp"

void objcTest() {
    printf("blah");
}

@interface NifFile() {
    nifly::NifFile *file;
}
@end

@implementation NifFile

- (instancetype)init {
    file = new nifly::NifFile();
    
    return self;
}

- (void)dealloc {
    delete file;
}

- (BOOL)load: (NSURL*) url error: (NSError**) error {
    int result = file->Load(url.path.UTF8String);
    BOOL ok = (result == 0);
    if(!ok) {
        *error = [NSError errorWithDomain:@"Nifly" code:result userInfo:nil];
    }
    
    return ok;
}

- (BOOL)save: (NSURL*) url error: (NSError**) error {
    int result = file->Save(url.path.UTF8String);
    BOOL ok = (result == 0);
    if(!ok) {
        *error = [NSError errorWithDomain:@"Nifly" code:result userInfo:nil];
    }
    
    return ok;
}

@end
