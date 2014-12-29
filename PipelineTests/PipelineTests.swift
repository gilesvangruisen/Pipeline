//
//  PipelineTests.swift
//  PipelineTests
//
//  Created by Giles Van Gruisen on 12/29/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

import UIKit
import XCTest
import Pipeline

class PipelineTests: XCTestCase {
    
    func testForwardPipeline() {
        let forwardPipe = 0 --> { $0 + 10 }

        XCTAssert(forwardPipe == 10, "Basic forward pipe passed")
    }

    func testBackwardPipeline() {
        let backwardPipe = { $0 + 10 } <-- 0

        XCTAssert(backwardPipe == 10, "Basic backward pipe passed")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
