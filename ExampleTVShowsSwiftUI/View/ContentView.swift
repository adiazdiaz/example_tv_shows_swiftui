//
//  ContentView.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 14/11/2020.
//

import SwiftUI

struct ContentView: View {
    let mock: Bool?
    
    var body: some View {
        PopularTVShowsView(mock: mock)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(mock: true)
    }
}
