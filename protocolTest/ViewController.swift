//
//  ViewController.swift
//  protocolTest
//
//  Created by Yuki Shinohara on 2020/06/19.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//
///プロトコル: 設計図で定義すべきプロパティやメソッドについて記述
//https://techacademy.jp/magazine/14876

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let choko = Dog(name: "Choko", gender: <#String#>, age: 6)
//        choko.say(name: "Kotaro")
//        choko.sleep(for: 8)
        
        let kotaro = Dog(name: "小太郎", gender: .male, age: 5)
        print(kotaro.bark())
        print(kotaro.gender)
        print(kotaro.say(name: "チョコ"))
        
        let a = someClass()
        let str = a.someString
        print(str)
        
        var pitcher = Ohtani()
        print(pitcher.name)
        print(pitcher.specialty())
    }


}

protocol Speaking {}

extension Speaking{
    func say(name: String){
        print("Hey \(name)")
    }
    func sleep(for num: Int){
        print("I slept for \(num) hours last night")
    }
}

class Dog: Animal, Speaking {
    
    var name: String
    
    var gender: Gender
    
    var age: Int
    
    init(name: String, gender: Gender, age: Int) {
        self.name = name
        self.gender = gender
        self.age = age
    }
    
    func bark() -> String {
        return "ワン"
    }
    
    
}

enum Gender: String{
    case male
    case female
}

protocol Animal {
    var name: String{get}
    var gender: Gender{get}
    var age: Int{get}
    func bark() -> String
}

protocol SomeProtocol { }

extension SomeProtocol {
    var someString: String {
       return "文字列"
    }
}

class someClass: SomeProtocol {}

protocol Athelete {
    //varのみ letだめ
    var name: String{get}
    var age: Int{set get}
    func specialty() -> String
}
//protocol内部では ="あああ"という書き方できない

extension Athelete{
    func specialty() -> String{
        return "Pitcher and Batter"
    }
    //funcのデフォ値設定
}

struct Ohtani: Athelete{
    var name: String = "Shohei"
    var age: Int = 25
//    func specialty() -> String {
//        return "fast ball"
//    }
}
//元のプロトコルにある変数、関数を全て記載しないとエラーになる(デフォルトがある分はOK)


