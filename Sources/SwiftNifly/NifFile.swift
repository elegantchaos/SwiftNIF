// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation
import ObjCNifly

public class NifFile {
    enum Error: Swift.Error {
        case loadFailed(Int)
        case saveFailed(Int)
    }
    
    let file: nifly_file;
    
    public init() {
        file = nifly_file_new()
    }
    
    deinit {
        nifly_file_dispose(file)
    }
    
    public func load(from url: URL) throws {
        let result = nifly_file_load(file, url.path)
        guard result == 0 else {
            throw Error.loadFailed(Int(result))
        }
    }
    
    public func save(to url: URL) throws {
        let result = nifly_file_save(file, url.path)
        guard result == 0 else {
            throw Error.loadFailed(Int(result))
        }
    }
}

