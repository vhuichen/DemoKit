//
//  ModuleSwiftA.swift
//  ModuleFrameworkA
//
//  Created by vchan on 2021/5/9.
//

import Foundation

private class ModuleSwiftA : NSObject {
    var age = 0
//    var astruct = StructA()
    
    func sayHello() {
        let tea:Teacher = Teacher()
        print("sayHello")
        tea.whoIam()
        print("sayGoodbye")
    }
    
    func whoIam() {
        print("I am PersonSwift age = \(age)")
    }
}

@objc public class ModuleSwiftA1 : NSObject {
    @objc var age = 0
    
    @objc func sayHello() {
        let tea:Teacher = Teacher()
        print("sayHello")
        tea.whoIam()
        print("sayGoodbye")
    }
    
    @objc func whoIam() {
        print("I am PersonSwift age = \(age)")
    }
}
