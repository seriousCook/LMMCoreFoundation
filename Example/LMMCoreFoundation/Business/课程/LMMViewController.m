//
//  LMMViewController.m
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 02/20/2019.
//  Copyright (c) 2019 马敬龙. All rights reserved.
//

#import "LMMViewController.h"
#import "LMMCourseApi.h"
#import "LMMCourseCell.h"
#import "YYModel.h"
#import "CYPBaseWebView.h"
#import <BmobSDK/Bmob.h>
@interface LMMViewController ()<UITableViewDelegate,UITableViewDataSource, NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    NSInteger tag;
    
    NSArray * littleAllArray;
    NSArray * littleChapter1;
    NSArray * littleChapter2;
    NSArray * littleChapter3;
    NSArray * littleChapter4;
    
    NSArray * zhutiArray1;
    NSArray * zhutiArray2;
    NSArray * zhutiArray3;
    NSArray * zhutiArray4;
    NSArray * zhutiArray5;
    NSArray * zhutiArray6;
    NSArray * zhutiArray7;
    NSArray * zhutiArray8;
    NSArray * zhutiArray9;
    NSArray * zhutiArray10;
    NSArray * zhutiArray11;
    NSArray * zhutiArray12;
    NSArray * zhutiArray13;
    NSArray * zhutiArray14;
    NSArray * zhutiArray15;
    NSArray * zhutiArray16;
    NSArray * zhutiArray17;
    NSArray * zhutiArray18;
    NSArray * zhutiArray19;
    NSArray * zhutiArray20;
    NSArray * zhutiArray21;
    NSArray * zhutiArray22;
    
    
    NSArray * ssssss;
    
    NSInteger modelTag;
    NSArray * currSubArray;
    NSInteger subItemTag;
    
    NSArray * namesArray;
}
@property (nonatomic, strong) UITableView * listTableView;
@property (nonatomic, strong) NSMutableArray * listDataArray;
@property (nonatomic, strong) NSURLConnection * connect;
@property (nonatomic, strong) NSMutableData * data;
@property (nonatomic, strong) CYPBaseWebView * baseWebView;

@end

