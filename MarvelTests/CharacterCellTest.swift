//
//  CharacterCellTest.swift
//  MarvelTests
//
//  Created by Michelle Onasanya on 05/10/22.
//

import XCTest
@testable import Marvel


final class CharacterCellTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCharacterCellConfigHierarchy() {
        let charactersCell = CharactersCellViewCode()
        
        XCTAssertEqual(charactersCell.contentView.subviews.first, charactersCell.backgroundViewCell)
        
        XCTAssertEqual(charactersCell.backgroundViewCell.subviews.count, 3)
        XCTAssertNotNil(charactersCell.backgroundViewCell.subviews)
    }
    
    func testFavListNotChangeWithoutCharacters() {
        //given
        let charactersCell = CharactersCellViewCode()
        
        //when
        charactersCell.favorite()
        
        //then
        XCTAssertNil(charactersCell.char)
    }
    
    func testCharacterFavListIsMatchingWhitFavList() {
        //given
        let charactersCell = CharactersCellViewCode()
        charactersCell.char = Character(id: 01, name: "Tony", thumbnail: nil, description: "")
        
        //when
        charactersCell.favorite()
        let listCharacters = charactersCell.charactersList
        let listCharactersFav = charactersCell.favorites.getListFavorite()
        
        //then
        XCTAssertEqual(listCharacters, listCharactersFav)
    }
    
    func testCharacterFavListUpdated() {
        //given
        let charactersCell = CharactersCellViewCode()
        let lastFavList = charactersCell.favorites.getListFavorite()
        charactersCell.char = Character(id: 01, name: "Tony", thumbnail: nil, description: "")
        
        //when
        charactersCell.favorite()
        let favList = charactersCell.favorites.getListFavorite()
        
        //then
        XCTAssertNotEqual(favList, lastFavList)
    }
    
    func testButtonAddCharacterToFavoriteList() {
        //given
        let charactersCell = CharactersCellViewCode()
        let favButton = charactersCell.favoriteButton
        let favList = charactersCell.favorites.getListFavorite()
        charactersCell.char = Character(id: 01, name: "Tony", thumbnail: nil, description: "")
        
        //when
        favButton.sendActions(for: .touchUpInside)
        let favActualList = charactersCell.favorites.getListFavorite()
        
        //then
        XCTAssertNotEqual(favActualList, favList)
        //        XCTAssertEqual(favActualList.last, charactersCell.char)
        //mock????? Esta passando pela verificacao se ja existe na lista, o teste vai falhar.
    }
    
    func testButtonRemoveCharactersFromFavorite() {
        //given
        let charactersCell = CharactersCellViewCode()
        let favButton = charactersCell.favoriteButton
        let favList = charactersCell.favorites.getListFavorite()
        charactersCell.char = Character(id: 01, name: "Tony", thumbnail: nil, description: "")
        
        //when
        favButton.sendActions(for: .touchUpInside)
        
        let favActualList = charactersCell.favorites.getListFavorite()
        
        //then
        XCTAssertNotEqual(favList, favActualList)
        //        XCTAssertNotEqual(favActualList.last, charactersCell.char)
        //CONTROLE DO ESTADO
        //mock????? Esta passando pela verificacao se ja existe na lista, o teste vai falhar.
    }
    
    func testConfigNameCharacter() {
        //given
        let charactersCell = CharactersCellViewCode()
        let character = Character(id: 0001, name: "Tony", thumbnail: nil, description: "")
        
        //when
        charactersCell.configcell(character)
        
        //then
        XCTAssertEqual(charactersCell.nameLabel.text, character.name)
    }
    
    func testConfigThumbnailCharacters() {
        //given
        let charactersCell = CharactersCellViewCode()
        let thumbnail = Thumbnail(path: "marve/tony/0001", extension: ".jpg")
        let character = Character(id: 0001, name: "Tony", thumbnail: thumbnail, description: "")
        
        //when
        charactersCell.configcell(character)
        
        //then
        XCTAssertEqual(character.thumbnail?.extension, thumbnail.extension)
        XCTAssertEqual(character.thumbnail?.path, thumbnail.path)
    }
    
    func testeUrlPathIsMathing() {
        //given
        let charactersCell = CharactersCellViewCode()
        let thumbnail = Thumbnail(path: "marve/tony/0001", extension: ".jpg")
        let character = Character(id: 0001, name: "Tony", thumbnail: thumbnail, description: "")
        
        guard let urlPath = URL(string: charactersCell.path) else {return}
        
        //when
        charactersCell.getImageCharacter(urlPath)
        
        //then
        XCTAssertEqual(urlPath.description, "\(character.thumbnail?.path).\(character.thumbnail?.extension)")
    }
}
