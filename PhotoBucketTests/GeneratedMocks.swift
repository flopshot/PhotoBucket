// MARK: - Mocks generated from file: PhotoBucket/Repository/PhotosRepo.swift at 2019-09-02 16:28:12 +0000

//
//  PhotosRepo.swift
//  Photorama
//
//  Created by Sean Najera on 1/27/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Cuckoo
@testable import PhotoBucket

import Foundation
import RealmSwift
import RxRealm
import RxSwift
import UIKit


 class MockPhotosRepo: PhotosRepo, Cuckoo.ProtocolMock {
    
     typealias MocksType = PhotosRepo
    
     typealias Stubbing = __StubbingProxy_PhotosRepo
     typealias Verification = __VerificationProxy_PhotosRepo

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: PhotosRepo?

     func enableDefaultImplementation(_ stub: PhotosRepo) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getPhotos() -> Observable<[Photo]> {
        
    return cuckoo_manager.call("getPhotos() -> Observable<[Photo]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getPhotos())
        
    }
    
    
    
     func getPhoto(_ photoId: String) -> Observable<Photo> {
        
    return cuckoo_manager.call("getPhoto(_: String) -> Observable<Photo>",
            parameters: (photoId),
            escapingParameters: (photoId),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getPhoto(photoId))
        
    }
    
    
    
     func fetchPhotos() -> Observable<Photo> {
        
    return cuckoo_manager.call("fetchPhotos() -> Observable<Photo>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchPhotos())
        
    }
    

	 struct __StubbingProxy_PhotosRepo: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getPhotos() -> Cuckoo.ProtocolStubFunction<(), Observable<[Photo]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosRepo.self, method: "getPhotos() -> Observable<[Photo]>", parameterMatchers: matchers))
	    }
	    
	    func getPhoto<M1: Cuckoo.Matchable>(_ photoId: M1) -> Cuckoo.ProtocolStubFunction<(String), Observable<Photo>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: photoId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosRepo.self, method: "getPhoto(_: String) -> Observable<Photo>", parameterMatchers: matchers))
	    }
	    
	    func fetchPhotos() -> Cuckoo.ProtocolStubFunction<(), Observable<Photo>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosRepo.self, method: "fetchPhotos() -> Observable<Photo>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PhotosRepo: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getPhotos() -> Cuckoo.__DoNotUse<(), Observable<[Photo]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getPhotos() -> Observable<[Photo]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getPhoto<M1: Cuckoo.Matchable>(_ photoId: M1) -> Cuckoo.__DoNotUse<(String), Observable<Photo>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: photoId) { $0 }]
	        return cuckoo_manager.verify("getPhoto(_: String) -> Observable<Photo>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func fetchPhotos() -> Cuckoo.__DoNotUse<(), Observable<Photo>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchPhotos() -> Observable<Photo>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PhotosRepoStub: PhotosRepo {
    

    

    
     func getPhotos() -> Observable<[Photo]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Photo]>).self)
    }
    
     func getPhoto(_ photoId: String) -> Observable<Photo>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Photo>).self)
    }
    
     func fetchPhotos() -> Observable<Photo>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Photo>).self)
    }
    
}



 class MockPhotosRepoImpl: PhotosRepoImpl, Cuckoo.ClassMock {
    
     typealias MocksType = PhotosRepoImpl
    
     typealias Stubbing = __StubbingProxy_PhotosRepoImpl
     typealias Verification = __VerificationProxy_PhotosRepoImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: PhotosRepoImpl?

     func enableDefaultImplementation(_ stub: PhotosRepoImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func fetchPhotos() -> Observable<Photo> {
        
    return cuckoo_manager.call("fetchPhotos() -> Observable<Photo>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.fetchPhotos()
                ,
            defaultCall: __defaultImplStub!.fetchPhotos())
        
    }
    
    
    
     override func getPhotos() -> Observable<[Photo]> {
        
    return cuckoo_manager.call("getPhotos() -> Observable<[Photo]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.getPhotos()
                ,
            defaultCall: __defaultImplStub!.getPhotos())
        
    }
    
    
    
     override func getPhoto(_ photoId: String) -> Observable<Photo> {
        
    return cuckoo_manager.call("getPhoto(_: String) -> Observable<Photo>",
            parameters: (photoId),
            escapingParameters: (photoId),
            superclassCall:
                
                super.getPhoto(photoId)
                ,
            defaultCall: __defaultImplStub!.getPhoto(photoId))
        
    }
    

	 struct __StubbingProxy_PhotosRepoImpl: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchPhotos() -> Cuckoo.ClassStubFunction<(), Observable<Photo>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosRepoImpl.self, method: "fetchPhotos() -> Observable<Photo>", parameterMatchers: matchers))
	    }
	    
	    func getPhotos() -> Cuckoo.ClassStubFunction<(), Observable<[Photo]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosRepoImpl.self, method: "getPhotos() -> Observable<[Photo]>", parameterMatchers: matchers))
	    }
	    
	    func getPhoto<M1: Cuckoo.Matchable>(_ photoId: M1) -> Cuckoo.ClassStubFunction<(String), Observable<Photo>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: photoId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosRepoImpl.self, method: "getPhoto(_: String) -> Observable<Photo>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PhotosRepoImpl: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchPhotos() -> Cuckoo.__DoNotUse<(), Observable<Photo>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchPhotos() -> Observable<Photo>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getPhotos() -> Cuckoo.__DoNotUse<(), Observable<[Photo]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getPhotos() -> Observable<[Photo]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getPhoto<M1: Cuckoo.Matchable>(_ photoId: M1) -> Cuckoo.__DoNotUse<(String), Observable<Photo>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: photoId) { $0 }]
	        return cuckoo_manager.verify("getPhoto(_: String) -> Observable<Photo>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PhotosRepoImplStub: PhotosRepoImpl {
    

    

    
     override func fetchPhotos() -> Observable<Photo>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Photo>).self)
    }
    
     override func getPhotos() -> Observable<[Photo]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Photo]>).self)
    }
    
     override func getPhoto(_ photoId: String) -> Observable<Photo>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Photo>).self)
    }
    
}


