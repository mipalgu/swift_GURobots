/*
 * FieldPositionContainer.swift
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

import GUUnits
import GUCoordinates

/// Conforming types are capable of being placed on the soccer field.
public protocol FieldPositionContainer {
    
// MARK: - Properties
    
    /// Our current position on the field.
    var fieldPosition: FieldCoordinate? { get }
    
}

extension FieldPositionContainer {
    
// MARK: - Field Coordinates From Relative Coordinates
    
    /// Calculate the position of a coordinate in relation to this coordinate.
    ///
    /// - Parameter coord: The position of the coordinate in relation to
    /// this coordinate.
    ///
    /// - Returns: A new `CartesianCoordinate` calculated in relation to this
    /// coordinate.
    public func cartesianCoordinate(at coord: RelativeCoordinate) -> CartesianCoordinate? {
        return self.fieldPosition?.cartesianCoordinate(at: coord)
    }

    /// Calculate the position of a coordinate in relation to this coordinate.
    ///
    /// - Parameter coord: The position of the coordinate in relation to
    /// this coordinate.
    ///
    /// - Parameter heading: The direction in which the new coordinate
    /// is facing.
    ///
    /// - Returns: A new `FieldCoordinate` calculated in relation to this
    /// coordinate.
    public func fieldCoordinate(at coord: RelativeCoordinate, heading: Degrees_t) -> FieldCoordinate? {
        return self.fieldPosition?.fieldCoordinate(at: coord, heading: heading)
    }
    
// MARK: - Relative Coordinates From Field Coordinates
    
    /// Calculate the `RelativeCoordinate` to a target coordinate.
    ///
    /// - Parameter coord: The target coordinate.
    ///
    /// - Returns: A new `RelativeCoordinate` pointing towards `coord` from
    /// this coordinate.
    public func relativeCoordinate(to coord: CartesianCoordinate) -> RelativeCoordinate? {
        return self.fieldPosition?.relativeCoordinate(to: coord)
    }

    /// Calculate the `RelativeCoordinate` to a target coordinate.
    ///
    /// - Parameter coord: The target coordinate.
    ///
    /// - Returns: A new `RelativeCoordinate` pointing towards `coord` from
    /// this coordinate.
    public func relativeCoordinate(to coord: FieldCoordinate) -> RelativeCoordinate? {
        return self.fieldPosition?.relativeCoordinate(to: coord)
    }
    
}
