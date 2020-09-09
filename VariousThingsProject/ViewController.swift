//
//  ViewController.swift
//  VariousThingsProject
//
//  Created by MAC on 9/9/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import UIKit

//typealias ThingCompletion = () -> Void
//typealias CodableViewController = Codable & UIViewController
//typealias SessionCompletion = (Data?, URLResponse?, Error?) -> Void
//
//typealias MLDFloat = CGFloat

class ViewController: UIViewController {
  @IBOutlet weak var darkModeLabel: UILabel!
  @IBOutlet weak var darkModeSwitch: UISwitch!
  
  private var name = "Paul"
  fileprivate var lastName = "Renfrew"
  /*
   5 levels of access
   
   private - can only be used within the class it was defined. Note that private properties can be used within extensions of the class, so long as it is within the same file
   fileprivate - can only be used within the same file. In most cases equivalent to private considering you onl y have one class per file
   internal - can be used by anything within the same module. If no access level is defined, it uses internal.
   public - can be used outside of the module. However, can't be subclassed or overridden outside of the module
   open - can be used, subclassed and overriden outside of the module. Similar to open, but can be subclassed and/or overridden outside of the module
   */
  
  private func updateDarkModeUI() {
    if self.darkModeSwitch.isOn {
      self.view.backgroundColor = .black
      self.darkModeLabel.textColor = .white
    } else {
      self.view.backgroundColor = .white
      self.darkModeLabel.textColor = .black
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    /*
     3 main ways to do data persistence
     1. UserDefaults - used for gnerally simple pieces of information that are not user-sensitive
     2. KeyChain - used to store user-sensitive pieces of information, such as passwords. Reason being is because keyChain encrypts things stored in it, making it a more secure mode of persistence. It mainly relies on query dictionaries to do anything, including saving and retrieving data fto/from the Keychain
     3. CoreData
     */
    
    /*
     CoreData is made up of 4 main components:
     1. Persistent store
     2. managed Object Context(MOC)
     3. Persistent store coordinator
     4. Managed Objects
     */
    let isDarkModeOn = UserDefaults.standard.bool(forKey: "darkMode")
    self.darkModeSwitch.isOn = isDarkModeOn
    self.updateDarkModeUI()
    var i = 1
    self.addFirst10NumbersAbove(i: &i)
  }
  
  func addFirst10NumbersAbove(i: inout Int) {
//    var mutableI = i
    for n in 1...10 {
      let newN = i + n
      i += newN
    }
  }
  
  @IBAction func didChangeSwitch(_ sender: UISwitch) {
    self.updateDarkModeUI()
    UserDefaults.standard.set(sender.isOn, forKey: "darkMode")
  }
  //  func doThings(completion: @escaping ThingCompletion) {
//
//  }
}

//extension Array where Element: Comparable {
//  func object(at index: Int) -> Element? {
//    if index >= 0 && index < self.count {
//      return self[index]
//    } else {
//      return nil
//    }
//  }
//}

extension ViewController {
  func getName() -> String {
    return self.name
  }
}

class OtherClass {
  func getViewControllerName() -> String {
    let vc = ViewController()
    return vc.lastName
  }
}

//struct MLDRect {
//  let origin: MLDPoint
//}
//
//struct MLDPoint {
//  let x: MLDFloat
//  let y: MLDFloat
//}
