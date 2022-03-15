//
//  NiflyTests.swift
//  NiflyTests
//
//  Created by Sam Deane on 15/03/2022.
//

import Nifly
import XCTest

class NiflyTests: XCTestCase {

    func testExample() throws {
        swiftTest()
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testNifFile() {
        let file = NifFile()
        file.test()
    }

}
