import Foundation
import PokemonService

protocol PokemonEnvironmentProtocol {
    var pokemonRepository: PokemonRepositoryProtocol { get }
}

class PokemonEnvironment: PokemonEnvironmentProtocol {
    let pokemonRepository: PokemonRepositoryProtocol
    
    init(pokemonRepository: PokemonRepositoryProtocol) {
        self.pokemonRepository = pokemonRepository
    }
}
