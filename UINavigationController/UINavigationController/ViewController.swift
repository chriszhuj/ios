//
//  ViewController.swift
//  UINavigationController
//
//  Created by 衰公 on 2018/9/5.
//  Copyright © 2018年 chrisz. All rights reserved.
//

import UIKit

var conIndex = 1
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "第\(conIndex)视图控制器"
        conIndex += 1
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 20, y: 100, width: 280, height: 30)
        btn.setTitle("push", for: .normal)
        btn.addTarget(self, action: #selector(push), for: .touchUpInside)
        self.view.addSubview(btn)
        
//        let myLayout = MyLayout()
//        myLayout.itemCount = 20
//        let myCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: myLayout)
//        myCollectionView.backgroundColor = UIColor.white
//        myCollectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "cellID")
//        myCollectionView.delegate = self
//        myCollectionView.dataSource = self
//        self.view.addSubview(myCollectionView)
    }
    
    @objc func push(){
        let con = ViewController()
        con.title = "第\(conIndex)视图控制器"
        self.navigationController?.pushViewController(con, animated: true)
    }
    
    deinit {
        conIndex -= 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = UITabBarController()
        var array = Array<UIViewController>()
        for index in 0..<10{
            let con = UIViewController()
            con.view.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
            con.tabBarItem.title = "\(index)视图"
            if index==0{
                con.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: index)
            } else if index==1{
                con.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: index)
                let webView = UIWebView(frame: self.view.bounds)
                let url = URL(string: "https://www.baidu.com")
                let request = URLRequest(url: url!)
                webView.loadRequest(request)
                con.view.addSubview(webView)
            } else if index==2{
                con.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: index)
                let tableView = UITableView(frame: self.view.bounds, style: .plain)
                tableView.isEditing = true
                tableView.delegate = self
                tableView.dataSource = self
                con.view.addSubview(tableView)
            } else if index==3{
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .vertical
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 10
                layout.itemSize = CGSize(width: 100, height: 100)
                let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
                collectionView.backgroundColor = UIColor.white
                collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "cellID")
                collectionView.delegate = self
                collectionView.dataSource = self
                con.view.addSubview(collectionView)
            } else if index==4{
                
//                myLayout.itemCount = 20
//                let myCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: myLayout)
//                myCollectionView.backgroundColor = UIColor.white
//                myCollectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "cellID")
//                myCollectionView.delegate = self
//                myCollectionView.dataSource = self
//                con.view.addSubview(myCollectionView)
            } else{
                con.tabBarItem.image = UIImage(named: "tab_bar_icon")
                con.tabBarItem.selectedImage = UIImage(named: "tab_bar_icon")
            }
            array.append(con)
        }
        tabBar.viewControllers = array
        self.present(tabBar, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 3
        } else{
            return 10
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell ID")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell ID")
        }
        cell?.textLabel?.text = "第\(indexPath.section)分区第\(indexPath.row)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.section == 0{
            return .insert
        } else{
            return .delete
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["one","two"]
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
        return cell
    }
    

}

