//
//  Favorites.swift
//  Marvel
//
//  Created by Michelle Onasanya on 21/09/22.
//

import Foundation

class Favorites {
    private var characters: Set<String>
    let defaults = UserDefaults.standard

    init(){
        let decoder = PropertyListDecoder()

        if let data = defaults.data(forKey: "Favorites") {
            let charactersData = try? decoder.decode(Set<String>.self, from: data)
            self.characters = charactersData ?? []
            return

        } else {
            self.characters = []
        }
    }

    func getCharactersIds() -> Set<String> {
        return self.characters
    }


    func add(_ character: Character) {
        var characterList = getListFavorite()
        
        guard !characterList.contains(where: { element in
            return character.id == element.id
        }) else {return}
                
        characterList.append(character)
        
        guard let characterListData = try? JSONEncoder().encode(characterList) else {return}
                
        defaults.set(characterListData, forKey: "Favorites")
    }

    func remove(_ character: Character) {
        var characterList = getListFavorite()
        
        guard let index = characterList.firstIndex(where: { element in
            return character.id == element.id
            
        }) else {return}
        
        characterList.remove(at: index)
        
        guard let characterListData = try? JSONEncoder().encode(characterList) else {return}
                
        defaults.set(characterListData, forKey: "Favorites")
    }
    
    func getListFavorite() -> [Character] {
        guard let characterListData = defaults.value(forKey: "Favorites") as? Data else { return [] }
        
        guard let characterList = try? JSONDecoder().decode([Character].self, from: characterListData)
        else {return []}
        
        return characterList
    }
}
