import SwiftUI

// View for displaying a simple greeting message
struct IngSearchView: View {
    var body: some View {
        Text("Hello, world!")
    }
}

// View for searching and selecting recipes
struct RecipeSearchView: Identifiable, View {
    // Environment object to access all recipes
    @EnvironmentObject var allRecipes: AllRecipes
    
    // Binding variables to manage the current meal, popover state, and screen size
    @Binding var currMeal: Meal?
    @Binding var showingPopover: Bool
    @Binding var ifHalfScreen: Bool
    
    // Unique identifier for the view
    let id: String = UUID().uuidString
    
    // State variables for search functionality and new recipe view
    @State private var typedText: String = ""
    @State private var isSearching: Bool = false
    @State private var showNewRecipe: Bool = false
    
    // Computed property to filter the list of recipes based on the search text
    var filteredList: [Recipe] {
        if typedText.isEmpty {
            return allRecipes.recipes
        } else {
            return allRecipes.recipes.filter {
                $0.name.lowercased().contains(typedText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    // Display the name of the currently selected meal, if any
                    HStack {
                        Text(currMeal?.recipe.name ?? "No Meal Selected")
                        Spacer()
                    }
                    .padding()
                    
                    // Search bar for filtering recipes
                    HStack {
                        TextField("Search...", text: $typedText)
                            .padding()
                            .background(Color.gray.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    // Button to add a new recipe
                    Button(action: {
                        showNewRecipe = true
                    }) {
                        HStack {
                            Image(systemName: "plus") // Plus symbol for adding a recipe
                                .imageScale(.small)
                            
                            Text("Add Recipe")
                                .font(.system(size: 16, weight: .medium))
                        }
                    }
                    .sheet(isPresented: $showNewRecipe) {
                        RecipeView(recipe: Recipe(), newRecipe: true, hitSaved: $showNewRecipe)
                    }
                    
                    // Display a list of filtered recipes
                    ForEach(filteredList, id: \.id) { item in
                        Button(action: {
                            currMeal?.recipe = item
                            showingPopover = false
                        }) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray)
                                .frame(width: 200, height: 30)
                                .overlay(
                                    Text(item.name)
                                        .foregroundColor(.black)
                                )
                        }
                    }
                }
                .padding(.top)
            }
        }
    }
}
