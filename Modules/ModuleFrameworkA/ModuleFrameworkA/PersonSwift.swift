//
//  PersonSwift.swift
//  ModuleFrameworkA
//
//  Created by vchan on 2021/5/8.
//

import Foundation

@objc open class PersonSwift : NSObject {
    @objc public var age = 0
    
    @objc public func sayHello() {
        let tea:Teacher = Teacher()
        print("sayHello")
        tea.whoIam()
        print("sayGoodbye")
    }
    
    @objc open func whoIam() {
        print("I am PersonSwift age = \(age)")
        let aPersonSwiftA = PersonSwiftA()
//        let aModuleSwiftA = ModuleSwiftA()
    }
}

private class PersonSwiftA : NSObject {
    var age = 0
    var astruct = StructA()
    
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

fileprivate struct StructA {
    var age = 0
    
}
