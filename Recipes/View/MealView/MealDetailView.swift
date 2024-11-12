import SwiftUI

struct MealDetailView: View {
    var meal: Meal
    @StateObject private var cocktailViewModel = CocktailViewModel()
    @StateObject private var mealViewModel: MealViewModel
    
    init(meal: Meal) {
        self.meal = meal
        _mealViewModel = StateObject(wrappedValue: MealViewModel(meal: meal))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if let imageUrl = meal.strMealThumb, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 250)
                .padding(.top, 0)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(cocktailViewModel.cocktails, id: \.idDrink) { cocktail in
                        NavigationLink(destination: CocktailDetailView(cocktail: cocktail)) {
                            VStack {
                                if let imageUrl = cocktail.strDrinkThumb, let url = URL(string: imageUrl) {
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 70, height: 70)
                                            .cornerRadius(8)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                
                                Text(cocktail.strDrink)
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 70)
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                cocktailViewModel.searchCocktails(query: "cocktail")
            }
            
            Divider()
                .padding(.vertical)
            
            ScrollView {
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                ForEach(mealViewModel.mealIngredientsList(for: meal), id: \.self) { ingredient in
                    Text(ingredient)
                        .padding(.horizontal)
                        .padding(.bottom, 2)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                
                Text("Instructions")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                Text(meal.strInstructions)
                    .padding()
                    .multilineTextAlignment(.leading)
            }
        }
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(meal.strMeal)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.top)
    }
}

#Preview {
    MealDetailView(meal: Meal(
        idMeal: "1",
        strMeal: "Chicken Curry",
        strCategory: "Main",
        strInstructions: "Cook the chicken...",
        strMealThumb: "https://www.themealdb.com/images/media/meals/abc123.jpg",
        strIngredient1: "Chicken",
        strIngredient2: "Curry Powder",
        strIngredient3: "Coconut Milk",
        strIngredient4: "Coconut Milk",
        strIngredient5: "Coconut Milk",
        strIngredient6: "Coconut Milk",
        strIngredient7: "Coconut Milk",
        strIngredient8: "Coconut Milk",
        strIngredient9: "Coconut Milk",
        strIngredient10: "Coconut Milk",
        strIngredient11: "Coconut Milk",
        strIngredient12: "Coconut Milk",
        strIngredient13: "Coconut Milk",
        strIngredient14: "Coconut Milk",
        strIngredient15: "Coconut Milk",
        strIngredient16: "Coconut Milk",
        strIngredient17: "Coconut Milk",
        strIngredient18: "Coconut Milk",
        strIngredient19: "Coconut Milk",
        strIngredient20: "Coconut Milk",
        strMeasure1: "200g",
        strMeasure2: "1 tsp",
        strMeasure3: "100ml",
        strMeasure4: "200g",
        strMeasure5: "200g",
        strMeasure6: "200g",
        strMeasure7: "200g",
        strMeasure8: "200g",
        strMeasure9: "200g",
        strMeasure10: "200g",
        strMeasure11: "200g",
        strMeasure12: "200g",
        strMeasure13: "200g",
        strMeasure14: "200g",
        strMeasure15: "200g",
        strMeasure16: "200g",
        strMeasure17: "200g",
        strMeasure18: "200g",
        strMeasure19: "200g",
        strMeasure20: "200g"
    ))
}
