//
//  ViewController.swift
//  CatNews
//
//  Created by Adam Young on 07/12/2020.
//

import CatNewsCore
import UIKit

protocol StoryListViewControllerDelegate: class {

    func viewController(_ viewController: StoryListViewController, wantsToViewStory storyID: String)

}

final class StoryListViewController: UITableViewController {

    weak var delegate: StoryListViewControllerDelegate?

    private let viewModel: StoryListViewModeling

    init(viewModel: StoryListViewModeling) {
        self.viewModel = viewModel

        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(MainStoryTableViewCell.self, forCellReuseIdentifier: "MainStoryCell")
        tableView.register(StoryTableViewCell.self, forCellReuseIdentifier: "StoryCell")
        tableView.register(WeblinkTableViewCell.self, forCellReuseIdentifier: "WeblinkCell")
        tableView.register(AdvertTableViewCell.self, forCellReuseIdentifier: "AdvertCell")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if viewModel.items == nil {
            fetchStories()
        }
    }

}

extension StoryListViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.items == nil ? 0 : 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.item(forIndexPath: indexPath)
        switch item {
        case .story(let viewModel):
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MainStoryCell",
                                                         for: indexPath) as! MainStoryTableViewCell
                cell.viewModel = viewModel
                return cell
            }

            let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell",
                                                     for: indexPath) as! StoryTableViewCell
            cell.viewModel = viewModel
            return cell

        case .weblink(let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeblinkCell",
                                                     for: indexPath) as! WeblinkTableViewCell
            cell.viewModel = viewModel
            return cell

        case .advert(let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertCell",
                                                     for: indexPath) as! AdvertTableViewCell
            cell.viewModel = viewModel
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let storyID = viewModel.storyID(forIndexPath: indexPath) else {
            return
        }

        delegate?.viewController(self, wantsToViewStory: storyID)
    }

}

extension StoryListViewController {

    private func fetchStories() {
        viewModel.fetch { [weak self] in
            guard let self = self else {
                return
            }

            if let error = self.viewModel.fetchError {
                self.displayError(error)
                return
            }

            self.updateUI()
        }
    }

    private func updateUI() {
        self.title = self.viewModel.title

        tableView.reloadData()
    }

    private func displayError(_ error: Error) {
        print("Error: \(error.localizedDescription)")
    }

}
