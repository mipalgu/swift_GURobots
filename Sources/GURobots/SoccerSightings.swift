//
/*
 * SoccerSightings.swift
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
import CGURobots
import GUUnits

/// A line sighting such as an edge of an object or horizon.
public struct SoccerSightings: CTypeWrapper {
    
// MARK: - Properties
    
    /// The sighting of the soccer ball.
    public var ball: EllipseSighting?
    
    /// The sighting of an unknown goal post.
    public var genericGoalPost: RectangleSighting?
    
    /// The sighting of the goals left post.
    public var leftGoalPost: RectangleSighting?
    
    /// The sighting of the goals right post.
    public var rightGoalPost: RectangleSighting?
    
    /// The sighting of the edge of the soccer field.
    public var horizon: HorizonSighting?
    
    /// Sightings of the lines on the soccer field.
    public var lines: [RectangleSighting]
    
// MARK: - Converting Between The Underlying gurobots C Type
    
    /// Convert to the underlying gurobots C type `gu_soccer_sightings`.
    public var rawValue: gu_soccer_sightings {
        let ball = gu_optional_ellipse_sighting(has_value: self.ball != nil, value: self.ball?.rawValue ?? gu_ellipse_sighting())
        let genericGoalPost = gu_optional_rectangle_sighting(has_value: self.genericGoalPost != nil, value: self.genericGoalPost?.rawValue ?? gu_rectangle_sighting())
        let leftGoalPost = gu_optional_rectangle_sighting(has_value: self.leftGoalPost != nil, value: self.leftGoalPost?.rawValue ?? gu_rectangle_sighting())
        let rightGoalPost = gu_optional_rectangle_sighting(has_value: self.rightGoalPost != nil, value: self.rightGoalPost?.rawValue ?? gu_rectangle_sighting())
        let horizon = gu_optional_horizon_sighting(has_value: self.horizon != nil, value: self.horizon?.rawValue ?? gu_horizon_sighting())
        var sightings = gu_soccer_sightings()
        sightings.ball = ball
        sightings.genericGoalPost = genericGoalPost
        sightings.leftGoalPost = leftGoalPost
        sightings.rightGoalPost = rightGoalPost
        sightings.horizon = horizon
        let numLines = min(self.lines.count, Int(GUROBOTS_SOCCER_SIGHTINGS_MAX_LINE_SIGHTINGS))
        sightings.numLines = CInt(numLines)
        withUnsafeMutablePointer(to: &sightings.lines.0) {
            let buffer = UnsafeMutableBufferPointer(start: $0, count: numLines)
            for i in 0..<numLines {
                buffer[i] = self.lines[i].rawValue
            }
        }
        return sightings
    }
    
    /// Create a SoccerSightings by copying the values from the underlying
    /// gurobots C type `gu_soccer_sightings`.
    ///
    /// - Parameter other: The underlying gurobots C type `gu_soccer_sightings`
    /// which contains the values being copied.
    public init(_ other: gu_soccer_sightings) {
        self.init(
            ball: other.ball.has_value ? EllipseSighting(other.ball.value) : nil,
            genericGoalPost: other.genericGoalPost.has_value ? RectangleSighting(other.genericGoalPost.value) : nil,
            leftGoalPost: other.leftGoalPost.has_value ? RectangleSighting(other.leftGoalPost.value) : nil,
            rightGoalPost: other.rightGoalPost.has_value ? RectangleSighting(other.rightGoalPost.value) : nil,
            horizon: other.horizon.has_value ? HorizonSighting(other.horizon.value) : nil,
            lines: withUnsafePointer(to: other.lines.0) {
                UnsafeBufferPointer(start: $0, count: Int(other.numLines)).map { RectangleSighting($0) }
            }
        )
    }
    
// MARK: - Creating a SoccerSightings
    
    /// Create a SoccerSightings.
    ///
    /// - Parameter ball: The sighting of the soccer ball.
    ///
    /// - Parameter genericGoalPost: The sighting of an unknown goal post.
    ///
    /// - Parameter leftGoalPost: The sighting of the goals left post.
    ///
    /// - Parameter rightGoalPost: The sighting of the goals right post.
    ///
    /// - Parameter horizon: The sighting of the edge of the soccer field.
    ///
    /// - Parameter lines: Sightings of the lines on the soccer field.
    public init(ball: EllipseSighting? = nil, genericGoalPost: RectangleSighting? = nil, leftGoalPost: RectangleSighting? = nil, rightGoalPost: RectangleSighting? = nil, horizon: HorizonSighting? = nil, lines: [RectangleSighting] = []) {
        self.ball = ball
        self.genericGoalPost = genericGoalPost
        self.leftGoalPost = leftGoalPost
        self.rightGoalPost = rightGoalPost
        self.horizon = horizon
        self.lines = lines
    }
    
}
