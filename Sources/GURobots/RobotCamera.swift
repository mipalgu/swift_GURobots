/*
 * RobotCamera.swift
 * GURobots
 *
 * Created by Callum McColl on 11/9/20.
 * Copyright © 2020 Callum McColl. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials
 *    provided with the distribution.
 *
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgement:
 *
 *        This product includes software developed by Callum McColl.
 *
 * 4. Neither the name of the author nor the names of contributors
 *    may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * -----------------------------------------------------------------------
 * This program is free software; you can redistribute it and/or
 * modify it under the above terms or under the terms of the GNU
 * General Public License as published by the Free Software Foundation;
 * either version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/licenses/
 * or write to the Free Software Foundation, Inc., 51 Franklin Street,
 * Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */

import GUCoordinates

/// Provides a convenience struct that makes operating with GUCoordinate cameras
/// easier.
public struct RobotCamera {
    
// MARK: - Properties
    
    /// The `CameraPivot` that this camera is attached to.
    public var cameraPivot: CameraPivot
    
    /// The index of the camera within the `cameraPivot.cameras` array.
    public let index: Int
    
    /// The `Camera`.
    public var camera: Camera {
        get {
            self.cameraPivot.cameras[index]
        } set {
            self.cameraPivot.cameras[index] = newValue
        }
    }

// MARK: - Createing a RobotCamera
    
    /// Create a `RobotCamera`.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` which this camera is attached
    /// to.
    ///
    /// - Parameter camera: The index of the camera within the
    /// `cameraPivot.cameras` array.
    public init(cameraPivot: CameraPivot, camera: Int) {
        self.cameraPivot = cameraPivot
        self.index = camera
    }
    
// MARK: - Convenince Getters
    
    /// The vertical distance from the ground to the pivot
    /// point.
    public var cameraPivotHeight: Distance {
        get {
            return self.cameraPivot.height
        } set {
            self.cameraPivot.height = newValue
        }
    }
    
    /// The vertical orientation of the pivot point.
    public var cameraPivotPitch: Angle {
        get {
            return self.cameraPivot.pitch
        } set {
            self.cameraPivot.pitch = newValue
        }
    }
    
    /// The horizontal orientation of the pivot point.
    public var cameraPivotYaw: Angle {
        get {
            return self.cameraPivot.yaw
        } set {
            self.cameraPivot.yaw = newValue
        }
    }
    
    /// The vertical distance from the pivot point to the middle of the camera.
    ///
    /// If the pivot point is the ground then this is the height to the ground.
    /// If it is a camera on a stick then it's the height from the end of the
    /// stick to the camera. If it's a camera attached to the head of a robot
    /// then its the length from the neck (the pivot point for the head) to the
    /// camera.
    public var cameraHeight: Distance {
        get {
            return self.camera.height
        } set {
            self.camera.height = newValue
        }
    }
    
    /// The vertical orientation of the camera in relation
    /// to the pivot point.
    ///
    /// A positive value means that the camera is pointing more to the ground. A
    /// negative value means that the camera is pointing more to the sky.
    public var cameraPitch: Angle {
        get {
            return self.camera.vDirection
        } set {
            self.camera.vDirection = newValue
        }
    }
    
    /// The distance the camera is from the pivot point. A positive value
    /// indicates that the camera is in front of the pivot point while a
    /// negative value indicates that the camera is behind the pivot
    /// point.
    ///
    /// This property is useful for when the camera is mounted on a robot
    /// and distance calculations need to be calculated from the torso,
    /// not the camera.
    public var centerOffset: Distance {
        get {
            return self.camera.centerOffset
        } set {
            self.camera.centerOffset = newValue
        }
    }
    
    /// The vertical field of view of the camera.
    public var vFov: Angle {
        get {
            return self.camera.vFov
        } set {
            self.camera.vFov = newValue
        }
    }
    
    /// The horizontal field of view of the camera.
    public var hFov: Angle {
        get {
            return self.camera.hFov
        } set {
            self.camera.hFov = newValue
        }
    }
    
// MARK: - Checking Whether Conversions Are Possible
    
