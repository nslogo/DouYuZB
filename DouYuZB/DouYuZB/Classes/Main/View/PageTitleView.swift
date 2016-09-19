//
//  PageTitleView.swift
//  DouYuZB
//
//  Created by nie on 16/9/19.
//  Copyright © 2016年 ZoroNie. All rights reserved.
//

import UIKit

//label下划线
fileprivate let kScrollLineH : CGFloat = 2

class PageTitleView: UIView {

    //MARK : - 懒加载属性
    fileprivate lazy var scrollView : UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        //scrollView.isPagingEnabled = false
        scrollView.bounces = false
        return scrollView
    }()
    
    //MARK : - 定义属性
    fileprivate var titles : [String]
    
    //MARK : - 自定义构造函数
    init(frame : CGRect, titles : [String]) {
    
        self.titles = titles
        
        super.init(frame : frame)
        
        //设置UI界面
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - 创建UI界面
extension PageTitleView {
    fileprivate func setUpUI() {
        
        //添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        
        //添加title对应的label
        setUpTtileLabels()
        
        
    }
    
    private func setUpTtileLabels() {
        for (index, title) in titles.enumerated() {
            
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
           
            let labelW : CGFloat = frame.width / CGFloat(titles.count)
            let labelH : CGFloat = frame.height - kScrollLineH
            let labelX : CGFloat = labelW * CGFloat(index)
            let labelY : CGFloat = 0
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            scrollView.addSubview(label)
        
        }
    }
}
