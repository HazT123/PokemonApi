import Foundation

// MARK: - PokemonDetail

struct PokemonDetail {
    var abilities: [Ability]?
    var baseExperience: Int?
    var cries: Cries?
    var forms: [Species]?
    var gameIndices: [GameIndex]?
    var height: Int?
    var heldItems: [HeldItem]?
    var id: Int?
    var isDefault: Bool?
    var locationAreaEncounters: String?
    var moves: [Move]?
    var name: String?
    var order: Int?
    var pastAbilities, pastTypes: [Any?]?
    var species: Species?
    var sprites: Sprites?
    var stats: [Stat]?
    var types: [TypeElement]?
    var weight: Int?
}
