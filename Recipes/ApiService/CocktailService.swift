import Foundation

class CocktailService {
    func fetchCocktails(completion: @escaping ([Cocktail]?) -> Void) {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=") else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching cocktails: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let cocktailResponse = try decoder.decode(CocktailResponse.self, from: data)
                completion(cocktailResponse.drinks)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}
