// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftNIF
import XCTest
import XCTestExtensions

class SwiftNIFTests: XCTestCase {

    func testMissingFile() {
        let url = URL(fileURLWithPath: "not_existing.nif")
        let file = NifFile()

        XCTAssertThrowsError(try file.load(from: url))
    }

    func testLoadAndSaveStaticFile() {
        let url = Bundle.module.url(forResource: "TestNifFile_Static_SE", withExtension: "nif")!
        let file = NifFile()

        XCTAssertNoThrow(try file.load(from: url))
        
        let output = outputFile(named: "TestNifFile_Static_SE", extension: "nif")
        XCTAssertNoThrow(try file.save(to: output))
    }

    func testNodes() throws {
        let url = Bundle.module.url(forResource: "TestNifFile_Static_SE", withExtension: "nif")!
        let file = NifFile()
        try file.load(from: url)
        let root = file.root
        XCTAssertNotNil(root)

        file.iterateChildren(root) { node in
            print(node.name)
        }
    }

    func testTree() throws {
        let url = Bundle.module.url(forResource: "TestNifFile_Static_SE", withExtension: "nif")!
        let file = NifFile()
        try file.load(from: url)
        let root = file.root
        XCTAssertNotNil(root)

        file.iterateTree(root) { node in
            print("\(node.kind): \(node.name)")
        }
    }

    func testShapes() throws {
        let url = Bundle.module.url(forResource: "TestNifFile_Static_SE", withExtension: "nif")!
        let file = NifFile()
        try file.load(from: url)
        let root = file.root
        XCTAssertNotNil(root)

        file.iterateShapes { shape in
            print(shape.name)
        }
    }

    /*
     
     
     TEST_CASE("Load and save static file (FO4)", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_Static_FO4";
         const auto [fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load and save skinned file (OB)", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_Skinned_OB";
         const auto [fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load and save skinned file (SE)", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_Skinned_SE";
         const auto [fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load and save skinned, dynamic file (SE)", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_Skinned_Dynamic_SE";
         const auto[fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load and save skinned file (FO4)", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_Skinned_FO4";
         const auto [fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load and save furniture file (SE)", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_Furniture_Col_SE";
         const auto [fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load and save file with loose blocks (SE)", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_LooseBlocks_SE";
         const auto [fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load and save file with multi bound node (SE)", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_MultiBound_SE";
         const auto[fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load and save animated file (LE)", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_Animated_LE";
         const auto [fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load and save file with deep scene graph (SE)", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_DeepGraph_SE";
         const auto [fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load, optimize (LE to SE) and save file", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_Optimize_LE_to_SE";
         const auto [fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         OptOptions options;
         options.targetVersion = NiVersion::getSSE();

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         nif.OptimizeFor(options);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load, optimize (LE to SE, dynamic) and save file", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_Optimize_Dynamic_LE_to_SE";
         const auto[fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         OptOptions options;
         options.targetVersion = NiVersion::getSSE();
         options.headParts = true;

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         nif.OptimizeFor(options);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load, optimize (SE to LE) and save file", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_Optimize_SE_to_LE";
         const auto [fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         OptOptions options;
         options.targetVersion = NiVersion::getSK();

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         nif.OptimizeFor(options);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load and save file with ordered node (SE)", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_OrderedNode_SE";
         const auto [fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         OptOptions options;
         options.targetVersion = NiVersion::getSK();

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     TEST_CASE("Load, optimize (SE to LE, dynamic) and save file", "[NifFile]") {
         constexpr auto fileName = "TestNifFile_Optimize_Dynamic_SE_to_LE";
         const auto[fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);

         OptOptions options;
         options.targetVersion = NiVersion::getSK();
         options.headParts = true;

         NifFile nif;
         REQUIRE(nif.Load(fileInput) == 0);
         nif.OptimizeFor(options);
         REQUIRE(nif.Save(fileOutput) == 0);

         REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
     }

     */
}
