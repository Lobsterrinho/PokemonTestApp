//
//  PokemonCoreDataManager.swift
//  PokemonTestApp
//
//  Created by Lobster on 11.05.23.
//

import CoreData

final class PokemonCoreDataManager: CoreDataManagerProtocol {
    
    let coreData: PokemonsCoreDataService
    
    init(coreData: PokemonsCoreDataService) {
        self.coreData = coreData
    }
    
    func savePokemonList(pokemonListModel: PokemonListModel) {
        let pokemonList = PokemonMapper.map(pokemonListModel)
        let context = coreData.context
        context.perform {
            for pokemonResult in pokemonList {
                let newPokemon = PokemonList(context: context)
                newPokemon.name = pokemonResult.name
                newPokemon.url = pokemonResult.url
            }
            self.coreData.saveContext()
        }
    }
    
    func getPokemonList(completion: @escaping ([PokemonResult]) -> Void) {
        let request = PokemonList.fetchRequest()
        let pokemonList = try? coreData.context.fetch(request)
        guard let pokemonList = pokemonList else { return }
        let pokemons = PokemonMapper.mapCoreData(pokemonList)
        completion(pokemons)
    }
}
