//
//  File.swift
//  
//
//  Created by Sam Deane on 15/03/2022.
//

@import Foundation;
@import nifly;

#import "ObjCNifly.h"

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
