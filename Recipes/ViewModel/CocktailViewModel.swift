import Foundation

class CocktailViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let cocktailService = CocktailService()
    
    func searchCocktails(query: String) {
        
        isLoading = true
        errorMessage = nil
        
        cocktailService.fetchCocktails(searchQuery: query) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let cocktails):
                    self?.cocktails = cocktails
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func cocktailIngredientsList(for cocktail: Cocktail) -> [String] {
        var ingredients: [String] = []
        
        
        let ingredientArray = [
            cocktail.strIngredient1, cocktail.strIngredient2, cocktail.strIngredient3, cocktail.strIngredient4,
            cocktail.strIngredient5, cocktail.strIngredient6, cocktail.strIngredient7, cocktail.strIngredient8,
            cocktail.strIngredient9, cocktail.strIngredient10, cocktail.strIngredient11, cocktail.strIngredient12,
            cocktail.strIngredient13, cocktail.strIngredient14, cocktail.strIngredient15
        ]
        
        
        let measureArray = [
            cocktail.strMeasure1, cocktail.strMeasure2, cocktail.strMeasure3, cocktail.strMeasure4,
            cocktail.strMeasure5, cocktail.strMeasure6, cocktail.strMeasure7, cocktail.strMeasure8,
            cocktail.strMeasure9, cocktail.strMeasure10, cocktail.strMeasure11, cocktail.strMeasure12,
            cocktail.strMeasure13, cocktail.strMeasure14, cocktail.strMeasure15
        ]
        
        
        for (ingredient, measure) in zip(ingredientArray, measureArray) {
            if let ingredient = ingredient, !ingredient.isEmpty {
                let measure = measure ?? ""
                ingredients.append("\(measure) \(ingredient)")
            }
        }
        
        return ingredients
    }
}
