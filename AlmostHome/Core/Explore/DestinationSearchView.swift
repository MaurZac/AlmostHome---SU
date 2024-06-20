//
//  DestinationSearchView.swift
//  AlmostHome
//
//  Created by Mauricio Zarate Chula on 6/1/24.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
    case none
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .none
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    var body: some View {
        VStack{
            Button {
                withAnimation {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            
            VStack(alignment:.leading){
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destionation", text: $destination)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }else{
                    CollapsePickerView(title: "Where", description: "Add destionation")
                }
               
            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .location}
            }
            
           
            VStack(alignment: .leading){
                if selectedOption == .dates{
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack{
                        DatePicker(selection: $startDate, in: ...Date.now, displayedComponents: .date) {
                                        Text("Select a date")
                                    }

                                    Text("Date is \(startDate.formatted(date: .long, time: .omitted))")
                               
                        Divider()
                        
                    }
                }else {
                    CollapsePickerView(title: "When", description: "Add dates")
                }
                
            }
            .padding()
            .frame(height: selectedOption == .dates ? 180 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .dates}
            }
            
            VStack{
                if selectedOption == .guests{
                    HStack{
                        Text("Show expanded view")
                        Spacer()
                    }
                }else {
                    CollapsePickerView(title: "Who", description: "Add guests")
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 180 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .guests}
            }
            
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsePickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
