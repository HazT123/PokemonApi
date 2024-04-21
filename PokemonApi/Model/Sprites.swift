import Foundation

// MARK: - Sprites

class Sprites {
    var backDefault: String?
    var backFemale: NSNull?
    var backShiny: String?
    var backShinyFemale: NSNull?
    var frontDefault: String?
    var frontFemale: NSNull?
    var frontShiny: String?
    var frontShinyFemale: NSNull?
    var other: Other?
    var versions: Versions?
    var animated: Sprites?

    init(backDefault: String?, backFemale: NSNull?, backShiny: String?, backShinyFemale: NSNull?, frontDefault: String?, frontFemale: NSNull?, frontShiny: String?, frontShinyFemale: NSNull?, other: Other?, versions: Versions?, animated: Sprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.other = other
        self.versions = versions
        self.animated = animated
    }
}
