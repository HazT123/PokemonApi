//
//  PokemonView.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 21/04/2024.
//

import SwiftUI
import PokemonModel

struct PokemonItemView: View {
    
    @EnvironmentObject private var store: PokemonStore
    
    let pokemon: Pokemon
    
    var body: some View {
        HStack(alignment: .center) {
            Text("\(pokemon.name?.capitalized ?? "")")
                .font(.headline)
                .bold()
                .padding(.horizontal, 15)
            
            Spacer()
            
            AsyncImage(url: URL(string: pokemon.imageUrlString ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
        }
        .frame(maxHeight: 150)
        .frame(maxWidth: .infinity)
    }
}
