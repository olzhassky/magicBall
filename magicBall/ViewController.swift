//
//  AppDelegate.swift
//  magicBall
//
//  Created by Olzhas Zhakan on 15.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let answers = [
        "Without a doubt", "It is certain", "No doubt about it", "Definitely yes", "You can count on it",
        "Seems like a yes", "Most likely", "Good prospects", "Signs point to yes", "Yes",
        "Not clear, try again", "Ask again later", "Better not tell you now", "Cannot predict now",
        "Concentrate and ask again", "Don't even think about it", "My sources say no", "Outlook not so good",
        "Very doubtful"
    ]
    let viewBall: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 160
        return view
    }()
    let imageBall: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ball")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let ballLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let jstButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 16
        button.setTitle("TapMe", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    var isResetButton: Bool = false
    
    override func viewDidLoad() {
        view.backgroundColor = .systemGray4
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(viewBall)
        viewBall.addSubview(imageBall)
        view.addSubview(ballLabel)
        view.addSubview(jstButton)
        
        viewBall.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(620)
            make.height.equalTo(620)
        }
        
        imageBall.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(400)
        }
        
        ballLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        jstButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(viewBall.snp.bottom).offset(20)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
    
    @objc func buttonTapped() {
        if isResetButton {
            resetButton()
        } else {
            itsMagic()
            isResetButton = true
            jstButton.setTitle("Reset", for: .normal)
        }
    }
    
    func resetButton() {
        UIView.animate(withDuration: 1.5) {
            self.ballLabel.alpha = 0
        }
        ballLabel.text = nil
        isResetButton = false
        jstButton.setTitle("TapMe", for: .normal)
    }
    
    @objc func itsMagic() {
        let randomIndex = Int.random(in: 0..<answers.count)
        let randomAnswer = answers[randomIndex]
        UIView.animate(withDuration: 1.5) {
            self.ballLabel.alpha = 1
        }
        ballLabel.text = randomAnswer
    }
}

