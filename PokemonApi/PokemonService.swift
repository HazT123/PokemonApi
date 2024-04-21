//
//  PokemonServices.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 21/04/2024.
//

import Foundation

protocol PokemonServiceProtocol {
    func fetchPokemon() async throws -> [Pokemon]
}

class PokemonService: PokemonServiceProtocol {
    
    private let baseUrl = "https://pokeapi.co/api/v2/"
        
    private let pokemonEndpoint = "pokemon?limit=100000&offset=0"
    
    private let decoder = JSONDecoder()
    
    init() {}
    
    @MainActor
    func fetchPokemon() async throws -> [Pokemon] {
        guard let url = URL(string: baseUrl + pokemonEndpoint) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([Pokemon].self, from: data)
    }
}
