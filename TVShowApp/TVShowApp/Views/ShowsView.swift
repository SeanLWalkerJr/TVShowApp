//
//  ContentView.swift
//  TVShowApp
//
//  Created by User 1 on 8/8/21.
//

import SwiftUI

struct ShowsView: View {
    
    @ObservedObject var showViewModel = ShowViewModel() //Can only make an observed object out of something that is an observable object
    
    let columns = [
        GridItem(.flexible(minimum: 108, maximum: 208), spacing: 16),
        GridItem(.flexible(minimum: 108, maximum: 208), spacing: 16),
        GridItem(.flexible(minimum: 108, maximum: 208), spacing: 16)
    ]
    
    
    var body: some View {
        NavigationView{
            ScrollView{//If content exceeds size of screen, create scroll functionality
                //Grid like elements in swift
                //Tell it how many columns you want to display, and what the size of those columns should be
                LazyVGrid(columns: columns, content: {
                    ForEach(showViewModel.shows) { show in //As i fetch these shows
                        //Create a thing
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 150)
                    }
                })
                .padding()
            }
            .navigationTitle("TV Shows")
            .onAppear(perform: {
                showViewModel.fetchTVShows()
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShowsView()
    }
}
