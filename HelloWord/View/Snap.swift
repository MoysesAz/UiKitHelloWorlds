//
//  Snap.swift
//  HelloWord
//
//  Created by Moyses Miranda do Vale Azevedo on 07/09/22.
//

import UIKit

class Snap: UIViewController {

    enum interactionErrors: Error {
        case invalidCoordenation
        case invalidValueOfAnchorView
    }

    private var anchorView = 1

    lazy private var panGesture = UIPanGestureRecognizer(target: self, action: #selector(pannedView))

    lazy private var view1: UIView = {
        let view1 = UIView(frame: CGRect(x: view.frame.width / 2 , y: view.frame.height / 2 , width: 50, height: 50))
        view1.backgroundColor = .systemPink
        view1.addGestureRecognizer(panGesture)
        view1.isUserInteractionEnabled = true
        return view1
    }()

    lazy private var view2: UIView = {
        let view2 = UIView(frame: .zero)
        view2.layer.borderWidth = 1
        view2.layer.borderColor = UIColor.systemCyan.cgColor
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.isUserInteractionEnabled = false
        return view2
    }()

    lazy private var view3: UIView = {
        let view3 = UIView(frame: CGRect(x: 0, y: 0 , width: 55, height: 55))
        view3.layer.borderWidth = 1
        view3.layer.borderColor = UIColor.systemCyan.cgColor
        view3.translatesAutoresizingMaskIntoConstraints = false
        view3.isUserInteractionEnabled = false
        return view3
    }()

    lazy private var dynamicAnimator: UIDynamicAnimator = {
        let dynamicAnimator = UIDynamicAnimator(referenceView: view)
        return dynamicAnimator
    }()

    lazy private var snapBehavior1: UISnapBehavior = {
        let snapBehavior = UISnapBehavior(item: view1, snapTo: view.center)
        return snapBehavior
    }()

    lazy private var snapBehavior2: UISnapBehavior = {
        let snapBehavior = UISnapBehavior(item: view1, snapTo: view2.center)
        return snapBehavior
    }()

    lazy private var snapBehavior3: UISnapBehavior = {
        let snapBehavior = UISnapBehavior(item: view1, snapTo: view3.center)
        return snapBehavior
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view1)
        setConstraints()
        dynamicAnimator.addBehavior(snapBehavior1)
    }

    @objc func pannedView(recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
        case .began:
            removeBehavior()
        case .changed:
            let translation = recognizer.translation(in: view)
            view1.center = CGPoint(x: view1.center.x + translation.x,
                                   y: view1.center.y + translation.y)
            let value = view1.center.y
            setAnchorView(ValueY: value)
            recognizer.setTranslation(.zero, in: view)
        case .ended, .cancelled, .failed:
            animationAnchor()
        case .possible:
            break
        }
    }

    func removeBehavior(){
        dynamicAnimator.removeAllBehaviors()
//        switch anchorView{
//        case 1:
//            dynamicAnimator.removeBehavior(snapBehavior1)
//        case 2 :
//            dynamicAnimator.removeBehavior(snapBehavior2)
//        case 3 :
//            dynamicAnimator.removeBehavior(snapBehavior3)
//        default:
//            print(interactionErrors.invalidValueOfAnchorView)
//        }
    }

    func animationAnchor(){
        clearPoints()
        switch anchorView{
        case 1:
            animationNotPoint()
        case 2 :
            animationPointInView2()
        case 3 :
            animationPointInView3()
        default:
            print(interactionErrors.invalidValueOfAnchorView)
        }
    }

    func clearPoints(){
        view2.backgroundColor = .white
        view3.backgroundColor = .white
    }

    func animationNotPoint(){
        view1.backgroundColor = .systemPink
        dynamicAnimator.addBehavior(snapBehavior1)
    }
    func animationPointInView2(){
        view1.backgroundColor = .systemBlue
        view2.backgroundColor = .systemCyan
        dynamicAnimator.addBehavior(snapBehavior2)
    }

    func animationPointInView3(){
        view1.backgroundColor = .systemGreen
        view3.backgroundColor = .systemMint
        dynamicAnimator.addBehavior(snapBehavior3)
    }


    func setAnchorView(ValueY: CGFloat){
        switch ValueY {
        case 250...580:
            anchorView = 1
        case ...250:
            anchorView = 2
        case 580...:
            anchorView = 3
        default:
            print(interactionErrors.invalidCoordenation)
        }
    }

    func setConstraints(){
        setConstrainstView2()
        setConstrainstView3()
    }

    func setConstrainstView2(){
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            view2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            view2.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
    }

    func setConstrainstView3(){
        NSLayoutConstraint.activate([
            view3.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            view3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            view3.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
    }


}

