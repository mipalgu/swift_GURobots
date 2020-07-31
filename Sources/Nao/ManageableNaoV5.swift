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
/// - SeeAlso: `SoccerSightingsContainer`
/// - SeeAlso: `FieldPositionContainer`
public struct ManageableNaoV5: NaoWrapper {
    
// MARK: - Properties
    
    /// The joints of the robot.
    public var joints: NaoJoints
    
    /// The soccer objects that this robot can see.
    public var soccerSightings: SoccerSightings
    
    /// The current field position of this robot.
    public var fieldPosition: FieldCoordinate?
    
// MARK: - Converting Between The Underlying gurobots C Type
    
    /// Convert this object to the underlying gurobots C type `gu_nao`.
    public var rawValue: gu_nao {
        let fieldCoordinate = gu_optional_field_coordinate(
            has_value: self.fieldPosition != nil,
            value: self.fieldPosition?.rawValue ?? gu_field_coordinate()
        )
        return gu_nao(
            fieldPosition: fieldCoordinate,
            joints: self.joints.rawValue,
            sightings: self.soccerSightings.rawValue
        )
    }
    
    /// Create a `ManageableNaoV5` by copying the values from the underlying
    /// gurobots C type `gu_nao`.
    ///
    /// - Parameter other: The underlying gurobots C type `gu_nao` which values
    /// will be copied.
    public init(_ other: gu_nao) {
        self.init(
            joints: NaoJoints(other.joints),
            soccerSightings: SoccerSightings(other.sightings),
            fieldPosition: other.fieldPosition.has_value ? FieldCoordinate(other.fieldPosition.value) : nil
        )
    }
    
// MARK: - Creating a ManageableNaoV5
    
    /// Create a `ManageableNaoV5`.
    ///
    /// - Parameter joints: The list of joints for the robot.
    ///
    /// - Parameter soccerSightings: The soccer objects viewable by the robot.
    ///
    /// - Parameter fieldPostion: The current field position of the robot.
    public init(joints: NaoJoints = NaoJoints(), soccerSightings: SoccerSightings = SoccerSightings(), fieldPosition: FieldCoordinate? = nil) {
        self.joints = joints
        self.soccerSightings = soccerSightings
        self.fieldPosition = fieldPosition
    }
    
}
