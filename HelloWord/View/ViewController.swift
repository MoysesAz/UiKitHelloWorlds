//
//  ViewController.swift
//  HelloWord
//
//  Created by Moyses Miranda do Vale Azevedo on 16/06/22.
//
import UIKit

final class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let names = ["PropertyAnimator": PropertyViewAnimator(),
                         "Gravity": Gravity(),
                         "Snap": Snap(),
                         "Collision": Collision()
    ]
    private lazy var uiTable: UITableView = {
        let uiTable = UITableView(frame: .zero)
        uiTable.translatesAutoresizingMaskIntoConstraints = false
        return uiTable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        uiTable.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        uiTable.dataSource = self
        uiTable.delegate = self
        view.addSubview(uiTable)
        setConstraints()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrayViewControllers = Array(names.values)
        navigationController?.pushViewController(arrayViewControllers[indexPath.row], animated: true)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        let arrayNames = Array(names.keys)
        cell.textLabel!.text = "\(arrayNames[indexPath.row])"
        return cell
    }

    private func setConstraints(){
        NSLayoutConstraint.activate([
            uiTable.topAnchor.constraint(equalTo: view.topAnchor),
            uiTable.leftAnchor.constraint(equalTo: view.leftAnchor),
            uiTable.heightAnchor.constraint(equalTo: view.heightAnchor),
            uiTable.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
}

