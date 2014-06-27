//
//  USAViewController.swift
//  WXVideo
//
//  Created by 赵超 on 14-6-26.
//  Copyright (c) 2014年 赵超. All rights reserved.
//

import UIKit

class USAViewController: UIViewController {
    var tableView:UITableView?
    var postView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="USA"
        var view=UIView(frame:UIScreen.mainScreen().applicationFrame)
        self.view=view
        
        loadTableView()
        loadPostView()
        loadRightBar()
        // Do any additional setup after loading the view.
    }
    
    func animation(baseView:UIView,flag:Bool){
        UIView.beginAnimations(nil,context:nil)
        baseView.exchangeSubviewAtIndex(0, withSubviewAtIndex :1)
        if flag {
            
              //添加动画效果
             UIView.setAnimationTransition( UIViewAnimationTransition.FlipFromLeft,
                forView: baseView,
                cache: true)
            
        }else{
            //添加动画效果
            UIView.setAnimationTransition( UIViewAnimationTransition.FlipFromRight,
                forView: baseView,
                cache: true)
        }
        
        UIView.setAnimationDuration(0.5)
        UIView.commitAnimations()

    }
    
    
    //切换视图
    func changView(tap:UITapGestureRecognizer){
        
        var baseItemView=self.navigationItem.rightBarButtonItem.customView
        var posterItem=baseItemView.viewWithTag(1)
        var listItem=baseItemView.viewWithTag(2)
        //开始动画
        UIView.beginAnimations(nil,context:nil)
        

        animation(self.view,flag:posterItem.hidden)
        animation(baseItemView,flag:posterItem.hidden)
        if posterItem.hidden{
            posterItem.hidden=false
            listItem.hidden=true
        }else{
            posterItem.hidden=true
            listItem.hidden=false
        }
        
    }
    
    //加载右按钮
    func loadRightBar(){
        
        var itemBaseView=UIImageView(frame:CGRectMake(0,0,44,25))
        itemBaseView.image=UIImage(named:"exchange_bg_home")
        itemBaseView.userInteractionEnabled=true
        
        //添加事件
        var tap=UITapGestureRecognizer(target:self,action:Selector("changView:"))
        itemBaseView.addGestureRecognizer(tap)
        
        var posterItem=UIImageView(frame:CGRectMake(10,5,23,14))
        posterItem.image=UIImage(named:"poster_home")
        posterItem.contentMode = .ScaleAspectFit
        posterItem.hidden=false
        posterItem.tag=1
        
        var listItem=UIImageView(frame:CGRectMake(10,5,23,14))
        listItem.image=UIImage(named:"list_home")
        listItem.contentMode = .ScaleAspectFit
        listItem.tag=2
        listItem.hidden=true
        
        
        itemBaseView.addSubview(posterItem)
        itemBaseView.addSubview(listItem)
    
        var rightBtn=UIBarButtonItem(customView:itemBaseView)
        self.navigationItem.rightBarButtonItem=rightBtn
        
    }
    
    //加载列表视图
    func loadTableView(){
    tableView=UITableView(frame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height))
        self.view.addSubview(tableView)
        
    }
    // 加载海报视图
    func loadPostView(){
        postView=UIView(frame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height))
        postView!.backgroundColor=UIColor.blueColor()
        self.view.addSubview(postView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
