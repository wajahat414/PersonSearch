//
//  personViewModel.swift
//  coding_task
//
//  Created by devloper on 6/8/24.
//

import Foundation
import SwiftUI
import Combine

class NameListViewModel: ObservableObject {
    @Published var searchText: String = ""

    @Published var people: [Person] = [
        Person(name: "Candy Potter"),
        Person(name: "John Smith"),
        Person(name: "Michael Johnson"),
        Person(name: "Rick Monty"),
        Person(name: "Stuart Smith"),
        Person(name: "Lee Johnson"),
        Person(name: "Abrat Silk"),
        Person(name: "Nouman Peter"),
        Person(name: "Josh Ron"),
        Person(name: "Markram Som"),
        Person(name: "Ravin Rop"),
        Person(name: "Thor Zeus"),
        
        // Add more names as needed
    ]
    
    var filteredPeople: [Person] {
        if searchText.isEmpty {
            return people
        } else {
            return people.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    @Published var palindromeInput: String = ""
    @Published var isPalindrome: Bool? = nil
    
    func checkPalindrome() {
        let cleanedInput = palindromeInput.lowercased().filter { $0.isLetter }
        isPalindrome = cleanedInput == String(cleanedInput.reversed())
    }
}
