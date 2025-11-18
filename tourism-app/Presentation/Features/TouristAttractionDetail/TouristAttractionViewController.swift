//
//  TouristAttractionViewController.swift
//  tourism-app
//
//  Created by Ade Dwi Prayitno on 18/11/25.
//

import UIKit
import Kingfisher

class TouristAttractionViewController: UIViewController {
    
    let imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameLabelView: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .lighterBlack
        return label
    }()
    
    let addressLabelView: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .lightGray
        return label
    }()
    
    let mapPinImageView: UIImageView = {
        let image: UIImageView = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage.locationPin
        return image
    }()
    
    let descriptionLabelView: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    var data: TouristAttractionModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        [imageView, nameLabelView, addressLabelView, mapPinImageView, descriptionLabelView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 360)
        ])
        
        NSLayoutConstraint.activate([
            nameLabelView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabelView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            nameLabelView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            mapPinImageView.topAnchor.constraint(equalTo: nameLabelView.bottomAnchor, constant: 12),
            mapPinImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            mapPinImageView.heightAnchor.constraint(equalToConstant: 17),
            mapPinImageView.widthAnchor.constraint(equalToConstant: 17),
        ])
        
        NSLayoutConstraint.activate([
            addressLabelView.leadingAnchor.constraint(equalTo: mapPinImageView.trailingAnchor, constant: 10),
            addressLabelView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 16),
            addressLabelView.centerYAnchor.constraint(equalTo: mapPinImageView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabelView.topAnchor.constraint(equalTo: mapPinImageView.bottomAnchor, constant: 14),
            descriptionLabelView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            descriptionLabelView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
        ])
    }
    
    func configure(data: TouristAttractionModel) {
        self.data = data
        setupData()
    }
    
    private func setupData() {
        guard let data else {
            return
        }
        title = data.name
        
        nameLabelView.text = data.name
        addressLabelView.text = data.address
        descriptionLabelView.text = data.description
        imageView.kf.setImage(with: data.imageURL)
    }
}
