import Foundation
import ReduxKit

let pokemonMiddleware: Middleware<PokemonState, PokemonAction, PokemonEnvironmentProtocol> = { state, action, environment in

    switch action {

    case .fetchPokemon:
        do {
            try await environment.pokemonRepository.refreshPokemon(force: true)
        } catch {
            return .onPokemonRecieved(nil)
        }
        
    case .onPokemonRecieved:
        break
        
    case .onSelectedPokemon(let pokemon):
        do {
            if let urlString = pokemon.url {
                let pokemonDetails = try await environment.pokemonRepository.getPokemonStats(urlString)
                return PokemonAction.onSelectedPokemonDetailRecieved(pokemonDetails)
            }
        } catch {
            print(error.localizedDescription)
            // TODO: - Handle error
        }
    case .onSelectedPokemonDetailRecieved:
        break
    case .searchPokemon:
        break
    }
    
    return nil
}
