/*
 * ManageableNaoV5.swift
 * GURobots 
 *
 * Created by Callum McColl on 10/07/2020.
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

/// A fully manageable nao type.
///
/// Generally it is advisable to use `NaoV5` instead of this type. You
/// should only use this type if you are simulating a nao with
/// an editor or simulator. This type will not allow you to retrieve the current
/// state of the sensors, the current field position of the robot, nor any
/// useful data about what the robot is seeing. Instead, this type allows you to
/// specify all of these things manually. This gives you complete control.
///
/// Note that by itself, this struct looks like it doesn't do much.
/// This is because, the entirety of its functionality is provided through
/// protocols and protocols extensions. Consider looking through these protocols
/// in order to understand all the functionality that this type provides.
///
/// - SeeAlso: `NaoV5`
/// - SeeAlso: `NaoWrapper`
/// - SeeAlso: `NaoJointsContainer`
/// - SeeAlso: `TopCameraSoccerSightingsContainer`
/// - SeeAlso: `BottomCameraSoccerSightingsContainer`
/// - SeeAlso: `SoccerObjectLocationsContainer`
/// - SeeAlso: `FieldPositionContainer`
/// - SeeAlso: `BallPositionContainer`
public struct ManageableNaoV5: NaoRobot {
    
// MARK: - Properties
    
    /// The robots player number.
    public var playerNumber: Int
    
    /// The joints of the robot.
    public var joints: NaoJoints
    
    /// The sightings for the top camera.
    public var topCameraSoccerSightings: SoccerSightings
    
    /// The sightings for the bottom camera.
    public var bottomCameraSoccerSightings: SoccerSightings
    
    /// The soccer objects that this robot can see.
    public var soccerObjectLocations: SoccerObjectLocations
    
    /// The current field position of this robot.
    public var fieldPosition: FieldCoordinate?
    
    /// The current position and orientation of the ball on the soccer field.
    public var ballPosition: BallPosition?
    
// MARK: - Converting Between The Underlying gurobots C Type
    
    /// Convert this object to the underlying gurobots C type `gu_nao`.
    public var rawValue: gu_nao {
        let fieldCoordinate = gu_optional_field_coordinate(
            has_value: self.fieldPosition != nil,
            value: self.fieldPosition?.rawValue ?? gu_field_coordinate()
        )
        let ballPosition = gu_optional_ball_position(
            has_value: self.ballPosition != nil,
            value: self.ballPosition?.rawValue ?? gu_ball_position()
        )
        return gu_nao(
            playerNumber: UInt8(self.playerNumber),
            fieldPosition: fieldCoordinate,
            ballPosition: ballPosition,
            joints: self.joints.rawValue,
            locations: self.soccerObjectLocations.rawValue,
            topCameraSightings: self.topCameraSoccerSightings.rawValue,
            bottomCameraSightings: self.bottomCameraSoccerSightings.rawValue
        )
    }
    
    /// Create a `ManageableNaoV5` by copying the values from the underlying
    /// gurobots C type `gu_nao`.
    ///
    /// - Parameter other: The underlying gurobots C type `gu_nao` which values
    /// will be copied.
    public init(_ other: gu_nao) {
        self.init(
            playerNumber: Int(other.playerNumber),
            joints: NaoJoints(other.joints),
            topCameraSoccerSightings: SoccerSightings(other.topCameraSightings),
            bottomCameraSoccerSightings: SoccerSightings(other.bottomCameraSightings),
            soccerObjectLocations: SoccerObjectLocations(other.locations),
            fieldPosition: other.fieldPosition.has_value ? FieldCoordinate(other.fieldPosition.value) : nil,
            ballPosition: other.ballPosition.has_value ? BallPosition(other.ballPosition.value) : nil
        )
    }
    
// MARK: - Creating a ManageableNaoV5
    
    /// Create a `ManageableNaoV5`.
    ///
    /// - Parameter playerNumber: The player number for this robot.
    ///
    /// - Parameter joints: The list of joints for the robot.
    ///
    /// - Parameter topCameraSoccerSightings: The sightings from vision for the
    /// top camera.
    ///
    /// - Parameter bottomCameraSoccerSightings: The sightings from vision for
    /// the bottom camera.
    ///
    /// - Parameter soccerObjectLocations: The soccer objects viewable by the robot.
    ///
    /// - Parameter fieldPostion: The current field position of the robot.
    ///
    /// - Parameter ballPosition: The current position and orientation of the
    /// soccer ball on the soccer field.
    public init(
        playerNumber: Int,
        joints: NaoJoints = NaoJoints(),
        topCameraSoccerSightings: SoccerSightings = SoccerSightings(),
        bottomCameraSoccerSightings: SoccerSightings = SoccerSightings(),
        soccerObjectLocations: SoccerObjectLocations = SoccerObjectLocations(),
        fieldPosition: FieldCoordinate? = nil,
        ballPosition: BallPosition? = nil
    ) {
        self.playerNumber = playerNumber
        self.joints = joints
        self.topCameraSoccerSightings = topCameraSoccerSightings
        self.bottomCameraSoccerSightings = bottomCameraSoccerSightings
        self.soccerObjectLocations = soccerObjectLocations
        self.fieldPosition = fieldPosition
        self.ballPosition = ballPosition
    }
    
// MARK: - Creating a ManageableNaoV5 in Specific Poses
    
    /// Creates a `ManageableNaoV5` in the kneeling position.
    ///
    /// - Parameter playerNumber: The player number of this robot.
    ///
    /// - Parameter head: Optionally specify the position of the head.
    ///
    /// - Parameter leftArm: Optionally specify the position of the left arm. By
    /// default, the left arm will be positioned as it is in the *kneeling*
    /// pose.
    ///
    /// - Parameter rightArm: Optionally specify the position of the right arm.
    /// By default, the right arm will be positioned as it is in the *kneeling*
    /// pose.
    ///
    /// - Parameter topCameraSoccerSightings: The sightings from vision for the
    /// top camera.
    ///
    /// - Parameter bottomCameraSoccerSightings: The sightings from vision for
    /// the bottom camera.
    ///
    /// - Parameter soccerObjectLocations: Optionally specify the sightings viewable
    /// by the robot. Be default, no objects on the field are visible.
    ///
    /// - Parameter fieldPosition: Optionally specify the position of the robot
    /// on the field. By default, there is no field position.
    ///
    /// - Parameter ballPosition: Optionally specify the current position and
    /// orientation of the soccer ball on the soccer field. By default, the
    /// position and orientation of the ball is unknown.
    public static func kneeling(
        playerNumber: Int,
        head: NaoHead = NaoHead(),
        leftArm: NaoArm = NaoArm(
            shoulder: PitchRollJoint(pitch: Angle(degrees: 90), roll: Angle(degrees: 4)),
            elbow: YawRollJoint(yaw: Angle(degrees: 0), roll: Angle(degrees: -2.8)),
            wrist: YawJoint(yaw: Angle(degrees: -90))
        ),
        rightArm: NaoArm = NaoArm(
            shoulder: PitchRollJoint(pitch: Angle(degrees: 90), roll: Angle(degrees: -4)),
            elbow: YawRollJoint(yaw: Angle(degrees: 0), roll: Angle(degrees: 2.8)),
            wrist: YawJoint(yaw: Angle(degrees: -90))
        ),
        topCameraSoccerSightings: SoccerSightings = SoccerSightings(),
        bottomCameraSoccerSightings: SoccerSightings = SoccerSightings(),
        soccerObjectLocations: SoccerObjectLocations = SoccerObjectLocations(),
        fieldPosition: FieldCoordinate? = nil,
        ballPosition: BallPosition? = nil
    ) -> ManageableNaoV5 {
        let leftLeg = NaoLeg(
            hip: YPJoint(pitch: Angle(degrees: 2.7), roll: Angle(degrees: -0.7), yawPitch: Angle(degrees: -53.0)),
            knee: PitchJoint(pitch: Angle(degrees: 121.0)),
            ankle: PitchRollJoint(pitch: Angle(degrees: -69.2), roll: Angle(degrees: 0.6))
        )
        let rightLeg = NaoLeg(
            hip: YPJoint(pitch: Angle(degrees: 0.0), roll: Angle(degrees: 0.0), yawPitch: Angle(degrees: -53.0)),
            knee: PitchJoint(pitch: Angle(degrees: 121.0)),
            ankle: PitchRollJoint(pitch: Angle(degrees: -69.2), roll: Angle(degrees: -0.7))
        )
        return ManageableNaoV5(
            playerNumber: playerNumber,
            joints: NaoJoints(head: head, leftArm: leftArm, rightArm: rightArm, leftLeg: leftLeg, rightLeg: rightLeg),
            topCameraSoccerSightings: topCameraSoccerSightings,
            bottomCameraSoccerSightings: bottomCameraSoccerSightings,
            soccerObjectLocations: soccerObjectLocations,
            fieldPosition: fieldPosition,
            ballPosition: ballPosition
        )
    }
    
    /// Creates a `ManageableNaoV5` in the standing position.
    ///
    /// - Parameter playerNumber: The player number of this robot.
    ///
    /// - Parameter head: Optionally specify the position of the head.
    ///
    /// - Parameter leftArm: Optionally specify the position of the left arm. By
    /// default, the left arm will be positioned as it is in the *standing*
    /// pose.
    ///
    /// - Parameter rightArm: Optionally specify the position of the right arm.
    /// By default, the right arm will be positioned as it is in the *standing*
    /// pose.
    ///
    /// - Parameter topCameraSoccerSightings: The sightings from vision for the
    /// top camera.
    ///
    /// - Parameter bottomCameraSoccerSightings: The sightings from vision for
    /// the bottom camera. 
    ///
    /// - Parameter soccerObjectLocations: Optionally specify the sightings viewable
    /// by the robot. Be default, no objects on the field are visible.
    ///
    /// - Parameter fieldPosition: Optionally specify the position of the robot
    /// on the field. By default, there is no field position.
    ///
    /// - Parameter ballPosition: Optionally specify the current position and
    /// orientation of the soccer ball on the soccer field. By default, the
    /// position and orientation of the ball is unknown.
    public static func standing(
        playerNumber: Int,
        head: NaoHead = NaoHead(),
        leftArm: NaoArm = NaoArm(
            shoulder: PitchRollJoint(pitch: Angle(degrees: 90), roll: Angle(degrees: 18)),
            elbow: YawRollJoint(yaw: Angle(degrees: 0), roll: Angle(degrees: -2)),
            wrist: YawJoint(yaw: Angle(degrees: -90))
        ),
        rightArm: NaoArm = NaoArm(
            shoulder: PitchRollJoint(pitch: Angle(degrees: 90), roll: Angle(degrees: -18)),
            elbow: YawRollJoint(yaw: Angle(degrees: 0), roll: Angle(degrees: 2)),
            wrist: YawJoint(yaw: Angle(degrees: -90))
        ),
        topCameraSoccerSightings: SoccerSightings = SoccerSightings(),
        bottomCameraSoccerSightings: SoccerSightings = SoccerSightings(),
        soccerObjectLocations: SoccerObjectLocations = SoccerObjectLocations(),
        fieldPosition: FieldCoordinate? = nil,
        ballPosition: BallPosition? = nil
    ) -> ManageableNaoV5 {
        let leftLeg = NaoLeg(
            hip: YPJoint(pitch: Angle(degrees: 0.0), roll: Angle(degrees: 0.0), yawPitch: Angle(degrees: -29.0)),
            knee: PitchJoint(pitch: Angle(degrees: 59.2)),
            ankle: PitchRollJoint(pitch: Angle(degrees: -30), roll: Angle(degrees: 0))
        )
        let rightLeg = NaoLeg(
            hip: YPJoint(pitch: Angle(degrees: 0.0), roll: Angle(degrees: 0.0), yawPitch: Angle(degrees: -29.0)),
            knee: PitchJoint(pitch: Angle(degrees: 58.8)),
            ankle: PitchRollJoint(pitch: Angle(degrees: -30), roll: Angle(degrees: 0))
        )
        return ManageableNaoV5(
            playerNumber: playerNumber,
            joints: NaoJoints(head: head, leftArm: leftArm, rightArm: rightArm, leftLeg: leftLeg, rightLeg: rightLeg),
            topCameraSoccerSightings: topCameraSoccerSightings,
            bottomCameraSoccerSightings: bottomCameraSoccerSightings,
            soccerObjectLocations: soccerObjectLocations,
            fieldPosition: fieldPosition,
            ballPosition: ballPosition
        )
    }
    
// MARK: Moving To Specific Poses
    
    /// Change the joints so that the robot is in the kneeling position.
    ///
    /// - Parameter head: Optionally specify the position of the head. If
    /// omitted the head is not changed.
    ///
    /// - Parameter leftArm: Optionally specify the position of the left arm. If
    /// omitted the left arm is changed to the position that it is normally in
    /// when the robot is kneeling. Pass nil to keep the current position of the
    /// left arm.
    ///
    /// - Parameter rightArm: Optionally specify the position of the right arm.
    /// If omitted the right arm is changed to the position that it is normally
    /// in when the robot is kneeling. Pass nil to keep the current position of
    /// the right arm.
    public mutating func kneel(
        head: NaoHead? = nil,
        leftArm: NaoArm? = NaoArm(
            shoulder: PitchRollJoint(pitch: Angle(degrees: 90), roll: Angle(degrees: 4)),
            elbow: YawRollJoint(yaw: Angle(degrees: 0), roll: Angle(degrees: -2.8)),
            wrist: YawJoint(yaw: Angle(degrees: -90))
        ),
        rightArm: NaoArm? = NaoArm(
            shoulder: PitchRollJoint(pitch: Angle(degrees: 90), roll: Angle(degrees: -4)),
            elbow: YawRollJoint(yaw: Angle(degrees: 0), roll: Angle(degrees: 2.8)),
            wrist: YawJoint(yaw: Angle(degrees: -90))
        )
    ) {
        self.joints.head = head ?? self.joints.head
        self.joints.leftArm = leftArm ?? self.joints.leftArm
        self.joints.rightArm = rightArm ?? self.joints.rightArm
        self.joints.leftLeg = NaoLeg(
            hip: YPJoint(pitch: Angle(degrees: 2.7), roll: Angle(degrees: -0.7), yawPitch: Angle(degrees: -53.0)),
            knee: PitchJoint(pitch: Angle(degrees: 121.0)),
            ankle: PitchRollJoint(pitch: Angle(degrees: -69.2), roll: Angle(degrees: 0.6))
        )
        self.joints.rightLeg = NaoLeg(
            hip: YPJoint(pitch: Angle(degrees: 0.0), roll: Angle(degrees: 0.0), yawPitch: Angle(degrees: -53.0)),
            knee: PitchJoint(pitch: Angle(degrees: 121.0)),
            ankle: PitchRollJoint(pitch: Angle(degrees: -69.2), roll: Angle(degrees: -0.7))
        )
    }
    
    /// Change the joints so that the robot is in the kneeling position.
    ///
    /// - Parameter head: Optionally specify the position of the head. If
    /// omitted the head is not changed.
    ///
    /// - Parameter leftArm: Optionally specify the position of the left arm. If
    /// omitted the left arm is changed to the position that it is normally in
    /// when the robot is kneeling. Pass nil to keep the current position of the
    /// left arm.
    ///
    /// - Parameter rightArm: Optionally specify the position of the right arm.
    /// If omitted the right arm is changed to the position that it is normally
    /// in when the robot is kneeling. Pass nil to keep the current position of
    /// the right arm.
    public func kneeling(
        head: NaoHead? = nil,
        leftArm: NaoArm? = NaoArm(
            shoulder: PitchRollJoint(pitch: Angle(degrees: 90), roll: Angle(degrees: 4)),
            elbow: YawRollJoint(yaw: Angle(degrees: 0), roll: Angle(degrees: -2.8)),
            wrist: YawJoint(yaw: Angle(degrees: -90))
        ),
        rightArm: NaoArm? = NaoArm(
            shoulder: PitchRollJoint(pitch: Angle(degrees: 90), roll: Angle(degrees: -4)),
            elbow: YawRollJoint(yaw: Angle(degrees: 0), roll: Angle(degrees: 2.8)),
            wrist: YawJoint(yaw: Angle(degrees: -90))
        )
    ) -> ManageableNaoV5 {
        return ManageableNaoV5(
            playerNumber: self.playerNumber,
            joints: NaoJoints(
                head: head ?? self.joints.head,
                leftArm: leftArm ?? self.joints.leftArm,
                rightArm: rightArm ?? self.joints.rightArm,
                leftLeg: NaoLeg(
                    hip: YPJoint(pitch: Angle(degrees: 2.7), roll: Angle(degrees: -0.7), yawPitch: Angle(degrees: -53.0)),
                    knee: PitchJoint(pitch: Angle(degrees: 121.0)),
                    ankle: PitchRollJoint(pitch: Angle(degrees: -69.2), roll: Angle(degrees: 0.6))
                ),
                rightLeg: NaoLeg(
                    hip: YPJoint(pitch: Angle(degrees: 0.0), roll: Angle(degrees: 0.0), yawPitch: Angle(degrees: -53.0)),
                    knee: PitchJoint(pitch: Angle(degrees: 121.0)),
                    ankle: PitchRollJoint(pitch: Angle(degrees: -69.2), roll: Angle(degrees: -0.7))
                )
            ),
            topCameraSoccerSightings: self.topCameraSoccerSightings,
            bottomCameraSoccerSightings: self.bottomCameraSoccerSightings,
            soccerObjectLocations: self.soccerObjectLocations,
            fieldPosition: self.fieldPosition,
            ballPosition: self.ballPosition
        )
    }
    
    /// Change the joints so that the robot is in the standing position.
    ///
    /// - Parameter head: Optionally specify the position of the head. If
    /// omitted the head is not changed.
    ///
    /// - Parameter leftArm: Optionally specify the position of the left arm. If
    /// omitted the left arm is changed to the position that it is normally in
    /// when the robot is standing. Pass nil to keep the current position of the
    /// left arm.
    ///
    /// - Parameter rightArm: Optionally specify the position of the right arm.
    /// If omitted the right arm is changed to the position that it is normally
    /// in when the robot is standing. Pass nil to keep the current position of
    /// the right arm.
    public mutating func stand(
        head: NaoHead? = nil,
        leftArm: NaoArm? = NaoArm(
            shoulder: PitchRollJoint(pitch: Angle(degrees: 90), roll: Angle(degrees: 18)),
            elbow: YawRollJoint(yaw: Angle(degrees: 0), roll: Angle(degrees: -2)),
            wrist: YawJoint(yaw: Angle(degrees: -90))
        ),
        rightArm: NaoArm? = NaoArm(
            shoulder: PitchRollJoint(pitch: Angle(degrees: 90), roll: Angle(degrees: -18)),
            elbow: YawRollJoint(yaw: Angle(degrees: 0), roll: Angle(degrees: 2)),
            wrist: YawJoint(yaw: Angle(degrees: -90))
        )
    ) {
        self.joints.head = head ?? self.joints.head
        self.joints.leftArm = leftArm ?? self.joints.leftArm
        self.joints.rightArm = rightArm ?? self.joints.rightArm
        self.joints.leftLeg = NaoLeg(
            hip: YPJoint(pitch: Angle(degrees: 0.0), roll: Angle(degrees: 0.0), yawPitch: Angle(degrees: -29.0)),
            knee: PitchJoint(pitch: Angle(degrees: 59.2)),
            ankle: PitchRollJoint(pitch: Angle(degrees: -30), roll: Angle(degrees: 0))
        )
        self.joints.rightLeg = NaoLeg(
            hip: YPJoint(pitch: Angle(degrees: 0.0), roll: Angle(degrees: 0.0), yawPitch: Angle(degrees: -29.0)),
            knee: PitchJoint(pitch: Angle(degrees: 58.8)),
            ankle: PitchRollJoint(pitch: Angle(degrees: -30), roll: Angle(degrees: 0))
        )
    }
    
    /// Create a new nao in the standing position.
    ///
    /// - Parameter head: Optionally specify the position of the head. If
    /// omitted the head is not changed.
    ///
    /// - Parameter leftArm: Optionally specify the position of the left arm. If
    /// omitted the left arm is changed to the position that it is normally in
    /// when the robot is standing. Pass nil to keep the current position of the
    /// left arm.
    ///
    /// - Parameter rightArm: Optionally specify the position of the right arm.
    /// If omitted the right arm is changed to the position that it is normally
    /// in when the robot is standing. Pass nil to keep the current position of
    /// the right arm.
    public func standing(
        head: NaoHead? = nil,
        leftArm: NaoArm? = NaoArm(
            shoulder: PitchRollJoint(pitch: Angle(degrees: 90), roll: Angle(degrees: 18)),
            elbow: YawRollJoint(yaw: Angle(degrees: 0), roll: Angle(degrees: -2)),
            wrist: YawJoint(yaw: Angle(degrees: -90))
        ),
        rightArm: NaoArm? = NaoArm(
            shoulder: PitchRollJoint(pitch: Angle(degrees: 90), roll: Angle(degrees: -18)),
            elbow: YawRollJoint(yaw: Angle(degrees: 0), roll: Angle(degrees: 2)),
            wrist: YawJoint(yaw: Angle(degrees: -90))
        )
    ) -> ManageableNaoV5 {
        return ManageableNaoV5(
            playerNumber: self.playerNumber,
            joints: NaoJoints(
                head: head ?? self.joints.head,
                leftArm: leftArm ?? self.joints.leftArm,
                rightArm: rightArm ?? self.joints.rightArm,
                leftLeg: NaoLeg(
                    hip: YPJoint(pitch: Angle(degrees: 0.0), roll: Angle(degrees: 0.0), yawPitch: Angle(degrees: -29.0)),
                    knee: PitchJoint(pitch: Angle(degrees: 59.2)),
                    ankle: PitchRollJoint(pitch: Angle(degrees: -30), roll: Angle(degrees: 0))
                ),
                rightLeg: NaoLeg(
                    hip: YPJoint(pitch: Angle(degrees: 0.0), roll: Angle(degrees: 0.0), yawPitch: Angle(degrees: -29.0)),
                    knee: PitchJoint(pitch: Angle(degrees: 58.8)),
                    ankle: PitchRollJoint(pitch: Angle(degrees: -30), roll: Angle(degrees: 0))
                )
            ),
            topCameraSoccerSightings: self.topCameraSoccerSightings,
            bottomCameraSoccerSightings: self.bottomCameraSoccerSightings,
            soccerObjectLocations: self.soccerObjectLocations,
            fieldPosition: self.fieldPosition,
            ballPosition: self.ballPosition
        )
    }
    
}
