// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

extern "C" {
    #include "nifly_file.hpp"
}

#include "NifFile.hpp"

//struct nifly_file {
//    nifly::NifFile *instance;
//};

extern "C" {

nifly::NifFile* asFile(nifly_file handle) {
    return (nifly::NifFile*) handle;
}

nifly_file nifly_file_new() {
    nifly_file file = new nifly::NifFile();
    return file;
}

void nifly_file_dispose(nifly_file file) {
    delete asFile(file);
}

int nifly_file_load(nifly_file file, const char* path) {
    return asFile(file)->Load(path);
}

int nifly_file_save(nifly_file file, const char* path) {
    return asFile(file)->Save(path);
}

}
