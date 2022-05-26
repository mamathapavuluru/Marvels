//
//  CharacterDetailViewController.swift
//  MarvelOpen
//
//  Created by Mamatha on 13/05/22.
//

import UIKit

protocol CharacterDetailCoordinatorDelegate: AnyObject {
    func didPopCharacterDetailViewController()
}

class CharacterDetailViewController: UIViewController {
    
    weak var detailCoordinatorDelegate: CharacterDetailCoordinatorDelegate?
    
    @IBOutlet private weak var characterDetailImageView: UIImageView!
    @IBOutlet private weak var characterDetailNameLabel: UILabel!
    @IBOutlet private weak var characterDetailDescriptionLabel: UILabel!
    
    var characterID : Int? = nil
    lazy var viewDetailModel = {
        CharacterDetailViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initCharacterDetailViewModel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        detailCoordinatorDelegate?.didPopCharacterDetailViewController()
    }
}

extension CharacterDetailViewController {
    
    func initCharacterDetailViewModel() {
        guard let characterID = characterID else {return}
        startLoadingActivityIndicator()
        viewDetailModel.getCharacterDetails(idVal: "\(characterID)") {[weak self] result  in
            DispatchQueue.main.async {
                self?.stopLoadingActivityIndicator()
                switch result {
                case .success(let successBool):
                    if successBool == true {
                        self?.refreshCharacterDetailsUIElements()
                    }else{
                        self?.presentAlertController(withTitle: kAlertTitle, message: kParsingErrorMessage)
                    }
                case .failure(let error):
                    self?.presentAlertController(withTitle: kAlertTitle, message: error.localizedDescription)
                }
            }
        }
    }
    
    func refreshCharacterDetailsUIElements() {        characterDetailImageView.loadImageFromCache(withUrl: viewDetailModel.characterDetailImageURLString)
        characterDetailNameLabel.text = viewDetailModel.characterDetailName
        characterDetailDescriptionLabel.text = viewDetailModel.characterDetailDescription
    }
}