static NSString * courseListIdf = @"courseListIdf";
@implementation LMMViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"课程";
//    [self.view addSubview:self.listTableView];
    
    NSString * url = @"https://www.json.cn/";
    self.baseWebView = [[CYPBaseWebView alloc] initWithFrame:self.view.bounds requestWithWebUrl:url];
    self.baseWebView.scalesPageToFit = YES;
    [self.view addSubview:self.baseWebView];
    
    [self.baseWebView registerCYPWebViewHandler:@"save" dataBlock:^(NSDictionary *dataDic) {
        
    }];
    
    //  <[ -> @[@>    <@@->@> <,->, @>  <@@->@>
    
    littleAllArray =@[@[@1537,@1573],@[@7908,@7908],@[@8013,@8013],@[@13555,@13555],@[@14003,@14003],@[@1731,@1748],@[@1574,@1730],@[@1749,@1765],@[@2641,@2662],@[@2664,@2681],@[@2683,@2716],@[@7836,@7836],@[@7859,@7864],@[@7899,@7899],@[@7901,@7903],@[@7909,@7915],@[@7928,@7933],@[@7940,@7953],@[@7979,@7984],@[@7992,@7992],@[@8014,@8023],@[@13557,@13557],@[@13559,@13563],@[@13591,@13591],@[@13898,@13899],@[@13906,@13911],@[@13913,@13914],@[@13917,@13918],@[@13922,@13932],@[@13934,@13937],@[@13940,@13941],@[@13946,@13946],@[@13948,@13948],@[@13956,@13956],@[@13962,@13963],@[@13966,@13967],@[@13970,@13971],@[@13973,@13975],@[@13977,@13979],@[@13982,@13986],@[@13993,@13993],@[@13997,@13997],@[@13999,@13999],@[@14004,@14004],@[@14006,@14006],@[@14008,@14009],@[@1919,@1936],@[@1766,@1918],@[@1937,@1980],@[@13921,@13921],@[@13960,@13961],@[@1981,@2042],@[@2717,@2727],@[@7837,@7852],@[@7858,@7858],@[@7865,@7872],@[@7874,@7879],@[@7889,@7892],@[@7900,@7900],@[@7904,@7907],@[@7916,@7923],@[@7934,@7939],@[@7954,@7969],@[@7978,@7978],@[@7985,@7991],@[@7993,@8009],@[@13905,@13905],@[@13915,@13915],@[@13938,@13939],@[@13942,@13945],@[@13950,@13950],@[@13953,@13955],@[@13957,@13958],@[@13968,@13969],@[@13972,@13972],@[@13976,@13976],@[@13980,@13981],@[@13987,@13992],@[@13998,@13998],@[@14001,@14002],@[@14005,@14005],@[@14007,@14007],@[@2125,@2134],@[@2043,@2124],@[@2135,@2207],@[@2728,@2740],@[@7830,@7833],@[@7835,@7835],@[@7880,@7888],@[@7893,@7898],@[@8010,@8012],@[@13565,@13585],@[@13588,@13588],@[@13592,@13593],@[@13900,@13902],@[@13912,@13912],@[@13919,@13920],@[@13933,@13933],@[@13951,@13952],@[@13964,@13965],@[@13994,@13995],@[@14000,@14000],@[@2208,@2211],@[@2213,@2300],@[@7853,@7854],@[@7924,@7926],@[@7970,@7975],@[@13586,@13587],@[@13614,@13614],@[@13903,@13904],@[@2302,@2336],@[@7855,@7857],@[@7927,@7927],@[@7976,@7977],@[@13947,@13947],@[@13996,@13996]];
    
    littleChapter1 = @[@[@1537,@1573],@[@7908,@7908],@[@8013,@8013],@[@13555,@13555],@[@14003,@14003]];
    
    littleChapter2 = @[@[@1731,@1748],@[@1574,@1730],@[@1749,@1765],@[@2641,@2662],@[@2664,@2681],@[@2683,@2716],@[@7836,@7836],@[@7859,@7864],@[@7899,@7899],@[@7901,@7903],@[@7909,@7915],@[@7928,@7933],@[@7940,@7953],@[@7979,@7984],@[@7992,@7992],@[@8014,@8023],@[@13557,@13557],@[@13559,@13563],@[@13591,@13591],@[@13898,@13899],@[@13906,@13911],@[@13913,@13914],@[@13917,@13918],@[@13922,@13932],@[@13934,@13937],@[@13940,@13941],@[@13946,@13946],@[@13948,@13948],@[@13956,@13956],@[@13962,@13963],@[@13966,@13967],@[@13970,@13971],@[@13973,@13975],@[@13977,@13979],@[@13982,@13986],@[@13993,@13993],@[@13997,@13997],@[@13999,@13999],@[@14004,@14004],@[@14006,@14006],@[@14008,@14009]];
    
    littleChapter3 = @[@[@1919,@1936],@[@1766,@1918],@[@1937,@1980],@[@13921,@13921],@[@13960,@13961]];
    
    littleChapter4 = @[@[@1981,@2042],@[@2717,@2727],@[@7837,@7852],@[@7858,@7858],@[@7865,@7872],@[@7874,@7879],@[@7889,@7892],@[@7900,@7900],@[@7904,@7907],@[@7916,@7923],@[@7934,@7939],@[@7954,@7969],@[@7978,@7978],@[@7985,@7991],@[@7993,@8009],@[@13905,@13905],@[@13915,@13915],@[@13938,@13939],@[@13942,@13945],@[@13950,@13950],@[@13953,@13955],@[@13957,@13958],@[@13968,@13969],@[@13972,@13972],@[@13976,@13976],@[@13980,@13981],@[@13987,@13992],@[@13998,@13998],@[@14001,@14002],@[@14005,@14005],@[@14007,@14007]];
    
    zhutiArray1 = @[@[@2125,@2134],@[@2043,@2124],@[@2135,@2207],@[@2728,@2740],@[@7830,@7833],@[@7835,@7835],@[@7880,@7888],@[@7893,@7898],@[@8010,@8012],@[@13565,@13585],@[@13588,@13588],@[@13592,@13593],@[@13900,@13902],@[@13912,@13912],@[@13919,@13920],@[@13933,@13933],@[@13951,@13952],@[@13964,@13965],@[@13994,@13995],@[@14000,@14000]];
    
    zhutiArray2 =@[@[@2208,@2211],@[@2213,@2300],@[@7853,@7854],@[@7924,@7926],@[@7970,@7975],@[@13586,@13587],@[@13614,@13614],@[@13903,@13904]];
    
    zhutiArray3 =@[@[@2302,@2336],@[@7855,@7857],@[@7927,@7927],@[@7976,@7977],@[@13947,@13947],@[@13996,@13996]];
    
    zhutiArray4 =@[@[@1632,@1633],@[@1908,@1908],@[@1912,@1912],@[@1915,@1917],@[@1919,@1920],@[@1923,@1923],@[@1927,@1930],@[@1932,@1937],@[@1941,@1963],@[@1906,@1907],@[@1909,@1911],@[@1913,@1914],@[@1918,@1918],@[@1921,@1922],@[@1924,@1926],@[@1931,@1931],@[@1938,@1940]];
    
    zhutiArray5 =@[@[@1766,@1767],@[@1769,@1769],@[@1771,@1775],@[@1768,@1768],@[@1770,@1770]];
    
    zhutiArray6 =@[@[@2048,@2048],@[@2050,@2050],@[@2170,@2172],@[@2174,@2176],@[@2178,@2178],@[@2181,@2185],@[@2187,@2188],@[@2191,@2196],@[@2200,@2203],@[@2205,@2207],@[@2209,@2209],@[@2290,@2300],@[@2658,@2658],@[@2661,@2661],@[@7830,@7831],@[@7835,@7835],@[@7851,@7853],@[@7880,@7881],@[@7884,@7884],@[@7893,@7896],@[@7925,@7925],@[@7969,@7969],@[@7971,@7972],@[@8010,@8012],@[@13555,@13555],@[@13585,@13585]];
    
    zhutiArray7 =@[@[@1712,@1714],@[@1716,@1717],@[@1720,@1721],@[@1723,@1723],@[@1725,@1730],@[@1738,@1741],@[@1743,@1745],@[@1982,@1985],@[@1991,@1991],@[@1995,@1999],@[@2106,@2106],@[@2698,@2698],@[@2700,@2700],@[@2714,@2715],@[@7866,@7866],@[@7869,@7870],@[@7921,@7921],@[@7937,@7937],@[@7939,@7939],@[@7947,@7947],@[@7951,@7951],@[@7986,@7986],@[@7988,@7988],@[@7993,@7994],@[@7999,@7999],@[@8006,@8006],@[@8016,@8016],@[@1683,@1683],@[@1689,@1689],@[@1715,@1715],@[@1718,@1719],@[@1722,@1722],@[@1724,@1724],@[@1731,@1731],@[@1737,@1737],@[@1742,@1742]];
    
    zhutiArray8 =@[@[@1700,@1702],@[@1704,@1704],@[@1706,@1711],@[@1732,@1732],@[@1735,@1736],@[@2043,@2049],@[@2051,@2094],@[@2154,@2169],@[@2173,@2173],@[@2179,@2179],@[@2197,@2198],@[@2685,@2685],@[@2724,@2724],@[@2729,@2733],@[@2740,@2740],@[@7832,@7832],@[@7837,@7839],@[@7842,@7842],@[@7847,@7847],@[@7875,@7875],@[@7886,@7887],@[@7899,@7899],@[@7904,@7904],@[@7917,@7918],@[@7954,@7961],@[@13557,@13557],@[@13565,@13565],@[@13577,@13581],@[@13583,@13583],@[@1734,@1734],@[@13901,@13902],@[@1686,@1686],@[@1703,@1703],@[@1705,@1705],@[@1733,@1733],@[@2108,@2108]];
    
    zhutiArray9 =@[@[@1587,@1587],@[@1589,@1589],@[@1600,@1600],@[@1657,@1660],@[@1682,@1682],@[@1684,@1685],@[@1687,@1687],@[@1695,@1695],@[@1989,@1989],@[@2095,@2107],@[@2109,@2110],@[@2131,@2131],@[@2145,@2145],@[@2148,@2148],@[@2199,@2199],@[@2648,@2648],@[@2659,@2659],@[@2676,@2676],@[@2681,@2681],@[@2683,@2683],@[@2704,@2704],@[@2716,@2716],@[@7843,@7843],@[@7858,@7858],@[@7860,@7860],@[@7864,@7864],@[@7868,@7868],@[@7874,@7874],@[@7891,@7891],@[@7903,@7903],@[@7910,@7910],@[@7919,@7920],@[@7934,@7934],@[@7962,@7963],@[@7975,@7975],@[@7985,@7985],@[@7990,@7990],@[@8001,@8001],@[@8007,@8007],@[@8022,@8023],@[@13900,@13900],@[@1681,@1681],@[@1683,@1683],@[@1686,@1686],@[@1688,@1690],@[@1718,@1719],@[@2691,@2691]];
    
    zhutiArray10 =@[@[@1574,@1585],@[@1593,@1596],@[@1598,@1598],@[@2642,@2645],@[@2647,@2647],@[@2649,@2650],@[@2652,@2652],@[@2669,@2669],@[@7968,@7968],@[@13899,@13899],@[@13898,@13898],@[@1597,@1597]];
    
    zhutiArray11 =@[@[@1602,@1604],@[@1631,@1631],@[@1746,@1746],@[@1750,@1751],@[@1753,@1753],@[@1755,@1755],@[@1776,@1777],@[@1779,@1781],@[@1783,@1783],@[@1787,@1787],@[@1790,@1790],@[@1798,@1798],@[@1801,@1801],@[@1803,@1805],@[@1807,@1807],@[@1811,@1812],@[@1816,@1818],@[@1822,@1824],@[@1826,@1827],@[@1829,@1831],@[@1836,@1839],@[@1841,@1841],@[@1843,@1850],@[@1852,@1854],@[@1856,@1858],@[@1862,@1862],@[@1866,@1874],@[@1876,@1878],@[@1880,@1880],@[@1882,@1882],@[@1888,@1888],@[@1890,@1891],@[@1896,@1896],@[@1901,@1901],@[@1903,@1905],@[@2020,@2020],@[@2190,@2190],@[@2662,@2662],@[@2701,@2701],@[@2705,@2705],@[@2728,@2728],@[@1778,@1778],@[@1782,@1782],@[@1784,@1786],@[@1788,@1789],@[@1791,@1797],@[@1799,@1800],@[@1802,@1802],@[@1806,@1806],@[@1808,@1810],@[@1813,@1815],@[@1819,@1821],@[@1825,@1825],@[@1828,@1828],@[@1833,@1835],@[@1840,@1840],@[@1842,@1842],@[@1851,@1851],@[@1855,@1855],@[@1859,@1861],@[@1863,@1865],@[@1875,@1875],@[@1879,@1879],@[@1881,@1881],@[@1883,@1887],@[@1889,@1889],@[@1892,@1895],@[@1897,@1900],@[@1902,@1902],@[@1832,@1832]];
    
    zhutiArray12 =@[@[@1614,@1624],@[@1638,@1655],@[@1989,@1990],@[@2096,@2097],@[@2100,@2100],@[@2104,@2104],@[@2189,@2189],@[@2670,@2677],@[@2679,@2680],@[@2717,@2717],@[@2731,@2731],@[@2738,@2738],@[@7848,@7848],@[@7912,@7912],@[@7930,@7930],@[@7933,@7933],@[@7935,@7935],@[@7958,@7958],@[@7962,@7962],@[@7983,@7983],@[@7987,@7987],@[@7991,@7991],@[@7995,@7995],@[@8002,@8002],@[@13569,@13569],@[@1681,@1681]];
    
    zhutiArray13 =@[@[@1964,@1980]];
    
    zhutiArray14 =@[@[@1610,@1613],@[@1656,@1660],@[@1662,@1662],@[@1664,@1666],@[@1674,@1680],@[@1695,@1697],@[@2110,@2110],@[@2116,@2116],@[@2646,@2646],@[@2648,@2648],@[@2659,@2659],@[@2683,@2690],@[@2692,@2697],@[@2710,@2710],@[@7861,@7861],@[@7867,@7867],@[@7892,@7892],@[@7900,@7900],@[@7946,@7947],@[@7984,@7984],@[@8005,@8005],@[@8017,@8017],@[@13559,@13560],@[@13562,@13562],@[@1661,@1661],@[@1663,@1663],@[@1667,@1673],@[@1698,@1699],@[@1724,@1724],@[@1762,@1762],@[@2691,@2691]];
    
    zhutiArray15 =@[@[@2180,@2180],@[@2190,@2190],@[@2204,@2204],@[@2657,@2657],@[@2661,@2661],@[@7849,@7849],@[@7882,@7882],@[@7923,@7923],@[@2660,@2660]];
    
    zhutiArray16 =@[@[@2328,@2336]];
    
    zhutiArray17 =@[@[@1586,@1586],@[@1588,@1588],@[@1590,@1590],@[@1599,@1599],@[@1657,@1658],@[@1660,@1660],@[@2111,@2136],@[@2138,@2153],@[@2186,@2186],@[@2277,@2280],@[@2666,@2667],@[@2734,@2739],@[@7833,@7833],@[@7845,@7846],@[@7854,@7854],@[@7872,@7872],@[@7888,@7888],@[@7897,@7898],@[@7921,@7922],@[@7938,@7938],@[@7964,@7967],@[@7970,@7970],@[@7978,@7978],@[@13555,@13555],@[@13566,@13566],@[@13568,@13568],@[@13570,@13576],@[@2137,@2137]];
    
    zhutiArray18 =@[@[@1591,@1592],@[@1601,@1609],@[@1625,@1637],@[@1691,@1691],@[@1694,@1694],@[@1748,@1748],@[@1752,@1752],@[@1756,@1757],@[@1761,@1761],@[@1763,@1765],@[@1981,@1988],@[@1991,@2019],@[@2021,@2041],@[@2177,@2177],@[@2651,@2651],@[@2654,@2656],@[@2664,@2665],@[@2677,@2678],@[@2699,@2699],@[@2703,@2704],@[@2706,@2708],@[@2711,@2714],@[@2716,@2716],@[@2718,@2727],@[@7836,@7836],@[@7859,@7859],@[@7862,@7862],@[@7865,@7865],@[@7871,@7871],@[@7876,@7879],@[@7883,@7883],@[@7890,@7890],@[@7901,@7902],@[@7911,@7911],@[@7913,@7915],@[@7928,@7929],@[@7936,@7936],@[@7941,@7941],@[@7948,@7949],@[@7952,@7953],@[@7979,@7979],@[@7997,@7997],@[@8000,@8000],@[@8003,@8004],@[@8008,@8008],@[@8020,@8020],@[@13561,@13561],@[@13582,@13582],@[@7998,@7998],@[@13905,@13906],@[@1692,@1693],@[@1747,@1747],@[@1749,@1749],@[@1754,@1754],@[@1758,@1760],@[@2709,@2709],@[@2702,@2702]];
    
    zhutiArray19 =@[@[@2641,@2641],@[@2653,@2653]];
    
    zhutiArray20 =@[@[@1790,@1790],@[@1803,@1803],@[@1811,@1811],@[@1816,@1818],@[@1870,@1871],@[@1873,@1874],@[@2020,@2020],@[@2062,@2062],@[@2730,@2730],@[@7885,@7885],@[@7996,@7996],@[@1782,@1782],@[@1784,@1784],@[@1786,@1786],@[@1791,@1793],@[@1795,@1796],@[@1799,@1800],@[@1808,@1810],@[@1813,@1815],@[@1834,@1835]];
    
    zhutiArray21 =@[@[@2208,@2208],@[@2210,@2211],@[@2213,@2234],@[@2236,@2243],@[@2245,@2265],@[@2267,@2276],@[@2281,@2289],@[@2302,@2327],@[@7857,@7857],@[@7926,@7927],@[@7976,@7977],@[@7989,@7989],@[@13584,@13584],@[@13586,@13586],@[@13903,@13904],@[@13567,@13567],@[@2266,@2266],@[@2244,@2244],@[@2235,@2235]];
    
    zhutiArray22 =@[@[@2042,@2042],@[@8009,@8009]];

    namesArray = @[@"顺序全部",
                   @"章节-违法行为综合判断与案例分析（41题）",
                   @"章节-安全行车常识（384题）",
                   @"章节-常见交通标志、标线和交通手势辨识（218题）",
                   @"章节-驾驶职业道德和文明驾驶常识（199题）",
                   @"章节-恶劣气候和复杂道路条件下驾驶常识（239题）",
                   @"章节-紧急情况下避险常识（108题）",
                   @"章节-交通事故救护及常见危化品处置常识（43题）",
                   @"专项-标线(60题)",
                   @"专项-道路信号灯(10题)",
                   @"专项-高速(65题)",
                   @"专项-普通路段(62题)",
                   @"专项-特殊路段(129题)",
                   @"专项-灯光使用(71题)",
                   @"专项-安全常识(31题)",
                   @"专项-标志(145题)",
                   @"专项-道路通行原则(63题)",
                   @"专项-交警手势(17题)",
                   @"专项-基础驾驶技巧(69题)",
                   @"专项-速度(9题)",
                   @"专项-特殊品运输(9题)",
                   @"专项-特殊天气(90题)",
                   @"专项-文明驾驶(169题)",
                   @"专项-仪表、指示灯(2题)",
                   @"专项-易混标志(33题)",
                   @"专项-意外事故处理(113题)",
                   @"专项-责任判定(2题)",
                   ];
    
    ssssss =          @[littleAllArray,
                        littleChapter1,
                        littleChapter2,
                        littleChapter3,
                        littleChapter4,
                        zhutiArray1,
                        zhutiArray2,
                        zhutiArray3,
                        zhutiArray4,
                        zhutiArray5,
                        zhutiArray6,
                        zhutiArray7,
                        zhutiArray8,
                        zhutiArray9,
                        zhutiArray10,
                        zhutiArray11,
                        zhutiArray12,
                        zhutiArray13,
                        zhutiArray14,
                        zhutiArray15,
                        zhutiArray16,
                        zhutiArray17,
                        zhutiArray18,
                        zhutiArray19,
                        zhutiArray20,
                        zhutiArray21,
                        zhutiArray22];
    
    //http://img.58cdn.com.cn/dist/jxedt/app/static/img/kaoshi_p/_40556.gif
    //http://img.58cdn.com.cn/dist/jxedt/app/static/img/kaoshi_p/5eb4d75agw1e295gvf1gjj.jpg
    
