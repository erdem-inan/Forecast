//
//  ListCell.swift
//  App
//
//

import GlobalUI
import UIKit

class ListCell: TableViewCell {

    private var titleLabel = UILabel.useConstraint
    private var descriptionLabel = UILabel.useConstraint

    override func addSubviews() {
        super.addSubviews()
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }

    override func configure() {
        super.configure()
        
        titleLabel.textColor = .white
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        descriptionLabel.textColor = .white
    }

    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }

    override func load(data: TableViewData) {
        super.load(data: data)
        guard let data = data as? ListCellData else { return }
        
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.description
    }
}
