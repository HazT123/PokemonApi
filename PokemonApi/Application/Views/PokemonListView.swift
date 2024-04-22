//
//  PokemonListView.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 20/04/2024.
//

import SwiftUI
import PokemonModel

enum SearchScope: String, CaseIterable {
    case all, favorites
}

struct PokemonView: View {
    @EnvironmentObject private var store: PokemonStore
    
    @State private var pokemon: [Pokemon] = []
    
    @State private var searchScope = SearchScope.all
    
    var body: some View {
        
        var searchText: Binding<String> = .init {
            store.state.searchText
        } set: {
            store.dispatch(.searchPokemon(searchText: $0))
        }

        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    if store.state.searchText != "" {
                        List {
                            ForEach(store.state.filteredPokemon) { pokemon in
                                NavigationLink {
                                    PokemonDetailView()
                                        .environmentObject(store)
                                        .onAppear {
                                            store.dispatch(.onSelectedPokemon(pokemon))
                                        }
                                } label: {
                                    PokemonItemView(pokemon: pokemon)
                                }
                            }
                        }
                        .listStyle(.plain)
                    } else {
                        Image("homeBackground")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, 
                                   maxHeight: .infinity - geometry.safeAreaInsets.top)
                    }
                }
                .navigationTitle("Pokemon")
            }
        }
        .searchable(text: searchText)
//        .searchScopes($searchScope) {
//            ForEach(SearchScope.allCases, id: \.self) { scope in
//                Text(scope.rawValue.capitalized)
//            }
//        }
        .refreshable {
            try? await store.environment.pokemonRepository.refreshPokemon(force: true)
        }
        .onAppear {
            store.dispatch(.fetchPokemon)
        }
//        .onChange(of: searchScope) { _ in store.dispatch(.searchPokemon(searchText: searchText)) }
    }
}
