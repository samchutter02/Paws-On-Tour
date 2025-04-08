//
//  CarouselView.swift
//  Paws On Tour
//
//  Created by Sam Chutter on 4/7/25.
//

// Views/CarouselView.swift
import SwiftUI

struct CarouselView: View {
    let images: [Landmark.LandmarkImage]
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(images.indices, id: \.self) { index in
                    Image(images[index].url)
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 250)
            
            if !images[currentIndex].caption.isEmpty {
                Text(images[currentIndex].caption)
                    .font(.caption)
                    .italic()
                    .padding(5)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(4)
            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(images: landmarksData[1].images)
    }
}
