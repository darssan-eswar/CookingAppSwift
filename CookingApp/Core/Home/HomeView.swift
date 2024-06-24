//
//  HomeView.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import SwiftUI

struct HomeView: View {
  let meals = ["Breakfast", "Lunch", "Dinner"]
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 24) {
          ScrollView(.horizontal) {
            HStack {
              ForEach(meals, id: \.self) { meal in
                RoundedRectangle(cornerRadius: 8)
                  .fill(.gray)
                  .frame(width: 300, height: 200)
                  .overlay(
                    Text(meal)
                  )
              }
            }
            .padding(.horizontal)
            .scrollTargetLayout()
          }
          .scrollIndicators(.hidden)
          .scrollTargetBehavior(.paging)
          VStack {
            Text("Some details")
          }
        }
        .padding(.top, 64)
      }
    }
  }
}

#Preview {
  HomeView()
}
