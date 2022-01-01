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

//https://api.edamam.com/api/recipes/v2?type=public&app_id=b653a986&app_key=19de07e36c468998b5ed58ff3c5d2384&ingr=5&diet=low-carb&diet=low-fat&health=soy-free&health=sugar-conscious&health=sulfite-free&calories=100-1000

class RecipeDataSource{

    private var recipeArray: [Recipe] = []
    private var mealType: String =  "Dinner"
    var delegate: RecipeDataSourceDelegate?
    private let baseURL = "https://api.edamam.com/api/recipes/v2?type=public&app_id=2a3787d1&app_key=b97d50b316555ab070db21e485525b74"

    
    func getUsedParameter() -> String{
        let param = "mealType"
        return param
    }
    
    func addDietToURL(currentURL: String, dietDict: [String: Bool]) -> String{
        var addition = ""
        for key in dietDict.keys {
            if dietDict[key] == true{
                addition += "&diet" + key.lowercased()
            }
        }
        return currentURL + addition
    }
    
    func addAllergyToURL(currentURL: String, allergyDict: [String: Bool]) -> String{
        var addition = ""
        for key in allergyDict.keys {
            if allergyDict[key] == true{
                addition += "&health" + key.lowercased() + "-free"
            }
        }
        return currentURL + addition
    }
    
    func addCaloriesToURL(currentURL: String, fromCalories: Int, toCalories: Int)-> String{
        let addition = "&calories=" + String(fromCalories) + "-" + String(toCalories)
        return currentURL + addition
    }
    func addNumberofIngredientsToURL(currentURL: String, ingredientNumber: Int)-> String{
        let addition = "&ingr=" + String(ingredientNumber)
        return currentURL + addition
    }
    
    func finalizeURL(currentURL: String,allergyDict: [String: Bool],fromCalories: Int, toCalories: Int, ingredientNumber: Int, dietDict: [String: Bool]) -> String{
        let addition = getUsedParameter()
        var url = "\(currentURL)&\(addition)"
        url  = addCaloriesToURL(currentURL: url, fromCalories: fromCalories, toCalories: toCalories)
        url = addDietToURL(currentURL: url, dietDict: dietDict)
        url = addAllergyToURL(currentURL: url, allergyDict: allergyDict)
        url = addNumberofIngredientsToURL(currentURL: <#T##String#>, ingredientNumber: <#T##Int#>)
        return url
    }
    

    
    
    

    
    func loadRecipeList(allergyDict: [String: Bool],fromCalories: Int, toCalories: Int, ingredientNumber: Int, dietDict: [String: Bool]) {
        let urlSession = URLSession.shared
        if let url = URL(string: finalizeURL(currentURL: baseURL, allergyDict: allergyDict, fromCalories: fromCalories, toCalories: toCalories, ingredientNumber: ingredientNumber, dietDict: dietDict)){
        //if let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&app_id=2a3787d1&app_key=b97d50b316555ab070db21e485525b74&mealType=Dinner"){
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            //urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
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
