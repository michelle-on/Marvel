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
    
    /*
     1 - Verificar se a requisição está salvando os personagens na lista
     2 - Verificacao da contrucao de celulas {teste de view?? - viabilidade}
     3 - Verificar se a quantidade que esta salva na lista vai ser exibida na TableView
     */
    

    /*
     Verificando se o numero de personagens corresponde ao numero de celulas da tela
     
     O numero de personagens deve conter o mesmo numero de celulas da TableView
     */
    func testChekingIfNumberCharactersMatchesNumberOfCells() {
        
    }
    
    /*
     Verificando se a requisição está salvando os personagens na lista
     
     A lista de persongaens deve conter o mesmo número de personagens que está no Json.
     */
    func testCheckingIfCharactersAreSavingInList() {
        let viewController = ViewController()
        
        let mockNetwork = MockNetwork()
        viewController.network = mockNetwork
        
        
        
    }
    
    class MockNetwork: Network {
        func dataTask(with url: URL, callback: @escaping (Data?, URLResponse?, Error?) -> Void) {
            
            let charactersList: [Character] = [
                Character(id: 0, name: "Homem Aranha", thumbnail: nil, description: "Teste 12234"),
                Character(id: 1, name: "Homem de Ferro",thumbnail: nil, description: "Teste 1234"),
                Character(id: 2, name: "Hulk", thumbnail: nil, description: "Teste 1234"),
                Character(id: 3, name: "Dr. Strange", thumbnail: nil, description: "Teste 1234"),
                Character(id: 4, name: "Viuva Negra", thumbnail: nil, description: "Teste 1234"),
                Character(id: 5, name: "Pantera Negra",thumbnail: nil, description: "Teste 1234")]
            
            guard let characterListData = try? JSONEncoder().encode(charactersList) else {return}
            
            callback(characterListData, nil, nil)
        }
    }
    
    

}
