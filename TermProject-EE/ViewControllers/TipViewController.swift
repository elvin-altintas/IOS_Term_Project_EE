//
//  TipViewController.swift
//  TermProject-EE
//
//  Created by Elvin Altıntaş on 24.12.2021.
//

import UIKit

class TipViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var recipeDataSource = RecipeDataSource()

    @IBOutlet weak var tipPicker: UIPickerView!
    @IBOutlet weak var learnHowButton: UIButton!
    
    var pickerData: [String] = []
    var selectedTip: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeDataSource.delegate = self
        self.tipPicker.dataSource = self
        self.tipPicker.delegate = self
        
        pickerData = ["Whisk", "Peel", "Boil", "Slice", "Season"]
        selectedTip = String(pickerData.first!)
        
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
        selectedTip = pickerData[row]
        print(selectedTip)
    }
    


    //Passes the selected tip as string to the animation view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tip = selectedTip
        let animationViewController = segue.destination as! AnimationViewController
        animationViewController.selectedTip = tip
    }
}
    

extension TipViewController: RecipeDataSourceDelegate {
    func recipeListLoaded() {}
    func suggestedRecipeLoaded(recipe: Recipe) {}
}
