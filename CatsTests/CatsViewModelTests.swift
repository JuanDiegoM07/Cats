//
//  CatsTests.swift
//  CatsTests
//
//  Created by Juan Diego Marin on 10/11/22.
//

import XCTest
@testable import Cats

class CatsTests: XCTestCase {
    
    // MARK:- Private properties
    private var requestExpectation: XCTestExpectation?
    // MARK:- Subject under test
    private var viewModel: CatsViewModel!
    // MARK: - Mock

    private var repositoryMock: CatsRepositoryMock!
    
    // MARK: - Setup & TearDown
    override func setUp() {
        repositoryMock = CatsRepositoryMock()
        viewModel = CatsViewModel(repository: repositoryMock)
    }

    override func tearDown() {
        viewModel = nil
        repositoryMock = nil
    }
    
    // test
    
    func testGetCats() {
        //Given
        repositoryMock.cat = CatsFake.value
        // When
        getCats()
        // Then
        XCTAssertEqual(requestExpectation?.expectationDescription, ResponseExpectation.ok.rawValue)
    }

}

private extension CatsTests {
    
    // MARK: - getCats
    
    func getCats() {
        requestExpectation = expectation(description: ResponseExpectation.go.rawValue)
        viewModel.success = {
            self.requestExpectation?.expectationDescription = ResponseExpectation.ok.rawValue
            self.requestExpectation?.fulfill()
        }
        viewModel.getCats()
        if let requestExpectation = requestExpectation {
            wait(for: [requestExpectation], timeout: 1)
        }
    }
}
