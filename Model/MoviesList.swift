//
//  MoviesList.swift
//  MoviesAPI
//
//  Created by Mila Rabuchin on 22/04/2020.
//  Copyright © 2020 Mila Rabuchin. All rights reserved.
//

import Foundation

struct MoviesList:Decodable{
    let title : String
    let image : String
    let rating:Float
    let releaseYear: Int
    let genre : [String]
    
}





