import Foundation
import PokemonModel

enum PokemonAction {
    case fetchPokemon
    case onPokemonRecieved(_ pokemon: [Pokemon]?)
    case onSelectedPokemon(_ pokemon: Pokemon)
    case onSelectedPokemonDetailRecieved(_ detail: PokemonDetail?)
    case searchPokemon(searchText: String)
}
