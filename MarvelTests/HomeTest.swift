//
//  HomeTest.swift
//  MarvelTests
//
//  Created by Michelle Onasanya on 30/09/22.
//

import Foundation
import XCTest
@testable import Marvel

class HomeTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
       /**
            Verificar se a view raiz do ViewController contem uma HomeView
        **/
      func testViewControllerRootViewContainsHomeView() throws {
          // Given
          let viewController = ViewController()
          
         // Then
         XCTAssertNotNil(viewController.view.subviews.first as? HomeViewCode)
      }
    
        func testViewControllerLeftBarButtonItemIsFavButton() throws {
            // Given
            let viewController = ViewController()
    
            XCTAssertNil(viewController.navigationItem.leftBarButtonItem)
    
            // When
            _ = viewController.view
    
            // Then
            XCTAssertEqual(viewController.navigationItem.leftBarButtonItem, viewController.favButton)
        }
    
        func testViewControllerPerformedConfigTableView() throws {
            // Given
            let viewController = ViewController()
    
            XCTAssertNil(viewController.homeView.tableViewView.delegate)
            XCTAssertNil(viewController.homeView.tableViewView.dataSource)
            XCTAssertNil(viewController.homeView.tableViewView.dequeueReusableCell(withIdentifier: "CharactersCell"))
    
            // When
            _ = viewController.view
    
            // Then
            XCTAssertEqual(viewController.homeView.tableViewView.delegate as? UIViewController, viewController)
            XCTAssertEqual(viewController.homeView.tableViewView.dataSource as? UIViewController, viewController)
    
            XCTAssertNotNil(viewController.homeView.tableViewView.dequeueReusableCell(withIdentifier: "CharactersCell") as? CharactersCellViewCode)
        }
    
        func testViewControllerConfigConstraints() throws {
            // Given
            let viewController = ViewController()
    
            XCTAssertTrue(viewController.homeView.frame.isEmpty)
    
            // When
            let view = viewController.view
            view?.setNeedsLayout()
            view?.layoutIfNeeded()
    
            // Then

            XCTAssertFalse(viewController.homeView.frame.isEmpty)
            XCTAssertEqual(viewController.homeView.frame, view?.bounds)
        }
    
        func testViewControllerGetCharactersWithCorrectQueryItems() throws {
            // Given
            let mockNetwork = MockNetwork()
            let viewController = ViewController()
            viewController.network = mockNetwork
    
            // When
            _ = viewController.view
    
            // Then
            let url = try XCTUnwrap(mockNetwork.calledUrl)
            let components = try XCTUnwrap(URLComponents(url: url, resolvingAgainstBaseURL: true))
            XCTAssertEqual(components.queryItems, viewController.queryList)
        }
    
        func testViewControllerGetCharactersWithCorrectCharacters() throws {
            // Given
            let mockNetwork = MockNetwork()
            let viewController = ViewController()
            viewController.network = mockNetwork
    
            XCTAssertEqual(viewController.charactersList.count, 0)
    
            // When
            _ = viewController.view
    
            // Then
//            XCTAssertEqual(viewController.charactersList, mockNetwork.expectedCharactersList)
        }
    
        func testViewControllerGetCharactersUpdatedTableView() throws {
            // Given
            let mockNetwork = MockNetwork()
            let viewController = ViewController()
            viewController.network = mockNetwork
    
            XCTAssertTrue(viewController.homeView.tableViewView.subviews.isEmpty)
    
            // When
            let view = viewController.view
            view?.setNeedsLayout()
            view?.layoutIfNeeded()
    
            // Then
            XCTAssertFalse(viewController.homeView.tableViewView.subviews.isEmpty)
        }
    
    func testCheckingIfCharactersAreSavingInList() {
        let viewController = ViewController()
        
        let mockNetwork = MockNetwork()
        viewController.network = mockNetwork
        
    }
    
    class MockNetwork: Network {
        var calledUrl: URL?

        func dataTask(with url: URL, callback: @escaping (Data?, URLResponse?, Error?) -> Void) {
            
            let expectedCharactersList: [Character] = [
            Character(id: 0, name: "Homem Aranha", thumbnail: nil, description: "Teste 12234"),
            Character(id: 1, name: "Homem de Ferro",thumbnail: nil, description: "Teste 1234"),
            Character(id: 2, name: "Hulk", thumbnail: nil, description: "Teste 1234"),
            Character(id: 3, name: "Dr. Strange", thumbnail: nil, description: "Teste 1234"),
            Character(id: 4, name: "Viuva Negra", thumbnail: nil, description: "Teste 1234"),
            Character(id: 5, name: "Pantera Negra",thumbnail: nil, description: "Teste 1234")]
            
            calledUrl = url
                        
            let results = Results(data: APICharacterData(results: expectedCharactersList))
            guard let characterListData = try? JSONEncoder().encode(results) else {return}
                        
            callback(characterListData, nil, nil)
        }
    }
    
    

}
