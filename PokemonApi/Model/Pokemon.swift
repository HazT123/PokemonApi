//
//  PokemonResult.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 20/04/2024.
//

import Foundation

public struct PokemonPage: Codable {
    public let count: Int
    public let next: String
    public let results: [Pokemon]
}

public struct Pokemon: Codable, Identifiable, Equatable {
    public var id = UUID()
    public let name: String
    public let url: String
    
    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

public struct DetailPokemon: Codable {
    public let id: Int
    public let height: Int
    public let weight: Int
}
