import SwiftUI

struct CocktailItemView: View {
    var cocktail: Cocktail
    
    var body: some View {
        HStack {
            if let imageUrl = cocktail.strDrinkThumb, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text(cocktail.strDrink)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .padding(.leading, 8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    CocktailItemView(cocktail: Cocktail(
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
