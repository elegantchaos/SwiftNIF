//
//  NiflyTests.swift
//  NiflyTests
//
//  Created by Sam Deane on 15/03/2022.
//

import SwiftNifly
import XCTest
import XCTestExtensions

class NiflyTests: XCTestCase {

    func testExample() throws {
        swiftTest()
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testMissingFile() {
        let url = URL(fileURLWithPath: "not_existing.nif")
        let file = NifFile()

        XCTAssertThrowsError(try file.load(url))
    }

    func testLoadAndSaveStaticFile() {
        let url = testURL(named: "TestNifFile_Static_SE", withExtension: "nif")
        let file = NifFile()

        XCTAssertNoThrow(try file.load(url))
        
        let output = outputFile(named: "TestNifFile_Static_SE", extension: "nif")
        XCTAssertNoThrow(try file.save(output))
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
