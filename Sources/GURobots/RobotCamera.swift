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
    
}
