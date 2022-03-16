// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#include "ni_file_private.hpp"
#include "ni_node_private.hpp"
#include "ni_shape_private.hpp"

extern "C" {


ni_file ni_file_new() {
    ni_file file = new nifly::NifFile();
    return file;
}

void ni_file_dispose(ni_file file) {
    delete asFile(file);
}

int ni_file_load(ni_file file, const char* path) {
    return asFile(file)->Load(path);
}

int ni_file_save(ni_file file, const char* path) {
    return asFile(file)->Save(path);
}

ni_node ni_file_get_root_node(ni_file file) {
    return asFile(file)->GetRootNode();
}

void ni_file_iterate_children(ni_file file, ni_node node, const void *const _Nonnull context, ni_node_callback callback) {
    std::vector<uint32_t> indices;
    asNode(node)->GetChildIndices(indices);

    auto hdr = asFile(file)->GetHeader();
    
    for (auto& i : indices) {
        auto child = hdr.GetBlock<nifly::NiObject>(i);
        if (child)
            callback(child, context);
    }
}

void ni_file_iterate_tree(ni_file file, ni_node parent, const void *const _Nonnull context, ni_node_callback callback) {
    std::vector<nifly::NiObject*> objects;
    asFile(file)->GetTree(objects, asNode(parent));
    
    for (auto& object : objects) {
        callback(object, context);
    }
}

void ni_file_iterate_shapes(ni_file file, ni_context context, ni_shape_callback callback) {
    std::vector<nifly::NiShape*> shapes;
    asFile(file)->GetShapes();
    
    for (auto& shape : shapes) {
        callback(shape, context);
    }
}

void ni_file_iterate_partitions(ni_file file, ni_shape shape, ni_context context, ni_partition_callback callback) {
    
    nifly::NiVector<nifly::BSDismemberSkinInstance::PartitionInfo> infos;
    std::vector<int> triParts;
    
    asFile(file)->GetShapePartitions(asShape(shape), infos, triParts);
    for (auto& info : infos) {
        int partition = ((info.flags) << 16) | info.partID;
        callback(partition, context);
    }
}


}

//
//// Gets the partition info and a list of the partitions each triangle is assigned to.
//// A triangle can only be assigned to one partition at the same time.
//// A partition index of -1 in the list means the triangle is currently not assigned to any partition.
//bool GetShapePartitions(NiShape* shape,
//                        NiVector<BSDismemberSkinInstance::PartitionInfo>& partitionInfo,
//                        std::vector<int>& triParts) const;
//
//// Sets the partition info and a list of the partitions each triangle is assigned to.
//// A triangle can only be assigned to one partition at the same time.
//// "convertSkinInstance" will convert a NiSkinInstance to a BSDismemberSkinInstance block.
//void SetShapePartitions(NiShape* shape,
//                        const NiVector<BSDismemberSkinInstance::PartitionInfo>& partitionInfo,
//                        const std::vector<int>& triParts,
//                        const bool convertSkinInstance = true);
//
//// Clears all partitions and assigns all triangles to a default partition slot.
//// Default slot 32 for Skyrim (body) and slot 0 for FO3/NV (torso).
//void SetDefaultPartition(NiShape* shape);
//
//// Delete partitions with the specified indices. partInds must be in sorted ascending order before calling!
//void DeletePartitions(NiShape* shape, std::vector<uint32_t>& partInds);
////const char* _Nonnull  ni_node_get_name(ni_node node) {
////    return asNode(node)->GetBlockName();
////}
////