    /// Is the object represent by the pixel in the image taken from the camera
    /// on the ground?
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Returns: True if the pixel represents an object that is on the ground.
    /// Otherwise, False.
    public func objectOnGround(_ coord: CameraCoordinate) -> Bool {
        return self.cameraPivot.objectOnGround(coord, forCamera: self.index)
    }
    
    /// Is the object represent by the pixel in the image taken from the camera
    /// on the ground?
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Returns: True if the pixel represents an object that is on the ground.
    /// Otherwise, False.
    public func objectOnGround(_ coord: PixelCoordinate) -> Bool {
        return self.cameraPivot.objectOnGround(coord, forCamera: self.index)
    }
    
    /// Is the object represent by the pixel in the image taken from the camera
    /// on the ground?
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Returns: True if the pixel represents an object that is on the ground.
    /// Otherwise, False.
    public func objectOnGround(_ coord: PercentCoordinate) -> Bool {
        return self.cameraPivot.objectOnGround(coord, forCamera: self.index)
    }
    
    /// Can the camera see the object?
    ///
    /// - Parameter coord: The location of the object in relation to the camera.
    ///
    /// - Returns: True if the specified camera can see the object, False
    /// otherwise.
    public func canSee(object coord: RelativeCoordinate) -> Bool {
        return self.cameraPivot.canSee(object: coord, inCamera: self.index)
    }
    
// MARK: - Converting Image Coordinates To Relative Coordinates
    
    /// Convert the object in an image to a `RelativeCoordinate` for the
    /// top camera attached to the `topCameraPivot` pivot point.
    ///
    /// - Parameter coord: The pixel within the image representing the object.
    ///
    /// - Returns: This function returns the
    /// `RelativeCoordinate` representing the object in the image at the pixel
    /// `coord`.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func relativeCoordinate(of coord: CameraCoordinate) -> RelativeCoordinate {
        return coord.relativeCoordinate(cameraPivot: self.cameraPivot, camera: self.index)
    }

    /// Convert the object in an image to a `RelativeCoordinate` for the
    /// top camera attached to the `topCameraPivot` pivot point.
    ///
    /// - Parameter coord: The pixel within the image representing the object.
    ///
    /// - Returns: This function returns the
    /// `RelativeCoordinate` representing the object in the image at the pixel
    /// `coord`.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func relativeCoordinate(of coord: PixelCoordinate) -> RelativeCoordinate {
        return coord.relativeCoordinate(cameraPivot: self.cameraPivot, camera: self.index)
    }

    /// Convert the object in an image to a `RelativeCoordinate` for the
    /// top camera attached to the `topCameraPivot` pivot point.
    ///
    /// - Parameter coord: The point within the image representing the object.
    ///
    /// - Returns: This function returns the
    /// `RelativeCoordinate` representing the object in the image at the point
    /// `coord`.
    ///
    /// - Warning: Only use this function if you are positive that the point in
    /// the image is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func relativeCoordinate(of coord: PercentCoordinate) -> RelativeCoordinate {
        return coord.relativeCoordinate(cameraPivot: self.cameraPivot, camera: self.index)
    }
    
