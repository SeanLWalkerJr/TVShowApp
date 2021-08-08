//
//  TVShowDetailView.swift
//  TVShowApp
//
//  Created by User 1 on 8/8/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct TVShowDetailView: View {
    
    var tvShow : TVShow
    var body: some View {
        ScrollView{
            WebImage(url: tvShow.image.original)
                .resizable()
                .indicator(.activity)
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading){
                Text(tvShow.name)
                    .font(.title)
                //Spacer()
                Text(tvShow.type)
                    .font(.title)
            }
            .padding(.horizontal)
        }
    }
}

//struct TVShowDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TVShowDetailView()
//    }
//}
