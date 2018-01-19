//
//  selectViewController.swift
//  navigationforblind
//
//  Created by Pathompong Chaisri on 15/1/2561 BE.
//  Copyright © 2561 Pathompong Chaisri. All rights reserved.
//

import UIKit

class selectViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    var startLocation: String! = ""
    var destination : String! = ""
    //row ที่ถูกเลือกใน pickerview เพื่อเอาไปใช้อิงโหนดใน หน้าrouting
    var selectedRow = 0
    
    let destinationNode = ["Entrance1","Ladder1","Toilet1Man","Toilet1Woman","Library","DSSRoom","ATRoom","Entrance2","PublicRelation","Room102","Ladder2","Lift","Room104","Room105","KKRoom","Room107","Room108","Room110","Toilet2Man","Toilet2Woman","Ladder3","CopyStore","Room115","Room116","Room118"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return destinationNode.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return destinationNode[row]
        
    }
    
    @IBAction func pick(_ sender: Any) {
        
        destination = destinationNode[pickerView.selectedRow(inComponent: 0)]
        selectedRow = pickerView.selectedRow(inComponent: 0)
        performSegue(withIdentifier: "routingVC", sender: self)

        
    }
    

   
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //สามอันนี้เพื่อทำให้ pickerviewทำงาน
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        pickerView.selectRow(2, inComponent: 0, animated: true)
        
       

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //หลังจากกดปุ่ม ยืนยัน pickerview ให้ส่งค่าไปอีกหน้านึง
        let playerViewController = segue.destination as? routingViewController
        playerViewController?.destination = destination
        playerViewController?.startLocation = startLocation
        playerViewController?.selectedRow = selectedRow

        
        
    }
    


}
