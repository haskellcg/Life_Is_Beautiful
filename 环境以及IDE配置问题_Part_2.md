[![catalog][catalog_img]][catalog_link]

* [1. 组装台式机，最近重装系统后，发现进入BIOS后非常卡顿，而且CPU频率显示只有0.8GHz，另外进入Windows后连打开网页都卡顿，拖动窗口能够看到明显的痕迹，进入CSGO的fps只有30多，再观察主板温度显示，一直稳定在28-30，满载也是30]()

[catalog_img]: https://img.shields.io/badge/%E7%9B%AE%E5%BD%95-Summary-brightgreen.svg 
[catalog_link]: https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_2.md


## 1. 组装台式机，最近重装系统后，发现进入BIOS后非常卡顿，而且CPU频率显示只有0.8GHz，另外进入Windows后连打开网页都卡顿，拖动窗口能够看到明显的痕迹，进入CSGO的fps只有30多，再观察主板温度显示，一直稳定在28-30，满载也是30
  * 查了很多资料，都是多电源管理问题，说开启高性能，确保CPU 100%使用
  * 但是这些对我的情况不管用，刚开始以为时主板坏了，后来无意间看到，MSI Z97 Gaming7有一个slow mode开关，开启之后会导致CPU锁频
  * 所以只需要将开关关闭即可，肯定是我哪天手残打开这个开关了
