import Foundation
import PokemonModel
import SwiftUI

struct PokemonState {
    
    var viewState: ViewState = .initial
    
    var searchText = ""
    
    var pokemon: [Pokemon] = []
    var favourites: [Pokemon] = []
    var selectedPokemon: PokemonDetail? = nil
        
    // Used with searchText to filter pokemon results
    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return pokemon
        } else {
            return pokemon.filter { $0.name?.localizedCaseInsensitiveContains(searchText) ?? false }
        }
    }
    
    // Formats the Height or the Weight of a given pokemon
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
    
    var pokemonDetailBackgroundColour: Color {
        switch selectedPokemon?.types?.first?.type?.name {
        case "fire": return .red
        case "poison": return .green
        case "water": return .blue
        case "electric": return .yellow
        case "psychic": return .purple
        case "normal": return .orange
        case "ground": return .gray
        case "flying": return .teal
        case "fairy": return .pink
        default: return .indigo
        }
    }
}

enum ViewState: Equatable {
    case initial
    case loading
    case done
    
    var isLoading: Bool {
        self == .loading
    }
}
