//
//  PokemonDataStore.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 21/04/2024.
//

import Foundation

protocol PokemonDataStoreProtocol {
    func store(pokemon: [Pokemon]) throws
    func fetchStoredPokemon() -> [Pokemon]?
}

class PokemonDataStore: PokemonDataStoreProtocol {
    
    private struct StorageKeys {
        static let pokemon = "pokemon"
    }
    
    private let encoder: JSONEncoder = JSONEncoder()
    private let decoder: JSONDecoder = JSONDecoder()
    
    // MARK: Fetch
    
    func fetchStoredPokemon() -> [Pokemon]? {
        if let data = UserDefaults.standard.data(forKey: StorageKeys.pokemon) {
            if let decoded = try? JSONDecoder().decode([Pokemon].self, from: data) {
                return decoded
            }
        }
        return nil
    }
    
    // MARK: Store
    
    func store(pokemon: [Pokemon]) throws {
        try store(key: StorageKeys.pokemon, value: pokemon)
    }
    
    private func store<ValueType: Codable>(key: String, value: ValueType) throws {
        UserDefaults.standard.set(value, forKey: key)
    }
}
