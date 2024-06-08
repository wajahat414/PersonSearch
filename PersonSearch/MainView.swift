//
//  ContentView.swift
//  coding_task
//
//  Created by devloper on 6/8/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NameListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                List(viewModel.filteredPeople) { person in
                    Text(person.name)
                }
                .navigationTitle("Name List")
                Divider().padding()
                
                VStack{
                    
                    TextField("Enter text to check for palindrome", text: $viewModel.palindromeInput)
                                           .textFieldStyle(RoundedBorderTextFieldStyle())
                                           .padding()
                    Button(action: {
                                           viewModel.checkPalindrome()
                                       }) {
                                           Text("Check Palindrome")
                                               .padding()
                                               .background(Color.blue)
                                               .foregroundColor(.white)
                                               .cornerRadius(8)
                                       }
                    if let isPalindrome = viewModel.isPalindrome {
                                         Text(isPalindrome ? "It is a palindrome!" : "It is not a palindrome.")
                                             .padding()
                                             .foregroundColor(isPalindrome ? .green : .red)
                                     }
                }
                .padding()
            }
        }
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
