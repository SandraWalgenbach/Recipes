import SwiftUI

struct HomeView: View {
    @StateObject private var mealViewModel = MealViewModel()
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search for a meal", text: $searchQuery, onCommit: {
                    mealViewModel.searchMeals(query: searchQuery)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                if mealViewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = mealViewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 10) {
                            ForEach(mealViewModel.meals, id: \.idMeal) { meal in
                                NavigationLink(
                                    destination: MealDetailView(meal: meal)
                                ) {
                                    MealItemView(meal: meal)
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Meals")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: UserView()) {
                        Image(systemName: "person.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .onAppear {
            mealViewModel.searchMeals(query: searchQuery)
        }
    }
}


#Preview {
    HomeView()
}
