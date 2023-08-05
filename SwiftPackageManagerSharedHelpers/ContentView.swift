//
//  ContentView.swift
//  SwiftPackageManagerSharedHelpers
//
//  Created by Brian Michel on 8/5/23.
//

import App
import SwiftUI

struct ContentView: View {
    let app = App()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
