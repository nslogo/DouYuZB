//
//  HomeViewController.swift
//  DouYuZB
//
//  Created by nie on 16/9/19.
//  Copyright © 2016年 ZoroNie. All rights reserved.
//

import UIKit

fileprivate let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {

    //MARK : - 懒加载属性 
    //pageTitleView {}()闭包
    fileprivate lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.backgroundColor = UIColor.blue
        return titleView
    }()
    
    
    //MARK : - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置UI界面
        setupUI()
    }


    
}

// MARK: - 设置UI界面
extension HomeViewController {
    
    fileprivate func setupUI() {
        //设置导航栏
        setupNavigationBar()
        //添加titleView
        view.addSubview(pageTitleView)
    }
    
    
    private func setupNavigationBar() {
        
        //左侧的item 
        //自定义便利构造函数创建item
        navigationItem.leftBarButtonItem = UIBarButtonItem(logoImageName: "logo")
        
        //右侧的item数组
        let size = CGSize(width: 40, height: 40)
        //自定义类方法创建item
        //let historyItem = UIBarButtonItem.creatItem(imageName: "image_my_history", hightImageName: "Image_my_history_click", size: size)
        //自定义便利构造函数创建item
        let historyItem = UIBarButtonItem(imageName: "image_my_history", hightImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", hightImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", hightImageName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
        
    
    }
}
