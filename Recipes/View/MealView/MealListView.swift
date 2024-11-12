import Foundation
import SwiftUI

struct MealListView: View {
    @StateObject private var mealViewModel = MealViewModel()
    @StateObject private var cocktailViewModel = CocktailViewModel()
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search for a meal", text: $searchQuery, onCommit: {
                    mealViewModel.searchMeals(query: searchQuery)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.horizontal, .top])
                
                if mealViewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = mealViewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(mealViewModel.meals, id: \.idMeal) { meal in
                                NavigationLink(destination: MealDetailView(meal: meal)) {
                                    MealItemView(meal: meal)
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Meals")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.top, 4)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .onAppear {
            mealViewModel.searchMeals(query: "chicken")
            cocktailViewModel.searchCocktails(query: "cocktail")
        }
    }
}

#Preview {
    MealListView()
}
