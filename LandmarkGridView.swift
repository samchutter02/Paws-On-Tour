//
//  LandmarkGridView.swift
//  Paws On Tour
//
//  Created by Sam Chutter on 4/7/25.
//

// Views/LandmarkGridView.swift
import SwiftUI

struct LandmarkGridView: View {
    let landmarks: [Landmark]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], spacing: 16) {
                ForEach(landmarks) { landmark in
                    NavigationLink(destination: LandmarkDetailView(landmark: landmark)) {
                        VStack(spacing: 8) {
                            Image(landmark.images[0].url)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 120) // Fixed size
                                .clipped()
                                .cornerRadius(10)
                            
                            Text(landmark.name)
                                .font(.headline)
                                .foregroundColor(Color(red: 90/255, green: 27/255, blue: 31/255))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                            
                            Text(landmark.location)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .lineLimit(1)
                        }
                        .frame(width: 160, height: 200) // Fixed card size
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
    }
}
