//
//  TipViewController.swift
//  TermProject-EE
//
//  Created by Elvin Altıntaş on 24.12.2021.
//

import UIKit

class TipViewController: UIViewController {
    
    var recipeDataSource = RecipeDataSource()

    @IBOutlet weak var tipPicker: UIPickerView!
    @IBOutlet weak var learnHowButton: UIButton!
    
    var pickerData: [String] = []
    var selectedTip: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeDataSource.delegate = self

        pickerData = ["Chopping", "Peeling", "Baking", "Boiling", "Blending", "Frying", "Grilling", "Seasoning", "Slicing", "Sauteing"]
        
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
        selectedTip = pickerData[row]
        print(selectedTip)
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


extension TipViewController: RecipeDataSourceDelegate {
    
    func recipeListLoaded() {}
    func suggestedRecipeLoaded(recipe: Recipe) {}
}
