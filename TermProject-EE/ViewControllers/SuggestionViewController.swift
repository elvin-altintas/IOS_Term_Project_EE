//
//  SuggestionViewController.swift
//  TermProject-EE
//
//  Created by Elvin Altıntaş on 24.12.2021.
//

import UIKit

class SuggestionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var randomSuggestionLabel: UITextView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var mealTypePicker: UIPickerView!
    @IBOutlet weak var urlView: UITextView!
    
    
    var recipeDataSource = RecipeDataSource()
    
    var pickerData: [String] = []
    var selectedMealType: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mealTypePicker.dataSource = self
        self.mealTypePicker.delegate = self
        pickerData = ["Breakfast", "Lunch", "Dinner", "Snack", "Teatime"]
        
        recipeDataSource.delegate = self
        
        titleLabel.text = "Select the meal type!"
    
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedMealType = pickerData[row]
        recipeDataSource.loadSuggestedRecipe(mealType: selectedMealType)

    }
    
   /* override func viewWillAppear(_ animated: Bool) {
        //recipeDataSource.loadSuggestedRecipe(mealType: selectedMealType)
        
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SuggestionViewController: RecipeDataSourceDelegate {
    func recipeListLoaded() {}
    
    func suggestedRecipeLoaded(recipe: Recipe) {
        self.urlView.text = "\(recipe.url)"
        self.image.downloaded(from: recipe.image)
        self.randomSuggestionLabel.text = recipe.label
        self.titleLabel.text = "No likey? Select again!"
    }
    

    
}

    
