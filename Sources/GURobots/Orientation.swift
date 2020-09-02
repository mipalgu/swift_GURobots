/*
 * Orientation.swift
 * GURobots
 *
 * Created by Callum McColl on 2/9/20.
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

/// The orientation of an object with respect to the three angular coordinates.
public struct Orientation: CTypeWrapper {
    
// MARK: - Properties
    
    /// The angle of the vertical axis.
    public var pitch: Angle
    
    /// The angle of the horizontal axis.
    public var yaw: Angle
    
    /// The angle of the roll axis.
    public var roll: Angle
    
// MARK: - Converting Between The Underlying gurobots C Type
    
    /// Convert to the underlying gurobots C type `gu_orientation`.
    public var rawValue: gu_orientation {
        return gu_orientation(
            pitch: self.pitch.degrees_f.rawValue,
            yaw: self.pitch.degrees_f.rawValue,
            roll: self.pitch.degrees_f.rawValue
        )
    }
    
    /// Create an Orientation by copying the values from the underlying
    /// gurobots C type `gu_orientation`.
    ///
    /// - Parameter other: The underlying gurobots C type `gu_orientation`
    /// which contains the values being copied.
    public init(_ other: gu_orientation) {
        self.init(
            pitch: Angle(Degrees_f(rawValue: other.pitch)),
            yaw: Angle(Degrees_f(rawValue: other.yaw)),
            roll: Angle(Degrees_f(rawValue: other.roll))
        )
    }
    
// MARK: - Create an Orientation
    
    /// Create an Orientation.
    ///
    /// - Parameter pitch: The angle of the vertical axis.
    ///
    /// - Parameter yaw: The angle of the horizontal axis.
    ///
    /// - Parameter roll: The angle of the roll axis.
    public init(pitch: Angle = .zero, yaw: Angle = .zero, roll: Angle = .zero) {
        self.pitch = pitch
        self.yaw = yaw
        self.roll = roll
    }
    
}
