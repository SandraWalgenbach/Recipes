import Foundation

class MealService {
    let baseURL = "https://www.themealdb.com/api/json/v1/1/search.php"
    
    func fetchMeals(searchQuery: String, completion: @escaping (Result<[Meal], Error>) -> Void) {
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
                let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
                completion(.success(mealResponse.meals))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