// MARK: - Mocks generated from file: PhotoBucket/Repository/RealmManager.swift at 2019-09-02 16:28:12 +0000

//
//  RealmManager.swift
//  Photorama
//
//  Created by Sean Najera on 9/2/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Cuckoo
@testable import PhotoBucket

import Foundation
import RealmSwift


 class MockRealmManager: RealmManager, Cuckoo.ClassMock {
    
     typealias MocksType = RealmManager
    
     typealias Stubbing = __StubbingProxy_RealmManager
     typealias Verification = __VerificationProxy_RealmManager

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: RealmManager?

     func enableDefaultImplementation(_ stub: RealmManager) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func insert(_ photo: Photo)  {
        
    return cuckoo_manager.call("insert(_: Photo)",
            parameters: (photo),
            escapingParameters: (photo),
            superclassCall:
                
                super.insert(photo)
                ,
            defaultCall: __defaultImplStub!.insert(photo))
        
    }
    
    
    
     override func getPhoto(_ photoId: String) -> Results<Photo> {
        
    return cuckoo_manager.call("getPhoto(_: String) -> Results<Photo>",
            parameters: (photoId),
            escapingParameters: (photoId),
            superclassCall:
                
                super.getPhoto(photoId)
                ,
            defaultCall: __defaultImplStub!.getPhoto(photoId))
        
    }
    
    
    
     override func getPhotos() -> Results<Photo> {
        
    return cuckoo_manager.call("getPhotos() -> Results<Photo>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.getPhotos()
                ,
            defaultCall: __defaultImplStub!.getPhotos())
        
    }
    

	 struct __StubbingProxy_RealmManager: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func insert<M1: Cuckoo.Matchable>(_ photo: M1) -> Cuckoo.ClassStubNoReturnFunction<(Photo)> where M1.MatchedType == Photo {
	        let matchers: [Cuckoo.ParameterMatcher<(Photo)>] = [wrap(matchable: photo) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRealmManager.self, method: "insert(_: Photo)", parameterMatchers: matchers))
	    }
	    
	    func getPhoto<M1: Cuckoo.Matchable>(_ photoId: M1) -> Cuckoo.ClassStubFunction<(String), Results<Photo>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: photoId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRealmManager.self, method: "getPhoto(_: String) -> Results<Photo>", parameterMatchers: matchers))
	    }
	    
	    func getPhotos() -> Cuckoo.ClassStubFunction<(), Results<Photo>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockRealmManager.self, method: "getPhotos() -> Results<Photo>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_RealmManager: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func insert<M1: Cuckoo.Matchable>(_ photo: M1) -> Cuckoo.__DoNotUse<(Photo), Void> where M1.MatchedType == Photo {
	        let matchers: [Cuckoo.ParameterMatcher<(Photo)>] = [wrap(matchable: photo) { $0 }]
	        return cuckoo_manager.verify("insert(_: Photo)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getPhoto<M1: Cuckoo.Matchable>(_ photoId: M1) -> Cuckoo.__DoNotUse<(String), Results<Photo>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: photoId) { $0 }]
	        return cuckoo_manager.verify("getPhoto(_: String) -> Results<Photo>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getPhotos() -> Cuckoo.__DoNotUse<(), Results<Photo>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getPhotos() -> Results<Photo>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RealmManagerStub: RealmManager {
    

    

    
     override func insert(_ photo: Photo)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func getPhoto(_ photoId: String) -> Results<Photo>  {
        return DefaultValueRegistry.defaultValue(for: (Results<Photo>).self)
    }
    
     override func getPhotos() -> Results<Photo>  {
        return DefaultValueRegistry.defaultValue(for: (Results<Photo>).self)
    }
    
}

