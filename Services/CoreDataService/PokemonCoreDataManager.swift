//
//  PokemonCoreDataManager.swift
//  PokemonTestApp
//
//  Created by Lobster on 11.05.23.
//

import CoreData

typealias CoreDataResultHandler = (Result<PokemonResult, Error>) -> Void

final class PokemonCoreDataManager {
    
    private let coreDataService = PokemonsCoreDataService.shared
    
    func savePokemonList(pokemonListModel: PokemonListModel) {
        let pokemonList = PokemonMapper.map(pokemonListModel)
        let context = coreDataService.context
        context.perform {
            for pokemonResult in pokemonList {
                let newPokemon = PokemonList(context: context)
                newPokemon.name = pokemonResult.name
                newPokemon.url = pokemonResult.url
            }
            self.coreDataService.saveContext()
        }
    }
    
    func getPokemonList(completion: @escaping ([PokemonResult]) -> Void) {
        let request = PokemonList.fetchRequest()
        let pokemonList = try? coreDataService.context.fetch(request)
        guard let pokemonList = pokemonList else { return }
        let pokemons = PokemonMapper.mapCoreData(pokemonList)
        completion(pokemons)
    }
}
