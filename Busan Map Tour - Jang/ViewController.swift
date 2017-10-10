//
//  ViewController.swift
//  Busan Map Tour - Jang
//
//  Created by 장규식 on 2017. 10. 10..
//  Copyright © 2017년 장규식. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTable: UITableView!
    var contents = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTable.delegate = self
        myTable.dataSource = self
        
        //plist 데이터 불러오기
        let path = Bundle.main.path(forResource: "address", ofType: "plist")
        contents = NSArray(contentsOfFile: path!)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = myTable.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let myTitle = (contents[indexPath.row] as AnyObject).value(forKey: "title")
        let myAddress = (contents[indexPath.row] as AnyObject).value(forKey: "address")
        
        myCell.textLabel?.text = myTitle as? String
        myCell.detailTextLabel?.text = myAddress as? String
        
        return myCell
    }
 

    
    
}

