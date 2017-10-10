//
//  Controller.swift
//  hello-apiPackageDescription
//
//  Created by mariusz on 09.10.2017.
//

import Foundation
import Kitura
import SwiftyJSON
import LoggerAPI
import CloudFoundryEnv

public class Controller {
    let router: Router
    let appEnv: AppEnv
    var url: String {
        get {
            return appEnv.url
        }
    }
    var port: Int {
        get {
            return appEnv.port
        }
    }
    
    init() throws {
        appEnv = try CloundFoundryEnv.getAppEnv()
        router = Router()
        router.get("/", handler: getMain)
    }
    
    public func getMain(request: Request Router){
        
    }
}
