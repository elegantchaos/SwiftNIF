//
//  Nifly.h
//  Nifly
//
//  Created by Sam Deane on 15/03/2022.
//

#import <Foundation/Foundation.h>

@interface NifFile: NSObject {
}

- (BOOL)load: (NSURL*) url error: (NSError**) error;
- (BOOL)save: (NSURL*) url error: (NSError**) error;

@end
