//
//  app.swift
//  alex_preexamen
//
//  Created by Mac10 on 11/02/21.
//  Copyright © 2021 Mac10. All rights reserved.
//

import UIKit

class app: NSObject {
    static let aflm_shared = app()
    let defaults = UserDefaults.standard
    var aflm_usuarios = [Usuario]()
}
