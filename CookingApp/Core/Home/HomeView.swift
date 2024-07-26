//
//  HomeView.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//
//  This file contains the main view for the home page of the CookingApp.
//  It includes a welcome message, a horizontal scroll view of days, and a pie chart
//  representing nutritional data for the selected day.
//
//  Color palette:
//  - #D99066
//  - #F2D7B6
//  - #8C4830
//  - #A63921

import SwiftUI
import Charts

// Main view for the home page
struct HomeView: View {
    // Placeholder user name
    let name: String = "Arshia"
    
    // State to track the current day and recipes
    @State var currDay: DayInfo = templateData().days[0]
    @StateObject var allRecipes: AllRecipes = AllRecipes()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header section with cart icon and welcome message
                    HStack(alignment: .top) {
                        Image(systemName: "cart.fill")
                            .imageScale(.large)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Text("Welcome" /* + "\(user.username)"*/)
                            .padding(.trailing)
                    }
                    .frame(alignment: .top)
                    
                    // Scrollable view of days and pie chart
                    ScrollViewRotate(
                        allDays: templateData().days,
                        currDay: $currDay,
                        currMeal: templateData().days[0].meals[0]
                    )
                    PieChartView(currDay: $currDay)
                        .frame(width: 250, height: 250)
                }
            }
            .navigationTitle("Home Page")
        }
        .environmentObject(allRecipes)
    }
}

// View for horizontally scrolling through days
struct ScrollViewRotate: View {
    var allDays: [DayInfo]
    @Binding var currDay: DayInfo
    @State private var currPosition: Int? = 0
    @State private var showRecipeSearch: Bool = false
    @EnvironmentObject var recipeInfo: AllRecipes
    @State var currMeal: Meal?
    @State var ifHalfScreen: Bool = true
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(Array(allDays.enumerated()), id: \.offset) { index, day in
                    NavigationLink(
                        destination: RecipeView(recipe: Recipe(), hitSaved: .constant(false)),
                        label: {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(colorTheme.c1)
                                .frame(height: 75)
                                .overlay(
                                    Text(day.weekDay)
                                        .foregroundColor(.black)
                                )
                                .containerRelativeFrame(.horizontal, count: 1, spacing: 30)
                                .id(index)
                        }
                    )
                }
            }
            .frame(height: 200)
            .scrollTargetLayout()
        }
        .scrollPosition(id: $currPosition)
        .onChange(of: currPosition) { newValue in
            // Update the current day based on the scroll position
            currDay = allDays[newValue ?? 0]
        }
        .scrollTargetBehavior(.paging)
        .contentMargins(16, for: .scrollContent)
        
        LazyVStack {
            ForEach(0..<currDay.meals.count, id: \.self) { index in
                HStack {
                    // Meal title
                    Text(currDay.meals[index].title)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .frame(width: 120, alignment: .leading)
                    
                    // Recipe name
                    Text(currDay.meals[index].recipe.name)
                        .foregroundColor(colorTheme.c1)
                        .padding(.leading)
                        .onTapGesture {
                            currMeal = currDay.meals[index]
                            showRecipeSearch = true
                        }
                    
                    Spacer()
                    
                    // Navigation link to recipe details
                    NavigationLink(
                        destination: RecipeView(
                            recipe: currDay.meals[index].recipe,
                            hitSaved: .constant(false)
                        )
                        .navigationTitle("Recipe Details")
                        .navigationBarTitleDisplayMode(.inline),
                        label: {
                            Image(systemName: "arrow.right")
                                .foregroundColor(colorTheme.c1)
                                .padding(.trailing)
                        }
                    )
                }
            }
        }
        .popover(isPresented: $showRecipeSearch) {
            RecipeSearchView(
                currMeal: $currMeal,
                showingPopover: $showRecipeSearch,
                ifHalfScreen: $ifHalfScreen
            )
            .presentationDetents(ifHalfScreen ? [.medium] : [.large])
        }
    }
}

// Enum to define color themes
enum colorTheme {
    static let c1 = Color(hex: "D99066")
    static let c2 = Color(hex: "F2D7B6")
    static let c3 = Color(hex: "8C4830")
}

// View for displaying a pie chart
struct PieChartView: View {
    @Binding var currDay: DayInfo
    let colors: [Color] = [.blue, .black, .orange]
    
    var body: some View {
        // Pie chart representation of the day's nutritional data
        Chart(currDay.pieChartData, id: \.id) { slice in
            SectorMark(
                angle: .value("Value", slice.value),
                innerRadius: .ratio(0.9),
                angularInset: 1.0 // Space between sectors
            )
            .foregroundStyle(slice.color)
        }
        .chartForegroundStyleScale([
            "Fats": colorTheme.c1,
            "Carbs": colorTheme.c2,
            "Protein": colorTheme.c3
        ])
    }
}

// Extension to initialize Color from hex string
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    HomeView()
}
