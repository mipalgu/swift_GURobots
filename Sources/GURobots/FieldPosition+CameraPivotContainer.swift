/*
 * FieldPosition+CameraPivotContainer.swift
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

extension FieldPositionContainer where Self: CameraPivotContainer {
    
    /// Calculate the position of an object in an image in relation to this
    /// coordinate.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to this
    /// coordinate.
    ///
    /// - SeeAlso: `CameraCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func cartesianCoordinate(at coord: CameraCoordinate, camera: Int) -> CartesianCoordinate? {
        return self.fieldPosition?.cartesianCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: camera)
    }

    /// Calculate the position of an object in an image in relation to this
    /// coordinate.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to this
    /// coordinate.
    ///
    /// - SeeAlso: `PixelCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func cartesianCoordinate(at coord: PixelCoordinate, camera: Int) -> CartesianCoordinate? {
        return self.fieldPosition?.cartesianCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: camera)
    }

    /// Calculate the position of an object in an image in relation to this
    /// coordinate.
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the point represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to this
    /// coordinate.
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func cartesianCoordinate(at coord: PercentCoordinate, camera: Int) -> CartesianCoordinate? {
        return self.fieldPosition?.cartesianCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: camera)
    }

    /// Calculate the position of an object in an image in relation to this
    /// coordinate.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to this
    /// coordinate.
    ///
    /// - SeeAlso: `CameraCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func fieldCoordinate(at coord: CameraCoordinate, camera: Int, heading: degrees_t) -> FieldCoordinate? {
        return self.fieldPosition?.fieldCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: camera, heading: heading)
    }

    /// Calculate the position of an object in an image in relation to this
    /// coordinate.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to this
    /// coordinate.
    ///
    /// - SeeAlso: `PixelCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func fieldCoordinate(at coord: PixelCoordinate, camera: Int, heading: degrees_t) -> FieldCoordinate? {
        return self.fieldPosition?.fieldCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: camera, heading: heading)
    }

    /// Calculate the position of an object in an image in relation to this
    /// coordinate.
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the point represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to this
    /// coordinate.
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func fieldCoordinate(at coord: PercentCoordinate, camera: Int, heading: degrees_t) -> FieldCoordinate? {
        return self.fieldPosition?.fieldCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: camera, heading: heading)
    }
    
    /// Calculate the position of an object in an image in relation to this
    /// coordinate.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the point represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to this
    /// coordinate.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    ///
    /// - SeeAlso: `CameraCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeCartesianCoordinate(at coord: CameraCoordinate, camera: Int) -> CartesianCoordinate? {
        return self.fieldPosition?.unsafeCartesianCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: camera)
    }
    
    /// Calculate the position of an object in an image in relation to this
    /// coordinate.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the point represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to this
    /// coordinate.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    ///
    /// - SeeAlso: `PixelCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeCartesianCoordinate(at coord: PixelCoordinate, camera: Int) -> CartesianCoordinate? {
        return self.fieldPosition?.unsafeCartesianCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: camera)
    }
    
    /// Calculate the position of an object in an image in relation to this
    /// coordinate.
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the point represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to this
    /// coordinate.
    ///
    /// - Warning: Only use this function if you are positive that the point in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeCartesianCoordinate(at coord: PercentCoordinate, camera: Int) -> CartesianCoordinate? {
        return self.fieldPosition?.unsafeCartesianCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: camera)
    }
    
    /// Calculate the position of an object in an image in relation to this
    /// coordinate.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to this
    /// coordinate.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    ///
    /// - SeeAlso: `CameraCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeFieldCoordinate(at coord: CameraCoordinate, camera: Int, heading: degrees_t) -> FieldCoordinate? {
        return self.fieldPosition?.unsafeFieldCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: camera, heading: heading)
    }
    
    /// Calculate the position of an object in an image in relation to this
    /// coordinate.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to this
    /// coordinate.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    ///
    /// - SeeAlso: `PixelCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeFieldCoordinate(at coord: PixelCoordinate, camera: Int, heading: degrees_t) -> FieldCoordinate? {
        return self.fieldPosition?.unsafeFieldCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: camera, heading: heading)
    }
    
    /// Calculate the position of an object in an image in relation to this
    /// coordinate.
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the point represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to this
    /// coordinate.
    ///
    /// - Warning: Only use this function if you are positive that the point in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeFieldCoordinate(at coord: PercentCoordinate, camera: Int, heading: degrees_t) -> FieldCoordinate? {
        return self.fieldPosition?.unsafeFieldCoordinate(at: coord, cameraPivot: self.cameraPivot, camera: camera, heading: heading)
    }
    
    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: When successful, a new `CameraCoordinate` representing the
    /// object in the camera. When unsuccessful (for example when the camera
    /// cannot actually see the object) then `nil` is returned.
    ///
    /// - SeeAlso: `CameraCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func cameraCoordinate(to coord: CartesianCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u) -> CameraCoordinate? {
        return self.fieldPosition?.cameraCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: When successful, a new `CameraCoordinate` representing the
    /// object in the camera. When unsuccessful (for example when the camera
    /// cannot actually see the object) then `nil` is returned.
    ///
    /// - SeeAlso: `CameraCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func cameraCoordinate(to coord: FieldCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u) -> CameraCoordinate? {
        return self.fieldPosition?.cameraCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: When successful, a new `PixelCoordinate` representing the
    /// object in the camera. When unsuccessful (for example when the camera
    /// cannot actually see the object) then `nil` is returned.
    ///
    /// - SeeAlso: `PixelCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func pixelCoordinate(to coord: CartesianCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u) -> PixelCoordinate? {
        return self.fieldPosition?.pixelCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: When successful, a new `PixelCoordinate` representing the
    /// object in the camera. When unsuccessful (for example when the camera
    /// cannot actually see the object) then `nil` is returned.
    ///
    /// - SeeAlso: `PixelCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func pixelCoordinate(to coord: FieldCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u) -> PixelCoordinate? {
        return self.fieldPosition?.pixelCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a point in an image from a specific camera representing an
    /// object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Returns: When successful, a new `PercentCoordinate` representing the
    /// object in the camera. When unsuccessful (for example when the camera
    /// cannot actually see the object) then `nil` is returned.
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func percentCoordinate(to coord: CartesianCoordinate, camera: Int) -> PercentCoordinate? {
        return self.fieldPosition?.percentCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera)
    }

    /// Calculate a point in an image from a specific camera representing an
    /// object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Returns: When successful, a new `PercentCoordinate` representing the
    /// object in the camera. When unsuccessful (for example when the camera
    /// cannot actually see the object) then `nil` is returned.
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func percentCoordinate(to coord: FieldCoordinate, camera: Int) -> PercentCoordinate? {
        return self.fieldPosition?.percentCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera)
    }
    
    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// This function ensures that the calculated coordinate falls within the
    /// bounds of the image when the calculated coordinate is outside the image
    /// within the given tolerance. The tolerance represents a percentage of the
    /// image resolution. This tolerance is applied to each axis, therefore the
    /// x value of the coordinate will be adjusted to `resWidth - 1` if and only
    /// if `x > resWidth && x < resWidth + resWidth * tolerance`. Similarly the
    /// y value of the coordinate will be adjusted to `resHeight - 1` if and
    /// only if `y > resHeight && y < resHeight + resHeight * tolerance`.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image.
    ///
    /// - Returns: When successful, a new `CameraCoordinate` representing the
    /// object in the camera. This function returns nil when the calculated
    /// coordinate falls outside the image bounds and the given `tolerance`.
    ///
    /// - SeeAlso: `CameraCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func clampedCameraCoordinate(to coord: CartesianCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f) -> CameraCoordinate? {
        return self.fieldPosition?.clampedCameraCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// This function ensures that the calculated coordinate falls within the
    /// bounds of the image when the calculated coordinate is outside the image
    /// within the given tolerance. The tolerance represents a percentage of the
    /// image resolution. This tolerance is applied to each axis, therefore the
    /// x value of the coordinate will be adjusted to `resWidth - 1` if and only
    /// if `x > resWidth && x < resWidth + resWidth * tolerance`. Similarly the
    /// y value of the coordinate will be adjusted to `resHeight - 1` if and
    /// only if `y > resHeight && y < resHeight + resHeight * tolerance`.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image.
    ///
    /// - Returns: When successful, a new `CameraCoordinate` representing the
    /// object in the camera. This function returns nil when the calculated
    /// coordinate falls outside the image bounds and the given `tolerance`.
    ///
    /// - SeeAlso: `CameraCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func clampedCameraCoordinate(to coord: FieldCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f) -> CameraCoordinate? {
        return self.fieldPosition?.clampedCameraCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// This function ensures that the
    /// calculated coordinate falls within the bounds of the image when the
    /// calculated coordinate is outside the image within the given `tolerance`.
    /// The tolerance is represented as a percentage of the image resolution
    /// and is applied to each axis. The coordinate will be
    /// adjusted under the following conditions:
    /// ```
    ///     xmin = -floor((resWidth - 1) / 2.0)
    ///     xmax = ceil((resWidth - 1) / 2.0)
    ///     ymin = -floor((resHeight - 1) / 2.0)
    ///     ymax = ceil((resHeight - 1) / 2.0)
    ///     if x < xmin && x >= xmin - resWidth * tolerance
    ///         x = xmin
    ///     if x > xmax && x >= xmax + resWidth * tolerance
    ///         x = xmax
    ///     if y < ymin && y >= ymin - resHeight * tolerance
    ///         y = ymin
    ///     if y > ymax && y >= ymax + resHeight * tolerance
    ///         y = ymax
    /// ```
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image.
    ///
    /// - Returns: When successful, a new `PixelCoordinate` representing the
    /// object in the camera. This function returns nil when the calculated
    /// coordinate falls outside the image bounds and the given `tolerance`.
    ///
    /// - SeeAlso: `PixelCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func clampedPixelCoordinate(to coord: CartesianCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f) -> PixelCoordinate? {
        return self.fieldPosition?.clampedPixelCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// This function ensures that the
    /// calculated coordinate falls within the bounds of the image when the
    /// calculated coordinate is outside the image within the given `tolerance`.
    /// The tolerance is represented as a percentage of the image resolution
    /// and is applied to each axis. The coordinate will be
    /// adjusted under the following conditions:
    /// ```
    ///     xmin = -floor((resWidth - 1) / 2.0)
    ///     xmax = ceil((resWidth - 1) / 2.0)
    ///     ymin = -floor((resHeight - 1) / 2.0)
    ///     ymax = ceil((resHeight - 1) / 2.0)
    ///     if x < xmin && x >= xmin - resWidth * tolerance
    ///         x = xmin
    ///     if x > xmax && x >= xmax + resWidth * tolerance
    ///         x = xmax
    ///     if y < ymin && y >= ymin - resHeight * tolerance
    ///         y = ymin
    ///     if y > ymax && y >= ymax + resHeight * tolerance
    ///         y = ymax
    /// ```
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image.
    ///
    /// - Returns: When successful, a new `PixelCoordinate` representing the
    /// object in the camera. This function returns nil when the calculated
    /// coordinate falls outside the image bounds and the given `tolerance`.
    ///
    /// - SeeAlso: `PixelCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func clampedPixelCoordinate(to coord: FieldCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f) -> PixelCoordinate? {
        return self.fieldPosition?.clampedPixelCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a point within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// This function ensures that the
    /// calculated coordinate falls within the bounds of the image when the
    /// calculated coordinate is outside the image within the given `tolerance`.
    /// The tolerance is represented as a percentage of the image resolution
    /// and is applied to each axis. The coordinate will be
    /// adjusted under the following conditions:
    /// ```
    ///     if x < -1.0 && x >= -1.0 - tolerance
    ///         x = -1.0
    ///     if x > 1.0 && x <= 1.0 + tolerance
    ///         x = 1.0
    ///     if y < -1.0 && y >= -1.0 - tolerance
    ///         y = -1.0
    ///     if y > 1.0 && y <= 1.0 + tolerance
    ///         y = 1.0
    /// ```
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image.
    ///
    /// - Returns: When successful, a new `PercentCoordinate` representing the
    /// object in the camera. This function returns nil when the calculated
    /// coordinate falls outside the image bounds and the given `tolerance`.
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func clampedPercentCoordinate(to coord: CartesianCoordinate, camera: Int, tolerance: percent_f) -> PercentCoordinate? {
        return self.fieldPosition?.clampedPercentCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, tolerance: tolerance)
    }

    /// Calculate a point within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// This function ensures that the
    /// calculated coordinate falls within the bounds of the image when the
    /// calculated coordinate is outside the image within the given `tolerance`.
    /// The tolerance is represented as a percentage of the image resolution
    /// and is applied to each axis. The coordinate will be
    /// adjusted under the following conditions:
    /// ```
    ///     if x < -1.0 && x >= -1.0 - tolerance
    ///         x = -1.0
    ///     if x > 1.0 && x <= 1.0 + tolerance
    ///         x = 1.0
    ///     if y < -1.0 && y >= -1.0 - tolerance
    ///         y = -1.0
    ///     if y > 1.0 && y <= 1.0 + tolerance
    ///         y = 1.0
    /// ```
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image.
    ///
    /// - Returns: When successful, a new `PercentCoordinate` representing the
    /// object in the camera. This function returns nil when the calculated
    /// coordinate falls outside the image bounds and the given `tolerance`.
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func clampedPercentCoordinate(to coord: FieldCoordinate, camera: Int, tolerance: percent_f) -> PercentCoordinate? {
        return self.fieldPosition?.clampedPercentCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, tolerance: tolerance)
    }
    
    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the camera.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`. If you would like to use a version
    /// of this function that performs this bounds check then use
    /// `cameraCoordinate(to:cameraPivot:camera:resWidth:resHeight:)`
    ///
    /// - SeeAlso: `CameraCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeCameraCoordinate(to coord: CartesianCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u) -> CameraCoordinate? {
        return self.fieldPosition?.unsafeCameraCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the camera.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`. If you would like to use a version
    /// of this function that performs this bounds check then use
    /// `cameraCoordinate(to:cameraPivot:camera:resWidth:resHeight:)`
    ///
    /// - SeeAlso: `CameraCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeCameraCoordinate(to coord: FieldCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u) -> CameraCoordinate? {
        return self.fieldPosition?.unsafeCameraCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the camera.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`. If you would like to use a version
    /// of this function that performs this bounds check then use
    /// `pixelCoordinate(to:cameraPivot:camera:resWidth:resHeight:)`
    ///
    /// - SeeAlso: `PixelCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafePixelCoordinate(to coord: CartesianCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u) -> PixelCoordinate? {
        return self.fieldPosition?.unsafePixelCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the camera.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`. If you would like to use a version
    /// of this function that performs this bounds check then use
    /// `pixelCoordinate(to:cameraPivot:camera:resWidth:resHeight:)`
    ///
    /// - SeeAlso: `PixelCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafePixelCoordinate(to coord: FieldCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u) -> PixelCoordinate? {
        return self.fieldPosition?.unsafePixelCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a point within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`. If you would like to use a version
    /// of this function that performs this bounds check then use
    /// `percentCoordinate(to:cameraPivot:camera:)`
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafePercentCoordinate(to coord: CartesianCoordinate, camera: Int) -> PercentCoordinate? {
        return self.fieldPosition?.unsafePercentCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera)
    }

    /// Calculate a point within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`. If you would like to use a version
    /// of this function that performs this bounds check then use
    /// `percentCoordinate(to:cameraPivot:camera:)`
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafePercentCoordinate(to coord: FieldCoordinate, camera: Int) -> PercentCoordinate? {
        return self.fieldPosition?.unsafePercentCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera)
    }
    
    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// When `tolerance` is not nil then this function ensures that the
    /// calculated coordinate falls within the bounds of the image when the
    /// calculated coordinate is outside the image within the given tolerance.
    /// The tolerance represents a percentage of the image resolution. This
    /// tolerance is applied to each axis, therefore the x value
    /// of the coordinate will be adjusted to `resWidth - 1` if and only if
    /// `x > resWidth && x < resWidth + resWidth * tolerance`. Similarly the y
    /// value of the coordinate will be adjusted to `resHeight - 1` if and only
    /// if `y > resHeight && y < resHeight + resHeight * tolerance`.
    ///
    /// If the `tolerance` is nil then all calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image. When not nil,
    /// the `x` and `y` values of the calculated coordinate that fall outside
    /// the bounds of the resolution of the image, but fall within the tolerance
    /// such that `x > resWidth && x <= resWidth + resWidth * tolerance` and
    /// `y > resHeight && y < resHeight + resHeight * tolerance`, will be moved
    /// to the maximum possible value that is still within the image
    /// (`x = resWidth - 1`, `y = resHeight - 1`). When the tolerance is nil
    /// then all calculated coordinates that fall outside the image resolution
    /// bounds will be adjusted so that they are within the image.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: When tolerance is not nil, and the coordinate falls outside
    /// the specified tolerance, then the coordinate returned from this function
    /// will be outside the image resolution bounds.
    ///
    /// - SeeAlso: `CameraCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeClampedCameraCoordinate(to coord: CartesianCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f? = nil) -> CameraCoordinate? {
        return self.fieldPosition?.unsafeClampedCameraCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// When `tolerance` is not nil then this function ensures that the
    /// calculated coordinate falls within the bounds of the image when the
    /// calculated coordinate is outside the image within the given tolerance.
    /// The tolerance represents a percentage of the image resolution. This
    /// tolerance is applied to each axis, therefore the x value
    /// of the coordinate will be adjusted to `resWidth - 1` if and only if
    /// `x > resWidth && x < resWidth + resWidth * tolerance`. Similarly the y
    /// value of the coordinate will be adjusted to `resHeight - 1` if and only
    /// if `y > resHeight && y < resHeight + resHeight * tolerance`.
    ///
    /// If the `tolerance` is nil then all calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image. When not nil,
    /// the `x` and `y` values of the calculated coordinate that fall outside
    /// the bounds of the resolution of the image, but fall within the tolerance
    /// such that `x > resWidth && x <= resWidth + resWidth * tolerance` and
    /// `y > resHeight && y < resHeight + resHeight * tolerance`, will be moved
    /// to the maximum possible value that is still within the image
    /// (`x = resWidth - 1`, `y = resHeight - 1`). When the tolerance is nil
    /// then all calculated coordinates that fall outside the image resolution
    /// bounds will be adjusted so that they are within the image.
    ///
    /// - Returns: A new `CameraCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: When tolerance is not nil, and the coordinate falls outside
    /// the specified tolerance, then the coordinate returned from this function
    /// will be outside the image resolution bounds.
    ///
    /// - SeeAlso: `CameraCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeClampedCameraCoordinate(to coord: FieldCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f? = nil) -> CameraCoordinate? {
        return self.fieldPosition?.unsafeClampedCameraCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// When `tolerance` is not nil then this function ensures that the
    /// calculated coordinate falls within the bounds of the image when the
    /// calculated coordinate is outside the image within the given tolerance.
    /// The tolerance is represented as a percentage of the image resolution
    /// and is applied to each axis. The coordinate will be
    /// adjusted under the following conditions:
    /// ```
    ///     xmin = -floor((resWidth - 1) / 2.0)
    ///     xmax = ceil((resWidth - 1) / 2.0)
    ///     ymin = -floor((resHeight - 1) / 2.0)
    ///     ymax = ceil((resHeight - 1) / 2.0)
    ///     if x < xmin && x >= xmin - resWidth * tolerance
    ///         x = xmin
    ///     if x > xmax && x >= xmax + resWidth * tolerance
    ///         x = xmax
    ///     if y < ymin && y >= ymin - resHeight * tolerance
    ///         y = ymin
    ///     if y > ymax && y >= ymax + resHeight * tolerance
    ///         y = ymax
    /// ```
    ///
    /// If the `tolerance` is nil then all calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image. When the tolerance is nil
    /// then all calculated coordinates that fall outside the image resolution
    /// bounds will be adjusted so that they are within the image.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: When tolerance is not nil, and the coordinate falls outside
    /// the specified tolerance, then the coordinate returned from this function
    /// will be outside the image resolution bounds.
    ///
    /// - SeeAlso: `PixelCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeClampedPixelCoordinate(to coord: CartesianCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f? = nil) -> PixelCoordinate? {
        return self.fieldPosition?.unsafeClampedPixelCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a pixel within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// When `tolerance` is not nil then this function ensures that the
    /// calculated coordinate falls within the bounds of the image when the
    /// calculated coordinate is outside the image within the given tolerance.
    /// The tolerance is represented as a percentage of the image resolution
    /// and is applied to each axis. The coordinate will be
    /// adjusted under the following conditions:
    /// ```
    ///     xmin = -floor((resWidth - 1) / 2.0)
    ///     xmax = ceil((resWidth - 1) / 2.0)
    ///     ymin = -floor((resHeight - 1) / 2.0)
    ///     ymax = ceil((resHeight - 1) / 2.0)
    ///     if x < xmin && x >= xmin - resWidth * tolerance
    ///         x = xmin
    ///     if x > xmax && x <= xmax + resWidth * tolerance
    ///         x = xmax
    ///     if y < ymin && y >= ymin - resHeight * tolerance
    ///         y = ymin
    ///     if y > ymax && y <= ymax + resHeight * tolerance
    ///         y = ymax
    /// ```
    ///
    /// If the `tolerance` is nil then all calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image. When the tolerance is nil
    /// then all calculated coordinates that fall outside the image resolution
    /// bounds will be adjusted so that they are within the image.
    ///
    /// - Returns: A new `PixelCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: When tolerance is not nil, and the coordinate falls outside
    /// the specified tolerance, then the coordinate returned from this function
    /// will be outside the image resolution bounds.
    ///
    /// - SeeAlso: `PixelCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeClampedPixelCoordinate(to coord: FieldCoordinate, camera: Int, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f? = nil) -> PixelCoordinate? {
        return self.fieldPosition?.unsafeClampedPixelCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a point within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// When `tolerance` is not nil then this function ensures that the
    /// calculated coordinate falls within the bounds of the image when the
    /// calculated coordinate is outside the image within the given tolerance.
    /// The tolerance is represented as a percentage of the image resolution
    /// and is applied to each axis. The coordinate will be
    /// adjusted under the following conditions:
    /// ```
    ///     if x < -1.0 && x >= -1.0 - tolerance
    ///         x = -1.0
    ///     if x > 1.0 && x <= 1.0 + tolerance
    ///         x = 1.0
    ///     if y < -1.0 && y >= -1.0 - tolerance
    ///         y = -1.0
    ///     if y > 1.0 && y <= 1.0 + tolerance
    ///         y = 1.0
    /// ```
    ///
    /// If the `tolerance` is nil then all calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image. When the tolerance is nil
    /// then all calculated coordinates that fall outside the image resolution
    /// bounds will be adjusted so that they are within the image.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: When tolerance is not nil, and the coordinate falls outside
    /// the specified tolerance, then the coordinate returned from this function
    /// will be outside the image resolution bounds.
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeClampedPercentCoordinate(to coord: CartesianCoordinate, camera: Int, tolerance: percent_f? = nil) -> PercentCoordinate? {
        return self.fieldPosition?.unsafeClampedPercentCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, tolerance: tolerance)
    }

    /// Calculate a point within a specific image from a specific camera
    /// representing an object at a given position.
    ///
    /// When `tolerance` is not nil then this function ensures that the
    /// calculated coordinate falls within the bounds of the image when the
    /// calculated coordinate is outside the image within the given tolerance.
    /// The tolerance is represented as a percentage of the image resolution
    /// and is applied to each axis. The coordinate will be
    /// adjusted under the following conditions:
    /// ```
    ///     if x < -1.0 && x >= -1.0 - tolerance
    ///         x = -1.0
    ///     if x > 1.0 && x <= 1.0 + tolerance
    ///         x = 1.0
    ///     if y < -1.0 && y >= -1.0 - tolerance
    ///         y = -1.0
    ///     if y > 1.0 && y <= 1.0 + tolerance
    ///         y = 1.0
    /// ```
    ///
    /// If the `tolerance` is nil then all calculated pixels that fall outside
    /// the bounds of the image are moved to the edge of the image to ensure
    /// that the function always calculates a coordinate within the image
    /// bounds.
    ///
    /// - Parameter coord: The position of the object.
    ///
    /// - Parameter cameraPivot: The `CameraPivot` detailing the configuration
    /// of the pivot point in which the camera is placed, as well as detailing
    /// the cameras attached to the pivot point.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel represented by `coord`. This index should reference
    /// a valid `Camera` within the `cameras` array within
    /// `cameraPivot.cameras`.
    ///
    /// - Parameter resWidth: The width of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter resHeight: The height of the resolution of the image that
    /// we are placing the object in.
    ///
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image. When the tolerance is nil
    /// then all calculated coordinates that fall outside the image resolution
    /// bounds will be adjusted so that they are within the image.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera.
    ///
    /// - Warning: When tolerance is not nil, and the coordinate falls outside
    /// the specified tolerance, then the coordinate returned from this function
    /// will be outside the image resolution bounds.
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func unsafeClampedPercentCoordinate(to coord: FieldCoordinate, camera: Int, tolerance: percent_f? = nil) -> PercentCoordinate? {
        return self.fieldPosition?.unsafeClampedPercentCoordinate(to: coord, cameraPivot: self.cameraPivot, camera: camera, tolerance: tolerance)
    }
    
}
