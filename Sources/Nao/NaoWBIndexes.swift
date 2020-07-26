/*
 * NaoWBIndexes.swift
 * Nao
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
import GUSimpleWhiteboard

public struct NaoWBIndexes: CTypeWrapper {
    
    public var torsoSensors: Int
    
    public var topParticles: Int
    
    public var handSensors: Int
    
    public var headSensors: Int
    
    public var legSensors: Int
    
    public var ballLocation: Int
    
    public var leftGoalPostLocation: Int
    
    public var rightGoalPostLocation: Int
    
    public var goalLocation: Int
    
    public var rawValue: gu_nao_wb_indexes {
        return gu_nao_wb_indexes(
            torsoSensors: CInt(self.torsoSensors),
            topParticles: CInt(self.topParticles),
            handSensors: CInt(self.handSensors),
            headSensors: CInt(self.headSensors),
            legSensors: CInt(self.legSensors),
            ballLocation: CInt(self.ballLocation),
            leftGoalPostLocation: CInt(self.leftGoalPostLocation),
            rightGoalPostLocation: CInt(self.rightGoalPostLocation),
            goalLocation: CInt(self.goalLocation)
        )
    }
    
    public init(_ other: gu_nao_wb_indexes) {
        self.init(
            torsoSensors: Int(other.torsoSensors),
            topParticles: Int(other.topParticles),
            handSensors: Int(other.handSensors),
            headSensors: Int(other.headSensors),
            legSensors: Int(other.legSensors),
            ballLocation: Int(other.ballLocation),
            leftGoalPostLocation: Int(other.leftGoalPostLocation),
            rightGoalPostLocation: Int(other.rightGoalPostLocation),
            goalLocation: Int(other.goalLocation)
        )
    }
    
    public init(
        torsoSensors: Int = Int(kSENSORSTorsoJointSensors_v.rawValue),
        topParticles: Int = Int(kTopParticles_v.rawValue),
        handSensors: Int = Int(kSensorsHandSensors_v.rawValue),
        headSensors: Int = Int(kSensorsHeadSensors_v.rawValue),
        legSensors: Int = Int(kSENSORSLegJointSensors_v.rawValue),
        ballLocation: Int = Int(kBallLocation_v.rawValue),
        leftGoalPostLocation: Int = Int(kLeftGoalPostLocation_v.rawValue),
        rightGoalPostLocation: Int = Int(kRightGoalPostLocation_v.rawValue),
        goalLocation: Int = Int(kGoalLocation_v.rawValue)
    ) {
        self.torsoSensors = torsoSensors
        self.topParticles = topParticles
        self.handSensors = handSensors
        self.headSensors = headSensors
        self.legSensors = legSensors
        self.ballLocation = ballLocation
        self.leftGoalPostLocation = leftGoalPostLocation
        self.rightGoalPostLocation = rightGoalPostLocation
        self.goalLocation = goalLocation
    }
    
}
