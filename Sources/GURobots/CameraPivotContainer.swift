/*
 * CameraPivotContainer.swift
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

/// Conforming types have a single camera pivot for the cameras.
///
/// Generally it does not make sense to conform to this protocol without
/// conforming to protocols such as `TopCameraContainer` or
/// `BottomCameraContainer`. This protocol merely exists to provide
/// some common functionality for cameras in general. Protocols such as
/// `TopCameraContainer` and `BottomCameraContainer` create much nicer functions
/// which leverage the functions provided by this protocol.
///
/// - SeeAlso: `TopCameraContainer`
/// - SeeAlso: `BottomCameraContainer`
public protocol CameraPivotContainer {
    
    /// The pivot point which the cameras are attached to.
    var cameraPivot: CameraPivot { get }
    
}

extension CameraPivotContainer {
    
// MARK: - Camera Visibility Of Objects
    
    /// Can the camera attached to `cameraPivot` see the object?
    ///
    /// - Parameter coord: The location of the object in relation to the camera.
    ///
    /// - Parameter camera: The camera index for the camera in the
    /// `cameraPivot.cameras` array.
    ///
    /// - Returns: True if the specified camera can see the object, False
    /// otherwise.
    public func canSee(object: RelativeCoordinate, inCamera camera: Int) -> Bool {
        self.cameraPivot.canSee(object: object, inCamera: camera)
    }
    
// MARK: - Image Coordinate Validation
    
    /// Is the object represent by the pixel in the image taken from the camera
    /// on the ground?
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter camera: The camera index for the camera in the `cameras`
    /// array.
    ///
    /// - Returns: True if the pixel represents an object that is on the ground.
    /// Otherwise, False.
    public func objectOnGround(_ coord: CameraCoordinate, forCamera camera: Int) -> Bool {
        return self.cameraPivot.objectOnGround(coord.percentCoordinate, forCamera: camera)
    }
    
    /// Is the object represent by the pixel in the image taken from the camera
    /// on the ground?
    ///
    /// - Parameter coord: The pixel in the image representing the object.
    ///
    /// - Parameter camera: The camera index for the camera in the `cameras`
    /// array.
    ///
    /// - Returns: True if the pixel represents an object that is on the ground.
    /// Otherwise, False.
    public func objectOnGround(_ coord: PixelCoordinate, forCamera camera: Int) -> Bool {
        return self.cameraPivot.objectOnGround(coord.percentCoordinate, forCamera: camera)
    }
    
    /// Is the object represent by the point in the image taken from the camera
    /// on the ground?
    ///
    /// - Parameter coord: The point in the image representing the object.
    ///
    /// - Parameter camera: The camera index for the camera in the `cameras`
    /// array.
    ///
    /// - Returns: True if the point represents an object that is on the ground.
    /// Otherwise, False.
    public func objectOnGround(_ coord: PercentCoordinate, forCamera camera: Int) -> Bool {
        return self.cameraPivot.objectOnGround(coord, forCamera: camera)
    }
    
// MARK: Converting Image Coordinates To Relative Coordinates
    
    /// Convert the object in an image to a `RelativeCoordinate` for a camera
    /// attached to the `cameraPivot` pivot point.
    ///
    /// - Parameter coord: The pixel within the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel. This index should reference a valid `Camera`
    /// within the `cameraPivot.cameras` array.
    ///
    /// - Returns: This function returns the
    /// `RelativeCoordinate` representing the object in the image at the pixel
    /// `coord`.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func relativeCoordinate(of coord: CameraCoordinate, camera: Int) -> RelativeCoordinate {
        coord.relativeCoordinate(cameraPivot: self.cameraPivot, camera: camera)
    }
    
    /// Convert the object in an image to a `RelativeCoordinate` for a camera
    /// attached to the `cameraPivot` pivot point.
    ///
    /// - Parameter coord: The pixel within the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the pixel. This index should reference a valid `Camera`
    /// within the `cameraPivot.cameras` array.
    ///
    /// - Returns: This function returns the
    /// `RelativeCoordinate` representing the object in the image at the pixel
    /// `coord`.
    ///
    /// - Warning: Only use this function if you are positive that the pixel in
    /// the image is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func relativeCoordinate(of coord: PixelCoordinate, camera: Int) -> RelativeCoordinate {
        coord.relativeCoordinate(cameraPivot: self.cameraPivot, camera: camera)
    }
    
    /// Convert the object in an image to a `RelativeCoordinate` for a camera
    /// attached to the `cameraPivot` pivot point.
    ///
    /// - Parameter coord: The point within the image representing the object.
    ///
    /// - Parameter camera: The index of the camera which recorded the image
    /// containing the point. This index should reference a valid `Camera`
    /// within the `cameraPivot.cameras` array.
    ///
    /// - Returns: This function returns the
    /// `RelativeCoordinate` representing the object in the image at the point
    /// `coord`.
    ///
    /// - Warning: Only use this function if you are positive that the point in
    /// the image is representing an object on the ground.
    /// If this is not the case, then the maximum value for the distance will
    /// be used.
    public func relativeCoordinate(of coord: PercentCoordinate, camera: Int) -> RelativeCoordinate {
        coord.relativeCoordinate(cameraPivot: self.cameraPivot, camera: camera)
    }
    
}
