import Foundation

class MealViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var cocktails: [Cocktail] = []
    
    var meal: Meal?
    private let mealService = MealService()
    
    
    init(meal: Meal) {
        self.meal = meal
        self.cocktails = []
    }
    
    
    init() {
        self.cocktails = []
    }
    
    func searchMeals(query: String) {
        isLoading = true
        mealService.fetchMeals(searchQuery: query) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let meals):
                    self?.meals = meals
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func mealIngredientsList(for meal: Meal) -> [String] {
        var ingredients: [String] = []
        
        
        let ingredientArray = [
            meal.strIngredient1, meal.strIngredient2, meal.strIngredient3, meal.strIngredient4,
            meal.strIngredient5, meal.strIngredient6, meal.strIngredient7, meal.strIngredient8,
            meal.strIngredient9, meal.strIngredient10, meal.strIngredient11, meal.strIngredient12,
            meal.strIngredient13, meal.strIngredient14, meal.strIngredient15, meal.strIngredient16,
            meal.strIngredient17, meal.strIngredient18, meal.strIngredient19, meal.strIngredient20
        ]
        
        
        let measureArray = [
            meal.strMeasure1, meal.strMeasure2, meal.strMeasure3, meal.strMeasure4,
            meal.strMeasure5, meal.strMeasure6, meal.strMeasure7, meal.strMeasure8,
            meal.strMeasure9, meal.strMeasure10, meal.strMeasure11, meal.strMeasure12,
            meal.strMeasure13, meal.strMeasure14, meal.strMeasure15, meal.strMeasure16,
            meal.strMeasure17, meal.strMeasure18, meal.strMeasure19, meal.strMeasure20
        ]
        
        
        for (ingredient, measure) in zip(ingredientArray, measureArray) {
            if let ingredient = ingredient, !ingredient.isEmpty {
                let measure = measure ?? ""
                ingredients.append("\(measure) \(ingredient)")
            }
        }
        
        return ingredients
    }
    
    
    func matchingCocktails(for meal: Meal) -> [Cocktail] {
        
        let mealIngredients = Set([meal.strIngredient1, meal.strIngredient2, meal.strIngredient3, meal.strIngredient4, ].compactMap { $0?.lowercased() })
        
        
        return cocktails.filter { cocktail in
            let cocktailIngredients = Set([cocktail.strIngredient1, cocktail.strIngredient2, cocktail.strIngredient3,].compactMap { $0?.lowercased() })
            return !mealIngredients.isDisjoint(with: cocktailIngredients)
        }
    }
}
