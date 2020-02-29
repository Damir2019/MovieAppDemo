//
//  DetailsViewController.swift
//  MovirDemoTask1
//
//  Created by damir hodez on 02/02/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    
    var datum: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieTitle.text = datum?.title
        movieRating.text = datum?.rating
        movieYear.text = datum?.releaseYear
        movieGenre.text = datum?.allGenres()
        
        WebRequest.shared.fetchImage(movie: datum!) { (imageData) in
            self.movieImage.image = UIImage(data: imageData)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
