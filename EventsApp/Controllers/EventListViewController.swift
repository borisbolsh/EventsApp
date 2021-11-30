//
//  EventListViewController.swift
//  EventsApp
//
//  Created by Boris Bolshakov on 30.11.21.
//

import UIKit

class EventListViewController: UIViewController {
    
    static func instantiate() -> EventListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "EventListVC") as! EventListViewController
        
        return controller
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedAddEventButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = "Events"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedAddEventButton() {
        print("tapped")
    }
    
}
