
import PackageDescription

let package = Package(
    name: "hello-api",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 7),
        .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 1, minor: 7),
        .Package(url: "https://github.com/IBM-Swift/Swift-cfenv.git", majorVersion: 4, minor: 1),
        .Package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", majorVersion: 4)
    ]
)
