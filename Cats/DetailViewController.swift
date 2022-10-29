//
//  DetailViewController.swift
//  Cats
//
//  Created by gih96984 on 2022/10/14.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var temperamentLabel: UILabel!
    
    
    var cats:Cat?

    override func viewDidLoad() {
        super.viewDidLoad()

        getRowInfo()
    }
    
    func getRowInfo(){
        catImageView.kf.setImage(with: URL(string: cats?.image?.url ?? "無法顯示圖片")!)
        temperamentLabel.text = cats?.temperament
    }

}