// MARK: - Converting Relative Coordinates To Image Coordinates
    
    /// Calculate a pixel within an image representing the specified object in
    /// the top camera.
    ///
    /// - Parameter coord: The location of the target object.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the target in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the target in.
    ///
    /// - Returns: The `CameraCoordinate` representing the target in the image
    /// at a specific pixel.
    ///
    /// - Warning: This function does not check whether the calculated
    /// coordinate is within the bounds of `resWidth` and `resHeight`. As such
    /// you should only use this function if you are positive that the camera
    /// can actually see the object at `coord`.
    public func cameraCoordinate(to coord: RelativeCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> CameraCoordinate {
        return coord.cameraCoordinate(cameraPivot: self.cameraPivot, camera: self.index, resWidth: resWidth, resHeight: resHeight)
    }
    
    /// Calculate a pixel within an image representing the specified object in
    /// the top camera.
    ///
    /// - Parameter coord: The location of the target object.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the target in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the target in.
    ///
    /// - Returns: The `PixelCoordinate` representing the target in the image
    /// at a specific pixel.
    ///
    /// - Warning: This function does not check whether the calculated
    /// coordinate is within the bounds of `resWidth` and `resHeight`. As such
    /// you should only use this function if you are positive that the camera
    /// can actually see the object at `coord`.
    public func pixelCoordinate(to coord: RelativeCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> PixelCoordinate {
        return coord.pixelCoordinate(cameraPivot: self.cameraPivot, camera: self.index, resWidth: resWidth, resHeight: resHeight)
    }
    
    /// Calculate a point within an image representing the specified object in
    /// the top camera.
    ///
    /// - Parameter coord: The location of the target object.
    ///
    /// - Returns: The `PercentCoordinate` representing the target in the image
    /// at a specific pixel.
    ///
    /// - Warning: This function does not check whether the calculated
    /// coordinate is within the bounds of `-1.0` and `1.0`. As such
    /// you should only use this function if you are positive that the camera
    /// can actually see the object at `coord`.
    public func percentCoordinate(to coord: RelativeCoordinate) -> PercentCoordinate {
        return coord.percentCoordinate(cameraPivot: self.cameraPivot, camera: self.index)
    }
    
    /// Calculate a pixel within an image representing the specified
    /// object in the top camera.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The location of the object.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the target.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the target.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the
    /// top camera.
    public func clampedCameraCoordinate(to coord: RelativeCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> CameraCoordinate {
        return coord.clampedCameraCoordinate(cameraPivot: self.cameraPivot, camera: self.index, resWidth: resWidth, resHeight: resHeight)
    }
    
    /// Calculate a pixel within an image representing the specified
    /// object in the top camera.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The location of the object.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the target.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the target.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the
    /// top camera.
    public func clampedPixelCoordinate(to coord: RelativeCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> PixelCoordinate {
        return coord.clampedPixelCoordinate(cameraPivot: self.cameraPivot, camera: self.index, resWidth: resWidth, resHeight: resHeight)
    }
    
    /// Calculate a point within an image representing the specified
    /// object in the top camera.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The location of the object.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// top camera.
    public func clampedPercentCoordinate(to coord: RelativeCoordinate) -> PercentCoordinate {
        coord.clampedPercentCoordinate(cameraPivot: self.cameraPivot, camera: self.index)
    }
    
// MARK: - Field Coordinates From Image Coordinates
    
    /// Calculate the position of an object in an image in relation to
    /// the camera.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to
    /// `fieldPosition`.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func cartesianCoordinate(at coord: CameraCoordinate, from fieldPosition: FieldCoordinate) -> CartesianCoordinate {
        return fieldPosition.cartesianCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: self.index)
    }
    
    /// Calculate the position of an object in an image in relation to
    /// the camera.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to
    /// `fieldPosition`.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func cartesianCoordinate(at coord: PixelCoordinate, from fieldPosition: FieldCoordinate) -> CartesianCoordinate {
        return fieldPosition.cartesianCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: self.index)
    }
    
    /// Calculate the position of an object in an image in relation to
    /// the camera.
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to
    /// `fieldPosition`.
    ///
    /// - Warning: Only use this function if you are positive that the point in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func cartesianCoordinate(at coord: PercentCoordinate, from fieldPosition: FieldCoordinate) -> CartesianCoordinate {
        return fieldPosition.cartesianCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: self.index)
    }
    
    /// Calculate the position of an object in an image in relation to
    /// the camera.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to
    /// `fieldPosition`.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func fieldCoordinate(at coord: CameraCoordinate, from fieldPosition: FieldCoordinate, heading: Degrees_t) -> FieldCoordinate {
        return fieldPosition.fieldCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: self.index, heading: heading)
    }
    
    /// Calculate the position of an object in an image in relation to
    /// the camera.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to
    /// `fieldPosition`.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func fieldCoordinate(at coord: PixelCoordinate, from fieldPosition: FieldCoordinate, heading: Degrees_t) -> FieldCoordinate {
        return fieldPosition.fieldCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: self.index, heading: heading)
    }
    
    /// Calculate the position of an object in an image in relation to
    /// the camera.
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to
    /// `fieldPosition`.
    ///
    /// - Warning: Only use this function if you are positive that the point in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func fieldCoordinate(at coord: PercentCoordinate, from fieldPosition: FieldCoordinate, heading: Degrees_t) -> FieldCoordinate {
        return fieldPosition.fieldCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: self.index, heading: heading)
    }
    
