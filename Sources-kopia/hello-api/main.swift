
import Foundation
import Kitura
import HeliumLogger
import LoggerAPI
import SwiftyJSON

//setbuf(stdout, nil)
//example
//Log.logger = HeliumLogger()
//let router = Router()
//let port = 8090
//router.get("/"){request, response, next in
//    response.status(.OK).send(json: JSON(["Hello":"Kitura"]))
//    next()
//}
//Kitura.addHTTPServer(onPort: port, with: router)
//Kitura.run()
do {
    HeliumLogger.use(LoggerMessageType.info)
    let controller = try Controller()
    Log.info("Server will be started on \(controller.url)")
    Kitura.addHTTPServer(onPort: controller.port, with: controller.router)
    Kitura.run()
} catch let err {
    Log.error(err.localizedDescription)
    Log.error("Service did not started")
}

