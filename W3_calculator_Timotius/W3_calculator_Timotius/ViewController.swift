//
//  ViewController.swift
//  W3_calculator_Timotius
//
//  Created by MacBook Pro on 04/10/23.
//

import UIKit

class ViewController: UIViewController 
{
    @IBOutlet weak var calculatorWorking: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
    
    var working:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        allClear ()
    }
    func allClear()
    {
        working = ""
        calculatorWorking.text = ""
        calculatorResult.text = ""
        
    }
    @IBAction func equalBtn(_ sender: Any) 
    {
        
        if(validInput())
                {
                    let checkedWorkingForPercent = working.replacingOccurrences(of: "%", with: "*0.01")
                    let expression = NSExpression(format: checkedWorkingForPercent)
                    let result = expression.expressionValue(with: nil, context: nil) as! Double
                    let resultString = formatResult(result: result)
                    calculatorResult.text = resultString
                }
                else
                {
                    let alert = UIAlertController(
                        title: "Invalid Input",
                        message: "Calculator unable to do math based on input",
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
    }
    func validInput() ->Bool
        {
            var count = 0
            var funcCharIndexes = [Int]()
            
            for char in working
            {
                if(specialCharacter(char: char))
                {
                    funcCharIndexes.append(count)
                }
                count += 1
            }
            
            var previous: Int = -1
            
            for index in funcCharIndexes
            {
                if(index == 0)
                {
                    return false
                }
                
                if(index == working.count - 1)
                {
                    return false
                }
                
                if (previous != -1)
                {
                    if(index - previous == 1)
                    {
                        return false
                    }
                }
                previous = index
            }
            
            return true
        }
    func specialCharacter (char: Character) -> Bool
    {
        if(char=="*")
        {
            return true
        }
        if(char=="/")
        {
            return true
        }
        if(char=="+")
        {
            return true
        }
        return false
    }
    func formatResult(result: Double) -> String
    {
        if (result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.2f", result)
        }
    }
    @IBAction func AllClearbtn(_ sender: Any)
    {
       allClear()
    }
    
    @IBAction func plusAndmin(_ sender: Any) 
    {
        
    }
    func addTowork(value: String)
    {
        working = working + value
        calculatorWorking.text = working
    }
    @IBAction func percentBtn(_ sender: Any)
    {
        addTowork(value: "%")
    }
    @IBAction func dividedBtn(_ sender: Any) 
    {
        addTowork(value: "/")
    }
    @IBAction func timesBtn(_ sender: Any) 
    {
        addTowork(value: "*")
    }
    @IBAction func minusBtn(_ sender: Any) 
    {
        addTowork(value: "-")
    }
    @IBAction func plusBtn(_ sender: Any) 
    {
        addTowork(value: "+")
    }
    @IBAction func decimalBtn(_ sender: Any) 
    {
        addTowork(value: ",")
    }
    @IBAction func zeroBtn(_ sender: Any) 
    {
        addTowork(value: "0")
    }
    @IBAction func oneBtn(_ sender: Any) 
    {
        addTowork(value: "1")
    }
    @IBAction func twoBtn(_ sender: Any) 
    {
        addTowork(value: "2")
    }
    @IBAction func sanBtn(_ sender: Any) 
    {
        addTowork(value: "3")
    }
    @IBAction func shiBtn(_ sender: Any) 
    {
        addTowork(value: "4")
    }
    @IBAction func wuBtn(_ sender: Any) 
    {
        addTowork(value: "5")
    }
    @IBAction func liuBtn(_ sender: Any)
    {
        addTowork(value: "6")
    }
    @IBAction func jiBtn(_ sender: Any) 
    {
        addTowork(value: "7")
    }
    @IBAction func baBtn(_ sender: Any) 
    {
        addTowork(value: "8")
    }
    @IBAction func nineBTn(_ sender: Any) 
    {
        addTowork(value: "9")
    }
}

