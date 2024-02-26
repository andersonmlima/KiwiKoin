//
//  KiwiKoinController.swift
//  KiwiKoin
//
//  Created by Anderson Moura on 19/02/24.
//

import UIKit
import iOSDropDown

class KiwiKoinController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var dropDownTo: DropDown!
    @IBOutlet weak var dropDownFrom: DropDown!
    @IBOutlet weak var lblValueConvert: UILabel!
    @IBOutlet weak var txtValueInfo: UITextField!
    
    //MARK: Private vars/lets
    
    
    
    //MARK: ViewModel
    private var viewModel: CoinConverterViewModel!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CoinConverterViewModel()
        
        self.configDropDown()
    }
    
    //MARK: @IBActions
    @IBAction func actGetCoin( sander:UIButton) {
        let error:String = self.validateFields()
        if error != String.empty() {
            self.view.showMessage(view: self, messege: error)
        } else {
            
            let param1 = self.dropDownTo.text!
            let param2 = self.dropDownFrom.text!
            
            let param:String = "\(param1)-\(param2)"
            self.getCoins(param: param)
        }
    }
    
    
    //MARK: Private funcs
    private func validateFields() -> String {
        var error:String = String.empty()
        
        if self.txtValueInfo.text == String.empty() {
            error = "Informe um valor a ser convertido"
        } else if self.dropDownTo.text == String.empty() || self.dropDownFrom.text == String.empty() {
            error = "Selecione uma das moedas a serem convertidas"
        } else if self.dropDownTo.text == self.dropDownFrom.text {
            error = "Selecione moedas diferentes"
        }
        
        return error
    }
    
    private func getCoins(param:String) {
        self.viewModel.getCoins(params: param) { (data, error) in
            if let coins = data {
                DispatchQueue.main.async {
                    let valueStr:NSNumber = self.viewModel.calculateCoins(valueInfo: self.txtValueInfo.text!, valueCoin: coins.first!.value.buyValue)
                    self.lblValueConvert.text = String().formatCurrency(value: valueStr, enumCoin: dropDownFrom.text)
                }
            } else {
                
            }
        }
    }
    
    private func configDropDown() {
        self.dropDownTo.optionArray = self.viewModel.getListCoins()
        self.dropDownTo.arrowSize = 5
        self.dropDownTo.selectedRowColor = .gray
        
        self.dropDownFrom.optionArray = self.viewModel.getListCoins()
        self.dropDownFrom.arrowSize = 5
        self.dropDownFrom.selectedRowColor = .gray
    }
}
