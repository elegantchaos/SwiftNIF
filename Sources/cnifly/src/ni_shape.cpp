// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#include "ni_shape_private.hpp"
#include "ni_string_private.hpp"

#include "Nodes.hpp"
#include "BasicTypes.hpp"

ni_string ni_shape_get_name(ni_shape shape) {
    auto string = asShape(shape)->name;
    return string_ref_to_ni_string(string);
}
