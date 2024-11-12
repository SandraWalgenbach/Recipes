import Foundation

class CocktailService {
    private let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php"
    
    func fetchCocktails(searchQuery: String, completion: @escaping (Result<[Cocktail], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)?s=\(searchQuery)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let cocktailResponse = try JSONDecoder().decode(CocktailResponse.self, from: data)
                completion(.success(cocktailResponse.drinks))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
