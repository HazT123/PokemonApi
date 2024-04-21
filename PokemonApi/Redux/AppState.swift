import Foundation

struct AppState: Equatable {
    
    let viewState: ViewState = .initial
    
    @Published var pokemon: [Pokemon] = []
    @Published var pokemonDetails: DetailPokemon? = nil
    @Published var searchText = ""
    
    // Used with searchText to filter pokemon results
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter { $0.name.contains(searchText.lowercased()) }
    }
    
    // Get the index of a pokemon ( index + 1 = pokemon id)
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        return (pokemon.name.firstIndex(where: {$0 == pokemon}) + 1) ?? 0
    }
    
    // Get specific details for a pokemon
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.pokemonDetails = DetailPokemon(id: 0, height: 0, weight: 0)
        
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }
    
    // Formats the Height or the Weight of a given pokemon
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
}

enum ViewState: Equatable {
    case initial
    case loading
    case done(DoneType)
    
    var isLoading: Bool {
        self == .loading
    }
    
    var isError: Bool {
        if case .done(let doneType) = self {
            return doneType == .error
        }
        return false
    }
}
