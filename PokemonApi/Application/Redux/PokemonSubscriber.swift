import Foundation
import ReduxKit
import Combine

let pokemonSubscriber: OnSubscribe<PokemonStore> = { store in
    
    store.environment.pokemonRepository.pokemon
        .receive(on: RunLoop.main)
        .removeDuplicates()
        .filter{!$0.isEmpty}
        .sink { pokemon in
            store.dispatch(.onPokemonRecieved(pokemon))
        }
        .store(in: &store.subscriptions)
}
