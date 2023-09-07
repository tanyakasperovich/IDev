//
//  RoadMapViewModel.swift
//  IDev
//
//  Created by Татьяна Касперович on 6.09.23.
//

import SwiftUI

class RoadMapViewModel: ObservableObject {
    
    @Published var selectedCategory: CategoriesBlock_2 = .noCategory
    @Published var selectedColor: Color = .accentColor

    
    @Published var levels: [Level] = [
        
        Level(title: "Level 1", isSelect: false ,categories: []),
        
        Level(title: "Level 2", isSelect: false ,categories: [
            Category(title: "Swift", subTitle: "Swift Road Map", description: "", color: .theme.orangeColor, category: .swift, roadMap: [
            RoadMap(id: 0, title: "The Basics", descriptio: "Work with common kinds of data and write basic syntax.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 100),
            RoadMap(id: 1, title: "Basic Operators", descriptio: "Perform operations like assignment, arithmetic, and comparison.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators", rating: 20),
            RoadMap(id: 2, title: "Strings and Characters", descriptio: "Store and manipulate text.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters", rating: 50),
            RoadMap(id: 3, title: "Collection Types", descriptio: "Organize data using arrays, sets, and dictionaries.", url: "", rating: 0),
            RoadMap(id: 4, title: "Control Flow", descriptio: "Structure code with branches, loops, and early exits.", url: "", rating: 100),
            RoadMap(id: 5, title: "Functions", descriptio: "Define and call functions, label their arguments, and use their return values.", url: "", rating: 0),
            RoadMap(id: 6, title: "Closures", descriptio: "Group code that executes together, without creating a named function.", url: "", rating: 0),
            RoadMap(id: 7, title: "Enumerations", descriptio: "Model custom types that define a list of possible values.", url: "", rating: 0),
            RoadMap(id: 8, title: "Structures and Classes", descriptio: "Model custom types that encapsulate data.", url: "", rating: 100),
            RoadMap(id: 9, title: "Properties", descriptio: "Access stored and computed values that are part of an instance or type.", url: "", rating: 0),
            RoadMap(id: 10, title: "Methods", descriptio: "Define and call functions that are part of an instance or type.", url: "", rating: 0),
            RoadMap(id: 11, title: "Subscripts", descriptio: "Access the elements of a collection.", url: "", rating: 0),
            RoadMap(id: 12, title: "Inheritance", descriptio: "Subclass to add or override functionality.", url: "", rating: 0),
            RoadMap(id: 13, title: "Initialization", descriptio: "Set the initial values for a type’s stored properties and perform one-time setup.", url: "", rating: 0),
            RoadMap(id: 14, title: "Deinitialization", descriptio: "Release resources that require custom cleanup.", url: "", rating: 0),
            RoadMap(id: 15, title: "Optional Chaining", descriptio: "Access members of an optional value without unwrapping.", url: "", rating: 0),
            RoadMap(id: 16, title: "Error Handling", descriptio: "Respond to and recover from errors.", url: "", rating: 0),
            RoadMap(id: 17, title: "Concurrency", descriptio: "Perform asynchronous operations.", url: "", rating: 0),
            RoadMap(id: 18, title: "Macros", descriptio: "Use macros to generate code at compile time.", url: "", rating: 0),
            RoadMap(id: 19, title: "Type Casting", descriptio: "Determine a value’s runtime type and give it more specific type information.", url: "", rating: 0),
            RoadMap(id: 20, title: "Nested Types", descriptio: "Define types inside the scope of another type.", url: "", rating: 100),
            RoadMap(id: 21, title: "Extensions", descriptio: "Add functionality to an existing type.", url: "", rating: 0),
            RoadMap(id: 22, title: "Protocols", descriptio: "Define requirements that conforming types must implement.", url: "", rating: 0),
            RoadMap(id: 23, title: "Generics", descriptio: "Write code that works for multiple types and specify requirements for those types.", url: "", rating: 0),
            RoadMap(id: 24, title: "Opaque and Boxed Types", descriptio: "Hide implementation details about a value’s type.", url: "", rating: 0),
            RoadMap(id: 25, title: "Automatic Reference Counting", descriptio: "Model the lifetime of objects and their relationships.", url: "", rating: 0),
            RoadMap(id: 26, title: "Memory Safety", descriptio: "Structure your code to avoid conflicts when accessing memory.", url: "", rating: 0),
            RoadMap(id: 27, title: "Access Control", descriptio: "Manage the visibility of code by declaration, file, and module.", url: "", rating: 0),
            RoadMap(id: 28, title: "Advanced Operators", descriptio: "Define custom operators, perform bitwise operations, and use builder syntax.", url: "", rating: 0)
            ]),
            
            Category(title: "SwiftUI", subTitle: "SwiftUI Road Map", description: "", color: .theme.purpleColor, category: .swiftUI, roadMap: [
                RoadMap(id: 0, title: "Text", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 100),
                RoadMap(id: 1, title: "VStack", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
                RoadMap(id: 2, title: "HStack", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
                RoadMap(id: 3, title: "ZStack", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 10),
                RoadMap(id: 4, title: " ", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
                RoadMap(id: 5, title: " ", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
                RoadMap(id: 6, title: " ", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
                RoadMap(id: 7, title: " ", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0)

                ]),
                    
            Category(title: "UIKit", subTitle: "UIKit Road Map", description: "", color: .theme.blueColor, category: .uIKit, roadMap: [
                    RoadMap(id: 0, title: "The Basics", descriptio: "Work with common kinds of data and write basic syntax.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 10),
                    RoadMap(id: 1, title: "Basic Operators", descriptio: "Perform operations like assignment, arithmetic, and comparison.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators", rating: 100),
                    RoadMap(id: 2, title: "Strings and Characters", descriptio: "Store and manipulate text.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters", rating: 0)
             
                ])]),
        
        Level(title: "Level 3", isSelect: false ,categories: [])
    
    ]
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @Published var generalRoadMap: [Category] = [

        Category(title: "Swift", subTitle: "Swift Road Map", description: "", color: .theme.orangeColor, category: .swift, roadMap: [
RoadMap(id: 0, title: "The Basics", descriptio: "Work with common kinds of data and write basic syntax.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 100),
RoadMap(id: 1, title: "Basic Operators", descriptio: "Perform operations like assignment, arithmetic, and comparison.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators", rating: 20),
RoadMap(id: 2, title: "Strings and Characters", descriptio: "Store and manipulate text.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters", rating: 50),
RoadMap(id: 3, title: "Collection Types", descriptio: "Organize data using arrays, sets, and dictionaries.", url: "", rating: 0),
RoadMap(id: 4, title: "Control Flow", descriptio: "Structure code with branches, loops, and early exits.", url: "", rating: 100),
RoadMap(id: 5, title: "Functions", descriptio: "Define and call functions, label their arguments, and use their return values.", url: "", rating: 0),
RoadMap(id: 6, title: "Closures", descriptio: "Group code that executes together, without creating a named function.", url: "", rating: 0),
RoadMap(id: 7, title: "Enumerations", descriptio: "Model custom types that define a list of possible values.", url: "", rating: 0),
RoadMap(id: 8, title: "Structures and Classes", descriptio: "Model custom types that encapsulate data.", url: "", rating: 100),
RoadMap(id: 9, title: "Properties", descriptio: "Access stored and computed values that are part of an instance or type.", url: "", rating: 0),
RoadMap(id: 10, title: "Methods", descriptio: "Define and call functions that are part of an instance or type.", url: "", rating: 0),
RoadMap(id: 11, title: "Subscripts", descriptio: "Access the elements of a collection.", url: "", rating: 0),
RoadMap(id: 12, title: "Inheritance", descriptio: "Subclass to add or override functionality.", url: "", rating: 0),
RoadMap(id: 13, title: "Initialization", descriptio: "Set the initial values for a type’s stored properties and perform one-time setup.", url: "", rating: 0),
RoadMap(id: 14, title: "Deinitialization", descriptio: "Release resources that require custom cleanup.", url: "", rating: 0),
RoadMap(id: 15, title: "Optional Chaining", descriptio: "Access members of an optional value without unwrapping.", url: "", rating: 0),
RoadMap(id: 16, title: "Error Handling", descriptio: "Respond to and recover from errors.", url: "", rating: 0),
RoadMap(id: 17, title: "Concurrency", descriptio: "Perform asynchronous operations.", url: "", rating: 0),
RoadMap(id: 18, title: "Macros", descriptio: "Use macros to generate code at compile time.", url: "", rating: 0),
RoadMap(id: 19, title: "Type Casting", descriptio: "Determine a value’s runtime type and give it more specific type information.", url: "", rating: 0),
RoadMap(id: 20, title: "Nested Types", descriptio: "Define types inside the scope of another type.", url: "", rating: 100),
RoadMap(id: 21, title: "Extensions", descriptio: "Add functionality to an existing type.", url: "", rating: 0),
RoadMap(id: 22, title: "Protocols", descriptio: "Define requirements that conforming types must implement.", url: "", rating: 0),
RoadMap(id: 23, title: "Generics", descriptio: "Write code that works for multiple types and specify requirements for those types.", url: "", rating: 0),
RoadMap(id: 24, title: "Opaque and Boxed Types", descriptio: "Hide implementation details about a value’s type.", url: "", rating: 0),
RoadMap(id: 25, title: "Automatic Reference Counting", descriptio: "Model the lifetime of objects and their relationships.", url: "", rating: 0),
RoadMap(id: 26, title: "Memory Safety", descriptio: "Structure your code to avoid conflicts when accessing memory.", url: "", rating: 0),
RoadMap(id: 27, title: "Access Control", descriptio: "Manage the visibility of code by declaration, file, and module.", url: "", rating: 0),
RoadMap(id: 28, title: "Advanced Operators", descriptio: "Define custom operators, perform bitwise operations, and use builder syntax.", url: "", rating: 0)
]),

        Category(title: "SwiftUI", subTitle: "SwiftUI Road Map", description: "", color: .theme.purpleColor, category: .swiftUI, roadMap: [
        RoadMap(id: 0, title: "Text", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 100),
        RoadMap(id: 1, title: "VStack", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
        RoadMap(id: 2, title: "HStack", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
        RoadMap(id: 3, title: "ZStack", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 10),
        RoadMap(id: 4, title: " ", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
        RoadMap(id: 5, title: " ", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
        RoadMap(id: 6, title: " ", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
        RoadMap(id: 7, title: " ", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0)

        ]),

        Category(title: "UIKit", subTitle: "UIKit Road Map", description: "", color: .theme.blueColor, category: .uIKit, roadMap: [
        RoadMap(id: 0, title: "The Basics", descriptio: "Work with common kinds of data and write basic syntax.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 10),
        RoadMap(id: 1, title: "Basic Operators", descriptio: "Perform operations like assignment, arithmetic, and comparison.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators", rating: 100),
        RoadMap(id: 2, title: "Strings and Characters", descriptio: "Store and manipulate text.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters", rating: 0)

    ])
    ]

    @Published var swiftRoadMap: [RoadMap] = [
    RoadMap(id: 0, title: "The Basics", descriptio: "Work with common kinds of data and write basic syntax.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 100),
    RoadMap(id: 1, title: "Basic Operators", descriptio: "Perform operations like assignment, arithmetic, and comparison.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators", rating: 20),
    RoadMap(id: 2, title: "Strings and Characters", descriptio: "Store and manipulate text.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters", rating: 50),
    RoadMap(id: 3, title: "Collection Types", descriptio: "Organize data using arrays, sets, and dictionaries.", url: "", rating: 0),
    RoadMap(id: 4, title: "Control Flow", descriptio: "Structure code with branches, loops, and early exits.", url: "", rating: 100),
    RoadMap(id: 5, title: "Functions", descriptio: "Define and call functions, label their arguments, and use their return values.", url: "", rating: 0),
    RoadMap(id: 6, title: "Closures", descriptio: "Group code that executes together, without creating a named function.", url: "", rating: 0),
    RoadMap(id: 7, title: "Enumerations", descriptio: "Model custom types that define a list of possible values.", url: "", rating: 0),
    RoadMap(id: 8, title: "Structures and Classes", descriptio: "Model custom types that encapsulate data.", url: "", rating: 100),
    RoadMap(id: 9, title: "Properties", descriptio: "Access stored and computed values that are part of an instance or type.", url: "", rating: 0),
    RoadMap(id: 10, title: "Methods", descriptio: "Define and call functions that are part of an instance or type.", url: "", rating: 0),
    RoadMap(id: 11, title: "Subscripts", descriptio: "Access the elements of a collection.", url: "", rating: 0),
    RoadMap(id: 12, title: "Inheritance", descriptio: "Subclass to add or override functionality.", url: "", rating: 0),
    RoadMap(id: 13, title: "Initialization", descriptio: "Set the initial values for a type’s stored properties and perform one-time setup.", url: "", rating: 0),
    RoadMap(id: 14, title: "Deinitialization", descriptio: "Release resources that require custom cleanup.", url: "", rating: 0),
    RoadMap(id: 15, title: "Optional Chaining", descriptio: "Access members of an optional value without unwrapping.", url: "", rating: 0),
    RoadMap(id: 16, title: "Error Handling", descriptio: "Respond to and recover from errors.", url: "", rating: 0),
    RoadMap(id: 17, title: "Concurrency", descriptio: "Perform asynchronous operations.", url: "", rating: 0),
    RoadMap(id: 18, title: "Macros", descriptio: "Use macros to generate code at compile time.", url: "", rating: 0),
    RoadMap(id: 19, title: "Type Casting", descriptio: "Determine a value’s runtime type and give it more specific type information.", url: "", rating: 0),
    RoadMap(id: 20, title: "Nested Types", descriptio: "Define types inside the scope of another type.", url: "", rating: 100),
    RoadMap(id: 21, title: "Extensions", descriptio: "Add functionality to an existing type.", url: "", rating: 0),
    RoadMap(id: 22, title: "Protocols", descriptio: "Define requirements that conforming types must implement.", url: "", rating: 0),
    RoadMap(id: 23, title: "Generics", descriptio: "Write code that works for multiple types and specify requirements for those types.", url: "", rating: 0),
    RoadMap(id: 24, title: "Opaque and Boxed Types", descriptio: "Hide implementation details about a value’s type.", url: "", rating: 0),
    RoadMap(id: 25, title: "Automatic Reference Counting", descriptio: "Model the lifetime of objects and their relationships.", url: "", rating: 0),
    RoadMap(id: 26, title: "Memory Safety", descriptio: "Structure your code to avoid conflicts when accessing memory.", url: "", rating: 0),
    RoadMap(id: 27, title: "Access Control", descriptio: "Manage the visibility of code by declaration, file, and module.", url: "", rating: 0),
    RoadMap(id: 28, title: "Advanced Operators", descriptio: "Define custom operators, perform bitwise operations, and use builder syntax.", url: "", rating: 0)
    ]

    @Published var swiftUIRoadMap: [RoadMap] = [
    RoadMap(id: 0, title: "Text", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 100),
    RoadMap(id: 1, title: "VStack", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
    RoadMap(id: 2, title: "HStack", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
    RoadMap(id: 3, title: "ZStack", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 10),
    RoadMap(id: 4, title: " ", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
    RoadMap(id: 5, title: " ", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
    RoadMap(id: 6, title: " ", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0),
    RoadMap(id: 7, title: " ", descriptio: "", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 0)

    ]

    @Published var uIKitRoadMap: [RoadMap] = [
        RoadMap(id: 0, title: "The Basics", descriptio: "Work with common kinds of data and write basic syntax.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 10),
        RoadMap(id: 1, title: "Basic Operators", descriptio: "Perform operations like assignment, arithmetic, and comparison.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators", rating: 100),
        RoadMap(id: 2, title: "Strings and Characters", descriptio: "Store and manipulate text.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters", rating: 0)

    ]
  
}


