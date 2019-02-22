//
//  ViewController.swift
//  Yoga
//
//  Created by Даниил on 16/01/2019.
//  Copyright © 2019 SFB Tech. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    @IBOutlet weak var contentTableView: UITableView!
    var dataSource = [MainMenuContent]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fillDataSource()
        setupTableView()
    }
    
    private func setupTableView() {
        contentTableView.separatorStyle = .none
        contentTableView.dataSource = self
        contentTableView.delegate = self
        contentTableView.register(UINib(nibName: "WelcomeCell", bundle: nil), forCellReuseIdentifier: WelcomeCell.identifier)
        contentTableView.register(UINib(nibName: "ContentCell", bundle: nil), forCellReuseIdentifier: ContentCell.identifier)
    }
    
    private func fillDataSource() {
        dataSource.append(MainMenuContent.init(title: "Yoga poses", description: "Lorem ipsum dolor sit amet, consec tetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                                               backgroundImage: UIImage(named: "poses_girl")!, iconImage: UIImage(named: "flat_pose_icon")!, buttonTitle: "Start training",
                                               colors: [
                                                UIColor(red: 146 / 255, green: 62 / 255, blue: 255 / 255, alpha: 1),
                                                UIColor(red: 78 / 255, green: 25 / 255, blue: 174 / 255, alpha: 1)]))
        dataSource.append(MainMenuContent(title: "Yoga programms", description: "Lorem ipsum dolor sit amet, consec tetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                                          backgroundImage: UIImage(named: "programs_girl")!, iconImage: UIImage(named: "flat_star_icon")!, buttonTitle: "View programms",
                                          colors: [
                                            UIColor(red: 255 / 255, green: 199 / 255, blue: 88 / 255, alpha: 1),
                                            UIColor(red: 220 / 255, green: 120 / 255, blue: 61 / 255, alpha: 1)]))
        dataSource.append(MainMenuContent(title: "Meditation", description: "Lorem ipsum dolor sit amet, consec tetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                                          backgroundImage: UIImage(named: "meditation_girl")!, iconImage: UIImage(named: "flat_flower_icon")!, buttonTitle: "Start meditation", colors: [
                                                        UIColor(red: 150 / 255, green: 223  / 255, blue: 247 / 255, alpha: 1),
                                                        UIColor(red: 65 / 255, green: 147 / 255, blue: 189 / 255, alpha: 1)]))
        dataSource.append(MainMenuContent(title: "Theory", description: "Lorem ipsum dolor sit amet, consec tetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                                          backgroundImage: UIImage(named: "theory_girl")!, iconImage: UIImage(named: "flat_book_icon")!, buttonTitle: "Learn", colors: [
                                            UIColor(red: 154 / 255, green: 1, blue: 147 / 255, alpha: 1),
                                            UIColor(red: 13 / 255, green: 154 / 255, blue: 123 / 255, alpha: 1)]))
    }
}

extension MainScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UIScreen.main.bounds.height - 10
        } else {
            return 450
        }
    }
}

extension MainScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count + 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WelcomeCell.identifier, for: indexPath) as? WelcomeCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.identifier, for: indexPath) as? ContentCell else {
                return UITableViewCell()
            }
            
            let content = dataSource[indexPath.row - 1]
            cell.titleLabel.text = content.title
            cell.descriptionLabel.text = content.description
            cell.girlImage.image = content.backgroundImage
            cell.actionButton.setTitle(content.buttonTitle, for: .normal)
            cell.iconImageView.image = content.iconImage
            cell.contentView.applyGradient(colours: content.colors)
            return cell
        }
    }
}
