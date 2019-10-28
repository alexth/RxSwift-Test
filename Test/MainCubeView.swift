//
//  MainCubeView.swift
//  Test
//
//  Created by Alex Golub on 28.10.2019.
//  Copyright © 2019 Alex Golub. All rights reserved.
//

import UIKit

public protocol MainCubeViewDelegate: class {
    func cubeViewDidScroll(_ cubeView: MainCubeView)
    func cubeViewDidEndDecelerating(_ cubeView: MainCubeView)
    func cubeViewWillEndDragging(_ cubeView: MainCubeView)
    func cubeViewWillResetScroll(_ cubeView: MainCubeView)
}

final public class MainCubeView: UIScrollView {
    weak var cubeDelegate: MainCubeViewDelegate?
    
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
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
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
}
