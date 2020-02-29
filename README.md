# MovieAppDemo
Fetching json from the network

<img src=ScreenShots/Main.png width=200px> <img src=ScreenShots/Movie.png width=200px> <img src=ScreenShots/Search.png width=200px>

App Description:
when lunching the app, it start a request for an api to fetch the movies, when the data is fetched the tableview reloads and put all the data inside the list. for each movie there is an image url, while creating the cells, a request for image starts and as the image fetched it puted right away into the imageView.

by using closures and completion handlers i could managed my work with threads so the app will not be stuck, but each elements will be put in its place as needed.

in the main ViewController, there are also the viewController life cycle methods printing message, just for demonstration.

tapping on each movie leads you to the movie description page where all the information about the movie is.

at the main viewController there is a search bar, tapping insile automatically reffreshing the list filtered with the searching keywords the have beed tapped, not case sensitive. having nothing inside the search field returns the original movie list.

i made a reusable cell with a xib file and registered it to the tableView, this cell i can use for other projects as well.
