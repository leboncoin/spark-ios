//
//  ComponentDisplayTableView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

// MARK: - Protocol

protocol ComponentDisplayTableViewDelegate: AnyObject {
    func updateConfiguration(id: String)
    func removeConfiguration(id: String)
}

// MARK: - Constants

private enum Constants {
    static let cellIdentifier = "uikit-component-cell"
}

// MARK: - View

final class ComponentDisplayTableView<
    Configuration: ComponentConfiguration,
    ComponentView: UIView,
    ConfigurationView: ConfigurationUIViewable<Configuration, ComponentView>,
    ViewMaker: ComponentUIViewMaker<Configuration, ComponentView, ConfigurationView>
>: UIView, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Component

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.layer.cornerRadius = .init(radius: .medium)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Properties

    var configurations: [Configuration] = [] {
        didSet {
            self.tableView.reloadData()
            DispatchQueue.main.async {
                self.tableView.beginUpdates()
                self.tableView.endUpdates()
            }
        }
    }

    var viewMaker: ViewMaker
    weak var delegate: (any ComponentDisplayTableViewDelegate)?

    // MARK: - Initialization

    init(viewMaker: ViewMaker) {
        self.viewMaker = viewMaker
        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        // Subviews
        self.addSubview(self.tableView)

        // Registration
        self.tableView.register(
            ComponentDisplayTableViewCell<Configuration, ComponentView, ConfigurationView, ViewMaker>.self,
            forCellReuseIdentifier: Constants.cellIdentifier
        )

        // Add constraints
        self.setupConstraints()
    }

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.stickEdges(from: self.tableView, to: self)
    }

    // MARK: - Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.configurations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get Configuration
        guard self.configurations.count > indexPath.row else {
            return .init()
        }

        // Get Cell
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier,
            for: indexPath
        ) as? ComponentDisplayTableViewCell<Configuration, ComponentView, ConfigurationView, ViewMaker> else {
            return .init()
        }

        cell.viewMaker = self.viewMaker
        cell.configuration = self.configurations[indexPath.row]

        return cell
    }

    // MARK: - Delegate

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let delegate = self.delegate, self.configurations.count > indexPath.row else { return nil }

        let action = UIContextualAction(style: .normal, title: "Update") { action, view, success in
            delegate.updateConfiguration(id: self.configurations[indexPath.row].id)
            success(true)
        }
        action.image = .init(systemName: "pencil")
        action.backgroundColor = .systemBlue

        return UISwipeActionsConfiguration(actions: [action])
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let delegate = self.delegate, self.configurations.count > indexPath.row, self.configurations.count > 1 else { return nil }

        let action = UIContextualAction(style: .destructive, title: "Remove") { action, view, success in
            delegate.removeConfiguration(id: self.configurations[indexPath.row].id)
            success(true)
        }
        action.image = .init(systemName: "trash")

        return UISwipeActionsConfiguration(actions: [action])
    }
}
