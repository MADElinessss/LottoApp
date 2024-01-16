//
//  LottoViewController.swift
//  LottoApp
//
//  Created by 신정연 on 1/10/24.
//

import Alamofire
import UIKit

class LottoViewController: UIViewController {

    @IBOutlet var numberTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var lottoPickerView = UIPickerView()
    
    let numberList: [Int] = Array(1...1025).reversed()
    let manager = LottoAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberTextField.tintColor = .clear
        numberTextField.inputView = lottoPickerView
        numberTextField.placeholder = "회차를 선택하세요."
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberTextField.text = "\(numberList[row])회차"
        titleLabel.text = "\(numberList[row])회차의 당첨 번호"
        manager.callRequest(numberList[row]) { value in
            self.resultLabel.text = "🎉 \(value[0]), \(value[1]), \(value[2]), \(value[3]), \(value[4]), \(value[5]) 🎉"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }

}
