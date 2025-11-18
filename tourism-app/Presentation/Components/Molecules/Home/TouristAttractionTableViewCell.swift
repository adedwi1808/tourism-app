//
//  TouristAttractionTableViewCell.swift
//  tourism-app
//
//  Created by Ade Dwi Prayitno on 18/11/25.
//

import UIKit
import Kingfisher

class TouristAttractionTableViewCell: UITableViewCell {
    static let name: String = "TouristAttractionTableViewCell"
    
    private let containerView = UIView()
    private let placeImageView = UIImageView()
    private let nameLabelView = UILabel()
    private let addressLabelView = UILabel()
    
    private var data: TouristAttractionModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with data: TouristAttractionModel) {
        self.data = data
        setupData()
    }
    
    private func setupView() {
        selectionStyle = .none
        
        containerView.layer.cornerRadius = 12
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.12
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 4
        containerView.backgroundColor = .white
        
        [containerView, placeImageView, nameLabelView, addressLabelView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        contentView.addSubview(containerView)
        containerView.addSubview(placeImageView)
        containerView.addSubview(nameLabelView)
        containerView.addSubview(addressLabelView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        placeImageView.layer.cornerRadius = 16
        placeImageView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            placeImageView.heightAnchor.constraint(equalToConstant: 58),
            placeImageView.widthAnchor.constraint(equalToConstant: 58),
            placeImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            placeImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        nameLabelView.font = .systemFont(ofSize: 16, weight: .medium)
        nameLabelView.textColor = .lighterBlack
        NSLayoutConstraint.activate([
            nameLabelView.leadingAnchor.constraint(equalTo: placeImageView.trailingAnchor, constant: 10),
            nameLabelView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            nameLabelView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20)
        ])
        
        addressLabelView.font = .systemFont(ofSize: 10, weight: .medium)
        addressLabelView.textColor = .lightGray
        NSLayoutConstraint.activate([
            addressLabelView.leadingAnchor.constraint(equalTo: placeImageView.trailingAnchor, constant: 10),
            addressLabelView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            addressLabelView.topAnchor.constraint(equalTo: nameLabelView.bottomAnchor, constant: 8),
            addressLabelView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12, )
        ])
    }
    
    private func setupData() {
        guard let data else { return }
        placeImageView.kf.setImage(with: data.imageURL)
        nameLabelView.text = data.name
        addressLabelView.text = data.address
    }
}
