//
//  HomeView.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//
// Colors to use for now
// #D99066 ,  #F2D7B6 ,  #8C4830  , #A63921


import SwiftUI
import Charts

struct HomeView: View {
  @EnvironmentObject var user: User
  @State var currMeal: Meal = dummyData.Meals[0]
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 24) {
          HStack(alignment:.top){
            Image(systemName:"cart.fill")
              .imageScale(.large)
              .padding(.leading)
            Spacer()
            Text("Welcome \(user.username)")
              .padding(.trailing)
            
          }
          .frame(alignment: .top)
          ScrollViewRotate(currMeal: self.$currMeal)
          PieChartView(currMeal: self.$currMeal)
            .frame(width: 250, height: 250)
        }
      }
    }
  }
}

struct ScrollViewRotate: View {
  let meals: [Meal] = dummyData.Meals
  @Binding var currMeal: Meal
  @State private var currPosition : Int? = 0 // has to be Optional
  @State private var mealPageStr : String = "Meal Page"
  var body: some View {
      
      ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack {
            ForEach(Array(meals.enumerated()), id: \.offset) { index, meal in
              NavigationLink(destination: RecipeView()) {
                RoundedRectangle(cornerRadius: 8)
                  .fill(colorTheme.c1)
                  .frame(height: 150)
                  .overlay(
                    Text(meal.title)
                      .foregroundColor(.black)
                  )
                  .containerRelativeFrame(.horizontal, count : 1, spacing: 30)
                  .scrollTransition { content, phase in
                    content
                      .offset(y: phase.isIdentity ? 0.0: -50)
                  }
                  .id(index)
              }
//              Text("\(index)")
            }
          }
          .frame(height:200)
          .scrollTargetLayout()
      }
      .scrollPosition(id: $currPosition)
      .onChange(of:currPosition) {
          currMeal = meals[currPosition ?? 0]
          mealPageStr = currMeal.title
          print("In the on change")
      }
      .scrollTargetBehavior(.paging)
      .contentMargins(16, for:.scrollContent)
    
//    Text("\(currPosition ?? 100)")
    NavigationLink(destination: RecipeView()) {
      HStack {
        Text(mealPageStr)
          .foregroundColor(colorTheme.c1)
        Spacer()
        Image(systemName:"plus.circle")
          .foregroundColor(colorTheme.c1)
      }
      .padding(.horizontal)
    }
  }
}

enum colorTheme{
  static let c1 = Color(hex: "D99066")
  static let c2 = Color(hex: "F2D7B6")
  static let c3 = Color(hex: "8C4830")
}

struct PieChartView: View {
  @Binding var currMeal: Meal
  let colors: [Color] = [.blue, .black, .orange]
  
  var body: some View {
    // meal.pieChartData has info for the pie chart
    Chart(currMeal.pieChartData, id: \.id) { slice in
      SectorMark(
        angle: .value("Value", slice.value),
        innerRadius: .ratio(0.9),
        angularInset: 1.0 // Add space between sectors
        
      )
      .foregroundStyle(slice.color)
    }
    // TODO needs to be changed
    .chartForegroundStyleScale([
      "Fats": colorTheme.c1,
      "Carbs": colorTheme.c2,
      "Protein": colorTheme.c3
    ])
    Text(currMeal.title)
  }
}

#Preview {
  HomeView()
}
