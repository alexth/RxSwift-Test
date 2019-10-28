//
//  VideoChatViewController.swift
//  Test
//
//  Created by Alex Golub on 25.10.2019.
//  Copyright © 2019 Alex Golub. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class VideoChatViewController: UIViewController {
    @IBOutlet weak var interactorEventButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var mainCubeView: MainCubeView!
    
    var interactorObservable = BehaviorSubject<IncomingCubeMessageType?>(value: nil)
    private var controller: VideoChatStateController!
        
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        controller = VideoChatStateController(self, mainCube: mainCubeView)
    }
    
    @IBAction func didPress(interactorButton: UIButton) {
        guard let randomIncomingMessage = IncomingCubeMessageType.allCases.randomElement() else {
            return
        }
        
        controller.incomingMessage(type: randomIncomingMessage)
    }
}
