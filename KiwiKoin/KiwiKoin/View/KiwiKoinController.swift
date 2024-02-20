//
//  KiwiKoinController.swift
//  KiwiKoin
//
//  Created by Anderson Moura on 19/02/24.
//

import UIKit
import DropDown

class KiwiKoinController: UIViewController {
    
    @IBOutlet weak var dropDownTo: DropDown!
    @IBOutlet weak var dropDownFrom: DropDown!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configDropDown() {
        self.dropDownTo.optionArray = self.createList()
        self.dropDownTo.arrowSize = 5
        self.dropDownTo.selectedRowColor = .gray
        
        self.dropDownFrom.optionArray = self.createList()
        self.dropDownFrom.arrowSize = 5
        self.dropDownFrom.selectedRowColor = .gray
    }
    
    private func createList() -> [String] {
        return ["Moeda 1", "Moeda 2", "Moeda 3"]
    }
}
