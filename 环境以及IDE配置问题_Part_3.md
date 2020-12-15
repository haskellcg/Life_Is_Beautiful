[![catalog][catalog_img]][catalog_link]
  * [1. 屏幕添加准星](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#1-%E5%B1%8F%E5%B9%95%E6%B7%BB%E5%8A%A0%E5%87%86%E6%98%9F)
  * [2. 提高win7的音量](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#2-%E6%8F%90%E9%AB%98win7%E7%9A%84%E9%9F%B3%E9%87%8F)
  * [3. Vmware:使用的设备标识号已超出本地系统范围](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#3-vmware%E4%BD%BF%E7%94%A8%E7%9A%84%E8%AE%BE%E5%A4%87%E6%A0%87%E8%AF%86%E5%8F%B7%E5%B7%B2%E8%B6%85%E5%87%BA%E6%9C%AC%E5%9C%B0%E7%B3%BB%E7%BB%9F%E8%8C%83%E5%9B%B4)
  * [4. 关闭firefox更新提示(版本70)](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#4-%E5%85%B3%E9%97%ADfirefox%E6%9B%B4%E6%96%B0%E6%8F%90%E7%A4%BA%E7%89%88%E6%9C%AC70)
  * [5. 安装YLMF系统](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#5-%E5%AE%89%E8%A3%85ylmf%E7%B3%BB%E7%BB%9F)
  * [6. Ubuntu启动报错:failed to start process error reports when automatic reporting is enabled](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#6-ubuntu%E5%90%AF%E5%8A%A8%E6%8A%A5%E9%94%99failed-to-start-process-error-reports-when-automatic-reporting-is-enabled)
  * [7. 改变linux命令行输出的颜色](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#7-%E6%94%B9%E5%8F%98linux%E5%91%BD%E4%BB%A4%E8%A1%8C%E8%BE%93%E5%87%BA%E7%9A%84%E9%A2%9C%E8%89%B2)
  * [8. Remove pirates and ecodisasters from Spore](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#8-remove-pirates-and-ecodisasters-from-spore)
  * [9. 调试DLL](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_3.md#9-%E8%B0%83%E8%AF%95dll)

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

## 5. 安装YLMF系统
  * [参考](https://blog.csdn.net/zhy20192009/article/details/89195933)
  
## 6. Ubuntu启动报错:failed to start process error reports when automatic reporting is enabled
  * 该报错由软件Apport产生
  * [参考](https://vitux.com/how-to-disable-enable-automatic-error-reporting-in-ubuntu-18-04-lts/)
  
## 7. 改变linux命令行输出的颜色
  * \033\[{CODE}m 表示开始设置颜色
  * \033\[0m 表示结束设置，不影响后面的输出
  * 字体颜色CODE    
  ![字体颜色](https://github.com/haskellcg/Blog_Pictures/blob/master/console_change_font_color.PNG)
  * 背景颜色CODE    
  ![背景颜色](https://github.com/haskellcg/Blog_Pictures/blob/master/console_change_bg_color.PNG)
  
## 8. Remove pirates and ecodisasters from Spore
  * come to the late stage of the game, these stuff really makes game unfun, so I decide to remove them from my game :)
  * [the link about how to do it](https://violetguard.wordpress.com/2013/12/06/removing-pirates-and-ecodisasters-from-spore-2014/)
  * basically we use unpack/pack tool to modify game file
  * beware "Spore_Game.package" file is located in steam installation folder
  * what I modified:
    * PirateRaidFrequency
    * GrobTeaseAttachFrequency
    * PirateRaidAllyFrequency
    * PirateRaidPlunderFrequency
    * BiosphereCollapseFrequency
    * HappinessDisasterFrequency
## 9. 调试DLL
  * [VS调试DLL](https://blog.csdn.net/qianghaohao/article/details/50190905)
