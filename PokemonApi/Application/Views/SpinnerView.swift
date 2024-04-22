//
//  SpinnerView.swift
//  PokemonApi
//
//  Created by Harry Tomlinson on 22/04/2024.
//

import SwiftUI

struct SpinnerView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .black))
            .scaleEffect(2.0, anchor: .center) // Makes the spinner larger
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    // Simulates a delay in content loading
                    // Perform transition to the next view here
                }
            }
    }
}
