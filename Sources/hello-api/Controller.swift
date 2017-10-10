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
import CloudEnvironment

#if os(Linux)
    import Glibc
#endif

public class Controller {
    
    let router: Router
    let appEnv: CloudEnv
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
    
    let people: [Dictionary<String, Any>] = [
        ["name":"Bruce", "age":30, "gender":"male"],
        ["name":"Linda", "age":28, "gender":"female"],
        ["name":"Alice", "age":32, "gender":"female"]
    ]
    
    init() throws {
        appEnv = CloudEnv()
        router = Router()
        router.get("/author", handler: self.getMain)
        router.get("/otherPeople", handler: self.getOtherPeople)
        router.get("/otherPeople/random", handler: self.getRandomPerson)
    }

    
    public func getMain(request: RouterRequest, response: RouterResponse, next: @escaping() -> Void) throws{
        Log.debug("GET - / router handler...")
        var json = JSON([:])
        json["name"].stringValue = "Mariusz"
        json["age"].intValue = 31
        json["gender"].stringValue = "male"
        try response.status(.OK).send(json: json).end()
    }
    
    public func getOtherPeople(request: RouterRequest, response: RouterResponse, next: @escaping() -> Void) throws{
        Log.debug("GET - /otherPeople router handler...")
        let json = JSON(people)
        try response.status(.OK).send(json: json).end()
    }
    
    public func getRandomPerson(request: RouterRequest, response: RouterResponse, next: @escaping() -> Void) throws{

        Log.debug("GET - /otherPeople/random router handler...")
        #if os(Linux)
            srandom(UInt32(NSDate().timeIntervalSince1970))
            let index = random() % people.count
        #else
            let index = Int(arc4random_uniform(UInt32(people.count)))
        #endif
        let json = JSON(people[index])
        try response.status(.OK).send(json: json).end()
    }


}
