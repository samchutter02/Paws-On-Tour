//
//  LandmarkDetailView.swift
//  Paws On Tour
//
//  Created by Sam Chutter on 4/7/25.
//

// Views/LandmarkDetailView.swift


import SwiftUI

struct LandmarkDetailView: View {
    let landmark: Landmark
    var nextLandmark: Landmark? {
        landmarksData.first { $0.order == landmark.order + 1 }
    }
    var prevLandmark: Landmark? {
        landmarksData.first { $0.order == landmark.order - 1 }
    }
    
    var parsedDirections: (destination: String, steps: [String], walkTime: String) {
        let components = landmark.directionToNext.split(separator: ". To get there: ")
        let destination = String(components[0])
        let rest = components.dropFirst().joined(separator: ". ")
        let walkTimeMatch = rest.split(separator: "Approx walk time: ")
        let walkTime = walkTimeMatch.count > 1 ? String(walkTimeMatch[1]) : ""
        let steps = walkTimeMatch[0].split(separator: ", ").map { String($0).trimmingCharacters(in: .whitespaces) }
        return (destination, steps, walkTime)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                CarouselView(images: landmark.images)
                    .frame(height: 300)
                
                Text(landmark.name)
                    .font(.title)
                    .foregroundColor(Color(red: 90/255, green: 27/255, blue: 31/255))
                
                Text("Location: \(landmark.location)")
                    .font(.subheadline)
                
                Text(landmark.desc)
                    .font(.body)
                
                // Directions
                VStack(alignment: .leading, spacing: 10) {
                    Text("NEXT STOP:")
                        .font(.caption)
                        .foregroundColor(Color(red: 92/255, green: 75/255, blue: 46/255)) // --secondary
                    
                    Text(parsedDirections.destination)
                        .font(.headline)
                        .foregroundColor(Color(red: 90/255, green: 27/255, blue: 31/255))
                    
                    ForEach(parsedDirections.steps, id: \.self) { step in
                        HStack(alignment: .top) {
                            Text("•")
                                .foregroundColor(Color(red: 212/255, green: 165/255, blue: 91/255)) // --accent
                            Text(step)
                        }
                    }
                    
                    if !parsedDirections.walkTime.isEmpty {
                        Text("Approximate walk time: \(parsedDirections.walkTime)")
                            .font(.caption)
                            .italic()
                            .foregroundColor(Color(red: 92/255, green: 75/255, blue: 46/255))
                    }
                }
                .padding()
                .background(Color(red: 248/255, green: 249/255, blue: 250/255))
                .cornerRadius(12)
                
                // Navigation buttons
                HStack(spacing: 30) {
                    if let prev = prevLandmark {
                        NavigationLink(destination: LandmarkDetailView(landmark: prev)) {
                            Text("Previous")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(red: 90/255, green: 27/255, blue: 31/255))
                                .cornerRadius(8)
                        }
                    }

                    NavigationLink(destination: ContentView()) {
                        Text("Back to List")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 90/255, green: 27/255, blue: 31/255))
                            .cornerRadius(8)
                    }

                    if let next = nextLandmark {
                        NavigationLink(destination: LandmarkDetailView(landmark: next)) {
                            Text("Next")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(red: 90/255, green: 27/255, blue: 31/255))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.vertical)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkDetailView(landmark: landmarksData[0])
        }
    }
}