//    for (int i=0; i<namesArray.count; i++) {
//        NSString * path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//        NSString * file = [path stringByAppendingFormat:@"/%ld_%@.json",(long)i,namesArray[i]];
//
//        id json = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
////        NSLog(@"%@",[json yy_modelToJSONString]);
////        NSLog(@"file__%@",file);
//
//        NSString *name = [[NSString alloc] initWithFormat:@"%ld_%@.json",(long)i,namesArray[i]];
//        NSString *newpath = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
//
//        NSArray * arr = [NSArray arrayWithContentsOfFile:newpath];
////        NSLog(@"arrat__%@",arr);
//        NSError * error = nil;
//        [[json yy_modelToJSONString] writeToFile:newpath atomically:YES encoding:NSUTF8StringEncoding error:&error];
////        NSLog(@"error__%@",error);
//        [[NSString alloc] init];
//    }
    


    [self loadRequest:0];
}

- (void)saveINfo:(NSInteger)index
{
    if (index>= self.listDataArray.count) {
        return;
    }
    
    NSDictionary * dict = self.listDataArray[index];
    BmobObject *gameScore = [BmobObject objectWithoutDataWithClassName:@"smallCarExam4" objectId:dict[@"id"]];
    
    [gameScore saveAllWithDictionary:dict];
    [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        
        [self saveINfo:index+1];
        if (!isSuccessful) {
            NSLog(@"error__%@",error);
        } else {
            NSLog(@"success_");
        }
    }];
}

