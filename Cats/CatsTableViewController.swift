//
//  CatsTableViewController.swift
//  Cats
//
//  Created by gih96984 on 2022/10/12.
//

import UIKit
import Kingfisher

class CatsTableViewController: UITableViewController {
    
    var cats = [Cat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        }
    //取得資料
    func loadData(){
        //抓10筆資料
        if let url = URL(string: "https://api.thecatapi.com/v1/breeds?limit=10"){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let data = data  {
                    do {
                        let cats =  try decoder.decode([Cat].self, from: data)
                            self.cats = cats
                        //撈資料
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch  {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cats.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CatsTableViewCell.self)", for: indexPath) as! CatsTableViewCell
        
        let cat = cats[indexPath.row]
        
        cell.typeLabel.text = cat.id
        cell.friendlyLabel.text = "\(cat.childFriendly)"
        cell.nameLabel.text = cat.name
        cell.ageLabel.text = cat.lifeSpan
        cell.originLabel.text = cat.origin
        //cell.infoImageView.kf.setImage(with: URL(string: cat.image.url))
        cell.infoImageView.kf.setImage(with: URL(string: cat.image?.url ?? "無法顯示圖片")!)
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DetailViewController
            ,let row = self.tableView.indexPathForSelectedRow?.row{
            let catList = cats[row]
            controller.cats = catList
        }
    }
  

}
