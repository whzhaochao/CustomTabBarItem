//
//  MainViewController.swift
//  WXVideo
//
//  Created by 赵超 on 14-6-26.
//  Copyright (c) 2014年 赵超. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    
    var tabBarBgImg:UIImageView?
    var tabBarBgImgSelected:UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏自带tabBarItem
        self.tabBar.hidden=true
        
        //自定义视图
        customTabBar()
        //加载视图
        loadViewController()
  
    }
    //选择视图
    func test(tap:UITapGestureRecognizer){
        var view=tap.view
        var index=view.tag as Int
        var z=(index)*57
        var c=CGFloat(z)
        var x:CGFloat=5.0 + c
        var y=tabBarBgImg!.frame.size.height/2-45/2
        UIView.beginAnimations("test",context:nil)
        tabBarBgImgSelected!.frame = CGRectMake(x ,y, 50, 45)
        UIView.commitAnimations()
       
        //跳转页面
        self.selectedIndex=view.tag
 
    }
    //自定义tabBar视图
    func customTabBar(){
   
        var height=UIScreen.mainScreen().bounds.size.height
        var width=UIScreen.mainScreen().bounds.size.width
        var tabW=width
        var tabH=height-49
        tabBarBgImg=UIImageView(frame:CGRectMake(0,tabH,tabW,49))
        //打开事件
        tabBarBgImg!.userInteractionEnabled=true
        tabBarBgImg!.image=UIImage(named:"tab_bg_all")
        
        //选中背影图片
        var y=tabBarBgImg!.frame.size.height/2-45/2
        tabBarBgImgSelected=UIImageView(frame:CGRectMake(5,y, 50, 45))
        tabBarBgImgSelected!.image=UIImage(named:"selectTabbar_bg_all1")
        tabBarBgImg!.addSubview(tabBarBgImgSelected)
        
         var x:CGFloat=0
        var images=["movie_home","msg_new","start_top250","icon_cinema","more_setting"]
        var titles=["电影","新闻","top","影院","更多"]
        var titleFont=UIFont.systemFontOfSize(12)
        for  index in 0..5{
            var imgView=UIImageView(frame:CGRectMake( x+18, y+5, 22, 22))
            //添加事件
            imgView.userInteractionEnabled=true
            imgView.tag=index
            var tap=UITapGestureRecognizer(target:self,action:Selector("test:"))
            imgView.addGestureRecognizer(tap)

            
            imgView.image = UIImage(named:images[index])
            tabBarBgImg!.addSubview(imgView)
            var title=UILabel(frame:CGRectMake(x+16,y+26,45,15))
            title.text=titles[index]
            title.font=titleFont
            title.textColor = UIColor.whiteColor()
            tabBarBgImg!.addSubview(title)
             x+=57
        }
        

        self.view.addSubview(tabBarBgImg)

    }
    
    //加载子视图控制器
    func loadViewController(){
        //USA
        var usa=USAViewController()
        var  usaItem=UITabBarItem(tabBarSystemItem: .Favorites,tag:1)
        usa.tabBarItem=usaItem
        
        var usaNav=BaseNavigationController(rootViewController:usa)
        //News
        var news=NewsViewController()
        var  newsItem=UITabBarItem(tabBarSystemItem: .Favorites,tag:2)
        news.tabBarItem=newsItem
        var newsNav=BaseNavigationController(rootViewController:news)
        //TOp
        var top=TopViewController()
        var  topItem=UITabBarItem(tabBarSystemItem: .Favorites,tag:3)
        top.tabBarItem=topItem
        var topNav=BaseNavigationController(rootViewController:top)
        //Cinama
        var cinema=CinemaViewController()
        var  cinemaItem=UITabBarItem(tabBarSystemItem: .Favorites,tag:4)
        cinema.tabBarItem=cinemaItem
        var cinemaNav=BaseNavigationController(rootViewController:cinema)
        //More
        var more=MoreViewController()
        var  moreItem=UITabBarItem(tabBarSystemItem: .Favorites,tag:5)
        more.tabBarItem=moreItem
        var moreNav=BaseNavigationController(rootViewController:more)
        //数组
        var ctrls=[usaNav,newsNav,topNav,cinemaNav,moreNav]
        //添加
        self.setViewControllers(ctrls,animated:true)
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
