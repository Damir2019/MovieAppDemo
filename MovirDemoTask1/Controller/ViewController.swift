//
//  ViewController.swift
//  MovirDemoTask1
//
//  Created by damir hodez on 02/02/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movieList: [Movie] = []
    var searchList: [Movie] = []
    
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTable.register(UINib(nibName: "MovieItemCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        
        WebRequest.shared.fetchData { (movies) in
            // if i have a simple array i can use array.sort and it will sort the array
            // if i have an array with more complex objects i need to user array.sort{with conditions}
            // if i want to get a returned sorted array i can user array.sorted{with conditions}
            self.movieList = movies.sorted(by: {$0.releaseYear > $1.releaseYear})
            self.movieTable.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear 1")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear 2")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear 3")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("vie did disappear 4")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movie = sender as! Movie
        if let detailsView = segue.destination as? DetailsViewController {
            detailsView.datum = movie
        }
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchList.count
        } else {
            return movieList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieItemCell
        
        
        var movie: Movie
        
        if searching {
            if searchList.isEmpty {return cell}
            movie = searchList[indexPath.item]
        } else {
            if movieList.isEmpty {return cell}
            movie = movieList[indexPath.item]
        }
        
        cell.setMovie(movie: movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movieList[indexPath.item]
        
        performSegue(withIdentifier: "goToDetails", sender: selectedMovie)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 0 {
            searching = true
            searchList = movieList.filter{$0.title.prefix(searchText.count).lowercased() == searchText.lowercased()}
        } else {
            searching = false
        }
        movieTable.reloadData()
    }
    
}
