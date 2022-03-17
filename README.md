# SwiftNIF

Swift support for reading/writing NIF files, as used by Skyrim, Fallout and other games based on the Creation / Gamebryo / NetImmerse engines.

## Here Be Dragons
                    
This is currently a very minimal implementation, focussed solely on the features I need first.
                    
## Nifly
                    
Currently this implementation is based on Ousnius' nifly library, which is a clean C++ wrapper around NIF files.

Because Swift-C++ interoperability isn't really a thing right now, I have added a C interface layer to nifly, and then wrapped that with Swift.

                    At some point I might switch to a native Swift implementation.
