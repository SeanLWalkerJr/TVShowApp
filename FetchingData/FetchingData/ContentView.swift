//
//  ContentView.swift
//  FetchingData
//
//  Created by User 1 on 8/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var users = [User]() //SwiftUI will automatically regenerate the body
    var body: some View {
        
        
        List(users) { user in
            ForEach(users){ user in
                Text(user.name)
            }
            
        }.onAppear(perform: {
            let url = URL(string: "https://www.breakingbadapi.com/api/characters")!
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        do{
                            let users = try decoder.decode([User].self, from: data)
                            self.users = users //Take these users I got an assign it to users decalred in the @State var users
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        
                    }
                }
                
            }.resume()
        })

        
                }
}

struct User : Decodable{
    
    var char_id : Int
    var name : String
    var birthday : String
    var occupation : [String]
    var img : String
    var status : String
    var nickname : String
    var appearance : [Int]
    var potrayed : String
    var category : String
    
}

extension User : Identifiable {
    var id : Int {
        return char_id
    }
}

struct Address : Decodable {
    var street : String
    var suite : String
    var city : String
    var zipcode : String
    var geo : Geo
}

struct Geo : Decodable {
    var lat : String
    var lng : String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
