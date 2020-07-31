/*
 * FieldPosition+BottomCameraContainer.swift
 * GURobots
 *
 * Created by Callum McColl on 26/7/20.
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

extension FieldPositionContainer where Self: BottomCameraContainer {
 
// MARK: - Bottom Camera Visibility Of Object On The Field
    
    /// Can the camera see the object?
    ///
    /// - Parameter coord: The location of the object on the field.
    ///
    /// - Returns: True if the bottom camera can see the object, False
    /// otherwise. Returns nil if `fieldPosition` is nil.
    public func bottomCameraCanSee(object coord: CartesianCoordinate) -> Bool? {
        guard let relativeCoordinate = self.relativeCoordinate(to: coord) else {
            return nil
        }
        return self.cameraPivot.canSee(object: relativeCoordinate, inCamera: self.bottomCameraIndex)
    }
    
    /// Can the camera see the object?
    ///
    /// - Parameter coord: The location of the object on the field.
    ///
    /// - Parameter camera: The camera index for the camera in the camera
    /// pivots `cameraPivot.cameras` array.
    ///
    /// - Returns: True if the bottom camera can see the object, False
    /// otherwise. Returns nil if `fieldPosition` is nil.
    public func canSee(object coord: FieldCoordinate) -> Bool? {
        guard let relativeCoordinate = self.relativeCoordinate(to: coord) else {
            return nil
        }
        return self.cameraPivot.canSee(object: relativeCoordinate, inCamera: self.bottomCameraIndex)
    }
    
// MARK: Field Coordinates From Bottom Camera Image Coordinates
    
    /// Calculate the position of an object in an image from the bottom camera
    /// in relation to `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to this
    /// coordinate. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func bottomCameraCartesianCoordinate(at coord: CameraCoordinate) -> CartesianCoordinate? {
        return self.cartesianCoordinate(at: coord, camera: self.bottomCameraIndex)
    }
    
    /// Calculate the position of an object in an image from the bottom camera
    /// in relation to `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to this
    /// coordinate. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func bottomCameraCartesianCoordinate(at coord: PixelCoordinate) -> CartesianCoordinate? {
        return self.cartesianCoordinate(at: coord, camera: self.bottomCameraIndex)
    }
    
    /// Calculate the position of an object in an image from the bottom camera
    /// in relation to `fieldPosition`.
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to this
    /// coordinate. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: Only use this function if you are positive that the point in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func bottomCameraCartesianCoordinate(at coord: PercentCoordinate) -> CartesianCoordinate? {
        return self.cartesianCoordinate(at: coord, camera: self.bottomCameraIndex)
    }
    
    /// Calculate the position of an object in an image from the bottom camera
    /// in relation to `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to this
    /// coordinate. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func bottomCameraFieldCoordinate(at coord: CameraCoordinate, heading: Degrees_t) -> FieldCoordinate? {
        return self.fieldCoordinate(at: coord, camera: self.bottomCameraIndex, heading: heading)
    }
    
    /// Calculate the position of an object in an image from the bottom camera
    /// in relation to `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to this
    /// coordinate. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func bottomCameraFieldCoordinate(at coord: PixelCoordinate, heading: Degrees_t) -> FieldCoordinate? {
        return self.fieldCoordinate(at: coord, camera: self.bottomCameraIndex, heading: heading)
    }
    
    /// Calculate the position of an object in an image from the bottom camera
    /// in relation to `fieldPosition`.
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to this
    /// coordinate. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: Only use this function if you are positive that the point in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func bottomCameraFieldCoordinate(at coord: PercentCoordinate, heading: Degrees_t) -> FieldCoordinate? {
        return self.fieldCoordinate(at: coord, camera: self.bottomCameraIndex, heading: heading)
    }
    
// MARK: - Bottom Camera Image Coordinates From Field Coordinates
    
    /// Calculate a pixel within a specific image from the bottom camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`.
    public func bottomCameraCameraCoordinate(to coord: CartesianCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> CameraCoordinate? {
        return self.cameraCoordinate(to: coord, camera: self.bottomCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image from the bottom camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`.
    public func bottomCameraCameraCoordinate(to coord: FieldCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> CameraCoordinate? {
        return self.cameraCoordinate(to: coord, camera: self.bottomCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image from the bottom camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`.
    public func bottomCameraPixelCoordinate(to coord: CartesianCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> PixelCoordinate? {
        return self.pixelCoordinate(to: coord, camera: self.bottomCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image from the bottom camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`.
    public func bottomCameraPixelCoordinate(to coord: FieldCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> PixelCoordinate? {
        return self.pixelCoordinate(to: coord, camera: self.bottomCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a point within a specific image from the bottom camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`.
    public func bottomCameraPercentCoordinate(to coord: CartesianCoordinate) -> PercentCoordinate? {
        return self.percentCoordinate(to: coord, camera: self.bottomCameraIndex)
    }

    /// Calculate a point within a specific image from the bottom camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`. If you would like to use a version
    /// of this function that performs this bounds check then use
    /// `bottomCameraPercentCoordinate(to:)`.
    public func bottomCameraPercentCoordinate(to coord: FieldCoordinate, camera: Int) -> PercentCoordinate? {
        return self.percentCoordinate(to: coord, camera: self.bottomCameraIndex)
    }
    
    /// Calculate a pixel within a specific image from the bottom camera
    /// representing an object at a given position.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    public func bottomCameraClampedCameraCoordinate(to coord: CartesianCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> CameraCoordinate? {
        return self.clampedCameraCoordinate(to: coord, camera: self.bottomCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image from the bottom camera
    /// representing an object at a given position.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    public func bottomCameraClampedCameraCoordinate(to coord: FieldCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> CameraCoordinate? {
        return self.clampedCameraCoordinate(to: coord, camera: self.bottomCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image from the bottom camera
    /// representing an object at a given position.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    public func bottomCameraClampedPixelCoordinate(to coord: CartesianCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> PixelCoordinate? {
        return self.clampedPixelCoordinate(to: coord, camera: self.bottomCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image from the bottom camera
    /// representing an object at a given position.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    public func bottomCameraClampedPixelCoordinate(to coord: FieldCoordinate, resWidth: Pixels_u, resHeight: Pixels_u) -> PixelCoordinate? {
        return self.clampedPixelCoordinate(to: coord, camera: self.bottomCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a point within a specific image from the bottom camera
    /// representing an object at a given position.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    public func bottomCameraClampedPercentCoordinate(to coord: CartesianCoordinate) -> PercentCoordinate? {
        return self.clampedPercentCoordinate(to: coord, camera: self.bottomCameraIndex)
    }

    /// Calculate a point within a specific image from the bottom camera
    /// representing an object at a given position.
    ///
    /// All calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    public func bottomClampedPercentCoordinate(to coord: FieldCoordinate) -> PercentCoordinate? {
        return self.clampedPercentCoordinate(to: coord, camera: self.bottomCameraIndex)
    }
    
}
