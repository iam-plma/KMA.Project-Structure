//
//  QuickstartViewController.swift
//  Project-structure
//
//  Created by Elina Semenko on 02.03.2023.
//

import UIKit

class QuickstartViewController: UIViewController {
    
    private var goal: Double = 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    @objc private func dismissKeyboard(){
        view.endEditing(true)
    }
    
    private func setupUI() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        let textField = UITextField()
        textField.isUserInteractionEnabled = true
        textField.delegate = self
        textField.borderStyle = .none
        textField.font = UIFont.boldSystemFont(ofSize: 50)
        textField.keyboardType = .decimalPad
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        
        textField.text = "3.00"
        label.text = "kilometers"
        
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        let imageView = UIImageView()
        view.addSubview(imageView)
        imageView.frame = view.bounds
        imageView.image = UIImage(named: "MapImage")
        
        view.bringSubviewToFront(stackView)
        
        let startButton = UIButton()
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 15
        startButton.layer.borderWidth = 0.5
        startButton.layer.borderColor = UIColor.darkGray.cgColor
        startButton.backgroundColor = UIColor(hexString: "2ECC71")
        startButton.setAttributedTitle(NSAttributedString(string: "START", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 35)]), for: .normal)
        
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            startButton.heightAnchor.constraint(equalToConstant: 45),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension QuickstartViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        goal = Double(textField.text ?? "0.0") ?? 0.0
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return !((textField.text ?? "").contains(".") && string.contains("."))
    }
    
}
