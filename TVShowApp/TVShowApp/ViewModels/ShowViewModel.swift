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
    func fetchTVShows(){
        let url = URL(string: "https://api.tvmaze.com/shows")!
        //The _ means I'm getting a property here that I don't plan to use
        URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                
                if let data = data {//Will only make it in this block if there is data
                    let decoder = JSONDecoder() //Create decoder to decode the data
                    //In our case we want to go from 0's and 1's to a TVShow
                    do {
                        //[TVShow].self, an array of TVShows, .self referring to
                        //the type TVShow in general
                        //Need model (TVSHOW) and data (data)
                        let shows = try decoder.decode([TVShow].self, from: data)
                        DispatchQueue.main.async {
                            self.shows = shows //stores the array of TVShows that were just fetched and decoded
                            }
                        } catch { //If trying to do the above fails, print the error to the screen
                        print(error.localizedDescription)
                    }
                }
            }
        }.resume() //added at the end of URLSessionTask
    }
}
