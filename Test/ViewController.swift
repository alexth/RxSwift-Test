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
    
    private var interactorObservable = BehaviorSubject<Int?>(value: nil)
    private var cubeObservable = BehaviorSubject<Character?>(value: nil)
    
    let disposeBag = DisposeBag()
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCombineLatest()
    }
    
    @IBAction func didPress(interactorButton: UIButton) {
        guard let random = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].randomElement() else {
            return
        }
        
        interactorObservable.onNext(random)
    }
    
    @IBAction func didPress(cubeButton: UIButton) {
        guard let random = ["A", "B", "C", "D", "E", "F"].randomElement() else {
            return
        }
        
        cubeObservable.onNext(Character(random))
    }
    
    // MARK: - Combine Latest logic
    
    private func setupCombineLatest() {
        let zip = Observable.combineLatest(interactorObservable, cubeObservable)
            .bind { (int, character) in
                self.resultLabel.text = "\(int) - \(character)"
        }
        
        zip.disposed(by: disposeBag)
    }
}
