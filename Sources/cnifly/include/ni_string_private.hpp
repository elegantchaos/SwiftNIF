// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 16/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

extern "C" {
#include "ni_string.h"
}

#include "BasicTypes.hpp"

ni_string std_string_to_ni_string(std::string string);
ni_string string_ref_to_ni_string(nifly::NiStringRef string);
