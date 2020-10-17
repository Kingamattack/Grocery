//
//  Checkbox.swift
//  Grocery
//
//  Created by Jordy Kingama on 17/10/2020.
//

import Foundation
import SwiftUI

struct Checkbox: View {
    let grocery: GroceryItem
    let callback: (GroceryItem) -> ()
    
    init(
        grocery: GroceryItem,
        callback: @escaping (GroceryItem) -> ()
        ) {
        self.callback = callback
        self.grocery = grocery
    }
    
    @State var isMarked:Bool = false
    
    var body: some View {
        Button(action:{
            self.isMarked.toggle()
            self.callback(grocery)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text(grocery.name)
                Spacer()
            }
        }
        .buttonStyle(FlatLinkStyle())
        .foregroundColor(Color.black)
    }
}

// Style to remove button click effet
struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
