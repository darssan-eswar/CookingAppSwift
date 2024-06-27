//
//  HomeView.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import SwiftUI

struct HomeView: View {
  let name: String = "Arshia"
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 24) {
          // TODO The text and cart needs to be moved higher
          HStack(alignment: .top) {
            Image(systemName:"cart.fill")
              .imageScale(.large)
              .padding(.leading)
            Spacer()
            Text("Welcome " + name)
              .padding(.trailing)
            
          }
          .frame(alignment: .top)
          ScrollView(.horizontal) {
            HStack {
//              ForEach() {}
            }
          }
        }
      }
      VStack {
        Text("Some details")
      }
    }
    .padding(.top, 64)
  }
}

#Preview {
  HomeView()
}
