//
//  Tests2.m
//  Tests2
//
//  Created by Sam Deane on 15/03/2022.
//

#import <XCTest/XCTest.h>

@import ObjCNifly;

#import "NiflyTest.h"
#import "ObjCNifFile.h"

@interface Tests2 : XCTestCase

@end

@implementation Tests2

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    id test = [NiflyTest new];
    
    id nf = [NifFile new];
}

@end
