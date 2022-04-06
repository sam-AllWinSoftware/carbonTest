//
//  Model.swift
//  testCarbon
//
//  Created by User on 4/5/22.
//

import Foundation
import UIKit

enum Section {
    case main
}

class List: Hashable {
    var id = UUID()
    var name: String
    var image: UIImage

    init(name: String,image: UIImage){
        self.name = name
        self.image = image
  
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
       
    static func == (lsh: List, rhs: List) -> Bool {
        lsh.id == rhs.id
    }
    
}

extension List {
    static func allList() -> [List] {
        var lists: [List] = []
        
        let item1 = List(name: "Ventas de gasolina por mes, esto es una prueba",image: UIImage(named: "Vector-5")!)
        let item2 = List(name: "Clientes", image: UIImage(named: "Vector-3")!)
        let item3 = List(name: "Inventario", image: UIImage(named: "Vector-4")!)
        let item4 = List(name: "Arqueo", image: UIImage(named: "Vector-5")!)
        let item5 = List(name: "Proveedores", image: UIImage(named: "Vector-6")!)
        let item6 = List(name: "Informes", image: UIImage(named: "Vector-1")!)
        let item7 = List(name: "Cartera y Cobro", image: UIImage(named: "Vector-7")!)
        let item8 = List(name: "Empleados", image: UIImage(named: "Vector-2")!)
        lists.append(contentsOf: [item1,item2,item3,item4,item5,item6,item7,item8])
        
        return lists
    }
}
