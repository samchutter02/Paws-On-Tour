//
//  Landmark.swift
//  Paws On Tour
//
//  Created by Sam Chutter on 4/7/25.
//

// Models/Landmark.swift
// Models/Landmark.swift
import Foundation
import CoreLocation

struct Landmark: Identifiable, Codable {
    let id = UUID()
    let name: String
    let location: String
    let desc: String
    let directionToNext: String
    let images: [LandmarkImage]
    let order: Int
    let lat: Double
    let lon: Double
    
    struct LandmarkImage: Identifiable, Codable {
        let id = UUID()
        let url: String // Image name in Assets.xcassets
        let caption: String
    }
}

let landmarksData: [Landmark] = [
    Landmark(
        name: "Harris Dining Hall",
        location: "West Campus",
        desc: "Texas State's biggest dining hall. Harris offers breakfast, lunch and dinner, with multiple buffet lines open all featuring different cuisine.",
        directionToNext: "GLADE AMPHITHEATER. To get there: Exit Harris and head left along the path towards Bexar Hall. Continue towards Bexar Hall down Academy St. Turn right at Bexar Hall and continue straight to the end of the parking lot. Turn left and go down the staircase. The amphitheater will be visible straight ahead on your left. Mostly downhill. Approx walk time: 3 mins.",
        images: [Landmark.LandmarkImage(url: "harris", caption: "Main eating area")],
        order: 1,
        lat: 29.8881,
        lon: -97.95118
    ),
    Landmark(
        name: "Glade Amphitheater",
        location: "West Campus",
        desc: "Now abandoned (and occasionally used), this amphitheater was once home to band practices and outdoor theatrical performances. Check out the hidden treehouse, too!",
        directionToNext: "STUDENT REC CENTER. To get there: Head back up towards Bexar Hall along the same path you took to get to the amphitheatre and turn right once you climb the staircase. Continue straight along Academy St. to the Student Rec Center. Mostly uphill. Approx walk time: 5 mins.",
        images: [
            Landmark.LandmarkImage(url: "gladeone", caption: "Abandoned parking lot area"),
            Landmark.LandmarkImage(url: "gladetwo", caption: "Abandoned tree house"),
            Landmark.LandmarkImage(url: "gladethree", caption: "Old seating section"),
            Landmark.LandmarkImage(url: "gladefour", caption: "Abandoned amphitheater")
        ],
        order: 2,
        lat: 29.88652,
        lon: -97.95006
    ),
    Landmark(
        name: "Student Rec Center",
        location: "West Campus",
        desc: "Featuring four indoor basketball/volleyball courts, an indoor 1/4 mile track, and more machines and squat racks than you can imagine, the Student Rec Center is where a lot of TXST students come to workout and unwind after a long day. Swing by Shake Smart on the way out and get a delicious protein shake with Bobcat Bucks!",
        directionToNext: "LBJ Student CENTER. To get there: Head east down W Sessom Dr. and turn right on N Commanche St. Turn left on Student Center Dr. Continue Straigt. The LBJ Student Center will be on your right. Mostly flat. Approx walk time: 10 mins.",
        images: [
            Landmark.LandmarkImage(url: "recone", caption: "Main entrance"),
            Landmark.LandmarkImage(url: "rectwo", caption: "Free weights"),
            Landmark.LandmarkImage(url: "recthree", caption: "One of four basketball courts"),
            Landmark.LandmarkImage(url: "recfour", caption: "Indoor quarter-mile track"),
            Landmark.LandmarkImage(url: "recfive", caption: "Front of Student Rec Center")
        ],
        order: 3,
        lat: 29.88876,
        lon: -97.95103
    ),
    Landmark(
        name: "LBJ Student Center",
        location: "Central Campus",
        desc: "This is the main hub on campus. Most buses drop off/pick up students here, and it is also home to Chick-fil-A, Tu Taco, and even more restaurants! Check out the first floor and see George's, a billiards lounge where students can also socialize and study.",
        directionToNext: "THE MALL. To get there: Head through the front entrance of the LBJ Student Center by the busses and go down the main stairs to the second floor. Walk straight out the back doors. Go down the steps and you'll arrive at The Mall. Mostly downhill. Approx walk time: 1 min.",
        images: [
            Landmark.LandmarkImage(url: "lbjone", caption: "Main entrance, second floor"),
            Landmark.LandmarkImage(url: "lbjtwo", caption: "Main entrance, second floor"),
            Landmark.LandmarkImage(url: "lbjthree", caption: "Dining area, second floor"),
            Landmark.LandmarkImage(url: "lbjfour", caption: "Dining area, first floor"),
            Landmark.LandmarkImage(url: "lbjfive", caption: "Dining area, first floor outside"),
            Landmark.LandmarkImage(url: "lbjsix", caption: "Main entrance, first floor")
        ],
        order: 4,
        lat: 29.8893,
        lon: -97.94399
    ),
    Landmark(
        name: "The Mall",
        location: "Central Campus",
        desc: "Located by LBJ Student Center and the center of campus, you'll most likely walk through this area every day. Here you'll often see farmers markets or fraternities/sororities hosting events.",
        directionToNext: "ALKEK LIBRARY. To get there: Head down the LBJ stairs and turn left towards Alkek Library. Mostly downhill. Approx walk time: 2 mins.",
        images: [
            Landmark.LandmarkImage(url: "mallone", caption: "The Mall, facing away from LBJ SC"),
            Landmark.LandmarkImage(url: "malltwo", caption: "The Mall, facing towards LBJ SC")
        ],
        order: 5,
        lat: 29.88872,
        lon: -97.94398
    ),
    Landmark(
        name: "Alkek Library",
        location: "Central Campus",
        desc: "Home to the Wittliff Collections and study resources.",
        directionToNext: "JONES DINING HALL. To get there: Exit Alkek and head left down the long staircase towards Jones Dining Hall. Approx walk time: 2 mins.",
        images: [
            Landmark.LandmarkImage(url: "alkekone", caption: "Alkek Library - front"),
            Landmark.LandmarkImage(url: "alkektwo", caption: "Alkek Library - back"),
            Landmark.LandmarkImage(url: "alkekthree", caption: "Alkek One, - Makerspace"),
            Landmark.LandmarkImage(url: "alkekfour", caption: "Alkek second floor - Starbucks"),
            Landmark.LandmarkImage(url: "alkekfive", caption: "Alkek, second floor"),
            Landmark.LandmarkImage(url: "alkeksix", caption: "The Witliff Collections")
        ],
        order: 6,
        lat: 29.88878,
        lon: -97.94314
    ),
    Landmark(
        name: "Jones Dining Hall",
        location: "South-Central Campus",
        desc: "One of TXST's dining halls, featuring six different restaurants to choose from.",
        directionToNext: "THE QUAD. To get there: Exit Jones from the Fruiteria restaurant side and head left towards Alkek library. Turn right by Derrick hall follow the wide open path towards Old Main. This is the Quad. Mostly flat. Approx walk time: 3 mins.",
        images: [
            Landmark.LandmarkImage(url: "jonesone", caption: "Jones Dining Hall - front"),
            Landmark.LandmarkImage(url: "jonestwo", caption: "Front entrance"),
            Landmark.LandmarkImage(url: "jonesthree", caption: "Front side of Jones"),
            Landmark.LandmarkImage(url: "jonesfour", caption: "Back side of Jones"),
            Landmark.LandmarkImage(url: "jonesfive", caption: "Back side of Jones"),
            Landmark.LandmarkImage(url: "jonessix", caption: "Outside seating area")
        ],
        order: 7,
        lat: 29.88767,
        lon: -97.94314
    ),
    Landmark(
        name: "The Quad",
        location: "Central Campus",
        desc: "The busiest hub of student activity on campus.",
        directionToNext: "BOBCAT STATUE. To get there: Head down the Quad towards Old Main. Turn left down the short path when you see the Bobcat statue. Mostly flat. Approx walk time: 2 mins.",
        images: [
            Landmark.LandmarkImage(url: "quadone", caption: "The Quad - by Alkek Library"),
            Landmark.LandmarkImage(url: "quadtwo", caption: "The Quad - by Old Main")
        ],
        order: 8,
        lat: 29.88911,
        lon: -97.94142
    ),
    Landmark(
        name: "Bobcat Statue",
        location: "North-Central Campus",
        desc: "Famous statue of a bobcat chasing its prey.",
        directionToNext: "TMH BUILDING COURTYARD. To get there: Head back towards Alkek library. The TMH building will be not too far down the Quad on your right. Enter the building to see the courtyard. Mostly flat. Approx walk time: 1 min.",
        images: [
            Landmark.LandmarkImage(url: "bobcat", caption: "Bobcat Statue")
        ],
        order: 9,
        lat: 29.88912,
        lon: -97.94105
    ),
    Landmark(
        name: "TMH Building Courtyard",
        location: "North-Central Campus",
        desc: "This courtyard features beautiful terracotta tiles and a serene landscape. This is definitely a beautiful place to study before your exams!",
        directionToNext: "LBJ STATUE. To get there: Head down the Quad towards Old Main. You will see the LBJ statue front and center. Mostly flat. Approx walk time: 2 mins.",
        images: [
            Landmark.LandmarkImage(url: "tmhone", caption: "First floor"),
            Landmark.LandmarkImage(url: "tmhtwo", caption: "Second floor")
        ],
        order: 10,
        lat: 29.88951,
        lon: -97.94161
    ),
    Landmark(
        name: "LBJ Statue",
        location: "North-Central Campus",
        desc: "Famous statue of President Lyndon B. Johnson. Traditionally, students shake LBJ's hand before their exams for good luck!",
        directionToNext: "OLD MAIN. To get there: Head straight up the stairs towards Old Main. Entirely uphill. Approx walk time: 1 min.",
        images: [
            Landmark.LandmarkImage(url: "statueone", caption: "LBJ Statue"),
            Landmark.LandmarkImage(url: "statuetwo", caption: "Traditional good luck student handshake")
        ],
        order: 11,
        lat: 29.88923,
        lon: -97.94034
    ),
    Landmark(
        name: "Old Main",
        location: "Hilltop",
        desc: "The iconic red-roofed building from 1903.",
        directionToNext: "COMMONS DINING HALL. To get there: Exit Old Main through the front doors and turn left. Follow the steep staircase towards Commons Dining Hall. Turn right and walk up the main path. Commons Dining Hall will be on your right. Uphill and downhill. Approx walk time: 3 mins.",
        images: [
            Landmark.LandmarkImage(url: "oldmain", caption: "Main entrance")
        ],
        order: 12,
        lat: 29.88938,
        lon: -97.9389
    ),
    Landmark(
        name: "Commons Dining Hall",
        location: "Central Campus",
        desc: "Another one of Texas State's dining halls. Similar to Harris Dining Hall, Commons serves multiple buffet lines daily, all featuring different cuisine.",
        directionToNext: "THE DEN. To get there: Exit Commons Dining Hall and turn right. Continue straight and The Entrance to The Den will be through the sliding doors on your right. Mostly downhill. Approx walk time: 2 mins.",
        images: [
            Landmark.LandmarkImage(url: "commonsone", caption: "Main entrance"),
            Landmark.LandmarkImage(url: "commonstwo", caption: "Inside main entrance"),
            Landmark.LandmarkImage(url: "commonsthree", caption: "Dining area")
        ],
        order: 13,
        lat: 29.88812,
        lon: -97.94024
    ),
    Landmark(
        name: "The Den",
        location: "East Campus",
        desc: "The third and final dining hall at Texas State. This dining hall offers different restaurant's as well as a bubble tea lounge. Upstairs, you can find Einstein Bagels.",
        directionToNext: "THE HAMMOCKS. To get there: Go back up the steep staircase towards Old Main. Climb it the steps and walk past Old Main. Continue straight and follow the steps down. Search for the hammocks and if you find them - relax! Uphill and downhill. Approx walk time: 5 mins.",
        images: [
            Landmark.LandmarkImage(url: "denone", caption: "Front side of The Den"),
            Landmark.LandmarkImage(url: "dentwo", caption: "Outdoor dining area"),
            Landmark.LandmarkImage(url: "denthree", caption: "Inside front entrance")
        ],
        order: 14,
        lat: 29.88864,
        lon: -97.93912
    ),
    Landmark(
        name: "The Hammocks",
        location: "East Campus",
        desc: "If you can manage to find these hidden hammocks beneath the overgrown vines of the agriculture building, you'll have trouble getting yourself to leave!",
        directionToNext: "SEWELL PARK. To get there: Head down Sessom Dr. towards Sewell Park. Mostly downhill. Approx walk time: 12 mins.",
        images: [
            Landmark.LandmarkImage(url: "hammockstwo", caption: "The Hammocks"),
            Landmark.LandmarkImage(url: "hammocksthree", caption: "The Hammocks"),
            Landmark.LandmarkImage(url: "hammocksone", caption: "Surrounding garden area")
        ],
        order: 15,
        lat: 29.89049,
        lon: -97.93856
    ),
    Landmark(
        name: "Sewell Park",
        location: "Riverfront",
        desc: "A relaxing spot along the San Marcos River.",
        directionToNext: "BOBCAT STADIUM. To get there: Head northeast along Aquarena Springs Dr. towards Bobcat Stadium. Mostly uphill. Approx walk time: 10 mins.",
        images: [
            Landmark.LandmarkImage(url: "sewell", caption: "Bikini Hill")
        ],
        order: 16,
        lat: 29.8887,
        lon: -97.93376
    ),
    Landmark(
        name: "Bobcat Stadium",
        location: "North Campus",
        desc: "The heart of athletics at Texas State.",
        directionToNext: "THE MEADOWS CENTER. To get there: Head northwest along Sessom Dr. and turn right on the street to The Meadows Center. Mostly uphill. Approx walk time: 10 mins.",
        images: [
            Landmark.LandmarkImage(url: "stadium", caption: "TXST football field")
        ],
        order: 17,
        lat: 29.89118,
        lon: -97.92556
    ),
    Landmark(
        name: "The Meadows Center",
        location: "Riverfront",
        desc: "Located slightly North-East off campus, The Meadows Center offers free information about the local ecosystem and its fragility. Catch a glass-bottom boat tour and see the beautiful San Marcos River in all its glory! Sometimes, you can even see divers cleaning the river's bed during the tours.",
        directionToNext: "This concludes the tour! Head back to campus via Aquarena Springs Dr.",
        images: [
            Landmark.LandmarkImage(url: "meadow", caption: "Glass bottom boat tour area")
        ],
        order: 18,
        lat: 29.89403,
        lon: -97.92976
    )
]
