//
//  PokemonRepository.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 21/04/2024.
//

import Foundation
import Combine

public protocol PokemonRepositoryProtocol {
    
    /// A publisher for the current pokemon
    var pokemon: CurrentValueSubject<[Pokemon], Never> { get }
    
    /// Fetch details for all of the pokemon
    /// - Parameters:
    ///   - force: Whether to fetch from network immediately. If set to true, the function will attempt to get details from network.
    ///   If set to false (default) the fetch will check what is in storage first before querying the network.
    func refreshPokemon(force: Bool) async throws
}

public class PokemonRepository: PokemonRepositoryProtocol {

    private let storage: PokemonDataStoreProtocol
    private let service: PokemonServiceProtocol
    
    /// Whether a request from this repository is the first of this session.
    var hasQueriedNetwork = true
    
    public convenience init() {
        let pokemonService = PokemonService()
        let pokemonDataStore = PokemonDataStore()
        
        self.init(service: pokemonService, dataStore: pokemonDataStore)
    }
    
    init(service: PokemonServiceProtocol,
         dataStore: PokemonDataStoreProtocol) {
        self.service = service
        self.storage = dataStore
    }
    
    // MARK: Pokemon
    
    public var pokemon: CurrentValueSubject<[Pokemon], Never> = .init([])
    
    public func refreshPokemon(force: Bool = false) async throws {
        var fetchedPokemon: [Pokemon] = []

        if hasQueriedNetwork && !force {
            if let planner = storage.fetchStoredPokemon() {
                fetchedPokemon = planner
            }
        }

        if fetchedPokemon.isEmpty {
            fetchedPokemon = try await getNetworkPlanner()
        }
        
        pokemon.send(fetchedPokemon)
    }
    
    private func getNetworkPlanner() async throws -> [Pokemon] {
        let pokemon = try await service.fetchPokemon()
        try storage.store(pokemon: pokemon)
        hasQueriedNetwork = true
        return pokemon
    }
}
