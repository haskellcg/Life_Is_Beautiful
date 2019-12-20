[![catalog][catalog_img]][catalog_link]
  * [1. 屏幕添加准星](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#1-%E5%B1%8F%E5%B9%95%E6%B7%BB%E5%8A%A0%E5%87%86%E6%98%9F)
  * [2. 提高win7的音量](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#2-%E6%8F%90%E9%AB%98win7%E7%9A%84%E9%9F%B3%E9%87%8F)
  * [3. Vmware:使用的设备标识号已超出本地系统范围](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#3-vmware%E4%BD%BF%E7%94%A8%E7%9A%84%E8%AE%BE%E5%A4%87%E6%A0%87%E8%AF%86%E5%8F%B7%E5%B7%B2%E8%B6%85%E5%87%BA%E6%9C%AC%E5%9C%B0%E7%B3%BB%E7%BB%9F%E8%8C%83%E5%9B%B4)
  * [4. 关闭firefox更新提示(版本70)](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#4-%E5%85%B3%E9%97%ADfirefox%E6%9B%B4%E6%96%B0%E6%8F%90%E7%A4%BA%E7%89%88%E6%9C%AC70)

[catalog_img]: https://img.shields.io/badge/%E7%9B%AE%E5%BD%95-Summary-brightgreen.svg 
[catalog_link]: https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_2.md

## 1. 屏幕添加准星
  * 使用酷狗音乐的歌词制作功能
  * 符号"•"与"⊙"

## 2. 提高win7的音量
  * 使用软件"Sound Booster"
  
## 3. Vmware:使用的设备标识号已超出本地系统范围
  * 打开主机系统的声音设备属性
  * 打开录制选项卡
  * 鼠标右键显示所有禁用设备，其中有一个设备出现了：立体声混音
  * 点击启用，并设置为默认设备，就好了
  * [参考](https://blog.csdn.net/sinat_26176609/article/details/44055015)
  
## 4. 关闭firefox更新提示(版本70)
  * [参考](https://github.com/mozilla/policy-templates/blob/master/README.md#disableappupdate)
  * 在firefox安装目录创建文件夹"distribution"
  * 进入"distribution"目录创建文件"policies.json"
  * 编辑"policies.json",编写一下内容,然后保存，重启Firefox即可
  ```
  {
	     "policies":{
		        "DisableAppUpdate": true
	     }
  }
  ```
