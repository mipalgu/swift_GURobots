/*
 * NaoWrapper.swift
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

import GURobots
import GUUnits
import GUCoordinates

/// The protocol that all nao robot types conform to.
///
/// This protocol provides a common set of functionality for nao robot types.
/// The protocol stipulates that conforming types have a top camera, a bottom
/// camera, a set of `NaoJoint`s and provides all the functionality of the
/// `SoccerPlayingRobot` protocol.
public protocol NaoRobot:
    TopCameraIndexContainer,
    BottomCameraIndexContainer,
    NaoJointsContainer,
    SoccerPlayingRobot,
    TopCameraSoccerSightingsContainer,
    BottomCameraSoccerSightingsContainer
{
    
// MARK: - Properties
    
    /// Nao types must be able to be converted to the underlying gurobots C
    /// type `gu_nao`.
    var rawValue: gu_nao { get }
    
}

// MARK: - Default Implementations

extension NaoRobot {
    
    /// Created a cameras array from GU_NAO_V5_TOP_CAMERA_INDEX and GU_NAO_V5_BOTTOM_CAMERA_INDEX.
    ///
    /// Calculates the cameraPivot by performing a kinematics chain on `joints`.
    ///
    /// - Bug: Currently the kinematics calculations do not take place and
    /// instead a hard-coded value for the camera pivot is used. This
    /// hard-coded value takes into consideration the pitch and yaw of the head
    /// but assumes that the robot is in the position where it is standing and
    /// ready to walk.
    public var cameras: [RobotCamera] {
        let cameraPivot = CameraPivot(gu_nao_head_to_camera_pivot(self.joints.head.rawValue))
        return [GU_NAO_V5_TOP_CAMERA_INDEX, GU_NAO_V5_BOTTOM_CAMERA_INDEX].sorted().map {
            RobotCamera(cameraPivot: cameraPivot, camera: Int($0))
        }
    }
    
    /// The nao robots top camera.
    ///
    /// This value is equal to GU_NAO_V5_TOP_CAMERA_INDEX.
    public var topCameraIndex: Int {
        return Int(GU_NAO_V5_TOP_CAMERA_INDEX)
    }
    
    /// The nao robots bottom camera.
    ///
    /// This value is equal to GU_NAO_V5_BOTTOM_CAMERA_INDEX.
    public var bottomCameraIndex: Int {
        return Int(GU_NAO_V5_BOTTOM_CAMERA_INDEX)
    }
    
    /// The nao robots player number.
    ///
    /// Converts from `rawValue.playerNumber`.
    public var playerNumber: Int {
        Int(self.rawValue.playerNumber)
    }
    
    /// The nao robots joints.
    ///
    /// Converts from `rawValue.joints`.
    public var joints: NaoJoints {
        NaoJoints(self.rawValue.joints)
    }
    
    /// The vision sightings seen from the top camera.
    ///
    /// Converts from `rawValue.topCameraSightings`.
    public var topCameraSoccerSightings: SoccerSightings {
        SoccerSightings(self.rawValue.topCameraSightings)
    }
    
    /// The vision sightings seen from the bottom camera.
    ///
    /// Converts from `rawValue.bottomCameraSightings`.
    public var bottomCameraSoccerSightings: SoccerSightings {
        SoccerSightings(self.rawValue.bottomCameraSightings)
    }
    
    /// All vision sightings seen in both the top camera and bottom cameras.
    ///
    /// Converts from `rawValue.topCameraSightings` and
    /// `rawValue.bottomCameraSightings`.
    public var soccerSightings: [SoccerSightings] {
        let indexes = [GU_NAO_V5_TOP_CAMERA_INDEX, GU_NAO_V5_BOTTOM_CAMERA_INDEX].sorted()
        return indexes.map {
            switch $0 {
            case GU_NAO_V5_TOP_CAMERA_INDEX:
                return self.topCameraSoccerSightings
            case GU_NAO_V5_BOTTOM_CAMERA_INDEX:
                return self.bottomCameraSoccerSightings
            default:
                fatalError("Unsupported camera index: \($0).")
            }
        }
    }

    /// The location of soccer object in relation to the nao robot.
    ///
    /// Converts from `rawValue.sightings`.
    public var soccerObjectLocations: SoccerObjectLocations {
        SoccerObjectLocations(self.rawValue.locations)
    }

    /// The field position of the nao robot.
    ///
    /// Converts from `rawValue.fieldPosition`.
    public var fieldPosition: FieldCoordinate? {
        guard self.rawValue.fieldPosition.has_value else {
            return nil
        }
        return FieldCoordinate(self.rawValue.fieldPosition.value)
    }
    
    /// Where this nao robot thinks the ball is on the field.
    ///
    /// Converts from `rawValue.ballPosition`.
    public var ballPosition: BallPosition? {
        guard self.rawValue.ballPosition.has_value else {
            return nil
        }
        return BallPosition(self.rawValue.ballPosition.value)
    }
    
}
