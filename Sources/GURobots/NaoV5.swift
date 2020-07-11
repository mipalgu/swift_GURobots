/*
 * NaoV5.swift 
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

import GUSimpleWhiteboard
import GUCoordinates

public struct NaoV5 {

    public enum Cameras: Hashable {

        case top
        case bottom

        public var rawValue: Int {
            switch self {
            case .top:
                return Int(GU_NAO_V5_TOP_CAMERA_INDEX)
            case .bottom:
                return Int(GU_NAO_V5_BOTTOM_CAMERA_INDEX)
            }
        }

        public init?(rawValue: Int) {
            if rawValue == Int(GU_NAO_V5_TOP_CAMERA_INDEX) {
                self = .top
                return
            }
            if rawValue == Int(GU_NAO_V5_BOTTOM_CAMERA_INDEX) {
                self = .bottom
                return
            }
            return nil
        }

    }

    private let wb: Whiteboard

    public private(set) var rawValue: gu_nao

    public var cameraPivot: CameraPivot {
        CameraPivot(gu_nao_head_to_camera_pivot(self.joints.head))
    }

    public var joints: gu_nao_joints {
        self.rawValue.joints
    }

    public var sightings: gu_nao_sightings {
        self.rawValue.sightings
    }

    public var fieldPosition: FieldCoordinate? {
        guard self.rawValue.fieldPosition.hasCoordinate else {
            return nil
        }
        return FieldCoordinate(self.rawValue.fieldPosition.field_coordinate)
    }

    public var ballSighting: RelativeCoordinate? {
        guard self.sightings.ball.canSee else {
            return nil
        }
        return RelativeCoordinate(self.sightings.ball.coordinate)
    }

    public var leftGoalPostSighting: RelativeCoordinate? {
        guard self.sightings.leftGoalPost.canSee else {
            return nil
        }
        return RelativeCoordinate(self.sightings.leftGoalPost.coordinate)
    }

    public var rightGoalPostSighting: RelativeCoordinate? {
        guard self.sightings.rightGoalPost.canSee else {
            return nil
        }
        return RelativeCoordinate(self.sightings.rightGoalPost.coordinate)
    }

    public var goalSighting: RelativeCoordinate? {
        guard self.sightings.goal.canSee else {
            return nil
        }
        return RelativeCoordinate(self.sightings.goal.coordinate)
    }

    public init(wb: Whiteboard = Whiteboard()) {
        self.wb = wb
        self.rawValue = gu_nao()
        self.update()
    }

    public func topCameraRelativeCoordinate(of coord: CameraCoordinate) -> RelativeCoordinate? {
        coord.relativeCoordinate(cameraPivot: self.cameraPivot, camera: Cameras.top.rawValue)
    }

    public func topCameraRelativeCoordinate(of coord: PixelCoordinate) -> RelativeCoordinate? {
        coord.relativeCoordinate(cameraPivot: self.cameraPivot, camera: Cameras.top.rawValue)
    }

    public func topCameraRelativeCoordinate(of coord: PercentCoordinate) -> RelativeCoordinate? {
        coord.relativeCoordinate(cameraPivot: self.cameraPivot, camera: Cameras.top.rawValue)
    }

    public func bottomCameraRelativeCoordinate(of coord: CameraCoordinate) -> RelativeCoordinate? {
        coord.relativeCoordinate(cameraPivot: self.cameraPivot, camera: Cameras.bottom.rawValue)
    }

    public func bottomCameraRelativeCoordinate(of coord: PixelCoordinate) -> RelativeCoordinate? {
        coord.relativeCoordinate(cameraPivot: self.cameraPivot, camera: Cameras.bottom.rawValue)
    }

    public func bottomCameraRelativeCoordinate(of coord: PercentCoordinate) -> RelativeCoordinate? {
        coord.relativeCoordinate(cameraPivot: self.cameraPivot, camera: Cameras.bottom.rawValue)
    }

    public mutating func update() {
        gu_nao_update_from_wb(&self.rawValue, self.wb.wb)
    }

}

extension NaoV5.Cameras: Codable {

    enum CodingKeys: String, CodingKey {
        case rawValue
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawValue = try values.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case Int(GU_NAO_V5_TOP_CAMERA_INDEX):
            self = .top
        case Int(GU_NAO_V5_BOTTOM_CAMERA_INDEX):
            self = .bottom
        default:
            let keys = [CodingKeys.rawValue]
            let msg = "Value of rawValue '\(rawValue)' does not equal GU_NAO_V5_TOP_CAMERA_INDEX (\(GU_NAO_V5_TOP_CAMERA_INDEX)) or GU_NAO_V5_BOTTOM_CAMERA_INDEX (\(GU_NAO_V5_BOTTOM_CAMERA_INDEX))"
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: keys, debugDescription: msg))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.rawValue, forKey: .rawValue)
    }

}
