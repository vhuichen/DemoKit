//
//  ModuleBSwift.swift
//  ModuleFrameworkB
//
//  Created by vchan on 2021/5/9.
//

import Foundation
import ModuleFrameworkA

public class ModuleBSwift: NSObject {
    @objc public func moduleBSwiftSayHello() {
        print("ModuleBSwift SayHello")
        let stu:Student = Student()
        let tea:Teacher = Teacher()
        print("sayHello")
        stu.whoIam()
        tea.whoIam()
        
        let aPersonSwift = PersonSwift()
        aPersonSwift.sayHello()
        
        print("sayGoodbye")
        
        //
        
        let stuB:Student = ModuleBStudent()
        let teaB:Teacher = ModuleBTeacher()
        stuB.whoIam()
        teaB.whoIam()
        
        let aModuleBPersonSwift = ModuleBPersonSwift()
        aModuleBPersonSwift.sayHello()
    }
}


public class ModuleBStudent: Student {
    override public func whoIam() {
        print("whoIam = ModuleBStudent")
    }
}

public class ModuleBTeacher: Teacher {
    override public func whoIam() {
        print("whoIam = ModuleBTeacher")
    }
}

public class ModuleBPersonSwift: PersonSwift {
    override public func whoIam() {
        print("whoIam = ModuleBPersonSwift")
    }
}
