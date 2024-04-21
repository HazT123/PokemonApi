import Foundation

enum AppAction {
    case fetchPokemon
    case onPokemonRecieved(_ pokemon: [Pokemon])
}
