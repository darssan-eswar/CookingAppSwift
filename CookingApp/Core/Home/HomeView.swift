//
//  HomeView.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import SwiftUI
import Charts

struct PieSlice: Identifiable {
    let id = UUID()
    let category: String
    let value: Double
}


struct HomeView: View {
  let name:String = "Arshia"
  let pieChartData = [
      PieSlice(category: "Fats", value: 20),
      PieSlice(category: "Carbs", value: 20),
      PieSlice(category: "Protein", value: 20)
    ]
  
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 24) {
            // TODO The text and cart needs to be moved higher
            HStack(alignment:.top){
                Image(systemName:"cart.fill")
                    .imageScale(.large)
                
                    .padding(.leading)
                Spacer()
                Text("Welcome " + name)
                    .padding(.trailing)

            }
            
            .frame(alignment: .top)
            ScrollView3D()
          Chart(pieChartData) { slice in
            SectorMark(
              angle: .value("Value", slice.value),
              innerRadius: .ratio(0.0),
              angularInset: 1.0
            )
            .foregroundStyle(by: .value("Category", slice.category))
          }
          .frame(width:.infinity, height: 250)
            }

          }
 
        }
        .padding(.top, 64)
      }
  }

struct ScrollView3D: View {
  
  let meals = ["Breakfast", "Lunch", "Dinner", "More Lunch", "More Dinner"]
  var body: some View {
      
      ScrollView(.horizontal, showsIndicators: false) {
        
        HStack {
          ForEach(meals, id: \.self) { meal in
              
              RoundedRectangle(cornerRadius: 8)
            

                .fill(.gray)
                .frame(height: 150)
                .overlay(Text(meal))
                .containerRelativeFrame(.horizontal, count : 1, spacing: 30)
                .scrollTransition { content, phase in
                  content
//                    .scaleEffect(x: phase.isIdentity ? 1.0 : 0.8,
//                                 y: phase.isIdentity ? 1.0 : 0.3)
                    .offset(y: phase.isIdentity ? 0.0: -50)
                  
                }
          }
          
        }
        .frame(height:200)
        .scrollTargetLayout()
        
      }
      .scrollTargetBehavior(.paging)
      .contentMargins(16, for:.scrollContent)
  }
}
   

struct anotherView: View {
  var body: some View {
    ScrollView {
        ForEach(0..<50) { index in
            GeometryReader { geometry in
              let rot: Double = geometry.frame(in: .global).minY
                Text("Item \(index)")
                .rotation3DEffect(
                  
                  .degrees(rot),
                    axis: (x: 0, y: 1, z: 0)
                )
//              let width = geometry.size.width
//              print(rot)
            }
          }
        }
    .padding(.top, 64)
  }
}

#Preview {
  HomeView()
}
