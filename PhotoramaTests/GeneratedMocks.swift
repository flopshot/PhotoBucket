// MARK: - Mocks generated from file: Photorama/Repository/PhotosRepo.swift at 2019-09-02 10:41:23 +0000

//
//  PhotosRepo.swift
//  Photorama
//
//  Created by Sean Najera on 1/27/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Cuckoo
@testable import Photorama

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
    

    

    

    
    
    
     func getPhotos() -> Observable<[Foto]> {
        
    return cuckoo_manager.call("getPhotos() -> Observable<[Foto]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getPhotos())
        
    }
    
    
    
     func getPhoto(_ photoId: String) -> Observable<Foto> {
        
    return cuckoo_manager.call("getPhoto(_: String) -> Observable<Foto>",
            parameters: (photoId),
            escapingParameters: (photoId),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getPhoto(photoId))
        
    }
    
    
    
     func fetchPhotos() -> Observable<Foto> {
        
    return cuckoo_manager.call("fetchPhotos() -> Observable<Foto>",
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
	    
	    
	    func getPhotos() -> Cuckoo.ProtocolStubFunction<(), Observable<[Foto]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosRepo.self, method: "getPhotos() -> Observable<[Foto]>", parameterMatchers: matchers))
	    }
	    
	    func getPhoto<M1: Cuckoo.Matchable>(_ photoId: M1) -> Cuckoo.ProtocolStubFunction<(String), Observable<Foto>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: photoId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosRepo.self, method: "getPhoto(_: String) -> Observable<Foto>", parameterMatchers: matchers))
	    }
	    
	    func fetchPhotos() -> Cuckoo.ProtocolStubFunction<(), Observable<Foto>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosRepo.self, method: "fetchPhotos() -> Observable<Foto>", parameterMatchers: matchers))
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
	    func getPhotos() -> Cuckoo.__DoNotUse<(), Observable<[Foto]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getPhotos() -> Observable<[Foto]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getPhoto<M1: Cuckoo.Matchable>(_ photoId: M1) -> Cuckoo.__DoNotUse<(String), Observable<Foto>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: photoId) { $0 }]
	        return cuckoo_manager.verify("getPhoto(_: String) -> Observable<Foto>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func fetchPhotos() -> Cuckoo.__DoNotUse<(), Observable<Foto>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchPhotos() -> Observable<Foto>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PhotosRepoStub: PhotosRepo {
    

    

    
     func getPhotos() -> Observable<[Foto]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Foto]>).self)
    }
    
     func getPhoto(_ photoId: String) -> Observable<Foto>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Foto>).self)
    }
    
     func fetchPhotos() -> Observable<Foto>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Foto>).self)
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
    

    

    

    
    
    
     override func fetchPhotos() -> Observable<Foto> {
        
    return cuckoo_manager.call("fetchPhotos() -> Observable<Foto>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.fetchPhotos()
                ,
            defaultCall: __defaultImplStub!.fetchPhotos())
        
    }
    
    
    
     override func getPhotos() -> Observable<[Foto]> {
        
    return cuckoo_manager.call("getPhotos() -> Observable<[Foto]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.getPhotos()
                ,
            defaultCall: __defaultImplStub!.getPhotos())
        
    }
    
    
    
     override func getPhoto(_ photoId: String) -> Observable<Foto> {
        
    return cuckoo_manager.call("getPhoto(_: String) -> Observable<Foto>",
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
	    
	    
	    func fetchPhotos() -> Cuckoo.ClassStubFunction<(), Observable<Foto>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosRepoImpl.self, method: "fetchPhotos() -> Observable<Foto>", parameterMatchers: matchers))
	    }
	    
	    func getPhotos() -> Cuckoo.ClassStubFunction<(), Observable<[Foto]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosRepoImpl.self, method: "getPhotos() -> Observable<[Foto]>", parameterMatchers: matchers))
	    }
	    
	    func getPhoto<M1: Cuckoo.Matchable>(_ photoId: M1) -> Cuckoo.ClassStubFunction<(String), Observable<Foto>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: photoId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosRepoImpl.self, method: "getPhoto(_: String) -> Observable<Foto>", parameterMatchers: matchers))
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
	    func fetchPhotos() -> Cuckoo.__DoNotUse<(), Observable<Foto>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchPhotos() -> Observable<Foto>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getPhotos() -> Cuckoo.__DoNotUse<(), Observable<[Foto]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getPhotos() -> Observable<[Foto]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getPhoto<M1: Cuckoo.Matchable>(_ photoId: M1) -> Cuckoo.__DoNotUse<(String), Observable<Foto>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: photoId) { $0 }]
	        return cuckoo_manager.verify("getPhoto(_: String) -> Observable<Foto>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PhotosRepoImplStub: PhotosRepoImpl {
    

    

    
     override func fetchPhotos() -> Observable<Foto>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Foto>).self)
    }
    
     override func getPhotos() -> Observable<[Foto]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Foto]>).self)
    }
    
     override func getPhoto(_ photoId: String) -> Observable<Foto>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Foto>).self)
    }
    
}


