
import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfpeople = 2
    var TotalBill = 0.0
    var finalRes = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitlePerc = String(buttonTitle.dropLast())
        
        let buttonTitleTonum = Double(buttonTitlePerc)!
        tip = buttonTitleTonum/100
        
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfpeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            TotalBill = Double(bill)!
            let result = TotalBill * (1+tip)/Double(numberOfpeople)
            finalRes = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "Res", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Res"{
            let Destination = segue.destination as! ResultViewController
            Destination.result = finalRes
            Destination.tip = Int(tip*100)
            Destination.split = numberOfpeople
            
            
        }
    }
}

