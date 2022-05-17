//
//  CharacterCell.swift
//  MarvelOpen
//
//  Created by Mamatha on 12/05/22.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var characterBackgroundView: UIView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterTitleLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.characterImageView.image = nil
        self.characterTitleLabel.text = ""
        self.characterDescriptionLabel.text = ""
        self.setCellStyling()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellStyling() {
        self.characterBackgroundView.setCornerRadiusForView(corners: kCharacterCellCornerRadius)
    }

    
    func loadCharacterCellWithCharacterModel(_ character: CharactersModel) {
        characterTitleLabel.text = character.name
        characterDescriptionLabel.text = character.description
        guard let charThumbnail = character.thumbnail, let path = charThumbnail.path, let imageExtension = charThumbnail.imageExtension else {return}
        let imageURLString = path + ".\(imageExtension)"
        characterImageView.loadImageFromCache(withUrl: imageURLString)
    }

    

    
}
