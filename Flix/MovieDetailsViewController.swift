//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Albert Gertskis on 2/28/19.
//  Copyright © 2019 Albert Gertskis. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var synopsisTextView: UITextView!
    
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "LLLL dd, yyyy"
        
        if let date = dateFormatterGet.date(from: movie["release_date"] as! String) {
            dateLabel.text = dateFormatterPrint.string(from: date)
        }
        
        synopsisTextView.text = movie["overview"] as? String        
        
        // Backdrop image view
        let baseUrl = "https://image.tmdb.org/t/p/w780"
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: baseUrl + backdropPath)
        
        backdropView.af_setImage(withURL: backdropUrl!)
        
        // Poster image view
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        posterView.layer.borderWidth = 1
        posterView.layer.borderColor = UIColor.white.cgColor
        posterView.af_setImage(withURL: posterUrl!)
        
        
        
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
