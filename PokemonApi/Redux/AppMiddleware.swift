import ReduxKit

let appMiddleware: Middleware<AppState, AppAction, AppEnvironmentProtocol> = { state, action, environment in

    switch action {

    case .fetchPokemon:
        do {
            if let account = environment.accountRepository.accountSubject.value {
                return .onAccountRecieved(account)
            } else {
                let account = try await environment.accountRepository.getAccount()
                return .onAccountRecieved(account)
            }
        } catch {
            return .onAccountRecieved(nil)
        }
        
    case .onPokemonRecieved:
        break
    }
    
    return nil
}
