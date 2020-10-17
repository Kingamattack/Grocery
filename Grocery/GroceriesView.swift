//
//  GroceriesView.swift
//  Grocery
//
//  Created by Jordy Kingama on 17/10/2020.
//

import SwiftUI

struct GroceriesView: View {
    @ObservedObject var viewModel = GroceriesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.groceries, id: \.self) { grocery in
                Text(grocery.name)
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
