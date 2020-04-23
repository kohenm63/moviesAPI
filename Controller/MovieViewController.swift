//
//  MovieViewController.swift
//  MoviesAPI
//
//  Created by Mila Rabuchin on 22/04/2020.
//  Copyright © 2020 Mila Rabuchin. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
    contentMode = mode
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard
            let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
            let image = UIImage(data: data)
            else { return }
        DispatchQueue.main.async() {
            self.image = image
        }
    }.resume()
}
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
    guard let url = URL(string: link) else { return }
    downloaded(from: url, contentMode: mode)
}
}



class MovieViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
  
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var year: UILabel!
    
    @IBOutlet weak var genre: UILabel!
    
    var  movie: MoviesList?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = movie?.title
        rating.text = "\((movie?.rating)!)"
        year.text = "\((movie?.releaseYear)!)"
     
        
        
       

        
        
//        let urlString = "https://api.androidhive.info" + (movie?.image)!


    //  let url = URL(string: urlString)
     
        imageView.downloaded(from: "https://api.androidhive.info/json/movies/1.jpg")
        
      


       
    }
    

  
}
