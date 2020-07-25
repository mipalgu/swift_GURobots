/*
 * FieldPosition+TopCameraContainer.swift
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

extension FieldPositionContainer where Self: TopCameraContainer {
    
    /// Calculate the position of an object in an image from the top camera in
    /// relation to `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to
    /// `fieldPosition`. Returns nil if `fieldPosition` is nil or the `coord`
    /// represents a pixel that cannot be converted to a `RelativeCoordinate`.
    public func topCameraCartesianCoordinate(at coord: CameraCoordinate) -> CartesianCoordinate? {
        return self.cartesianCoordinate(at: coord, camera: self.topCameraIndex)
    }

    /// Calculate the position of an object in an image from the top camera in
    /// relation to `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to
    /// `fieldPosition`. Returns nil if `fieldPosition` is nil or the `coord`
    /// represents a pixel that cannot be converted to a `RelativeCoordinate`.
    public func topCameraCartesianCoordinate(at coord: PixelCoordinate) -> CartesianCoordinate? {
        return self.cartesianCoordinate(at: coord, camera: self.topCameraIndex)
    }

    /// Calculate the position of an object in an image from the top camera in
    /// relation to `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to
    /// `fieldPosition`. Returns nil if `fieldPosition` is nil or the `coord`
    /// represents a point that cannot be converted to a `RelativeCoordinate`.
    public func topCameraCartesianCoordinate(at coord: PercentCoordinate) -> CartesianCoordinate? {
        return self.cartesianCoordinate(at: coord, camera: self.topCameraIndex)
    }

    /// Calculate the position of an object in an image from the top camera in
    /// relation to `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to
    /// `fieldPosition`. Returns nil if `fieldPosition` is nil or the `coord`
    /// represents a pixel that cannot be converted to a `RelativeCoordinate`.
    public func topCameraFieldCoordinate(at coord: CameraCoordinate, heading: degrees_t) -> FieldCoordinate? {
        return self.fieldCoordinate(at: coord, camera: self.topCameraIndex, heading: heading)
    }

    /// Calculate the position of an object in an image from the top camera in
    /// relation to `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to
    /// `fieldPosition`. Returns nil if `fieldPosition` is nil or the `coord`
    /// represents a pixel that cannot be converted to a `RelativeCoordinate`.
    public func topCameraFieldCoordinate(at coord: PixelCoordinate, heading: degrees_t) -> FieldCoordinate? {
        return self.fieldCoordinate(at: coord, camera: self.topCameraIndex, heading: heading)
    }

    /// Calculate the position of an object in an image from the top camera in
    /// relation to `fieldPosition`.
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to
    /// `fieldPosition`. Returns nil if `fieldPosition` is nil or the `coord`
    /// represents a point that cannot be converted to a `RelativeCoordinate`.
    public func topCameraFieldCoordinate(at coord: PercentCoordinate, heading: degrees_t) -> FieldCoordinate? {
        return self.fieldCoordinate(at: coord, camera: self.topCameraIndex, heading: heading)
    }
    
    /// Calculate the position of an object in an image from the top camera in
    /// relation to `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to
    /// `fieldPosition`. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func topCameraUnsafeCartesianCoordinate(at coord: CameraCoordinate) -> CartesianCoordinate? {
        return self.unsafeCartesianCoordinate(at: coord, camera: self.topCameraIndex)
    }
    
    /// Calculate the position of an object in an image from the top camera in
    /// relation to `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to
    /// `fieldPosition`. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func topCameraUnsafeCartesianCoordinate(at coord: PixelCoordinate) -> CartesianCoordinate? {
        return self.unsafeCartesianCoordinate(at: coord, camera: self.topCameraIndex)
    }
    
    /// Calculate the position of an object in an image from the top camera in
    /// relation to `fieldPosition`.
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to
    /// `fieldPosition`. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: Only use this function if you are positive that the point in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func topCameraUnsafeCartesianCoordinate(at coord: PercentCoordinate) -> CartesianCoordinate? {
        return self.unsafeCartesianCoordinate(at: coord, camera: self.topCameraIndex)
    }
    
    /// Calculate the position of an object in an image from the top camera in
    /// relation `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to
    /// `fieldPosition`. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func topCameraUnsafeFieldCoordinate(at coord: CameraCoordinate, heading: degrees_t) -> FieldCoordinate? {
        return self.unsafeFieldCoordinate(at: coord, camera: self.topCameraIndex, heading: heading)
    }
    
    /// Calculate the position of an object in an image from the top camera in
    /// relation `fieldPosition`.
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to
    /// `fieldPosition`. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func topCameraUnsafeFieldCoordinate(at coord: PixelCoordinate, heading: degrees_t) -> FieldCoordinate? {
        return self.unsafeFieldCoordinate(at: coord, camera: self.topCameraIndex, heading: heading)
    }
    
    /// Calculate the position of an object in an image from the top camera in
    /// relation `fieldPosition`.
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to
    /// `fieldPosition`. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: Only use this function if you are positive that the point in
    /// the image represented by `coord` is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func topCameraUnsafeFieldCoordinate(at coord: PercentCoordinate, heading: degrees_t) -> FieldCoordinate? {
        return self.unsafeFieldCoordinate(at: coord, camera: self.topCameraIndex, heading: heading)
    }
    
    /// Calculate a pixel within a specific image taken from the top camera
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
    /// - Returns: A new `CameraCoordinate` representing the
    /// object in the top camera. Returns nil when `fieldPosition` is nil or
    /// when the conversion fails.
    public func topCameraCameraCoordinate(to coord: CartesianCoordinate, resWidth: pixels_u, resHeight: pixels_u) -> CameraCoordinate? {
        return self.cameraCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image taken from the top camera
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
    /// - Returns: A new `CameraCoordinate` representing the
    /// object in the top camera. Returns nil when `fieldPosition` is nil or
    /// when the conversion fails.
    public func topCameraCameraCoordinate(to coord: FieldCoordinate, resWidth: pixels_u, resHeight: pixels_u) -> CameraCoordinate? {
        return self.cameraCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image taken from the top camera
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
    /// - Returns: A new `PixelCoordinate` representing the
    /// object in the top camera. Returns nil when `fieldPosition` is nil or
    /// when the conversion fails.
    public func topCameraPixelCoordinate(to coord: CartesianCoordinate, resWidth: pixels_u, resHeight: pixels_u) -> PixelCoordinate? {
        return self.pixelCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image taken from the top camera
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
    /// - Returns: A new `PixelCoordinate` representing the
    /// object in the top camera. Returns nil when `fieldPosition` is nil or
    /// when the conversion fails.
    public func topCameraPixelCoordinate(to coord: FieldCoordinate, resWidth: pixels_u, resHeight: pixels_u) -> PixelCoordinate? {
        return self.pixelCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a point within a specific image taken from the top camera
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
    /// - Returns: A new `PercentCoordinate` representing the
    /// object in the top camera. Returns nil when `fieldPosition` is nil or
    /// when the conversion fails.
    public func topCameraPercentCoordinate(to coord: CartesianCoordinate) -> PercentCoordinate? {
        return self.percentCoordinate(to: coord, camera: self.topCameraIndex)
    }

    /// Calculate a point within a specific image taken from the top camera
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
    /// - Returns: A new `PercentCoordinate` representing the
    /// object in the top camera. Returns nil when `fieldPosition` is nil or
    /// when the conversion fails.
    public func topCameraPercentCoordinate(to coord: FieldCoordinate) -> PercentCoordinate? {
        return self.percentCoordinate(to: coord, camera: self.topCameraIndex)
    }
    
    /// Calculate a pixel within a specific image taken from the top camera
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
    /// coordinate falls outside the image bounds and the given `tolerance` or
    /// `fieldPosition` is nil.
    public func topCameraClampedCameraCoordinate(to coord: CartesianCoordinate, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f) -> CameraCoordinate? {
        return self.clampedCameraCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a pixel within a specific image taken from the top camera
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
    /// coordinate falls outside the image bounds and the given `tolerance` or
    /// `fieldPosition` is nil.
    public func topCameraClampedCameraCoordinate(to coord: FieldCoordinate, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f) -> CameraCoordinate? {
        return self.clampedCameraCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a pixel within a specific image take from the top camera
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
    /// coordinate falls outside the image bounds and the given `tolerance` or
    /// `fieldPosition` is nil.
    public func topCameraClampedPixelCoordinate(to coord: CartesianCoordinate, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f) -> PixelCoordinate? {
        return self.clampedPixelCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a pixel within a specific image taken from the top camera
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
    /// coordinate falls outside the image bounds and the given `tolerance` or
    /// `fieldPosition` is nil.
    public func topCameraClampedPixelCoordinate(to coord: FieldCoordinate, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f) -> PixelCoordinate? {
        return self.clampedPixelCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a point within a specific image taken from the top camera
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
    /// coordinate falls outside the image bounds and the given `tolerance` or
    /// `fieldPosition` is nil.
    ///
    /// - SeeAlso: `PercentCoordinate`.
    /// - SeeAlso: `CameraPivot`.
    public func topCameraClampedPercentCoordinate(to coord: CartesianCoordinate, tolerance: percent_f) -> PercentCoordinate? {
        return self.clampedPercentCoordinate(to: coord, camera: self.topCameraIndex, tolerance: tolerance)
    }

    /// Calculate a point within a specific image taken from the top camera
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
    /// coordinate falls outside the image bounds and the given `tolerance` or
    /// `fieldPosition` is nil.
    public func topCameraClampedPercentCoordinate(to coord: FieldCoordinate, tolerance: percent_f) -> PercentCoordinate? {
        return self.clampedPercentCoordinate(to: coord, camera: self.topCameraIndex, tolerance: tolerance)
    }
    
    /// Calculate a pixel within a specific image taken from the top camera
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
    /// camera. Returns nil when `fieldPosition` is nil.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`. If you would like to use a version
    /// of this function that performs this bounds check then use
    /// `topCameraCameraCoordinate(to:resWidth:resHeight:)`.
    public func topCameraUnsafeCameraCoordinate(to coord: CartesianCoordinate, resWidth: pixels_u, resHeight: pixels_u) -> CameraCoordinate? {
        return self.unsafeCameraCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image taken from the top camera
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
    /// actually see the object at `coord`. If you would like to use a version
    /// of this function that performs this bounds check then use
    /// `topCameraCameraCoordinate(to:resWidth:resHeight:)`.
    public func topCameraUnsafeCameraCoordinate(to coord: FieldCoordinate, resWidth: pixels_u, resHeight: pixels_u) -> CameraCoordinate? {
        return self.unsafeCameraCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image taken from the top camera
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
    /// camera. Returns nil when `fieldPosition` is nil.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`. If you would like to use a version
    /// of this function that performs this bounds check then use
    /// `topCameraPixelCoordinate(to:resWidth:resHeight:)`.
    public func topCameraUnsafePixelCoordinate(to coord: CartesianCoordinate, resWidth: pixels_u, resHeight: pixels_u) -> PixelCoordinate? {
        return self.unsafePixelCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a pixel within a specific image taken from the top camera
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
    /// camera. Returns nil when `fieldPosition` is nil.
    ///
    /// - Warning: This function does not check whether the calculated coordinate
    /// is within the bounds of the `resWidth` and `resHeight`. As such you
    /// should only use this function if you are positive that the camera can
    /// actually see the object at `coord`. If you would like to use a version
    /// of this function that performs this bounds check then use
    /// `topCameraPixelCoordinate(to:resWidth:resHeight:)`.
    public func topCameraUnsafePixelCoordinate(to coord: FieldCoordinate, resWidth: pixels_u, resHeight: pixels_u) -> PixelCoordinate? {
        return self.unsafePixelCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight)
    }

    /// Calculate a point within a specific image taken from the top camera
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
    /// `topCameraPercentCoordinate(to:)`.
    public func topCameraUnsafePercentCoordinate(to coord: CartesianCoordinate) -> PercentCoordinate? {
        return self.unsafePercentCoordinate(to: coord, camera: self.topCameraIndex)
    }

    /// Calculate a point within a specific image from a specific camera
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
    /// `topCameraPercentCoordinate(to:)`.
    public func topCameraUnsafePercentCoordinate(to coord: FieldCoordinate, camera: Int) -> PercentCoordinate? {
        return self.unsafePercentCoordinate(to: coord, camera: self.topCameraIndex)
    }
    
    /// Calculate a pixel within a specific image taken from the top camera
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
    /// camera. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: When tolerance is not nil, and the coordinate falls outside
    /// the specified tolerance, then the coordinate returned from this function
    /// will be outside the image resolution bounds.
    public func topCameraUnsafeClampedCameraCoordinate(to coord: CartesianCoordinate, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f? = nil) -> CameraCoordinate? {
        return self.unsafeClampedCameraCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a pixel within a specific image taken from the top camera
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
    /// camera. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: When tolerance is not nil, and the coordinate falls outside
    /// the specified tolerance, then the coordinate returned from this function
    /// will be outside the image resolution bounds.
    public func topCameraUnsafeClampedCameraCoordinate(to coord: FieldCoordinate, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f? = nil) -> CameraCoordinate? {
        return self.unsafeClampedCameraCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a pixel within a specific image taken from the top camera
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
    /// camera. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: When tolerance is not nil, and the coordinate falls outside
    /// the specified tolerance, then the coordinate returned from this function
    /// will be outside the image resolution bounds.
    public func topCameraUnsafeClampedPixelCoordinate(to coord: CartesianCoordinate, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f? = nil) -> PixelCoordinate? {
        return self.unsafeClampedPixelCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a pixel within a specific image taken from the top camera
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
    /// camera. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: When tolerance is not nil, and the coordinate falls outside
    /// the specified tolerance, then the coordinate returned from this function
    /// will be outside the image resolution bounds.
    public func topCameraUnsafeClampedPixelCoordinate(to coord: FieldCoordinate, resWidth: pixels_u, resHeight: pixels_u, tolerance: percent_f? = nil) -> PixelCoordinate? {
        return self.unsafeClampedPixelCoordinate(to: coord, camera: self.topCameraIndex, resWidth: resWidth, resHeight: resHeight, tolerance: tolerance)
    }

    /// Calculate a point within a specific image taken from the top camera
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
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image. When the tolerance is nil
    /// then all calculated coordinates that fall outside the image resolution
    /// bounds will be adjusted so that they are within the image.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: When tolerance is not nil, and the coordinate falls outside
    /// the specified tolerance, then the coordinate returned from this function
    /// will be outside the image resolution bounds.
    public func topCameraUnsafeClampedPercentCoordinate(to coord: CartesianCoordinate, tolerance: percent_f? = nil) -> PercentCoordinate? {
        return self.unsafeClampedPercentCoordinate(to: coord, camera: self.topCameraIndex, tolerance: tolerance)
    }

    /// Calculate a point within a specific image taken from the top camera
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
    /// - Parameter tolerance: A percentage of the resolution indicating an
    /// area outside the image which, if the coordinate falls within, ajusts the
    /// coordinate so that it is within the image. When the tolerance is nil
    /// then all calculated coordinates that fall outside the image resolution
    /// bounds will be adjusted so that they are within the image.
    ///
    /// - Returns: A new `PercentCoordinate` representing the object in the
    /// camera. Returns nil if `fieldPosition` is nil.
    ///
    /// - Warning: When tolerance is not nil, and the coordinate falls outside
    /// the specified tolerance, then the coordinate returned from this function
    /// will be outside the image resolution bounds.
    public func topUnsafeClampedPercentCoordinate(to coord: FieldCoordinate, tolerance: percent_f? = nil) -> PercentCoordinate? {
        return self.unsafeClampedPercentCoordinate(to: coord, camera: self.topCameraIndex, tolerance: tolerance)
    }
    
}
