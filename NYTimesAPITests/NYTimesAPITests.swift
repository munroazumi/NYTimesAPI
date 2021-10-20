//
//  NYTimesAPITests.swift
//  NYTimesAPITests
//
//  Created by Munro Azumi on 10/15/21.
//

import XCTest
@testable import NYTimesAPI

class NYTimesAPITests: XCTestCase {
    
    var avm: ArticleViewModel?

    override func setUpWithError() throws {
        avm = ArticleViewModel()
    }

    override func tearDownWithError() throws {
        avm = nil
    }

    func testViewModel() throws {
        let expectation = self.expectation(description: "testing")
        var articles: [Article]?
        avm?.get {
            articles = self.avm?.getArray()
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10000) { error in
            let articleCount = articles?.count ?? -1
            XCTAssertGreaterThan(articleCount, 0)
        }
    }

    func testAPI() throws {
        let expectation = self.expectation(description: "also testing")
        var articles: [Article]?
        APIHandler.shared.get(url: URL(string: Constant.NYTIMES_URL.rawValue)!) { response, err in
            let articleResult = response
            articles = articleResult?.results
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10000) { error in
            let articleCount = articles?.count ?? -1
            XCTAssertGreaterThan(articleCount, 0)
        }
    }

}
