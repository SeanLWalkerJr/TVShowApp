//
//  ShowViewModel.swift
//  TVShowApp
//
//  Created by User 1 on 8/8/21.
//

import Foundation

class ShowViewModel : ObservableObject //Creates objects that can be subscribed to.
{
    @Published var shows = [TVShow]() //Whoever subscribes to this, it'll be published
    
    //Responsible for TV Show Fetching
    func fetchTVShow(){
        let url = URL(string: "https://api.tvmaze.com/shows")!
        //The _ means I'm getting a property here that I don't plan to use
        URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let shows = try decoder.decode([TVShow].self, from: data)
                        self.shows = shows
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
