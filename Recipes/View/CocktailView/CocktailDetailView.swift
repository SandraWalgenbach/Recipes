import SwiftUI

struct CocktailDetailView: View {
    var cocktail: Cocktail
    @StateObject private var viewModel = CocktailViewModel()
    
    var body: some View {
        VStack {
            if let imageUrl = cocktail.strDrinkThumb, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 300)
            }
            
            ScrollView {
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.cocktailIngredientsList(for: cocktail), id: \.self) { ingredient in
                        Text(ingredient)
                            .font(.body)
                    }
                }
                .padding()
                
                Divider()
                    .padding(.vertical)
                
                Text("Instructions")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Text(cocktail.strInstructions)
                    .padding()
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding(.top)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(cocktail.strDrink)
                    .font(.headline)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    CocktailDetailView(cocktail: Cocktail(
        idDrink: "11007",
        strDrink: "Margarita",
        strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg",
        strInstructions: "Mix all ingredients and enjoy your drink.",
        strIngredient1: "Tequila",
        strIngredient2: "Triple sec",
        strIngredient3: "Lime juice",
        strIngredient4: "Salt",
        strIngredient5: nil,
        strIngredient6: nil,
        strIngredient7: nil,
        strIngredient8: nil,
        strIngredient9: nil,
        strIngredient10: nil,
        strIngredient11: nil,
        strIngredient12: nil,
        strIngredient13: nil,
        strIngredient14: nil,
        strIngredient15: nil,
        strMeasure1: "1 1/2 oz",
        strMeasure2: "1/2 oz",
        strMeasure3: "1 oz",
        strMeasure4: "Rim of the glass",
        strMeasure5: nil,
        strMeasure6: nil,
        strMeasure7: nil,
        strMeasure8: nil,
        strMeasure9: nil,
        strMeasure10: nil,
        strMeasure11: nil,
        strMeasure12: nil,
        strMeasure13: nil,
        strMeasure14: nil,
        strMeasure15: nil
    ))
}
