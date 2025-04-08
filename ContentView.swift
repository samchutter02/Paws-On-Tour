//
//  ContentView.swift
//  Paws On Tour
//
//  Created by Sam Chutter on 4/7/25.
//


// Views/ContentView.swift
import SwiftUI

struct ContentView: View {
    @State private var searchQuery = ""
    @State private var sortCriteria = "order"
    @State private var viewMode = "grid" // "grid" or "list"
    
    var filteredLandmarks: [Landmark] {
        landmarksData
            .filter { landmark in
                searchQuery.isEmpty ||
                landmark.name.lowercased().contains(searchQuery.lowercased()) ||
                landmark.location.lowercased().contains(searchQuery.lowercased())
            }
            .sorted { a, b in
                switch sortCriteria {
                case "name": return a.name < b.name
                case "location": return a.location < b.location
                default: return a.order < b.order // "order"
                }
            }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Map at the top
                    MapView(landmarks: landmarksData)
                        .frame(height: 200)
                        .cornerRadius(12)
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        .shadow(color: Color.black.opacity(0.1), radius: 4)
                    
                    // Controls
                    VStack(spacing: 16) {
                        TextField("Search landmarks...", text: $searchQuery)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 16)
                            .submitLabel(.search)
                        
                        Picker("Sort by", selection: $sortCriteria) {
                            Text("Walking Order").tag("order")
                            Text("Name A-Z").tag("name")
                            Text("Location").tag("location")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal, 16)
                        
                        Button(action: { viewMode = viewMode == "grid" ? "list" : "grid" }) {
                            Text(viewMode == "grid" ? "Switch to List" : "Switch to Grid")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color(red: 90/255, green: 27/255, blue: 31/255))
                                .cornerRadius(10)
                                .shadow(radius: 2)
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    // Grid/List
                    if viewMode == "grid" {
                        LandmarkGridView(landmarks: filteredLandmarks)
                    } else {
                        LandmarkListView(landmarks: filteredLandmarks)
                    }
                }
            }
            .navigationTitle("Paws On Tour")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
