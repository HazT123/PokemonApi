//
//  PokemonDetailView.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 21/04/2024.
//

import SwiftUI
import PokemonModel

struct PokemonDetailView: View {
    
    @EnvironmentObject private var store: PokemonStore
    
    @State private var isLoading: Bool = true
    
    private var selectedPokemon: PokemonDetail? {
        store.state.selectedPokemon
    }
    
    var body: some View {
        ZStack {
            if store.state.viewState.isLoading {
                Color.white.overlay {
                    SpinnerView()
                }
            }
            
            store.state.pokemonDetailBackgroundColour
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                //  Image
                AsyncImage(url: URL(string: selectedPokemon?.sprites?.other?.home?.frontDefault ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 350)
                .padding(.horizontal, 20)
                
                // Title
                Text("\(selectedPokemon?.name?.capitalized ?? "")")
                    .font(.title)
                    .bold()
                
                // Stats
                Text("**ID**: \(store.state.selectedPokemon?.id ?? 0)")
                Text("**Weight**: \(store.state.formatHW(value: selectedPokemon?.weight ?? 0)) KG")
                Text("**Height**: \(store.state.formatHW(value: selectedPokemon?.height ?? 0)) M")
                
                Spacer()
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        }
        .onDisappear {
            store.dispatch(.onSelectedPokemonDetailRecieved(nil))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: AccessibleBackButton())
    }
}

struct AccessibleBackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                Text("Back")
            }
            .foregroundStyle(.white)
        }
    }
}
