// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GURobots",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
        name: "GURobots",
        targets: ["GURobots"]),
        .library(
            name: "Nao",
            targets: ["Nao"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "GUSimpleWhiteboard", url: "https://github.com/mipalgu/swift_wb.git", .branch("main")),
        .package(name: "GUCoordinates", url: "https://github.com/mipalgu/swift_GUCoordinates.git", .branch("main"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .systemLibrary(name: "CGURobots", pkgConfig: "libgurobots"),
        .target(
            name: "GURobots",
            dependencies: ["CGURobots", "GUCoordinates"]),
        .target(name: "Nao", dependencies: ["GURobots", "GUCoordinates", "GUSimpleWhiteboard"]),
        .testTarget(
            name: "GURobotsTests",
            dependencies: ["GURobots"]),
    ]
)
