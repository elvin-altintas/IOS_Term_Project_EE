//
//  RecipeDataSource.swift
//  TermProject-EE
//
//  Created by Elvin Altıntaş on 24.12.2021.
//

import Foundation
import UIKit
 //https://api.edamam.com/api/recipes/v2?type=public&q=pasta&app_id=2a3787d1&app_key=b97d50b316555ab070db21e485525b74
//https://api.edamam.com/api/recipes/v2?type=public&app_id=2a3787d1&app_key=b97d50b316555ab070db21e485525b74&mealType=Dinner

class RecipeDataSource{

    private var recipeArray: [Recipe] = []
    private var mealType: String =  "Dinner"
    var delegate: RecipeDataSourceDelegate?
    private let baseURL = "https://api.edamam.com/api/recipes/v2?type=public&app_id=2a3787d1&app_key=b97d50b316555ab070db21e485525b74"

    
    func getUsedParameter() -> String{
        let param = "mealType"
        return param
    }
    
    func finalizeURL(currentURL: String) -> String{
        let addition = getUsedParameter()
        let url = "\(currentURL)&\(addition)"
        return url
    }
    
    
    func loadRecipeList() {
        let urlSession = URLSession.shared
        //if let url = URL(string: finalizeURL(currentURL: baseURL)){
        if let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&app_id=2a3787d1&app_key=b97d50b316555ab070db21e485525b74&mealType=Dinner"){
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
        
            let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
                let decoder = JSONDecoder()
                if let data = data {
                    let recipeArrayFromNetwork = try! decoder.decode([Recipe].self, from: data)
                        self.recipeArray = recipeArrayFromNetwork
                        DispatchQueue.main.async {
                            self.delegate?.recipeListLoaded()
                        }
                    
                }
            }
            dataTask.resume()
        }
    }
    
    

    
    init () {
    }
    
    func getNumberOfRecipes() -> Int {
        return recipeArray.count
    }
    
    func getRecipeWithIndex(index: Int) -> Recipe {
        return recipeArray[index]
    }
    
    
    
}
