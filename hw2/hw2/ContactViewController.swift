//
//  ContactViewController.swift
//  hw2
//
//  Created by Артур Миннушин on 03.07.2023.
//

import UIKit

final class ContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    private let data: [ListTableViewData] = [
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009"),
        ListTableViewData(title: "Artur", image: .actions, number: "89270423009")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell
        else { return UITableViewCell() }
        
        cell.setUp(data[indexPath.row])
        
        return cell
    }
}