// MARK: - Image Coordinates From Field Coordinates
    
    /// Calculate a pixel within a specific image taken from the camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`.
    public func cameraCoordinate(to coord: CartesianCoordinate, from fieldPosition: FieldCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> CameraCoordinate {
        return self.cameraCoordinate(to: fieldPosition.relativeCoordinate(to: coord), resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image taken from the camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`.
    public func cameraCoordinate(to coord: FieldCoordinate, from fieldPosition: FieldCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> CameraCoordinate {
        return self.cameraCoordinate(to: fieldPosition.relativeCoordinate(to: coord), resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image taken from the camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`.
    public func pixelCoordinate(to coord: CartesianCoordinate, from fieldPosition: FieldCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> PixelCoordinate {
        return self.pixelCoordinate(to: fieldPosition.relativeCoordinate(to: coord), resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image taken from the camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`.
    public func pixelCoordinate(to coord: FieldCoordinate, from fieldPosition: FieldCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> PixelCoordinate {
        return self.pixelCoordinate(to: fieldPosition.relativeCoordinate(to: coord), resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a point within a specific image taken from the camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`.
    public func percentCoordinate(to coord: CartesianCoordinate, from fieldPosition: FieldCoordinate) -> PercentCoordinate {
        return self.percentCoordinate(to: fieldPosition.relativeCoordinate(to: coord))
    }

    /// Calculate a point within a specific image taken from the camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`.
    public func percentCoordinate(to coord: FieldCoordinate, from fieldPosition: FieldCoordinate) -> PercentCoordinate {
        return self.percentCoordinate(to: fieldPosition.relativeCoordinate(to: coord))    }
    
    /// Calculate a pixel within a specific image taken from the camera
    /// representing an object at a given position.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the
    /// camera.
    public func clampedCameraCoordinate(to coord: CartesianCoordinate, from fieldPosition: FieldCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> CameraCoordinate {
        return self.clampedCameraCoordinate(to: fieldPosition.relativeCoordinate(to: coord), resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image taken from the camera
    /// representing an object at a given position.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the
    /// camera.
    public func clampedCameraCoordinate(to coord: FieldCoordinate, from fieldPosition: FieldCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> CameraCoordinate {
        return self.clampedCameraCoordinate(to: fieldPosition.relativeCoordinate(to: coord), resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image taken from the camera
    /// representing an object at a given position.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the
    /// camera.
    public func clampedPixelCoordinate(to coord: CartesianCoordinate, from fieldPosition: FieldCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> PixelCoordinate {
        return self.clampedPixelCoordinate(to: fieldPosition.relativeCoordinate(to: coord), resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image taken from the camera
    /// representing an object at a given position.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the
    /// camera.
    public func clampedPixelCoordinate(to coord: FieldCoordinate, from fieldPosition: FieldCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> PixelCoordinate {
        return self.clampedPixelCoordinate(to: fieldPosition.relativeCoordinate(to: coord), resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a point within a specific image taken from the camera
    /// representing an object at a given position.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera.
    public func clampedPercentCoordinate(to coord: CartesianCoordinate, from fieldPosition: FieldCoordinate) -> PercentCoordinate {
        return self.clampedPercentCoordinate(to: fieldPosition.relativeCoordinate(to: coord))
    }

    /// Calculate a point within a specific image taken from the camera
    /// representing an object at a given position.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter fieldPosition: The field position of the camera.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera.
    public func clampedPercentCoordinate(to coord: FieldCoordinate, from fieldPosition: FieldCoordinate) -> PercentCoordinate {
        return self.clampedPercentCoordinate(to: fieldPosition.relativeCoordinate(to: coord))
    }
    
}
