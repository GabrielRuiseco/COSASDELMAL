//
//  Usuario.swift
//  alex_preexamen
//
//  Created by Mac10 on 11/02/21.
//  Copyright © 2021 Mac10. All rights reserved.
//

import UIKit

class Usuario: Codable {
    var aflm_username: String
    var aflm_password: String
    
    init(username: String, password:String){
        self.aflm_username = username
        self.aflm_password = password
    }
    func store(vc: UIViewController){
        //get productos
        
        app.aflm_shared.aflm_usuarios = self.getUsers()
        app.aflm_shared.aflm_usuarios.append(self)
        //print("Productos:\(App.shared.productos)")
        
        let encoder = JSONEncoder()
        
        guard let data:Data = try? encoder.encode(app.aflm_shared.aflm_usuarios)
            else{
            fatalError("NO FUE POSIBLE EL PARSEO")
        }
        
        app.aflm_shared.defaults.setValue(data, forKey: "usuarios")
        app.aflm_shared.defaults.synchronize()
        
        vc.alertDefault(for: "Faltan campos por llenar", and: "Revisa los campos por llenar")
        
    }
    
    func getUsers() -> [Usuario]{
        
        if let data = app.aflm_shared.defaults.object(forKey: "usuarios") as? Data{
            
            let decoder = JSONDecoder()
            
            guard let aflm_usuarios = try?
                decoder.decode([Usuario].self, from: data)
                else{
                fatalError("NO FUE POSIBLE LA DESERIALIZACION")
            }
            return aflm_usuarios
            
        }
        return [Usuario]()
    }
}
