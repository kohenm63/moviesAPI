//
//  ViewController.swift
//  MoviesAPI
//
//  Created by Mila Rabuchin on 22/04/2020.
//  Copyright © 2020 Mila Rabuchin. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
  
    

    @IBOutlet weak var tableView: UITableView!
    
    var movies = [MoviesList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchJSON {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return movies.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
          cell.textLabel?.text = movies[indexPath.row].title.capitalized
          return cell
      }
         
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails",
                     sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination  = segue.destination as?MovieViewController{
            destination.movie = movies[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    
   
    
   
    
    
    
    func fetchJSON (completed: @escaping() -> ()) {
        
        let url = URL(string: "http://api.androidhive.info/json/movies.json")
        
       
        URLSession.shared.dataTask(with: url!) { (data,response, err) in
            if err==nil{
                
                do{
                    self.movies = try JSONDecoder().decode([MoviesList].self, from: data!)
                    DispatchQueue.main.async{
                        completed()
                    }
                }catch{
                       print("failed to get data from url")
                }
            }
            
           
            }.resume()


}

}



