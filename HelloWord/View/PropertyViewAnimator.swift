//
//  PropertyViewAnimator.swift
//  HelloWord
//
//  Created by Moyses Miranda do Vale Azevedo on 07/09/22.
//

import UIKit

class PropertyViewAnimator: UIViewController {

    var animation:  UIViewPropertyAnimator!

    var countAnimation = 0

    lazy private var view1: UIView = {
        let view1 = UIView(frame: .zero)
        view1.backgroundColor = .systemPink
        view1.isUserInteractionEnabled = true
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()

    lazy var view1Constraints = ReferenceConstraints()

    private lazy var start: UIButton = {
        let start = UIButton(type: .system)
        start.setTitle("start", for: .normal)
        start.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        start.translatesAutoresizingMaskIntoConstraints = false
        return start
    }()

    private lazy var pause: UIButton = {
        let pause = UIButton(type: .system)
        pause.setTitle("pause", for: .normal)
        pause.addTarget(self, action: #selector(pauseAnimation), for: .touchUpInside)
        pause.translatesAutoresizingMaskIntoConstraints = false
        return pause
    }()

    private lazy var stop: UIButton = {
        let stop = UIButton(type: .system)
        stop.setTitle("stop", for: .normal)
        stop.addTarget(self, action: #selector(stopAnimation), for: .touchUpInside)
        stop.translatesAutoresizingMaskIntoConstraints = false
        return stop
    }()

    private lazy var reset: UIButton = {
        let reset = UIButton(type: .system)
        reset.setTitle("reset", for: .normal)
//        reset.addTarget(self, action: #selector(resetAnimation), for: .touchUpInside)
        reset.translatesAutoresizingMaskIntoConstraints = false
        return reset
    }()

    private lazy var reverse: UIButton = {
        let reverse = UIButton(type: .system)
        reverse.setTitle("reverse", for: .normal)
        reverse.addTarget(self, action: #selector(changeAnimation), for: .touchUpInside)
        reverse.translatesAutoresizingMaskIntoConstraints = false
        return reverse
    }()

    lazy private var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            start, pause, stop, reset, reverse
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    @objc func startAnimation(){
        animation.startAnimation()
    }

    @objc func pauseAnimation(){
        animation.pauseAnimation()
    }

    @objc func stopAnimation(){
        animation.stopAnimation(false)
        animation.finishAnimation(at: .current)

    }

    @objc func changeAnimation(){
        if countAnimation == 0 {
            self.leftToRight()
        } else if countAnimation == 1 {
            self.rightToLeft()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(view1)
        view.addSubview(stackView)
        setConstraints()
        leftToRight()
        // Do any additional setup after loading the view.
    }

    private func leftToRight(){
        animation = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {

            NSLayoutConstraint.deactivate([
                self.view1Constraints.centerXAnchor!,
            ])

            self.view1Constraints.centerXAnchor = self.view1.centerXAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)

            NSLayoutConstraint.activate([
                self.view1Constraints.centerXAnchor!,
            ])

            self.view1.backgroundColor = UIColor.systemMint

            self.view.layoutIfNeeded()
        })
        countAnimation = 1

    }

    @objc func rightToLeft(){
        animation = UIViewPropertyAnimator(duration: 1, curve: .easeIn, animations: {

            NSLayoutConstraint.deactivate([
                self.view1Constraints.centerXAnchor!
            ])

            self.view1Constraints.centerXAnchor = self.view1.centerXAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50)

            NSLayoutConstraint.activate([
                self.view1Constraints.centerXAnchor!
            ])
            self.view1.backgroundColor = UIColor.systemPink

            self.view.layoutIfNeeded()
        })
        countAnimation = 0
    }

    private func setConstraints(){
        setConstraintView1()
        setConstraintStackView()
    }

    private func setConstraintView1(){
        view1Constraints.centerYAnchor = view1.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        view1Constraints.centerXAnchor = view1.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        view1Constraints.heightAnchor = view1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        view1Constraints.widthAnchor = view1.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)

        NSLayoutConstraint.activate([
            view1Constraints.centerXAnchor!,
            view1Constraints.centerYAnchor!,
            view1Constraints.heightAnchor!,
            view1Constraints.widthAnchor!,
        ])


    }



    private func setConstraintStackView(){
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),

        ])
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}


