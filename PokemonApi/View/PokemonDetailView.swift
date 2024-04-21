//
//  PokemonDetailView.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 21/04/2024.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            
            VStack(spacing: 10) {
//                Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
//                Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) KG")
//                Text("**Height**: \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) M")
                
            }
            .padding()
        }
        .onAppear {
//            vm.getDetails(pokemon: pokemon)
        }
    }
}