// MARK: - Mocks generated from file: Photorama/Repository/RealmManager.swift at 2019-09-02 10:41:23 +0000

//
//  RealmManager.swift
//  Photorama
//
//  Created by Sean Najera on 9/2/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Cuckoo
@testable import Photorama

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
    

    

    

    
    
    
     override func insert(_ foto: Foto)  {
        
    return cuckoo_manager.call("insert(_: Foto)",
            parameters: (foto),
            escapingParameters: (foto),
            superclassCall:
                
                super.insert(foto)
                ,
            defaultCall: __defaultImplStub!.insert(foto))
        
    }
    
    
    
     override func getFoto(_ photoId: String) -> Results<Foto> {
        
    return cuckoo_manager.call("getFoto(_: String) -> Results<Foto>",
            parameters: (photoId),
            escapingParameters: (photoId),
            superclassCall:
                
                super.getFoto(photoId)
                ,
            defaultCall: __defaultImplStub!.getFoto(photoId))
        
    }
    
    
    
     override func getFotos() -> Results<Foto> {
        
    return cuckoo_manager.call("getFotos() -> Results<Foto>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.getFotos()
                ,
            defaultCall: __defaultImplStub!.getFotos())
        
    }
    

	 struct __StubbingProxy_RealmManager: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func insert<M1: Cuckoo.Matchable>(_ foto: M1) -> Cuckoo.ClassStubNoReturnFunction<(Foto)> where M1.MatchedType == Foto {
	        let matchers: [Cuckoo.ParameterMatcher<(Foto)>] = [wrap(matchable: foto) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRealmManager.self, method: "insert(_: Foto)", parameterMatchers: matchers))
	    }
	    
	    func getFoto<M1: Cuckoo.Matchable>(_ photoId: M1) -> Cuckoo.ClassStubFunction<(String), Results<Foto>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: photoId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRealmManager.self, method: "getFoto(_: String) -> Results<Foto>", parameterMatchers: matchers))
	    }
	    
	    func getFotos() -> Cuckoo.ClassStubFunction<(), Results<Foto>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockRealmManager.self, method: "getFotos() -> Results<Foto>", parameterMatchers: matchers))
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
	    func insert<M1: Cuckoo.Matchable>(_ foto: M1) -> Cuckoo.__DoNotUse<(Foto), Void> where M1.MatchedType == Foto {
	        let matchers: [Cuckoo.ParameterMatcher<(Foto)>] = [wrap(matchable: foto) { $0 }]
	        return cuckoo_manager.verify("insert(_: Foto)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getFoto<M1: Cuckoo.Matchable>(_ photoId: M1) -> Cuckoo.__DoNotUse<(String), Results<Foto>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: photoId) { $0 }]
	        return cuckoo_manager.verify("getFoto(_: String) -> Results<Foto>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getFotos() -> Cuckoo.__DoNotUse<(), Results<Foto>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getFotos() -> Results<Foto>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RealmManagerStub: RealmManager {
    

    

    
     override func insert(_ foto: Foto)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func getFoto(_ photoId: String) -> Results<Foto>  {
        return DefaultValueRegistry.defaultValue(for: (Results<Foto>).self)
    }
    
     override func getFotos() -> Results<Foto>  {
        return DefaultValueRegistry.defaultValue(for: (Results<Foto>).self)
    }
    
}

