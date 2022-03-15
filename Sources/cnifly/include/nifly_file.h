// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

typedef void* nifly_file;
typedef void* ni_node;

nifly_file nifly_file_new();
void nifly_file_dispose(nifly_file);
int nifly_file_load(nifly_file file, const char* path);
int nifly_file_save(nifly_file file, const char* path);
ni_node nifly_file_get_root_node(nifly_file file);
