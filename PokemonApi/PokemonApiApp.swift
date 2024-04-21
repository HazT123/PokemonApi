//
//  PokemonApiApp.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 20/04/2024.
//

import SwiftUI

@main
struct PokemonApiApp: App {
    @StateObject private var store: AppStore
    
    init() {
        let appEnvironment = AppEnvironment()
        let store = AppStore(initial: .init(),
                             reducer: appReducer,
                             environment: appEnvironment,
                             middleware: appMiddleware,
                             subscriber: appSubscriber)
        _store = StateObject(wrappedValue: store)
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
