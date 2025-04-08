//
//  LandmarkListView.swift
//  Paws On Tour
//
//  Created by Sam Chutter on 4/7/25.
//

// Views/LandmarkListView.swift
import SwiftUI

struct LandmarkListView: View {
    let landmarks: [Landmark]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(landmarks) { landmark in
                    NavigationLink(destination: LandmarkDetailView(landmark: landmark)) {
                        HStack(alignment: .top) {
                            Image(landmark.images[0].url)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading) {
                                Text(landmark.name)
                                    .font(.headline)
                                    .foregroundColor(Color(red: 90/255, green: 27/255, blue: 31/255))
                                
                                Text(landmark.location)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Text(landmark.desc)
                                    .font(.body)
                                    .lineLimit(2)
                                    .foregroundColor(.black)
                            }
                            .padding(.vertical)
                            
                            Spacer()
                            
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(red: 90/255, green: 27/255, blue: 31/255))
                                .overlay(Text("\(landmark.order)").foregroundColor(.white).font(.headline))
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 4)
                    }
                }
            }
            .padding()
        }
    }
}
