//
//  Nifly.m
//  Nifly
//
//  Created by Sam Deane on 15/03/2022.
//

#import "Nifly.h"

#import "NifFile.hpp"

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

- (void)test {
    printf("hello from niffile");
}
@end
