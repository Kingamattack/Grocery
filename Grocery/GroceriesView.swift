//
//  GroceriesView.swift
//  Grocery
//
//  Created by Jordy Kingama on 17/10/2020.
//

import SwiftUI

struct GroceriesView: View {
    @ObservedObject var viewModel = GroceriesViewModel()
    
    func onSelect(grocery: GroceryItem) {
        print("You just click")
        
        // Display popup
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.groceries, id: \.self) { grocery in
                Checkbox(grocery: grocery, callback: onSelect)
            }
            .navigationBarTitle(Text("Groceries"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GroceriesView()
    }
}
