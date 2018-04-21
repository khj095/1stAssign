//
//  ListViewController.swift
//  myProject
//
//  Created by SWUCOMPUTER on 2018. 4. 21..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var addButton: UIButton!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var moneyTF: UITextField!
    @IBOutlet var numTF: UITextField!
    @IBOutlet var list: UIPickerView!
    
    var totalmoney = 0
    var money = 0
    var num = 0
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if(textField.isEqual(self.moneyTF)){money = Int((moneyTF?.text!)!)!}
        if(textField.isEqual(self.numTF)){num = Int((numTF?.text!)!)!}
        return true
    }
    @IBAction func onClickAdd(_ sender: UIButton) {
        numArray[self.list.selectedRow(inComponent: 0)]+=num
        totalmoney += money
        showToast(message: "추가되었습니다.")
    }
    let foodArray: Array<String> = ["편의점", "봉구스", "츄밥", "교내 식당", "카페", "뚜레쥬르", "퀴즈노즈", "에땅", "교내 매점"]
    var numArray: Array<Int> = [0,0,0,0,0,0,0,0,0]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return foodArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return foodArray[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneView" {
            let nextList = segue.destination as! ViewController
            nextList.hidden=false
            var total: String = "나는 오늘"
            for i in 0 ..< numArray.count {
                if(numArray[i] != 0){
                total+=" \(foodArray[i])에서 \(numArray[i])번"
                }
            }
            if (totalmoney != 0) {
            nextList.totalString="\(total) 먹었어요!\n총 \(totalmoney)원 입니다"
            }
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    } }
