//
//  BaseNavigationController.swift
//  WXVideo
//
//  Created by 赵超 on 14-6-26.
//  Copyright (c) 2014年 赵超. All rights reserved.
//

import UIKit
//自定义navigationController
class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //背影图片
        self.navigationBar.setBackgroundImage(UIImage(named:"nav_bg_all"),
            forBarMetrics : UIBarMetrics.Default)

        // Do any additional setup after loading the view.
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
