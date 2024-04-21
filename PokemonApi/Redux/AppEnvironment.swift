import Foundation

protocol AppEnvironmentProtocol {
    var featureFlagProvider: FeatureFlagProviding { get }
}

class AppEnvironment: AppEnvironmentProtocol {
    let pokemonProvider: PokemonRepositoryProtocol = PokemonRepository()
}
