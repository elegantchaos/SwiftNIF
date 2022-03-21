// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 16/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

extern "C" {
#include "ni_string.h"
}

#include "BasicTypes.hpp"

inline ni_string asString(nifly::NiStringRef string) {
    return asString(string.get());
}

inline ni_string asString(std::string string) {
    char* buffer = (char*) malloc(string.length() + 1);
    std::strncpy(buffer, string.c_str(), string.length() + 1);
    return (ni_string) buffer;
}
