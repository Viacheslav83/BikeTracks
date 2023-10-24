//
//  TrackTableViewCell.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import UIKit

final class TrackTableViewCell: UITableViewCell, NibCapable {
    private lazy var view: TrackView = {
        let view = TrackView()
        return view
    }()

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        view.image.image = nil
//        view.label.text = nil
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    private func setup() {
        contentView.add([
            view
        ])
        
        view.autoPinEdgesToSuperView()
        self.selectionStyle = .none
    }
    
    func configure(item: TrackModel) {
        view.configure(item: item)
    }
}
