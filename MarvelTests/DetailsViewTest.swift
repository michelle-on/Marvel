//
//  DetaisViewTest.swift
//  MarvelTests
//
//  Created by Michelle Onasanya on 20/10/22.
//

import XCTest
@testable import Marvel

class DetailsViewTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testConfigConstraints() {
        //given
        let detailsViewController = DetailsViewController()
        
        //when
        let view = detailsViewController.view
        view?.setNeedsLayout()
        view?.layoutIfNeeded()
        
        //then
        XCTAssertEqual(detailsViewController.detailView.frame, view?.bounds)
    }
    
    
}
