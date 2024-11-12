import SwiftUI

struct CocktailListView: View {
    @StateObject var cocktailViewModel = CocktailViewModel()
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Search for a cocktail", text: $searchQuery, onCommit: {
                    cocktailViewModel.searchCocktails(query: searchQuery)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                
                if cocktailViewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = cocktailViewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(cocktailViewModel.cocktails, id: \.idDrink) { cocktail in
                                NavigationLink(destination: CocktailDetailView(cocktail: cocktail)) {
                                    CocktailItemView(cocktail: cocktail)
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Cocktails")
        }
        .onAppear {
            
            cocktailViewModel.searchCocktails(query: "Cocktail")
        }
    }
}

#Preview {
    CocktailListView()
}
