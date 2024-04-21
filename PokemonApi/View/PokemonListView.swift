//
//  PokemonListView.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 20/04/2024.
//

import SwiftUI

enum SearchScope: String, CaseIterable {
    case all, favorites
}

struct HomeView: View {
    @State private var pokemon = [Pokemon]()

    @State private var searchText = ""
    @State private var searchScope = SearchScope.all
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    if searchText != "" {
                        ScrollView {
                            LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                                ForEach(filteredPokemon) { pokemon in
                                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)
                                    ) {
                                        PokemonView(pokemon: pokemon)
                                    }
                                }
                            }
                        }
                    } else {
                        Image("homeBackground")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, 
                                   maxHeight: .infinity - geometry.safeAreaInsets.top)
                    }
                }
                .navigationTitle("PokeDex")
            }
        }
        .searchable(text: $searchText)
        .searchScopes($searchScope) {
            ForEach(SearchScope.allCases, id: \.self) { scope in
                Text(scope.rawValue.capitalized)
            }
        }
        .onAppear(perform: runSearch)
        .onSubmit(of: .search, runSearch)
        .onChange(of: searchScope) { _ in runSearch() }
    }
    
    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return pokemon
        } else {
            return pokemon.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func runSearch() {
        Task {
            guard let url = URL(string: "https://hws.dev/\(searchScope.rawValue).json") else { return }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            pokemon = try JSONDecoder().decode([Pokemon].self, from: data)
        }
    }
}
