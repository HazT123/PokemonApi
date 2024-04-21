//
//  PokemonView.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 21/04/2024.
//

import SwiftUI

struct PokemonView: View {
    
    let pokemon: Pokemon
    let dimensions: Double = 140
    
    var body: some View {
        VStack {
//            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { image in
//                if let image = image {
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: dimensions, height: dimensions)
//                }
//            } placeholder: {
//                ProgressView()
//                    .frame(width: dimensions, height: dimensions)
//                
//            }
//            .background(.thinMaterial)
//            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
            
        }
    }
}
