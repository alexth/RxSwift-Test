//
//  ViewController.swift
//  Test
//
//  Created by Alex Golub on 25.10.2019.
//  Copyright © 2019 Alex Golub. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class ViewController: UIViewController {
    @IBOutlet weak var interactorEventButton: UIButton!
    @IBOutlet weak var cubeEventButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    private let interactorEvents = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    private let cubeEvents: [Character] = ["A", "B", "C", "D", "E", "F"]
    
    private var interactorObservable = BehaviorSubject<Int?>.init(value: nil)
    private var cubeObservable = BehaviorSubject<Character?>.init(value: nil)
    
    let disposeBag = DisposeBag()
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupZip()
    }
    
    @IBAction func didPress(interactorButton: UIButton) {
        guard let random = interactorEvents.randomElement() else {
            return
        }
        
        interactorObservable.onNext(random)
    }
    
    @IBAction func didPress(cubeButton: UIButton) {
        guard let random = cubeEvents.randomElement() else {
            return
        }
        
        cubeObservable.onNext(random)
    }
    
    // MARK: - View lifecycle
    
    private func setupZip() {
        let zip = Observable.zip(interactorObservable, cubeObservable)
            .bind { (int, character) in
                self.resultLabel.text = "\(int) - \(character)"
        }
        
        zip.disposed(by: disposeBag)
    }
}
