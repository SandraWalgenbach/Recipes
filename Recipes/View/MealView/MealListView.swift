import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = MealViewModel()
    @State private var searchQuery = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search for a meal", text: $searchQuery, onCommit: {
                    viewModel.searchMeals(query: searchQuery)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.meals, id: \.idMeal) { meal in
                        HStack {
                            if let imageUrl = meal.strMealThumb, let url = URL(string: imageUrl) {
                                AsyncImage(url: url) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }

                            VStack(alignment: .leading) {
                                Text(meal.strMeal)
                                    .font(.headline)
                                Text(meal.strCategory ?? "Unknown Category")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Meals")
        }
    }
}
