//
//  SuggestionViewController.swift
//  TermProject-EE
//
//  Created by Elvin Altıntaş on 24.12.2021.
//

import UIKit

class SuggestionViewController: UIViewController {
    
    @IBOutlet weak var randomSuggestionLabel: UILabel!
    @IBOutlet weak var mealTypePicker: UIPickerView!
    
    var recipeDataSource = RecipeDataSource()
    var pickerData: [String] = []
    var selectedMealType: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeDataSource.delegate = self
        
        pickerData = ["Breakfast", "Lunch", "Dinner", "Snack", "Teatime"]
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
    
    // Select edildiğinde aktive olan yer burası -> data load eklenecek
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedMealType = pickerData[row]
        print(selectedMealType)
        randomSuggestionLabel.text = selectedMealType
    }
    
    

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
}

