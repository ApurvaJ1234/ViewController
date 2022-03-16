//
//  ViewController.swift
//  TableViewControllerOne
//
//  Created by Coditas on 14/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 20, y: 437, width: 220, height: 50))
        view.addSubview(button)
        button.backgroundColor = .systemPink
        button.setTitle("Collection View", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        let button1 = UIButton(frame: CGRect(x: 20, y: 491, width: 220, height: 50))
        view.addSubview(button1)
        button1.backgroundColor = .systemPink
        button1.setTitle("Split View", for: .normal)
        button1.addTarget(self, action: #selector(didTapButton1), for: .touchUpInside)

    }
    
    @IBAction func didTapButtonOne() {
        
        let vc = TableViewControllerOne()
        vc.models = ["Jaguar", "BMW", "Audi", "Hyundai", "Honda", "Mercedes", "Lexus"]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func didTapButtonTwo() {
        let vc = TableViewControllerOne()
        vc.models = ["Yamaha", "BMW", "TVS", "Honda", "Bajaj", "Royal Enfield", "Suzuki"]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func didTapButton(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-3, height: (view.frame.size.width/3)-3)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        
        let vc = GridCollectionViewController(collectionViewLayout: layout)
        
        present(vc, animated: true)
    }

    @objc func didTapButton1(){
        let splitVC = UISplitViewController(style: .doubleColumn)
        
        let secondVC = UIViewController()
        secondVC.title = ""
        secondVC.view.backgroundColor = .systemBlue
        
        splitVC.viewControllers = [ UINavigationController(rootViewController: MenuController(style: .plain)), UINavigationController(rootViewController: secondVC)
        
        ]
        
        present(splitVC, animated: true)
    }
}

class MenuController: UITableViewController{
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        title = "Menu"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "Option \(indexPath.row)"
        return cell!
}
}
