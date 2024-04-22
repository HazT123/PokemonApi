import ReduxKit
import SwiftUI

let pokemonReducer: Reducer<PokemonState, PokemonAction> = { state, action in

    var newState = state
    
    switch action {
    case .fetchPokemon:
        newState.viewState = .loading
        
    case .onPokemonRecieved(let pokemon):
        newState.pokemon = pokemon ?? []
        newState.viewState = .done
        
    case .onSelectedPokemon:
        newState.viewState = .loading

    case .onSelectedPokemonDetailRecieved(let pokemonDetail):
        newState.viewState = .done
        newState.selectedPokemon = pokemonDetail

    case .searchPokemon(let searchText):
        newState.searchText = searchText
    }

    return newState
}
