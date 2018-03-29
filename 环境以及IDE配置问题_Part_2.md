[![catalog][catalog_img]][catalog_link]

* [1. 组装台式机，最近重装系统后，发现进入BIOS后非常卡顿，而且CPU频率显示只有0.8GHz，另外进入Windows后连打开网页都卡顿，拖动窗口能够看到明显的痕迹，进入CSGO的fps只有30多，再观察主板温度显示，一直稳定在28-30，满载也是30](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_2.md#1-%E7%BB%84%E8%A3%85%E5%8F%B0%E5%BC%8F%E6%9C%BA%E6%9C%80%E8%BF%91%E9%87%8D%E8%A3%85%E7%B3%BB%E7%BB%9F%E5%90%8E%E5%8F%91%E7%8E%B0%E8%BF%9B%E5%85%A5bios%E5%90%8E%E9%9D%9E%E5%B8%B8%E5%8D%A1%E9%A1%BF%E8%80%8C%E4%B8%94cpu%E9%A2%91%E7%8E%87%E6%98%BE%E7%A4%BA%E5%8F%AA%E6%9C%8908ghz%E5%8F%A6%E5%A4%96%E8%BF%9B%E5%85%A5windows%E5%90%8E%E8%BF%9E%E6%89%93%E5%BC%80%E7%BD%91%E9%A1%B5%E9%83%BD%E5%8D%A1%E9%A1%BF%E6%8B%96%E5%8A%A8%E7%AA%97%E5%8F%A3%E8%83%BD%E5%A4%9F%E7%9C%8B%E5%88%B0%E6%98%8E%E6%98%BE%E7%9A%84%E7%97%95%E8%BF%B9%E8%BF%9B%E5%85%A5csgo%E7%9A%84fps%E5%8F%AA%E6%9C%8930%E5%A4%9A%E5%86%8D%E8%A7%82%E5%AF%9F%E4%B8%BB%E6%9D%BF%E6%B8%A9%E5%BA%A6%E6%98%BE%E7%A4%BA%E4%B8%80%E7%9B%B4%E7%A8%B3%E5%AE%9A%E5%9C%A828-30%E6%BB%A1%E8%BD%BD%E4%B9%9F%E6%98%AF30)

[catalog_img]: https://img.shields.io/badge/%E7%9B%AE%E5%BD%95-Summary-brightgreen.svg 
[catalog_link]: https://github.com/haskellcg/Life_Is_Beautiful/blob/master/%E7%8E%AF%E5%A2%83%E4%BB%A5%E5%8F%8AIDE%E9%85%8D%E7%BD%AE%E9%97%AE%E9%A2%98_Part_2.md


## 1. 组装台式机，最近重装系统后，发现进入BIOS后非常卡顿，而且CPU频率显示只有0.8GHz，另外进入Windows后连打开网页都卡顿，拖动窗口能够看到明显的痕迹，进入CSGO的fps只有30多，再观察主板温度显示，一直稳定在28-30，满载也是30
  * 查了很多资料，都是多电源管理问题，说开启高性能，确保CPU 100%使用
  * 但是这些对我的情况不管用，刚开始以为时主板坏了，后来无意间看到，MSI Z97 Gaming7有一个slow mode开关，开启之后会导致CPU锁频
  * 所以只需要将开关关闭即可，肯定是我哪天手残打开这个开关了
