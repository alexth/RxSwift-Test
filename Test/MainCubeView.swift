//
//  MainCubeView.swift
//  Test
//
//  Created by Alex Golub on 28.10.2019.
//  Copyright © 2019 Alex Golub. All rights reserved.
//

import UIKit
import RxSwift

public protocol MainCubeViewDelegate: class {
    func cubeViewDidScroll(_ cubeView: MainCubeView)
    func cubeViewDidEndDecelerating(_ cubeView: MainCubeView)
    func cubeViewWillEndDragging(_ cubeView: MainCubeView)
    func cubeViewWillResetScroll(_ cubeView: MainCubeView)
}

final public class MainCubeView: UIScrollView {
    weak var cubeDelegate: MainCubeViewDelegate?
    var cubeObservable = BehaviorSubject<CubeMessageType?>(value: nil)
    
    override public var frame: CGRect {
        didSet {
            updateView()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(emit))
        addGestureRecognizer(gesture)
//        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        isPagingEnabled = true
        bounces = false
//        delegate = self
        contentInsetAdjustmentBehavior = .never
    }
    
    private func updateView() {
        // TODO: updating view
    }
    
    @objc private func emit() {
        guard let randomCubeEvent = CubeMessageType.allCases.randomElement() else {
            return
        }
        
        cubeObservable.onNext(randomCubeEvent)
    }
}
