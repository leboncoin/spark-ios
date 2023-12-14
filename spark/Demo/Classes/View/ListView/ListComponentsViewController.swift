//
//  ListComponentsViewController.swift
//  Spark
//
//  Created by alican.aycil on 13.12.23.
//  Copyright © 2023 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI

final class ListComponentsViewController: UICollectionViewController {

    // MARK: - Typealias
    fileprivate typealias DataSource = UICollectionViewDiffableDataSource<Section, String>
    fileprivate typealias SnapShot = NSDiffableDataSourceSnapshot<Section, String>

    // MARK: - Properties
    private let reuseIdentifier = "defaultCell"

    private lazy var collectionViewDataSource: DataSource = {
        /// CollectionView cell registration
        let cellRegistration = UICollectionView.CellRegistration {
            (cell: UICollectionViewListCell, indexPath: IndexPath, title: String) in
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = title
            cell.contentConfiguration = contentConfiguration
            cell.accessories = [.disclosureIndicator(options: .init(tintColor: .systemGray3))]
        }
        /// CollectionView diffable data source
        let dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(
                            using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        return dataSource
    }()

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "List"
        setupData()
    }

    private func setupData() {
        /// CollectionView append sections and items
        var snapShot = SnapShot()
        snapShot.appendSections([.all])
        snapShot.appendItems(UIComponent.allCases.map{ $0.name }, toSection: .all)
        collectionViewDataSource.apply(snapShot)
    }
}

// MARK: - CollectionViewLayout
extension ListComponentsViewController {

    static func makeLayout() -> UICollectionViewCompositionalLayout {
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

// MARK: - CollectionViewDelegates
extension ListComponentsViewController {

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = UIComponent.allCases[indexPath.row]
        var viewController: UIViewController!
        switch section {
        case .badge:
            viewController = ListViewController<BadgeCell, BadgeConfiguration>()
        case .button:
            viewController = ListViewController<ButtonCell, ButtonConfiguration>()
        case .checkbox:
            viewController = ListViewController<CheckboxCell, CheckboxConfiguration>()
        case .chip:
            viewController = ListViewController<ChipCell, ChipConfiguration>()
        case .icon:
            viewController = ListViewController<IconCell, IconConfiguration>()
        default:
            break
        }
        guard viewController != nil else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Enums
private extension ListComponentsViewController {

    enum Section {
        case all
    }
}
