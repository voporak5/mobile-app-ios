//
//  ViewController.swift
//  HW8
//
//  Created by Bluestreet Mac on 2/25/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var moviesArr: [Movie] = []
    var movieViewController = MovieViewController()
    
    var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moviesArr.append(Movie(name:"Ant-Man and the Wasp: Quantumania",releaseDate: "2023-02-17",image:"quantumania"))
        moviesArr.append(Movie(name:"Black Panther: Wakanda Forever",releaseDate: "2022-11-11",image:"wakanda-forever"))
        moviesArr.append(Movie(name:"Thor: Love and Thunder",releaseDate: "2022-07-08",image:"love-and-thunder"))
        moviesArr.append(Movie(name:"Doctor Strange in the Multiverse of Madness",releaseDate: "2022-05-06",image:"multiverse-of-madness"))
        moviesArr.append(Movie(name:"Spider-Man: No Way Home",releaseDate: "2021-12-17",image:"no-way-home"))
        moviesArr.append(Movie(name:"Eternals",releaseDate: "2021-11-05",image:"eternals"))
        moviesArr.append(Movie(name:"Shang-Chi and the Legend of the Ten Rings",releaseDate: "2021-09-03",image:"shang-chi"))
        moviesArr.append(Movie(name:"Black Widow",releaseDate: "2021-07-09",image:"black-widow"))
        moviesArr.append(Movie(name:"Spider-Man: Far From Home",releaseDate: "2019-07-02",image:"far-from-home"))
        moviesArr.append(Movie(name:"Avengers: Endgame",releaseDate: "2019-04-26",image:"endgame"))
        moviesArr.append(Movie(name:"Captain Marvel",releaseDate: "2019-03-08",image:"captain-marvel"))
        moviesArr.append(Movie(name:"Ant-Man and the Wasp",releaseDate: "2018-07-06",image:"ant-man-and-the-wasp"))
        
        let barHeight: CGFloat = self.view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.movieViewController.SetMovie(movie: moviesArr[indexPath.row])
        self.present(self.movieViewController,animated:true,completion:nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(moviesArr[indexPath.row].name)"
        return cell
    }

}

