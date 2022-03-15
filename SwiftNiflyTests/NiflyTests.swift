//
//  NiflyTests.swift
//  NiflyTests
//
//  Created by Sam Deane on 15/03/2022.
//

import Nifly
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
    
//    TEST_CASE("Load and save static file (SE)", "[NifFile]") {
//        constexpr auto fileName = "TestNifFile_Static_SE";
//        const auto [fileInput, fileOutput, fileExpected] = GetNifFileTuple(fileName);
//
//        NifFile nif;
//        REQUIRE(nif.Load(fileInput) == 0);
//        REQUIRE(nif.Save(fileOutput) == 0);
//
//        REQUIRE(CompareBinaryFiles(fileOutput, fileExpected));
//    }
}
