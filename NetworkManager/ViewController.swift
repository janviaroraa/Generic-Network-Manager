//
//  ViewController.swift
//  NetworkManager
//
//  Created by Janvi Arora on 11/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jokesLabel: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            getJokes()
        }
        
        func getJokes() {
            let getJokesEndpoint = GetJokesEndpoint()
            NetworkManager.shared.request(endpoint: getJokesEndpoint as! EndPoint) { (result: Result<JokesResponse, Error>) in
                switch result {
                case .success(let jokesResponse):
                    print("Jokes setup received: \(jokesResponse.setup)")
                    print("Jokes punchline received: \(jokesResponse.punchline)")
                case .failure(let error):
                    print("Jokes fetching failed: \(error.localizedDescription)")
                }
            }
        }



}

