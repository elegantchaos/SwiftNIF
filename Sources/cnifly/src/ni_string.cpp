// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 16/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#include <cstdio>

#include "ni_string_private.hpp"

ni_string std_string_to_ni_string(std::string string) {
    char* buffer = (char*) malloc(string.length() + 1);
    std::strncpy(buffer, string.c_str(), string.length() + 1);
    return (ni_string) buffer;
}

ni_string string_ref_to_ni_string(nifly::NiStringRef string) {
    return std_string_to_ni_string(string.get());
}

const char* _Nonnull ni_string_chars(ni_string string) {
    return (char*)string;
}

void ni_string_free(ni_string string) {
    free(string);
}

