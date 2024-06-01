//
//  ExploreView.swift
//  AlmostHome
//
//  Created by Mauricio Zarate Chula on 5/17/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                SearchAndFilterBar()
                LazyVStack(spacing: 16){
                    ForEach(0...10, id: \.self){
                        listing in
                        NavigationLink(value: listing) {
                            ListingItemView()
                                .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .padding()
            }
            .navigationDestination(for: Int.self){
                listing in
                ListingDetailView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    ExploreView()
}
