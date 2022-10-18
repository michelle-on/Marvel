//
//  CharacterCellTest.swift
//  MarvelTests
//
//  Created by Michelle Onasanya on 05/10/22.
//

import XCTest
@testable import Marvel


class CharacterCellTest: XCTestCase {

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
    
    func testCharacterFavListIsMatchingWhitFavList() {
        //given
        let charactersCell = CharactersCellViewCode()

        //when
        charactersCell.favorite()
        
        //then
        XCTAssertEqual(charactersCell.charactersList, charactersCell.favorites.getListFavorite())
    }
    
    func testCharacterFavListUpdated() {
        //given
        let charactersCell = CharactersCellViewCode()
        let favorites = Favorites()
        let lastFavList = charactersCell.favorites.getListFavorite()
        guard let character = charactersCell.char else {return}

        //when
        charactersCell.favorite()
        favorites.add(character)
        let favList = charactersCell.favorites.getListFavorite()

        //then
        XCTAssertNotEqual(favList, lastFavList)
    }
    
    func testButtonAddFavorite() {
        //given
        let charactersCell = CharactersCellViewCode()
        let favButton = charactersCell.favoriteButton
        let favList = charactersCell.favorites.getListFavorite()
        guard let character = charactersCell.char else {return}

        //when
        favButton.sendActions(for: .touchUpInside)
        charactersCell.favorites.add(character)

        let favActualList = charactersCell.favorites.getListFavorite()
        
        //then
        XCTAssertNotEqual(favList, favActualList)
    }
    
    func testButtonRemoveFavorite() {
        //given
        let charactersCell = CharactersCellViewCode()
        let favButton = charactersCell.favoriteButton
        let favList = charactersCell.favorites.getListFavorite()
        guard let character = charactersCell.char else {return}

        //when
        favButton.sendActions(for: .touchUpInside)
        charactersCell.favorites.remove(character)

        let favActualList = charactersCell.favorites.getListFavorite()
        
        //then
        XCTAssertNotEqual(favList, favActualList)
    }
    
    func testConfigNameCharacter() {
        //given
        let charactersCell = CharactersCellViewCode()
        guard let character = charactersCell.char else {return}

        //when
        charactersCell.configcell(character)
        
        //then
        XCTAssertEqual(charactersCell.nameLabel.text, character.name)
    }
}


