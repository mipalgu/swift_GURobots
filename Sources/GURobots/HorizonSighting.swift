/*
 * HorizonSighting.swift
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

import CGURobots

/// A corner sighting such as the corner of the horizon.
public enum HorizonSighting: CTypeWrapper {
    
// MARK: - Cases
    
    /// A horizon sighting where only the field is visible.
    case fieldOnly
    
    /// A horizon sighting where only a single edge of the field is visible.
    case lineSighting(lineSighting: LineSighting)
    
    /// A horizon sighting where the corner of the field is visible.
    case cornerSighting(cornerSighting: CornerSighting)
    
// MARK: - Converting Between The Underlying gurobots C Type
    
    /// Convert to the underlying gurobots C type `gu_horizon_sighting`.
    public var rawValue: gu_horizon_sighting {
        switch self {
        case .fieldOnly:
            return gu_horizon_sighting(
                sightingType: GUHorizonSightingField,
                lineSighting: gu_line_sighting(),
                cornerSighting: gu_corner_sighting()
            )
        case .lineSighting(let lineSighting):
            return gu_horizon_sighting(
                sightingType: GUHorizonSightingLine,
                lineSighting: lineSighting.rawValue,
                cornerSighting: gu_corner_sighting()
            )
        case .cornerSighting(let cornerSighting):
            return gu_horizon_sighting(
                sightingType: GUHorizonSightingCorner,
                lineSighting: gu_line_sighting(),
                cornerSighting: cornerSighting.rawValue
            )
        }
    }
    
    /// Create a HorizonSighting by copying the values from the underlying
    /// gurobots C type `gu_horizon_sighting`.
    ///
    /// - Parameter other: The underlying gurobots C type `gu_horizon_sighting`
    /// which contains the values being copied.
    public init(_ other: gu_horizon_sighting) {
        switch other.sightingType {
        case GUHorizonSightingField:
            self = .fieldOnly
        case GUHorizonSightingLine:
            self = .lineSighting(lineSighting: LineSighting(other.lineSighting))
        case GUHorizonSightingCorner:
            self = .cornerSighting(cornerSighting: CornerSighting(other.cornerSighting))
        default:
            fatalError("Invalid value for horizon sighting type: \(other.sightingType)")
        }
    }
    
}
