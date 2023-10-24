//
//  TrackView.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import UIKit

final class TrackView: UIView {
    private let icon: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        return image
    }()
    
    private lazy var vStack: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [nameLabel, slotsCounterLabel, distanceLabel],
            axis: .vertical
        )
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .customFont(type: .bold, size: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private let slotsCounterLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .customFont(type: .semiBold, size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .customFont(type: .semiBold, size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray.withAlphaComponent(0.8)
        label.font = .customFont(type: .semiBold, size: 16)
        label.numberOfLines = 0
        return label
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            icon.width.constraint(equalTo: icon.height)
        ])
        
        icon.set(cornerRadius: icon.frame.height / 2)
    }
    
    private func setup() {
        add([
            icon,
            vStack,
            dateLabel
        ])

        NSLayoutConstraint.activate([
            icon.top.constraint(equalTo: top, constant: 8),
            icon.leading.constraint(equalTo: leading, constant: 16),
            icon.height.constraint(equalToConstant: 32),
            
            vStack.top.constraint(equalTo: top, constant: 8),
            vStack.leading.constraint(equalTo: icon.trailing, constant: 8),
            vStack.trailing.constraint(equalTo: trailing, constant: 16),
            vStack.bottom.constraint(equalTo: dateLabel.top, constant: -8),
            
            dateLabel.trailing.constraint(equalTo: trailing, constant: -16),
            dateLabel.bottom.constraint(equalTo: bottom, constant: -8)
        ])
    }
    
    func configure(item: TrackModel) {
        icon.image = .image(name: .mountainBikeColor, renderingMode: .alwaysOriginal)
        nameLabel.text = item.name
        slotsCounterLabel.text = "Numbers of empty slots: \(item.emptySlots ?? 0)"
        distanceLabel.text = "Distance to track is: \(item.distanceInMeters) meters"
        
        dateLabel.text = item.timestamp?.getDateString()
    }
}
