//
//  ViewController.swift
//  HelloWord
//
//  Created by Moyses Miranda do Vale Azevedo on 16/06/22.
//  Updated by Mateus Sales, GitHub MateuSales

import UIKit

enum FeedbackType: String, CaseIterable {
    case error
    case success
    case warning
    case impactLight = "impact light"
    case impactMedium = "impact medium"
    case impactHeavy = "impact heavy"
}

final class HapticsViewController: UIViewController {

    // MARK: Properties for Businness Logic

    private let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
    private var feedbackTypes: [FeedbackType] = FeedbackType.allCases
    private var index = 0
    
    // MARK: - Layout Properties
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap here!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewsInHierarchy()
        setupConstraints()
    }
    
    // MARK: - Actions

    @objc
    func buttonTapped() {
        let currentFeedbackType = feedbackTypes[index]
        label.text = "Feedback for: \(currentFeedbackType.rawValue)"
        
        switch currentFeedbackType {
        case .error:
            notificationFeedbackGenerator.notificationOccurred(.error)
        case .success:
            notificationFeedbackGenerator.notificationOccurred(.success)
        case .warning:
            notificationFeedbackGenerator.notificationOccurred(.warning)
        case .impactLight:
            makeImpact(style: .light)
        case .impactMedium:
            makeImpact(style: .medium)
        case .impactHeavy:
            makeImpact(style: .heavy)
        }
        
        index += 1
        resetIndexIfNeeded()
    }
    
    // MARK: - Layout Methods
    
    private func addViewsInHierarchy() {
        view.addSubview(button)
        view.addSubview(label)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 58),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: - Private Methods
    
    private func makeImpact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: style)
        impactFeedbackGenerator.impactOccurred()
    }
    
    private func resetIndexIfNeeded() {
        if index >= feedbackTypes.count {
            index = 0
        }
    }
}
