//
//  TVShow.swift
//  TVShowApp
//
//  Created by User 1 on 8/8/21.
//

import Foundation

struct TVShow : Decodable, Identifiable //Model for TV Objects from online API
{
    var id : Int
    var url : URL //represents the url the user can click to get more info on show
    var name : String
    var type : String
    var language : String
    var genres : [String] //an array that contains the type String
    var status : String
    var officialSite : URL?
    var schedule : Schedule
    var rating : Rating
    var image : TVShowImage
    var summary : String
}
