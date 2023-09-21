//
//  DonatViewModel.swift
//  donatApp
//
//  Created by Борух Соколов on 19.09.2023.
//

import SwiftUI

class DonatViewModel: ObservableObject {
    
    @Published var donatArr: [DonatModel] = []
    
    init(){
        fetchSale()
    }

    func fetchSale(){
        donatArr.append(
            DonatModel(image: "donut_1", title: "Unicorn Sprinkles", description: "Strawberry creamy...",price: 7800,teg: [.всеМеню,.клубничные]))
        donatArr.append(
            DonatModel(image: "donut_2", title: "Dark Sprinkles", description: "Chocolate with sprin...",price: 6800, teg: [.всеМеню,.шоколадные]))
        donatArr.append(
            DonatModel(image: "donut_3", title: "Choco Avocado", description: "Avocado creamy",price: 8800, teg:  [.всеМеню,.шоколадные]))
        donatArr.append(
            DonatModel(image: "donut_4", title: "Vanilla Splash", description: "Vanilla creamy with...", teg: [.всеМеню,.клубничные]))
        

    }


   
    
    
}

