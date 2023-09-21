//
//  DonatModel.swift
//  donatApp
//
//  Created by Борух Соколов on 19.09.2023.
//

import SwiftUI
import Foundation
import SwiftUI


class DonatModel:Identifiable {
    var id :String = UUID().uuidString
    var image:String
    //var color:Color
    var title:String
    var description:String
    var price:Int
    var teg:[Teg] //its array because item can include MANY tags
   
    init(image: String, title: String, description:String, price:Int = 7000, teg:[Teg] = [.всеМеню]) {
        
        self.image = image
        self.title = title
        self.description = description
        self.price = price
        self.teg = teg
       
    }
    
    
   
    
}


enum Teg: String, Codable, CaseIterable {
    case всеМеню = "Все меню"
    case клубничные = "Клубничные"
    case шоколадные = "Шоколадные"
}
