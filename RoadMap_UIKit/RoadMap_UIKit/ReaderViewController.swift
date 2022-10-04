//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.

import UIKit

// Стартовый экран приложения
final class ReaderViewController: UIViewController {
    
    // MARK: - Constants
    enum Constants {
        static let fonts = ["Palatino", "Optima Regular", "Kohinoor Devanagari Regular", "Georgia"]
    }
    // MARK: - IBOutlets
    // MARK: - Visual Components
    private let redTextButton = UIButton()
    private let systemPurpleButton = UIButton()
    private let systemBrownButton = UIButton()
    private let systemTealButton = UIButton()
    private let regularFontButton = UIButton()
    private let boldFontButton = UIButton()
    
    private let textFontSizeSlider = UISlider()
    
    private let fontPicker = UIPickerView()
    
    private let darkModeSwitch = UISwitch()
    
    // MARK: - Public properties
    let fontTextField = UITextField()
    
    var myTextView = UITextView()
    // MARK: - Private properties
    // MARK: - Initializers
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Public methods
    // MARK: - IBActions
    // MARK: - Private methods
    
    @objc private func changeTextColorAction(_ sender: UIButton) {
        switch sender.tag {
        case 0...3:
            myTextView.textColor = sender.backgroundColor
        default:
            myTextView.textColor = .black
        }
    }
    
    @objc private func changeTextFontSizeAction(_ sender: UISlider) {
        myTextView.font = myTextView.font?.withSize(
                CGFloat(Int(sender.value))
            )
    }
    
    @objc private func toMakeTextViewRegularAction() {
//        let regularText = myTextView.font?.regular
//        myTextView.font = regularText
        myTextView.font = myTextView.font?.regular
    }
    
    @objc private func toMakeTextViewBoldAction() {
        myTextView.font = myTextView.font?.bold
    }
    
    @objc private func darkModeSwitchAction(_ sender: UISwitch) {
        let appDelegate = UIApplication.shared.windows.first
        
        if sender.isOn {
            appDelegate?.overrideUserInterfaceStyle = .dark
            view.backgroundColor = .black
            regularFontButton.setTitleColor(UIColor(named: "myBlack"), for: .normal)
            boldFontButton.setTitleColor(UIColor(named: "myBlack"), for: .normal)
            return
        }
        appDelegate?.overrideUserInterfaceStyle = .light
        view.backgroundColor = .white
        regularFontButton.setTitleColor(UIColor(named: "myBlack"), for: .normal)
        boldFontButton.setTitleColor(UIColor(named: "myBlack"), for: .normal)
        return
    }
    
    private func configurateMyTextView() {
        myTextView = UITextView(
            frame: CGRect(
                x: 20,
                y: 100,
                width: view.bounds.width - 40,
                height: view.bounds.height / 2
            )
        )
        // swiftlint:disable all
        myTextView.text = """
I'm sorry but I don't want to be an Emperor. That's not my business. I don't want to rule or conquer anyone.
        I should like to help everyone if possible. We all want to help one another -- human beings are like that. We all want to live by each other's happiness, not by each other's misery.
        We don't want to hate and despise one another. In this world there is room for everyone and the earth is rich and can provide for everyone.
        The way of life can be free and beautiful. But we have lost the way.
        Greed has poisoned men's souls, has barricaded the world with hate, has goose-stepped us into misery and bloodshed. We have developed speed but we have shut ourselves in: machinery that gives abundance has left us in want. Our knowledge has made us cynical, our cleverness hard and unkind. We think too much and feel too little: more than machinery we need humanity; more than cleverness we need kindness and gentleness. Without these qualities, life will be violent and all will be lost.
        The aeroplane and the radio have brought us closer together. The very nature of these inventions cries out for the goodness in men, cries out for universal brotherhood for the unity of us all. Even now my voice is reaching millions throughout the world, millions of despairing men, women and little children, victims of a system that makes men torture and imprison innocent people. To those who can hear me I say, "Do not despair".
        The misery that is now upon us is but the passing of greed, the bitterness of men who
        fearthewayofhumanprogress. Thehateofmenwillpassandthepowertheytookfrom the people will return to the people and liberty will never perish.
        In the seventeenth chapter of Saint Luke it is written, "The kingdom of God is within man." Not one man, nor a group of men, but in all men -- in you, the people.
        You the people have the power, the power to create machines, the power to create happiness. You the people have the power to make life free and beautiful, to make this life a wonderful adventure. Then in the name of democracy let's use that power. Let us all unite. Let us fight for a new world, a decent world that will give men a chance to work, that will give you the future and old age and security. Let us fight to free the world, to do away with national barriers, do away with greed, with hate and intolerance. Let us fight for a world of reason, a world where science and progress will lead to all men's happiness. Let us all unite!
"""
        // swiftlint:enable all
        myTextView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        myTextView.font = UIFont(name: "Times New Roman", size: 15)
        view.addSubview(myTextView)
    }
    
