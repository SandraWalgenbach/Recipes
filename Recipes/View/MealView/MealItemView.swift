import SwiftUI

struct MealItemView: View {
    var meal: Meal
    
    var body: some View {
        HStack {
            if let imageUrl = meal.strMealThumb, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 120, height: 120)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 120, height: 120)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text(meal.strMeal)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                Text(meal.strCategory ?? "Unknown Category")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    MealItemView(meal: Meal(
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
