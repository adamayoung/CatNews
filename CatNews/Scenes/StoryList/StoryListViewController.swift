//
//  ViewController.swift
//  CatNews
//
//  Created by Adam Young on 07/12/2020.
//

import CatNewsCore
import UIKit

protocol StoryListViewable: class {

    var delegate: StoryListViewControllerDelegate? { get set }

}

typealias StoryListViewControlling = UIViewController & StoryListViewable


final class StoryListViewController: UITableViewController, StoryListViewable {

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

        tableView.accessibilityLabel = "Stories"
        tableView.register(MainStoryTableViewCell.self, forCellReuseIdentifier: "MainStoryCell")
        tableView.register(StoryTableViewCell.self, forCellReuseIdentifier: "StoryCell")
        tableView.register(WeblinkTableViewCell.self, forCellReuseIdentifier: "WeblinkCell")
        tableView.register(AdvertTableViewCell.self, forCellReuseIdentifier: "AdvertCell")

        tableView.separatorColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.item(forIndexPath: indexPath)
        switch item {
        case .story(let viewModel):
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainStoryCell",
                                                               for: indexPath) as? MainStoryTableViewCell
                else {
                    fatalError()
                }

                cell.viewModel = viewModel
                cell.setNeedsUpdateConstraints()
                cell.updateConstraints()
                return cell
            }

            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell",
                                                           for: indexPath) as? StoryTableViewCell
            else {
                fatalError()
            }

            cell.viewModel = viewModel
            return cell

        case .weblink(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeblinkCell",
                                                           for: indexPath) as? WeblinkTableViewCell
            else {
                fatalError()
            }

            cell.viewModel = viewModel
            return cell

        case .advert(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertCell",
                                                           for: indexPath) as? AdvertTableViewCell
            else {
                fatalError()
            }

            cell.viewModel = viewModel
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.item(forIndexPath: indexPath)
        switch item {
        case .story(let viewModel):
            delegate?.viewController(self, wantsToViewStory: viewModel.id)

        case .weblink(let viewModel):
            delegate?.viewController(self, wantsToViewWeblink: viewModel.url)

        default:
            return
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = viewModel.item(forIndexPath: indexPath)
        switch item {
        case .advert:
            return tableView.frame.width * 0.3

        default:
            return UITableView.automaticDimension
        }
    }

}

extension StoryListViewController {

    @objc
    private func fetchStories(_ sender: Any? = nil) {
        isLoading(true)

        viewModel.fetch { [weak self] in
            guard let self = self else {
                return
            }

            self.isLoading(false)

            if let error = self.viewModel.fetchError {
                self.displayError(error)
                return
            }

            self.updateUI()
        }
    }

    private func isLoading(_ loading: Bool) {
        if !loading {
            tableView.separatorColor = .separator
            tableView.backgroundView = nil
            tableView.refreshControl?.endRefreshing()
            return
        }

        if viewModel.items == nil {
            tableView.separatorColor = .clear
            tableView.backgroundView = LoadingView(message: NSLocalizedString("Loading", comment: "Loading"))
        } else {
            tableView.refreshControl?.beginRefreshing()
        }
    }

    private func updateUI() {
        tableView.separatorColor = .separator
        self.title = self.viewModel.title
        tableView.invalidateIntrinsicContentSize()
        tableView.reloadData()

        if tableView.refreshControl == nil {
            tableView.refreshControl = UIRefreshControl()
            tableView.refreshControl?.addTarget(self, action: #selector(fetchStories(_ :)), for: .valueChanged)
        }
    }

    private func displayError(_ error: Error) {
        let errorView = ErrorView(
            title: NSLocalizedString("What a CATastrophe", comment: "What a CATastrophe"),
            message: NSLocalizedString("There's been a problem fetching the latest news articles",
                                       comment: "There's been a problem fetching the latest news articles"),
            retryHandler: { [weak self] in
                self?.fetchStories()
            }
        )
        tableView.backgroundView = errorView
        tableView.separatorColor = .clear
    }

}

extension StoryListViewController {

    private func height(forCell cell: UITableViewCell) -> CGFloat {
        cell.frame.size.width = tableView.bounds.width
        cell.setNeedsUpdateConstraints()
        cell.setNeedsLayout()
        cell.updateConstraintsIfNeeded()
        cell.layoutIfNeeded()

        var size = cell.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = tableView.bounds.width

        return size.height
    }

}
