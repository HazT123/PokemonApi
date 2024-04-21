import ReduxKit
import SwiftUI

let appReducer: Reducer<AppState, AppAction> = { state, action in

    var newState = state
    
    switch action {
    case .fetchPokemon:
        newState.viewState = .loading
        
    case .onPokemonRecieved(let pokemon):
        newState.pokemon = pokemon
        newState.viewState = .done
        
    }

    return newState
}
