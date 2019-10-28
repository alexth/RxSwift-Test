//
//  VideoChatStateController.swift
//  Test
//
//  Created by Alex Golub on 28.10.2019.
//  Copyright © 2019 Alex Golub. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum IncomingCubeMessageType: CaseIterable {
    case ban
    case beginDialog
    case WRDDataReceived
    case endDialog
    case search
}

enum CubeMessageType: CaseIterable {
    case didScroll
    case didEndDecelerating
    case willEndDragging
    case willResetScroll
}

final class VideoChatStateController {
    private weak var viewController: VideoChatViewController?
    private weak var mainCube: MainCubeView?
    
    private let disposeBag = DisposeBag()
    
    init(_ viewController: VideoChatViewController, mainCube: MainCubeView) {
        self.viewController = viewController
        self.mainCube = mainCube
//        mainCube.cubeDelegate = self
        combineEvents()
    }
    
    // MARK: - Combine Latest logic
    
    func combineEvents() {
        guard let interactorObservable = viewController?.interactorObservable,
            let cubeObservable = mainCube?.cubeObservable else {
            return
        }
        
        let combineLatestObservable = Observable.combineLatest(interactorObservable, cubeObservable)
            .bind { (interactorEvent, cubeEvent) in
                self.viewController?.resultLabel.text = "\(interactorEvent) \n-\n \(cubeEvent)"
        }
        
        combineLatestObservable.disposed(by: disposeBag)
    }
}
