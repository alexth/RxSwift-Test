//
//  VideoChatStateController.swift
//  Test
//
//  Created by Alex Golub on 28.10.2019.
//  Copyright © 2019 Alex Golub. All rights reserved.
//

import Foundation

protocol CombinedEvent {}

enum IncomingCubeMessageType: CaseIterable, CombinedEvent {
    case ban
    case beginDialog
    case WRDDataReceived
    case endDialog
    case search
}

enum CubeMessageType: CaseIterable, CombinedEvent {
    case didScroll
    case didEndDecelerating
    case willEndDragging
    case willResetScroll
}

final class VideoChatStateController {
    // TODO: WIP
//    private weak var viewController: VideoChatViewController?
//    private weak var mainCube: MainCubeView?
//
//    init(_ viewController: VideoChatViewController, mainCube: MainCubeView) {
//        self.viewController = viewController
//        self.mainCube = mainCube
//        mainCube.cubeDelegate = self
//    }
    
    func incomingMessage(type: IncomingCubeMessageType) {
        combineEvents(event: type)
    }
    
    func combineEvents<T: CombinedEvent>(event: T) {
        
    }
}