    private func configurateRedTextButton() {
        redTextButton.backgroundColor = .red
        redTextButton.frame = CGRect(x: 35, y: 750, width: 25, height: 25)
        redTextButton.tag = 0
        redTextButton.addTarget(self, action: #selector(changeTextColorAction), for: .touchUpInside)
        view.addSubview(redTextButton)
    }
    
    private func configurateSystemPurpleButton() {
        systemPurpleButton.backgroundColor = .systemPurple
        systemPurpleButton.frame = CGRect(x: 75, y: 750, width: 25, height: 25)
        systemPurpleButton.tag = 1
        systemPurpleButton.addTarget(self, action: #selector(changeTextColorAction), for: .touchUpInside)
        view.addSubview(systemPurpleButton)
    }
    
    private func configurateSystemBrownButton() {
        systemBrownButton.backgroundColor = .systemBrown
        systemBrownButton.frame = CGRect(x: 115, y: 750, width: 25, height: 25)
        systemBrownButton.tag = 2
        systemBrownButton.addTarget(self, action: #selector(changeTextColorAction), for: .touchUpInside)
        view.addSubview(systemBrownButton)
    }
    
    private func configurateSystemTealButton() {
        systemTealButton.backgroundColor = .systemTeal
        systemTealButton.frame = CGRect(x: 155, y: 750, width: 25, height: 25)
        systemTealButton.tag = 3
        systemTealButton.addTarget(self, action: #selector(changeTextColorAction), for: .touchUpInside)
        view.addSubview(systemTealButton)
    }
    
    private func configurateTextFontSizeSlider() {
        textFontSizeSlider.frame = CGRect(x: 35, y: 680, width: 350, height: 20)
        textFontSizeSlider.minimumValue = 10
        textFontSizeSlider.maximumValue = 50
        textFontSizeSlider.value = 15
        textFontSizeSlider.addTarget(self, action: #selector(changeTextFontSizeAction), for: .valueChanged)
        view.addSubview(textFontSizeSlider)
    }
    
    private func configurateFontTextField() {
        fontTextField.frame = CGRect(x: 35, y: 600, width: 250, height: 25)
        fontTextField.placeholder = "Выберите шрифт"
        fontTextField.inputView = fontPicker
        fontTextField.addTarget(self, action: #selector(changeTextColorAction), for: .touchUpInside)
        
        view.addSubview(fontTextField)
    }
    
    private func configurateFontPicker() {
        fontPicker.delegate = self
        fontPicker.dataSource = self
    }
    
    private func configurateRegularFontButton() {
        regularFontButton.setTitle("a", for: .normal)
        regularFontButton.setTitleColor(.black, for: .normal)
        regularFontButton.frame = CGRect(x: 50, y: 550, width: 30, height: 30)
        regularFontButton.addTarget(self, action: #selector(toMakeTextViewRegularAction), for: .touchUpInside)
        view.addSubview(regularFontButton)
    }
    
    private func configurateBoldFontButton() {
        boldFontButton.setTitle("A", for: .normal)
        boldFontButton.setTitleColor(.black, for: .normal)
        boldFontButton.frame = CGRect(x: 100, y: 550, width: 30, height: 30)
        boldFontButton.addTarget(self, action: #selector(toMakeTextViewBoldAction), for: .touchUpInside)
        view.addSubview(boldFontButton)
    }
    
    private func configurateDarkModeSwitch() {
        darkModeSwitch.frame = CGRect(x: 200, y: 550, width: 50, height: 25)
        darkModeSwitch.isOn = false
        darkModeSwitch.addTarget(self, action: #selector(darkModeSwitchAction), for: .valueChanged)
        view.addSubview(darkModeSwitch)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        configurateMyTextView()
        configurateRedTextButton()
        configurateSystemPurpleButton()
        configurateSystemBrownButton()
        configurateSystemTealButton()
        configurateTextFontSizeSlider()
        configurateFontTextField()
        configurateFontPicker()
        configurateRegularFontButton()
        configurateBoldFontButton()
        configurateDarkModeSwitch()
    }
    
    // MARK: - Types
}
