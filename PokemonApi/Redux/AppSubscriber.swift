import Foundation
import ReduxKit
import Combine

let appSubscriber: OnSubscribe<AppStore> = { store in
    
    store.environment.pokemonRepository.pokemon
        .receive(on: RunLoop.main)
        .removeDuplicates()
        .sink { pokemon in
            store.dispatch(.onPokemonRecieved(pokemon))
        }
        .store(in: &store.subscriptions)
}
