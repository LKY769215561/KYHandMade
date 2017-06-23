# DOPDropDownMenu

[![CI Status](http://img.shields.io/travis/ysmeng/DOPDropDownMenu.svg?style=flat)](https://travis-ci.org/ysmeng/DOPDropDownMenu)
[![Version](https://img.shields.io/cocoapods/v/DOPDropDownMenu.svg?style=flat)](http://cocoapods.org/pods/DOPDropDownMenu)
[![License](https://img.shields.io/cocoapods/l/DOPDropDownMenu.svg?style=flat)](http://cocoapods.org/pods/DOPDropDownMenu)
[![Platform](https://img.shields.io/cocoapods/p/DOPDropDownMenu.svg?style=flat)](http://cocoapods.org/pods/DOPDropDownMenu)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## 平台要求
iOS 7.1

## 说明

DOPDropDownMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

个人并未去和原作者联系，并获得授权，希望大家用的时候，请清楚，原作者，我这里提供cocoaPod支持，只是为了我和我的朋友使用方便，希望作者能包涵，谢谢。
第一版本作者：https://github.com/dopcn/DOPDropDownMenu
第二版本作者：https://github.com/12207480/DOPDropDownMenu-Enhanced

第二版本的作者，在原版上美化了界面，添加了双列表的应用，优化了代码，增强了稳定性。

## 用法
@class DOPDropDownMenu;

@protocol DOPDropDownMenuDataSource <NSObject>

@required

/**
*  返回 menu 第column列有多少行
*/
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column;

/**
*  返回 menu 第column列 每行title
*/
- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath;

@optional
/**
*  返回 menu 有多少列 ，默认1列
*/
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu;


/** 新增
*  当有column列 row 行 返回有多少个item ，如果>0，说明有二级列表 ，=0 没有二级列表
*  如果都没有可以不实现该协议
*/
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column;

/** 新增
*  当有column列 row 行 item项 title
*  如果都没有可以不实现该协议
*/
- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath;
@end

@protocol DOPDropDownMenuDelegate <NSObject>
@optional
/**
*  点击代理，点击了第column 第row 或者item项，如果 item >=0
*/
- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath;
@end

## Author

Weizhou,  shiwoow@gmail.com
12207480, 122074809@qq.com

## License

DOPDropDownMenu is available under the MIT license. See the LICENSE file for more info.
