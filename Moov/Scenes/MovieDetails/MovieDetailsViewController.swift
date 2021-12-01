//
//  MovieDetailsViewController.swift
//  Moov
//
//  Created by Jade Silveira on 01/12/21.
//

import UIKit

protocol MovieDetailsDisplaying: AnyObject {
    
}

final class MovieDetailsViewController: UIViewController {
    private let interactor: MovieDetailsInteracting
    
    init(interactor: MovieDetailsInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
}

extension MovieDetailsViewController: MovieDetailsDisplaying {
    
}