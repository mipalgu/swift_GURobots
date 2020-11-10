/*
 * EllipseSighting.swift
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

import GUUnits
import GUCoordinates
import CGURobots

/// An elliptical object sighting such as a ball or center circle.
public struct EllipseSighting: CTypeWrapper {
    
// MARK: - Properties
    
    /// The center point of the ellipse.
    public var centerPoint: PixelCoordinate
    
    /// The number of pixels from the center to the top of the ellipse.
    public var verticalRadius: Pixels_u
    
    /// The number of pixel from the center to the side of the ellipse.
    public var horizontalRadius: Pixels_u
    
// MARK: - Converting Between The Underlying gurobots C Type
    
    /// Convert to the underlying gurobots C type `gu_ellipse_sighting`.
    public var rawValue: gu_ellipse_sighting {
        return gu_ellipse_sighting(
            centerPoint: centerPoint.rawValue,
            verticalRadius: verticalRadius.rawValue,
            horizontalRadius: horizontalRadius.rawValue
        )
    }
    
    /// Create an EllipseSighting by copying the values from the underlying
    /// gurobots C type `gu_ellipse_sighting`.
    ///
    /// - Parameter other: The underlying gurobots C type `gu_ellipse_sighting`
    /// which contains the values being copied.
    public init(_ other: gu_ellipse_sighting) {
        self.init(
            centerPoint: PixelCoordinate(other.centerPoint),
            verticalRadius: Pixels_u(other.verticalRadius),
            horizontalRadius: Pixels_u(other.horizontalRadius)
        )
    }
    
// MARK: - Creating an EllipseSighting
    
    /// Create an EllipseSighting.
    ///
    /// - Parameter centerPoint: The center point of the ellipse.
    ///
    /// - Parameter verticalRadius: The number of pixels from the center point
    /// to the top of the ellipse.
    ///
    /// - Parameter horizontalRadius: The number of pixels from the center point
    /// to the side of the ellipse.
    public init(centerPoint: PixelCoordinate, verticalRadius: Pixels_u, horizontalRadius: Pixels_u) {
        self.centerPoint = centerPoint
        self.verticalRadius = verticalRadius
        self.horizontalRadius = horizontalRadius
    }
    
}
