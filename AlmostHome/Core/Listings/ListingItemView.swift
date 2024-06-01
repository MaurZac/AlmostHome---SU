//
//  ListingItemView.swift
//  AlmostHome
//
//  Created by Mauricio Zarate Chula on 5/17/24.
//

import SwiftUI

struct ListingItemView: View {
    var images = [
        "listing-1",
        "listing-2",
        "listing-3"
    
    ]
    
    var body: some View {
        VStack(spacing:8){
            //images
            
            ListingImageCarouselView()
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            //listing details
            HStack(alignment: .top){
                //details
                VStack(alignment: .leading){ 
                    Text("CDMX, Mexico")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 m, away ")
                        .foregroundStyle(.gray)
                    
                    Text("May 7 - 24")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4){
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("Night")
                        
                    }
                    
                }
                Spacer()
                //raging
                HStack(spacing:2){
                    Image(systemName:"star.fill")
                    Text("4.85")
                        
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView()
}
