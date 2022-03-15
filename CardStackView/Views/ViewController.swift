//  ViewController.swift
//  CardStackView
//  Created by Doston Rustamov on 14/03/22.

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    //MARK: - Properties
    var viewModelData = [
        CardsDataModel(bgColor: UIColor(red:0.96, green:0.81, blue:0.46, alpha:1.0), text: "Oson", image: "hamburger"),
        CardsDataModel(bgColor: UIColor(red:0.29, green:0.64, blue:0.96, alpha:1.0), text: "Oson", image: "puppy"),
        CardsDataModel(bgColor: UIColor(red:0.29, green:0.63, blue:0.49, alpha:1.0), text: "Oson", image: "poop"),
        CardsDataModel(bgColor: UIColor(red:0.69, green:0.52, blue:0.38, alpha:1.0), text: "Oson", image: "panda"),
        CardsDataModel(bgColor: UIColor(red:0.90, green:0.99, blue:0.97, alpha:1.0), text: "Oson", image: "subway"),
        CardsDataModel(bgColor: UIColor(red:0.83, green:0.82, blue:0.69, alpha:1.0), text: "Oson", image: "robot")
    ]
    
    var stackContainer : StackContainerView!
    var testTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackContainer.dataSource = self
    }
    
    //MARK: - Init
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0)
        stackContainer = StackContainerView()
        testTable.dataSource = self
        testTable.delegate = self
        testTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(testTable)
//        view.addSubview(stackContainer)
//        stackContainer.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.height.equalTo(100)
//            make.width.equalTo(350)
//        }
        
        testTable.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        //configureStackContainer()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0 {
            cell.contentView.addSubview(stackContainer)
            stackContainer.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.height.equalTo(100)
                make.width.equalTo(350)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150
        }
        return 50.0
    }
}

extension ViewController : SwipeCardsDataSource {

    func numberOfCardsToShow() -> Int {
        return viewModelData.count
    }
    
    func card(at index: Int) -> SwipeCardView {
        let card = SwipeCardView()
        card.dataSource = viewModelData[index]
        return card
    }
    
    func emptyView() -> UIView? {
        return nil
    }
}
