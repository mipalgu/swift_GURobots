/*
 * BottomCameraContainer.swift
 * GURobots
 *
 * Created by Callum McColl on 25/7/20.
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

/// Conforming types have a camera designated the *bottom camera*.
///
/// This protocol provides convenience functions which make the use of
/// `Camera` and `CameraPivot` objects easier. Users of types that conform to
/// this protocol are able to use most of the functionality provided by the
/// `Camera` and `CameraPivot` api without having to create their own
/// pivot points and camera objects.
///
/// As the name of the protocol suggests; all the functionality provided by
/// this protocol deals with a specific camera designated the *bottom camera*.
public protocol BottomCameraContainer {
    
// MARK: - Properties
    
    /// The robots bottom camera.
    var bottomCamera: RobotCamera { get }
    
}

extension BottomCameraContainer {
    
// MARK: - Camera Visibility Of Objects
    
    /// Can the bottom camera attached to `bottomCameraPivot` see the object?
    ///
    /// - Parameter coord: The location of the object in relation to the
    /// bottom camera.
    ///
    /// - Returns: True if the bottom camera can see the object, False
    /// otherwise.
    public func bottomCameraCanSee(object: RelativeCoordinate) -> Bool {
        return self.bottomCamera.canSee(object: object)
    }
    
// MARK: - Image Coordinate Validation
    
    /// Is the object represent by the pixel in the image taken from the top
    /// camera on the ground?
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Returns: True if the pixel represents an object that is on the ground.
    /// Otherwise, False.
    public func bottomCameraObjectOnGround(_ coord: CameraCoordinate) -> Bool {
        return self.bottomCamera.objectOnGround(coord)
    }
    
    /// Is the object represent by the pixel in the image taken from the top
    /// camera on the ground?
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Returns: True if the pixel represents an object that is on the ground.
    /// Otherwise, False.
    public func bottomCameraObjectOnGround(_ coord: PixelCoordinate) -> Bool {
        return self.bottomCamera.objectOnGround(coord)
    }
    
    /// Is the object represent by the point in the image taken from the top
    /// camera on the ground?
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Returns: True if the point represents an object that is on the ground.
    /// Otherwise, False.
    public func bottomCameraObjectOnGround(_ coord: PercentCoordinate) -> Bool {
        return self.bottomCamera.objectOnGround(coord)
    }
    
// MARK: Converting Image Coordinates To Relative Coordinates
    
    /// Convert the object in an image to a `RelativeCoordinate` for the
    /// bottom camera attached to the `bottomCameraPivot` pivot point.
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
    public func bottomCameraRelativeCoordinate(of coord: CameraCoordinate) -> RelativeCoordinate {
        return self.bottomCamera.relativeCoordinate(of: coord)
    }


    /// Convert the object in an image to a `RelativeCoordinate` for the
    /// bottom camera attached to the `bottomCameraPivot` pivot point.
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
    public func bottomCameraRelativeCoordinate(of coord: PixelCoordinate) -> RelativeCoordinate {
        return self.bottomCamera.relativeCoordinate(of: coord)
    }

    /// Convert the object in an image to a `RelativeCoordinate` for the
    /// bottom camera attached to the `bottomCameraPivot` pivot point.
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
    public func bottomCameraRelativeCoordinate(of coord: PercentCoordinate) -> RelativeCoordinate {
        return self.bottomCamera.relativeCoordinate(of: coord)
    }
    
// MARK: - Converting Relative Coordinates To Image Coordinates
    
    /// Calculate a pixel within an image representing the specified object in
    /// the bottom camera.
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
    public func bottomCameraCameraCoordinate(to coord: RelativeCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> CameraCoordinate {
        return self.bottomCamera.cameraCoordinate(to: coord, resWidth: resWidth, resHeight: resHeight)
    }
    
    /// Calculate a pixel within an image representing the specified object in
    /// the bottom camera.
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
    public func bottomCameraPixelCoordinate(to coord: RelativeCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> PixelCoordinate {
        return self.bottomCamera.pixelCoordinate(to: coord, resWidth: resWidth, resHeight: resHeight)
    }
    
    /// Calculate a point within an image representing the specified object in
    /// the bottom camera.
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
    public func bottomCameraPercentCoordinate(to coord: RelativeCoordinate) -> PercentCoordinate {
        return self.bottomCamera.percentCoordinate(to: coord)
    }
    
    /// Calculate a pixel within an image representing the specified
    /// object in the bottom camera.
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
    /// bottom camera.
    public func bottomCameraClampedCameraCoordinate(to coord: RelativeCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> CameraCoordinate {
        return self.bottomCamera.clampedCameraCoordinate(to: coord, resWidth: resWidth, resHeight: resHeight)
    }
    
    /// Calculate a pixel within an image representing the specified
    /// object in the bottom camera.
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
    /// bottom camera.
    public func bottomCameraClampedPixelCoordinate(to coord: RelativeCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> PixelCoordinate {
        return self.bottomCamera.clampedPixelCoordinate(to: coord, resWidth: resWidth, resHeight: resHeight)
    }
    
    /// Calculate a point within an image representing the specified
    /// object in the bottom camera.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The location of the object.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// bottom camera.
    public func bottomCameraClampedPercentCoordinate(to coord: RelativeCoordinate) -> PercentCoordinate {
        return self.bottomCamera.clampedPercentCoordinate(to: coord)
    }
    
}