//去ss
- (void)loadRequest:(NSInteger)MTag
{
    if (MTag >= ssssss.count) {
        [[[UIAlertView alloc] initWithTitle:@"轮询计算完毕" message:[@(modelTag) stringValue] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
        return;
    }
    //获取组元素
    modelTag = MTag;
    currSubArray = ssssss[MTag];
    [self getSubItem:0];
}

- (void)getSubItem:(NSInteger)subTag
{
    
    if (subTag >= currSubArray.count) {
        //更新currSubArray 之前存储数据
        NSString * path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString * file = [path stringByAppendingFormat:@"/%ld_%@.json",(long)modelTag,namesArray[modelTag]];
        NSLog(@"file__path__%@",file);
        
        [self saveINfo:0];
        
        
//        [NSKeyedArchiver archiveRootObject:self.listDataArray toFile:file];
//        BOOL result = [[self.listDataArray yy_modelToJSONString] writeToFile:file atomically:YES];
//        [self.listDataArray removeAllObjects];
//
//        [self loadRequest:modelTag+1];
        return;
    }
    subItemTag = subTag;
    tag = [[currSubArray[subTag] firstObject] integerValue];
    
    [self requestWithId:tag];
}


- (void)requestWithId:(NSInteger)_id
{
    if (_id > [[currSubArray[subItemTag] lastObject] integerValue]) {
        [self getSubItem:subItemTag+1];
        return;
    }
    
    self.data = [[NSMutableData alloc] init];
    
    NSString * urlStr = [[NSString alloc] initWithFormat:@"http://mnks.jxedt.com/get_question?r=0.10163243037552194&index=%@",@(_id)];
    NSURL * url = [NSURL URLWithString:urlStr];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];

    self.connect = [NSURLConnection connectionWithRequest:request delegate:self];

    [self.connect start];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error>>>>>>>>>>>>>>>%@",error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString * str = [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding];
    
    id json = [NSJSONSerialization JSONObjectWithData:self.data options:(NSJSONReadingMutableContainers) error:nil];
//    NSLog(@"json___%@",json);
//    NSLog(@"str___%@",str);
    
//    [self.listDataArray addObject:str];
    if (json) {

        NSDictionary * dict = [self motifyInfoData:json];

        [self.listDataArray addObject:dict];
    } else if (str){
        str = [str stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
        str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        str = [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
        str = [str stringByReplacingOccurrencesOfString:@"\\" withString:@""];

        NSError * error = nil;
        NSData * data = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];

        NSDictionary * newdDict = [self motifyInfoData:json];

//        NSLog(@"olad_str___:%@",str);
//        NSLog(@"str-->NSDict__:%@",dict);
        [self.listDataArray addObject:newdDict];

    }
    ++tag;
    [self requestWithId:tag];
    
}

- (NSDictionary *)motifyInfoData:(NSDictionary *)json
{
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:json];
    if ([json[@"imageurl"] length]) {
        NSString * host = @"http://img.58cdn.com.cn/dist/jxedt/app/static/img/kaoshi_p/";
        NSString * url = [host stringByAppendingString:json[@"imageurl"]];
        if ([url hasSuffix:@".webp"]) {
            url = [url stringByReplacingOccurrencesOfString:@".webp" withString:@".jpg"];
        } else if([url hasSuffix:@".mp4"]){
            url = [url stringByReplacingOccurrencesOfString:@".mp4" withString:@".gif"];
        }
        [dic setObject:url forKey:@"imageurl"];
    }
    if ([json[@"sinaimg"] length]) {
        NSString * host = @"";
        NSString * url = [host stringByAppendingString:json[@"imageurl"]];
        if ([url hasSuffix:@".webp"]) {
            url = [url stringByReplacingOccurrencesOfString:@".webp" withString:@".jpg"];
        } else if([url hasSuffix:@".mp4"]){
            url = [url stringByReplacingOccurrencesOfString:@".mp4" withString:@".gif"];
        }
        [dic setObject:url forKey:@"sinaimg"];
    }
    
    return dic;
}



- (void)requestListWithPage:(NSInteger)page
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"" forKey:@"gradeId"];
    [params setObject:@"" forKey:@"subjectId"];
    [params setObject:@"" forKey:@"regionId"];
    [params setObject:@"" forKey:@"schoolId"];
    [params setObject:@"" forKey:@"courseName"];
    [params setObject:@(page) forKey:@"currentPage"];
    [params setObject:@"10" forKey:@"pageSize"];
    
    [[LMMCourseApi API] apiWithParams:params callback:^(id _Nonnull objct, NSError * _Nonnull error) {
        NSArray * data = [NSArray yy_modelArrayWithClass:LMMCourseModel.class json:objct[@"params"][@"courseList"]];
        [self.listDataArray addObjectsFromArray:data];
        [self.listTableView reloadData];
    }];
}

#pragma mark- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listDataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LMMCourseCell * cell = [tableView dequeueReusableCellWithIdentifier:courseListIdf forIndexPath:indexPath];
    
    cell.model = self.listDataArray[indexPath.row];
    
    return cell;
}

#pragma mark-
- (UITableView *)listTableView
{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _listTableView.dataSource = self;
        _listTableView.delegate = self;
        
        [_listTableView registerClass:[LMMCourseCell class] forCellReuseIdentifier:courseListIdf];
    }
    return _listTableView;
}

- (NSMutableArray *)listDataArray
{
    if (!_listDataArray) {
        _listDataArray = [[NSMutableArray alloc] init];
    }
    return _listDataArray;
}

@end
