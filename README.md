GURobots
============
*Swift convenience wrappers around gurobots*

---

# Table Of Contents

- [Quick Start](#quick-start)
- [Nao Robots](#nao-robots)
  * [Reading From The Whiteboard](#reading-from-the-whiteboard)
  * [A Manageable Nao](#a-manageable-nao)
  * [Common Functionality](#common-functionality)
    + [Joints](#joints)
      - [Manipulating Joints](#manipulating-joints)
    + [Kinematics](#kinematics)
    + [Vision (Not Yet Implemented)](#vision-not-yet-implemented)
    + [Locations](#locations)
    + [Field Position](#field-position)

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
`SoccerObjectLocationsContainer`, `FieldPositionContainer` and the camera protocols
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

// The robots can also create gucoordinate camera pivots and provide convenience
// functions for converting between image and relative coordinate systems.
let pixelCoordinate = PixelCoordinate(x: -12, y: 46, resWidth: 640, resHeight: 480)
if nao.topCameraObjectOnGround(pixelCoordinate) {
    let relativeCoordinate = nao.topCameraRelativeCoordinate(of: pixelCoordinate)
}
let clamped = nao.topCameraClampedPercentCoordinate()
```

# Nao Robots

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

One you have a nao object, you may routinely update the nao with the latest values from
the whiteboard. Note that this means that you must manually trigger a read from the
whiteboard, by default, the nao will keep the previous read values until a whiteboard
read happens. You can read from the whiteboard using the update function:
```
var nao = NaoV5() // Reads from the whiteboard automatically when it is created.
nao.update() // Take a second reading from the whiteboard.
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
// Setting the head pitch and yaw.
var nao = ManageableNao(
        joints: NaoJoints(
            head: NaoHead(neck: PitchYawJoint(pitch: .degrees(5.7), yaw: .degrees(-12.4)))
        )
    )
```

Once the nao has been created, you may overwrite these values:
```swift
// Changing the head pitch.
nao.head.neck.pitch = .degrees(-3.2)
```

## Common Functionality

The `NaoV5` and `ManageableNaoV5` structs share a lot of common functionality. This is
provided through protocol and protocol extensions. Many of the functionality that these
protocols provide is built from properties which the nao structs define. For the `NaoV5` these
properties are automatically created from the values read from the whiteboard. For the
`ManageableNaoV5`, again, these properties have to be provided manually; however, these
values contain common sense defaults and may be omitted in different situations.
The following is a list of some of the common functionality that the nao structs provide:

### Joints
---

The nao structs contain a `joints` property which is of the type `NaoJoints`. The
`NaoJoints` struct contains information for all the joints that make up the nao. This includes
the pitch, yaw and roll of the joints, as well (not yet implemented) as temperature readings
from the sensors for each of the joints.
```swift
let neck = nao.head.neck // PitchYawJoint
```

#### Manipulating Joints

For the `ManageableNaoV5` struct, it can be difficult to set all the joints to place the robot
into specific positions. To make this easier, the `ManageableNaoV5`  stryct provides
convenience functions for common positions:
```swift
// Sets the arm and leg joints.
let nao = ManageableNaoV5.standing()
let nao = ManageableNaoV5.kneeling()

// Can still set all the other fields.
let nao = ManagealbeNaoV5.standing(
    head: NaoHead(neck: PitchYawJoint(pitch: .degrees(1.5), yaw: .degrees(-2.3))),
    soccerObjectLocations: SoccerObjectLocations(ball: RelativeCoordinate(direction: .degrees( -36), distance: .centimetres(80))),
    fieldPosition: FieldCoordinate(position: CartesianCoordinate(x: 12, y: -23),
    heading: .degrees(80)
)

// You can also do this after the nao has been created
var nao = ManageableNaoV5()
nao.stand()
nao.kneel()

// Immutable Variants
let newNao = nao.standing()
let newNao = nao.kneeling()
```

### Kinematics
---

Because the nao structs contain the current position of all the joints, kinematics calculations
are possible. Importantly, this makes it possible to provide convenience functions for
interfacing with `gucoordinates`. The `gucoordinates` library uses `CameraPivot`
and `Camera` objects to specify the orientation and location of cameras with respect to
the ground. Because the nao structs can perform a kinematics chain, the
`CameraPivot` and `Camera` objects for the robot can automatically be created. This
makes, for example, converting a sighting from vision --- which is posted in centered
pixel coordinates --- easily convertable to relative coordinates --- which is used by
the Kalman Filter --- for each of the top and bottom cameras:
```swift
let mySighting = PixelCoordinate(x: 123, y: -242, resWidth: 1920, resHeight: 1080)
let relativeCoordinate = nao.topCameraRelativeCoordinate(of: mySighting)

// Or perhaps some safety checks first:
guard nao.topCameraObjectOnGround(object: mySighting) else {
    fatalError("The sighting was for an object that is not on the ground.")
}
let relativeCoordinate = nao.topCameraRelativeCoordinate(of: mySighting)
```

### Vision (Not Yet Implemented)
---

The nao structs contain a `topCameraSightings` property and a
`bottomCameraSightings` property which contain the sightings that is reported from
vision. Each of these properties is a `SoccerSightings` struct. A `SoccerSightings`
struct provides information for the sightings for each of the objects on a soccer field in
cenetered pixel coordinates. Because GURobots interfaces with `gucoordinates` it is
possible to fetch these sightings using the different coordinate systems:
```swift
// In centered pixel coordinates.
guard let ballSighting = nao.bottomCameraBallSighting else {
    fatalError("Cannot see ball.")
}
ballSighting // PixelCoordinate
let cameraCoordinate = ballSightings.cameraCoordinate // CameraCoordinate
```

### Locations
---

Each of the nao structs contain a `soccerObjectLocations` property. This property
contains information on the relative locations of soccer field objects --- such as the
ball and goals --- in relation to the robot. Each of the nao structs provide convenience
functions for accessing these locations:
```swift
// Where is the ball in relation to the robot?
guard let ballLocation = nao.ballLocation else {
    fatalError("We don't know where the ball is.")
}
ballLocation // RelativeCoordinate(direction: .degrees(-12), distance: .millimetres(3000))
```

### Field Position
---

Each of the nao structs contain a `fieldPosition` property that may be nil. This property
is a `FieldCoordinate` from `gucoordinates` describing the current position of the robot
on the soccer field. Having the position of the robot on the soccer field is advantageous
as it allows all the sightings and locations mentioned in the previous sections to be
extrapolated into the field coordinate system space:
```swift
guard let ballLocation = nao.ballLocation else {
    fatalError("We don't know where the ball is.")
}
guard let ballFieldPosition = nao.cartesianCoordinate(at: ballLocation) else {
    fatalError("We don't knoe where we are on the field.")
}
ballFieldPosition // CartesianCoordinate
```
