//
//  Photo+Matchable.swift
//  PhotoramaTests
//
//  Created by Sean Najera on 9/2/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation
import Cuckoo
@testable import PhotoBucket

extension Photo: Matchable {
    public var matcher: ParameterMatcher<Photo> {
        return ParameterMatcher { tested in
            tested.isEqual(self)
        }
    }
}
