//
//  Gravity.swift
//  HelloWord
//
//  Created by Moyses Miranda do Vale Azevedo on 07/09/22.
//

import UIKit

class Gravity: UIViewController {
    var count = 0


    lazy private var view1: UIView = {
        let view1 = UIView(frame: CGRect(x: view.frame.width / 2 - 25 , y: 100 , width: 50, height: 50))
        view1.backgroundColor = .systemPink
//        view1.addGestureRecognizer(panGesture)
        view1.isUserInteractionEnabled = true
        return view1
    }()

    private lazy var change: UIButton = {
        let start = UIButton(type: .system)
        start.setTitle("start", for: .normal)
        start.addTarget(self, action: #selector(changeGravity), for: .touchUpInside)
        start.translatesAutoresizingMaskIntoConstraints = false
        return start
    }()

    lazy private var dynamicAnimator: UIDynamicAnimator = {
        let dynamicAnimator = UIDynamicAnimator(referenceView: view)
        return dynamicAnimator
    }()

    lazy private var gravityBehavior1: UIGravityBehavior = {
        let gravityBehavior1 = UIGravityBehavior(items: [view1])
        gravityBehavior1.magnitude = 0.2
        return gravityBehavior1
    }()

    lazy private var gravityBehavior2: UIGravityBehavior = {
        let gravityBehavior1 = UIGravityBehavior(items: [view1])
        gravityBehavior1.magnitude = -0.2
        return gravityBehavior1
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(change)
        view.addSubview(view1)
        dynamicAnimator.addBehavior(gravityBehavior1)
        setContraints()
        let timer = Timer.scheduledTimer(timeInterval: 2.7,
                                         target: self,
                                         selector: #selector(handleTimerExecution),
                                         userInfo: nil,
                                         repeats: true)


    }
    @objc private func handleTimerExecution() {
        changeGravity()

    }

    @objc func changeGravity(){
        if count == 0 {
            dynamicAnimator.removeBehavior(gravityBehavior1)
            dynamicAnimator.addBehavior(gravityBehavior2)
            view1.backgroundColor = .systemMint
            count = 1
        } else if count == 1 {
            dynamicAnimator.removeBehavior(gravityBehavior2)
            dynamicAnimator.addBehavior(gravityBehavior1)
            view1.backgroundColor = .systemPink
            count = 0
        }
    }

    func setContraints(){
        setContraintChange()
    }

    func setContraintChange(){
        NSLayoutConstraint.activate([
            change.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            change.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            change.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            change.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10),
        ])
    }
}

