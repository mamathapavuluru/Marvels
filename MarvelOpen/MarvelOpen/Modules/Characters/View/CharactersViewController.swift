//
//  CharactersViewController.swift
//  MarvelOpen
//
//  Created by Mamatha on 06/05/22.
//

import UIKit

class CharactersViewController: UIViewController {
    
    @IBOutlet weak var characterTableView: UITableView!
    lazy var viewModel = {
        CharactersViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = NSLocalizedString(kCharactersTitle, comment: "")
        
        self.setCharactersTableView()
        self.initCharacterViewModel()
    }
    

}

extension CharactersViewController {
    private func setCharactersTableView() {
        self.characterTableView.estimatedRowHeight = 200
        self.characterTableView.estimatedSectionHeaderHeight = 1.0
        self.characterTableView.tableFooterView = UIView.init(frame: CGRect.zero)
        self.characterTableView.tableHeaderView = UIView.init(frame: CGRect.zero)
        self.characterTableView.register(UINib(nibName: kCharactersCellIdentifier, bundle: nil), forCellReuseIdentifier: kCharactersCellIdentifier)
    }
    
    func initCharacterViewModel() {
        self.startLoadingActivityIndicator()
        viewModel.getCharacters {[weak self] result  in
            DispatchQueue.main.async {
                self?.stopLoadingActivityIndicator()
                switch result {
                case .success(let successBool):
                    if successBool == true {
                        self?.characterTableView.reloadData()
                    }else{
                        self?.presentAlertController(withTitle: kAlertTitle, message: kParsingErrorMessage)
                    }
                case .failure(let error):
                    self?.presentAlertController(withTitle: kAlertTitle, message: error.localizedDescription)
                }
            }
        }
        
       
    }
}
extension CharactersViewController: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.charactersCount
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kCharactersCellIdentifier, for: indexPath) as? CharacterCell else { fatalError("xib does not exists") }
        guard let character = viewModel.character(at: indexPath.row) else{return cell}
        cell.loadCharacterCellWithCharacterModel(character)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewcontroller = CharacterDetailViewController(nibName: "CharacterDetailViewController", bundle: nil)
        viewcontroller.characterID = viewModel.selectedCharacterID(at: indexPath.row)
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    
}
