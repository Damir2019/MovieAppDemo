//
//  MovieItemCell.swift
//  MovirDemoTask1
//
//  Created by damir hodez on 02/02/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//

import UIKit

class MovieItemCell: UITableViewCell {

    @IBOutlet weak var cellMovieImage: UIImageView!
    @IBOutlet weak var cellMovieTitle: UILabel!
    @IBOutlet weak var cellMovieYear: UILabel!
    @IBOutlet weak var loadingCircle: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setMovie(movie: Movie) {
        loadingCircle.startAnimating()
        cellMovieTitle.text = movie.title
        cellMovieYear.text = movie.releaseYear
        
        WebRequest.shared.fetchImage(movie: movie) { (imageData) in
            self.cellMovieImage.image = UIImage(data: imageData)
            self.loadingCircle.stopAnimating()
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
