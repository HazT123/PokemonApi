//
//  PokemonApiApp.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 20/04/2024.
//

import SwiftUI
import PokemonService

@main
struct PokemonApiApp: App {
    
    @StateObject private var store: PokemonStore
    
    public init() {
        let environment = PokemonEnvironment(pokemonRepository: PokemonRepository())
        
        let store = PokemonStore(initial: .init(),
                              reducer: pokemonReducer,
                              environment: environment,
                              middleware: pokemonMiddleware,
                              subscriber: pokemonSubscriber)
        self._store = StateObject(wrappedValue: store)
    }
        
    var body: some Scene {
        WindowGroup {
            PokemonView()
                .environmentObject(store)
        }
    }
}
