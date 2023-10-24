//
//  BikeTracksView.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import UIKit

typealias TrackSnapshot = NSDiffableDataSourceSnapshot<TracksSection, TrackModel>
typealias TrackDataSource = UITableViewDiffableDataSource<TracksSection, TrackModel>

protocol BikeTracksViewDelegating: AnyObject {
    func didTapItem(_ sender: BikeTracksView, item: TrackModel)
}

final class BikeTracksView: UIView {
//    private var dataSource: NSDiffableDataSourceSnapshot<TracksSection, TrackModel>?
    private var dataSource: TrackDataSource?
    private var snapshot = TrackSnapshot()
    
    weak var delegate: BikeTracksViewDelegating?
    
    private enum Defaults {
        static let title = "Empty list!"
        static let edgeInsets: CGFloat = 20
    }
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let emptyMessageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .correctGreen
        label.font = .customFont(type: .bold, size: 24)
        label.minimumScaleFactor = 0.5
        label.text = Defaults.title
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        add([
            tableView,
            emptyMessageLabel
        ])
        tableView.autoPinSafeEdgesToSuperView()
        
        NSLayoutConstraint.activate([
            emptyMessageLabel.centerX.constraint(equalTo: tableView.centerX),
            emptyMessageLabel.centerY.constraint(equalTo: tableView.centerY),
            emptyMessageLabel.leading.constraint(equalTo: tableView.leading, constant: Defaults.edgeInsets),
            emptyMessageLabel.trailing.constraint(equalTo: tableView.trailing, constant: -Defaults.edgeInsets)
        ])
        
        setupTableView()
        updateEmptyMessageView()
    }
    
    private func setupTableView() {
        prepareDataSource()
//        tableView.rowHeight = 200
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        tableView.register(TrackTableViewCell.self, forCellReuseIdentifier: TrackTableViewCell.identifier)
    }
    
    private func prepareDataSource() {
        dataSource?.defaultRowAnimation = .bottom
        dataSource = UITableViewDiffableDataSource(
            tableView: tableView
        ) { (tableView, indexPath, item) -> UITableViewCell? in
            return self.cellForRowAt(indexPath, with: item)
        }
    }
    
    private func cellForRowAt(
        _ indexPath: IndexPath,
        with item: TrackModel
    ) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: TrackTableViewCell.identifier) as? TrackTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(item: item)
        return cell
    }
    
    func applySnapshot(
        _ animatingDifferences: Bool = false,
        items: [TrackModel] = []
    ) {
        tableView.reloadData()
        
        if snapshot.numberOfSections == .zero {
            snapshot.appendSections([TracksSection.first])
        }
        
        snapshot.appendItems(items)
        dataSource?.apply(snapshot, animatingDifferences: animatingDifferences)
        
        updateEmptyMessageView()
    }
    
    private func updateEmptyMessageView() {
        emptyMessageLabel.isHidden = snapshot.numberOfItems != 0
    }
}

//MARK: - UITableViewDelegate
extension BikeTracksView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let section = dataSource?.snapshot().sectionIdentifiers[indexPath.section],
            let item = dataSource?.snapshot().itemIdentifiers(inSection: section)[indexPath.row]
        else { return }
        
        delegate?.didTapItem(self, item: item)
    }
}
