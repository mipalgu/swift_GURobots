/*
 * NaoV5.swift
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
import GUSimpleWhiteboard

/// A read-only nao that reads its values from the whiteboard.
///
/// Note that by itself, this struct looks like it doesn't do anything.
/// This is because, the entirety of its functionality is provided through
/// protocols and protocols extensions. Consider looking through these protocols
/// in order to understand all the functionality that this type provides.
///
/// - SeeAlso: `NaoWrapper`
/// - SeeAlso: `NaoJointsContainer`
/// - SeeAlso: `SoccerObjectLocationsContainer`
/// - SeeAlso: `FieldPositionContainer`
public final class NaoV5: NaoRobot, UpdateableRobot {

// MARK: - Properties
    
    private let wb: Whiteboard
    
    private let indexes: NaoWBIndexes

// MARK: - Converting To The Underlying gurobots C Type
    
    /// Convert this object to the underlying gurobots C type `gu_nao`.
    public private(set) var rawValue: gu_nao
    
// MARK: - Creating a NaoV5

    /// Create a new `NaoV5` with a private whiteboard.
    ///
    /// This initialiser uses the default indexes of `NaoWBIndexes`.
    ///
    /// - Parameter name: The name of the private whiteboard used as the
    /// backing store.
    public convenience init(name: String) {
        self.init(name: name, indexes: NaoWBIndexes())
    }
    
    /// Create a new `NaoV5` with a private whiteobard and custom message
    /// offsets.
    ///
    /// - Parameter name: The name of the private whiteboard used as the
    /// backing store.
    ///
    /// - Parameter indexes: The offsets for the whiteboard messages that this
    /// type queries in order to update itself.
    public init(name: String, indexes: NaoWBIndexes) {
        guard let wbd = gsw_new_whiteboard(name) else {
            fatalError("Unable to create private whiteboard \(name).")
        }
        self.wb = Whiteboard(wbd: wbd)
        self.indexes = indexes
        self.rawValue = gu_nao()
        self.update()
    }
    
    /// Create a `NaoV5`.
    ///
    /// - Parameter indexes: The indexes of the messages within the whiteboard.
    /// By default, these indexes are those for the normal global whiteboard.
    /// By specifying a value for the indexes, we can allow the use of custom
    /// whiteboards. Again, by default, this parameter can be omitted in order
    /// to use the global whiteboard indexes.
    public init(indexes: NaoWBIndexes = NaoWBIndexes()) {
        self.wb = Whiteboard()
        self.indexes = indexes
        self.rawValue = gu_nao()
        self.update()
    }
    
// MARK: - Reading From The Whiteboard

    /// Update the nao by reading values from the whiteboard.
    public func update() {
        gu_nao_update_from_custom_wb(&self.rawValue, self.wb.wb, self.indexes.rawValue)
    }

}
