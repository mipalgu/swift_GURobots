/*
 * YPJoint.swift
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

import CGURobots
import GUUnits

/// A joint that can rotate along the pitch axis, roll axis, and an axis
/// between the yaw and pitch.
public struct YPJoint: CTypeWrapper {
    
// MARK: - Properties
    
    /// The angle of the pitch of the joint.
    public var pitch: Angle
    
    /// The angle of the roll of the joint.
    public var roll: Angle
    
    /// The angle of the yawPitch of the joint.
    public var yawPitch: Angle
    
// MARK: - Converting Between The Underlying gurobots C Type
    
    /// Convert to the underlying gurobots C type `gu_yp_joint`.
    public var rawValue: gu_yp_joint {
        return gu_yp_joint(
            pitch: self.pitch.degrees_f.rawValue,
            roll: self.roll.degrees_f.rawValue,
            yawPitch: self.yawPitch.degrees_f.rawValue
        )
    }
    
    /// Createa YPJoint by copying the values from the underlying gurobots C
    /// type `gu_yp_joint`.
    ///
    /// - Parameter other: The underlying gurobots C type `gu_yp_joint`
    /// which contains the values being copied.
    public init(_ other: gu_yp_joint) {
        self.init(
            pitch: Angle(Degrees_f(rawValue: other.pitch)),
            roll: Angle(Degrees_f(rawValue: other.roll)),
            yawPitch: Angle(Degrees_f(rawValue: other.yawPitch))
        )
    }

// MARK: - Creating a YPJoint
    
    /// Create a YPJoint.
    ///
    /// - Parameter pitch: The angle of the pitch of the joint.
    ///
    /// - Parameter roll: The angle of the roll of the joint.
    ///
    /// - Parameter yawPitch: The angle of the yawPitch of the joint.
    public init(pitch: Angle = .zero, roll: Angle = .zero, yawPitch: Angle = .zero) {
        self.pitch = pitch
        self.roll = roll
        self.yawPitch = yawPitch
    }
    
}
