//
//  NiflyBridge.c
//  Nifly
//
//  Created by Sam Deane on 15/03/2022.
//

#include <stdio.h>
#import "NifFile.hpp"

extern "C" {
    void niflyTest();

    void niflyTest() {
        nifly::NifFile nf;
        
        printf("blah");
    }
}


