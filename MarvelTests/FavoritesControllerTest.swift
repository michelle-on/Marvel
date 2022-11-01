//
//  FavoritesTest.swift
//  MarvelTests
//
//  Created by Michelle Onasanya on 07/10/22.
//

import XCTest
@testable import Marvel

class FavoritesControllerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testConfigcontraints() {
        //given
        let favoritesController = FavoritesController()
        
        //when
        let view = favoritesController.view
        view?.setNeedsLayout()
        view?.layoutIfNeeded()
        
        //then
        XCTAssertEqual(favoritesController.homeView.frame, view?.bounds)
    }
    
    func testTableViewAsCharactersCell() {
        //given
        let favoritesController = FavoritesController()
        
        //when
        _ = favoritesController.view
        favoritesController.configTableViewCode()
        
        //then
        XCTAssertEqual(favoritesController.homeView.tableViewView.delegate as? UIViewController, favoritesController)
        XCTAssertEqual(favoritesController.homeView.tableViewView.dataSource as? UIViewController, favoritesController)
        
    }
}
