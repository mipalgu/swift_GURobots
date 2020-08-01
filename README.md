GURobots
============
*Swift convenience wrappers around gurobots*

---

# Quick Start

GURobots gives you the ability to query the state of robots from the whiteboard. This
pretty much combines all the modules that are used for robocup into a single
facade/active record like structure. This is achieved by creating a robot (such as a nao)
object:
```swift
// Creates a nao that will read from the global whiteboard.
var nao = NaoV5()
```

And then, when new information is required, reading from the whiteboard:
```swift
nao.update() // Reads from the whiteboard.
```

A set of protocols and protocol extensions are available which provide all of
then functionality of the robots. Some common protocols are: `NaoJointsContainer`,
`SoccerSightingsContainer`, `FieldPositionContainer` and the camera protocols
`TopCameraContainer` and `BottomCameraContainer`.

The robots objects also leverage GUCoordinates to allow for coordinate calculations:
```swift
// Fetch the ball as a RelativeCoordinate
guard let ball = nao.ballSighting else {
    fatalError("The nao cannot see the ball")
}

// Calculate the field position of the ball.
guard let ballFieldPosition = nao.cartesianCoordinate(at: ball) else {
    fatalError("Only fails if the nao doesn't know where it is on the field")
}
```

# Nao's

## Reading From The Whiteboard

The `NaoV5` struct is the struct to use when creating behaviours. This struct allows you
to query the state of all the modules within the MiPal infrastructure which post to the
whiteboard and are related to the nao robot. The constructor takes a whiteboard and the
indexes to use to query the messages related to the nao in the whiteboard. By default,
if you do not provide these parameters, the default global whiteboard and appropriate
indexes are used. This means that by default, creating a nao will use the global
whiteboard to read its values:
```swift
let nao = NaoV5()
```

Alternatively, for example when custom whiteboard are used, you can provide these
values:
```swift
let nao = NaoV5(
    wb: Whiteboard(wbd: gsw_new_whiteboard("my_custom_whiteboard")),
    indexes: NaoWBIndexes(
        torsoSensors: 0,
        topParticles: 1,
        handSensors: 2,
        headSensors: 3,
        legSensors: 4,
        ballLocation: 5,
        leftGoalPostLocation: 6,
        rightGoalPostLocation: 7,
        goalLocation: 8
    )
)
```

## A Manageable Nao

While the `NaoV5` object gives you a read-only interface that communicates with the
whiteboard, sometimes a fully manual approach is required. The `ManageableNaoV5`
struct is used for this purpose. If you are creating a simulator, or perhaps a vision
module, then this is the struct you should use.

The `ManageableNaoV5` struct does not read from a whiteboard.
Note that the `ManageableNaoV5` provides the same
set of functionality as `NaoV5` as it conforms to the same set of protocols; however,
where the `NaoV5` object would only allow you to influence the values within the object ---
thus the result of the functions that it provides --- by reading the whiteboard,
a `ManageableNaoV5` object allows you to directly write to these variables and thus
directly influence the result of certain operations. Basically, the `ManageableNaoV5`
type gives you full control of the results of the operations that it can perform whereas the
`NaoV5` object was only limited to results based on the values from the whiteboard.

Because the `ManageableNaoV5` struct does not read from the whiteboard, the constructor
may take some values:
```swift
var nao = ManageableNao(joints: NaoJoints(head: NaoHead(pitch: 5.7, yaw: -12.4)))
```

Once the nao has been created, you may overwrite these values:
```swift
nao.head.pitch = -3.2
```
