/*
 * gu_nao_wb_indexes.swift
 * GURobots
 *
 * Created by Callum McColl on 27/7/20.
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

extension gu_nao_wb_indexes: Hashable, Codable {
    
    enum CodingKeys: String, CodingKey {
        case playerNumber
        case torsoSensors
        case topParticles
        case ballPosition
        case handSensors
        case headSensors
        case legSensors
        case ballLocation
        case leftGoalPostLocation
        case rightGoalPostLocation
        case goalLocation
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let playerNumber = try values.decode(CInt.self, forKey: .playerNumber)
        let torsoSensors = try values.decode(CInt.self, forKey: .torsoSensors)
        let topParticles = try values.decode(CInt.self, forKey: .topParticles)
        let ballPosition = try values.decode(CInt.self, forKey: .ballPosition)
        let handSensors = try values.decode(CInt.self, forKey: .handSensors)
        let headSensors = try values.decode(CInt.self, forKey: .headSensors)
        let legSensors = try values.decode(CInt.self, forKey: .legSensors)
        let ballLocation = try values.decode(CInt.self, forKey: .ballLocation)
        let leftGoalPostLocation = try values.decode(CInt.self, forKey: .leftGoalPostLocation)
        let rightGoalPostLocation = try values.decode(CInt.self, forKey: .rightGoalPostLocation)
        let goalLocation = try values.decode(CInt.self, forKey: .goalLocation)
        self.init(
            playerNumber: playerNumber,
            torsoSensors: torsoSensors,
            topParticles: topParticles,
            ballPosition: ballPosition,
            handSensors: handSensors,
            headSensors: headSensors,
            legSensors: legSensors,
            ballLocation: ballLocation,
            leftGoalPostLocation: leftGoalPostLocation,
            rightGoalPostLocation: rightGoalPostLocation,
            goalLocation: goalLocation
        )
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.playerNumber, forKey: .playerNumber)
        try container.encode(self.torsoSensors, forKey: .torsoSensors)
        try container.encode(self.topParticles, forKey: .topParticles)
        try container.encode(self.ballPosition, forKey: .ballPosition)
        try container.encode(self.handSensors, forKey: .handSensors)
        try container.encode(self.headSensors, forKey: .headSensors)
        try container.encode(self.legSensors, forKey: .legSensors)
        try container.encode(self.ballLocation, forKey: .ballLocation)
        try container.encode(self.leftGoalPostLocation, forKey: .leftGoalPostLocation)
        try container.encode(self.rightGoalPostLocation, forKey: .rightGoalPostLocation)
        try container.encode(self.goalLocation, forKey: .goalLocation)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.playerNumber)
        hasher.combine(self.torsoSensors)
        hasher.combine(self.topParticles)
        hasher.combine(self.ballPosition)
        hasher.combine(self.handSensors)
        hasher.combine(self.headSensors)
        hasher.combine(self.legSensors)
        hasher.combine(self.ballLocation)
        hasher.combine(self.leftGoalPostLocation)
        hasher.combine(self.rightGoalPostLocation)
        hasher.combine(self.goalLocation)
    }
    
    public static func ==(lhs: gu_nao_wb_indexes, rhs: gu_nao_wb_indexes) -> Bool {
        return gu_nao_wb_indexes_equals(lhs, rhs);
    }
    
}
