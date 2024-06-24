//
//  CalendarView.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import SwiftUI

struct CalendarView: View {
  let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 12) {
          ForEach(days, id: \.self) { day in
            HStack {
              Text(day)
              Spacer()
              Button{} label: {
                Image(systemName: "plus.circle")
              }
            }
            VStack(spacing: 12) {
              ForEach(0..<3, id: \.self) { index in
                RoundedRectangle(cornerRadius: 8)
                  .fill(.gray)
                  .frame(maxWidth: .infinity)
                  .frame(height: 200)
              }
            }
          }
        }
        .padding()
      }
      .scrollIndicators(.hidden)
      .navigationTitle("Calendar")
    }
  }
}

#Preview {
  CalendarView()
}
