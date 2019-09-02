//
//  Foto+Matchable.swift
//  PhotoramaTests
//
//  Created by Sean Najera on 9/2/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation
import Cuckoo
@testable import Photorama

extension Foto: Matchable {
    public var matcher: ParameterMatcher<Foto> {
        return ParameterMatcher { tested in
            tested.isEqual(self)
        }
    }
}
