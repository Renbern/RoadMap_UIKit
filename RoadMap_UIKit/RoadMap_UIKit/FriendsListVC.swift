//
//  FriendsListVC.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 23.09.2022.
//

import UIKit

/// экран списка друзей 
class FriendsListVC: UIViewController {
    
    let firstFriendPhotoButton: UIButton = {
        let photo = UIButton(type: .custom)
        photo.setBackgroundImage(UIImage(systemName: "person.crop.circle.fill"), for: .normal)
        photo.tintColor = .gray
        photo.frame = CGRect(x: 25, y: 120, width: 65, height: 65)
        return photo
    }()
    
    let firstFriendNameLabel: UILabel = {
        let friendName = UILabel()
        friendName.text = "Alexander"
        friendName.font = .systemFont(ofSize: 20, weight: .heavy)
        friendName.textColor = .black
        friendName.frame = CGRect(x: 100, y: 110, width: 160, height: 50)
        return friendName
    }()
    
    let firstFriendBirthdayLabel: UILabel = {
        let birthday = UILabel()
        birthday.text = "30 сентября, в пятницу исполнится 6 лет"
        birthday.font = .systemFont(ofSize: 12, weight: .light)
        birthday.frame = CGRect(x: 100, y: 135, width: 250, height: 50)
        return birthday
    }()
    
    let daysToFirstFriendBirtdayLabel: UILabel = {
        let days = UILabel()
        days.text = "6 дней"
        days.font = .systemFont(ofSize: 20, weight: .semibold)
        days.textColor = .gray
        days.frame = CGRect(x: 280, y: 110, width: 100, height: 50)
       return days
    }()
    
    let secondFriendPhotoButton: UIButton = {
        let photo = UIButton(type: .custom)
        photo.setBackgroundImage(UIImage(systemName: "person.crop.circle.fill"), for: .normal)
        photo.tintColor = .gray
        photo.frame = CGRect(x: 25, y: 200, width: 65, height: 65)
        return photo
    }()
    
    let secondFriendNameLabel: UILabel = {
        let friendName = UILabel()
        friendName.text = "Leo"
        friendName.font = .systemFont(ofSize: 20, weight: .heavy)
        friendName.textColor = .black
        friendName.frame = CGRect(x: 100, y: 190, width: 160, height: 50)
        return friendName
    }()
    
    let secondFriendBirthdayLabel: UILabel = {
        let birthday = UILabel()
        birthday.text = "1 октября, в субботу исполнится 66 лет"
        birthday.font = .systemFont(ofSize: 12, weight: .light)
        birthday.frame = CGRect(x: 100, y: 215, width: 250, height: 50)
        return birthday
    }()
    
    let daysToSecondFrindBirtdayLabel: UILabel = {
        let days = UILabel()
        days.text = "7 дней"
        days.font = .systemFont(ofSize: 20, weight: .semibold)
        days.textColor = .gray
        days.frame = CGRect(x: 280, y: 190, width: 100, height: 50)
       return days
    }()
    
    let thirdFriendPhotoButton: UIButton = {
        let photo = UIButton(type: .custom)
        photo.setBackgroundImage(UIImage(systemName: "person.crop.circle.fill"), for: .normal)
        photo.tintColor = .gray
        photo.frame = CGRect(x: 25, y: 280, width: 65, height: 65)
        return photo
    }()
    
    let thirdFriendNameLabel: UILabel = {
        let friendName = UILabel()
        friendName.text = "Kim"
        friendName.font = .systemFont(ofSize: 20, weight: .heavy)
        friendName.textColor = .black
        friendName.frame = CGRect(x: 100, y: 270, width: 160, height: 50)
        return friendName
    }()
    
    let thirdFriendBirthdayLabel: UILabel = {
        let birthday = UILabel()
        birthday.text = "5 октября, в среду исполнится 43 года"
        birthday.font = .systemFont(ofSize: 12, weight: .light)
        birthday.frame = CGRect(x: 100, y: 295, width: 250, height: 50)
        return birthday
    }()
    
    let daysToThirdFrindBirtdayLabel: UILabel = {
        let days = UILabel()
        days.text = "11 дней"
        days.font = .systemFont(ofSize: 20, weight: .semibold)
        days.textColor = .gray
        days.frame = CGRect(x: 280, y: 270, width: 100, height: 50)
       return days
    }()
    
    let fourthFriendPhoto: UIButton = {
        let photo = UIButton(type: .custom)
        photo.setBackgroundImage(UIImage(systemName: "person.crop.circle.fill"), for: .normal)
        photo.tintColor = .gray
        photo.frame = CGRect(x: 25, y: 360, width: 65, height: 65)
        photo.isHidden = true
        return photo
    }()
    
    let fourthFriendNameLabel: UILabel = {
        let friendName = UILabel()
        friendName.text = "Jade"
        friendName.font = .systemFont(ofSize: 20, weight: .heavy)
        friendName.textColor = .black
        friendName.isHidden = true
        friendName.frame = CGRect(x: 100, y: 350, width: 160, height: 50)
        return friendName
    }()
    
    let fourthFriendBirthdayLabel: UILabel = {
        let birthday = UILabel()
        birthday.text = "7 октября, в пятницу исполнится 69 лет"
        birthday.font = .systemFont(ofSize: 12, weight: .light)
        birthday.frame = CGRect(x: 100, y: 375, width: 250, height: 50)
        birthday.isHidden = true
        return birthday
    }()
    
    let daysToFourthFrindBirtdayLabel: UILabel = {
        let days = UILabel()
        days.text = "13 дней"
        days.font = .systemFont(ofSize: 20, weight: .semibold)
        days.textColor = .gray
        days.frame = CGRect(x: 280, y: 350, width: 100, height: 50)
        days.isHidden = true
       return days
    }()
    
    func setNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(toNewFriendScreenAction)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        addSubviews()
        setNavigationBar()
    }
    
    @objc func toNewFriendScreenAction() {
        let newFriend = NewFriendVC()
        newFriend.modalPresentationStyle = .formSheet
        present(newFriend, animated: true, completion: nil)
    }
    
    func addSubviews() {
        view.addSubview(firstFriendPhotoButton)
        view.addSubview(firstFriendNameLabel)
        view.addSubview(firstFriendBirthdayLabel)
        view.addSubview(daysToFirstFriendBirtdayLabel)
        view.addSubview(secondFriendPhotoButton)
        view.addSubview(secondFriendNameLabel)
        view.addSubview(secondFriendBirthdayLabel)
        view.addSubview(daysToSecondFrindBirtdayLabel)
        view.addSubview(thirdFriendPhotoButton)
        view.addSubview(thirdFriendNameLabel)
        view.addSubview(thirdFriendBirthdayLabel)
        view.addSubview(daysToThirdFrindBirtdayLabel)
        view.addSubview(fourthFriendPhoto)
        view.addSubview(fourthFriendNameLabel)
        view.addSubview(fourthFriendBirthdayLabel)
        view.addSubview(daysToFourthFrindBirtdayLabel)
    }
}
