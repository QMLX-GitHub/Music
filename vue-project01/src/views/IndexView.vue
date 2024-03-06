<template>
    <div>
        <!-- 编写布局 -->
        <!--  <el-header style="height: 60px; ">球球音乐ProMax后台管理</el-header> -->
        <!-- 头部 -->
        <div class="header">
            <div class="logo">
                球球音乐ProMax后台管理
            </div>
            <div class="head-right">
                <div class="user-avator">
                    <button @click="drawer = true" style="border: none;">
                        <img src="../assets/images/background.jpg">
                    </button>
                    <el-drawer title="我是标题" :visible.sync="drawer" :with-header="false">
                        <div class="right-admin">
                            <img src="../assets//images/background.jpg" alt="">
                            <span>Admin!</span><br>
                            <span>超级管理员!</span><br>
                            <span>Write The Demo!</span><br>
                            <span>&nbsp;&nbsp;Change The World!</span><br>
                            <router-link to="/login"
                                style="text-decoration: none;color: rgb(48, 193, 96);">退出登录</router-link>
                        </div>
                    </el-drawer>
                    <!--  <img src="../assets/images/background.jpg"> -->
                </div>
                <div class="user-name">
                    admin
                </div>
            </div>
        </div>


        <el-container style="height: 800px; border: 10px solid #eee">
            <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
                <el-menu :default-openeds="['1', '2', '3']">

                    <el-menu-item index="1">
                        <i class="el-icon-menu"></i>
                        <span slot="title">
                            <router-link to="/index" style="text-decoration: none;color: black;">首页</router-link>
                        </span>
                    </el-menu-item>

                    <el-menu-item index="2">
                        <i class="el-icon-user-solid"></i>
                        <span slot="title">
                            <router-link to="/user" style="text-decoration: none;color: black;">用户管理</router-link>
                        </span>
                    </el-menu-item>


                    <el-menu-item index="3">
                        <i class="el-icon-headset"></i>
                        <span slot="title">
                            <router-link to="/singer" style="text-decoration: none;color: black;">歌手管理</router-link>
                        </span>
                    </el-menu-item>

                    <el-menu-item index="4">
                        <i class="el-icon-video-play"></i>
                        <span slot="title">
                            <router-link to="/song" style="text-decoration: none;color: black;">歌曲管理</router-link>
                        </span>
                    </el-menu-item>

                </el-menu>
            </el-aside>


            <el-main>
                <div class="blue-bars">
                    <span class="title">球球音乐ProMax后台统计</span>
                </div>
                <div class="music-statistics">
                    <el-card class="el-card1">
                        <div class="blue-bar">
                            <span class="title">数据一览</span>
                        </div>
                        <div ref="chartContainer2" class=".chart-container" style="height: 500px;" ></div>
                        
                    </el-card>
                </div>
                <div class="music-statistics">
                    <el-card class="el-card">
                        <div ref="chartContainer" class=".chart-container" style="height: 500px;"> </div>
                        <div class="blue-bar">
                            <span class="title">歌曲类别统计</span>
                        </div>
                    </el-card>
                </div>
                
            </el-main>


        </el-container>





    </div>
</template>

<script>

import * as echarts from 'echarts'
import 'echarts/lib/chart/bar'; // 导入柱状图图表组件
import 'echarts/lib/component/tooltip'; // 导入提示框组件
import 'echarts/lib/component/title'; // 导入标题组件
import FirstPage from '@/components/FirstPage'
export default {
    data() {
        return {
            tableData: [],
            drawer: false,
            formInline: {
                user: '',
                region: '',
                around: ''
            }
        }
    },
    comments: {
        first: FirstPage
    },
    mounted() {
        this.renderChart();
        this.renderChart2();
    },
    methods: {
        renderChart() {
            // 获取DOM元素
            const chartContainer = this.$refs.chartContainer

            // 创建Echarts实例
            let myChart = echarts.init(chartContainer)

            // 音乐网站数据统计
            var musicData = [
                { name: '流行', value: 40 },
                { name: '摇滚', value: 20 },
                { name: '安静', value: 10 },
                { name: '民谣', value: 40 },
                { name: '乡村', value: 10 },
                { name: '国风', value: 20 }
            ]

            var rich = {
                white: {
                    color: '#ddd',
                    align: 'center',
                    padding: [3, 0]
                }
            }

            var placeHolderStyle = {
                normal: {
                    label: {
                        show: false
                    },
                    labelLine: {
                        show: false
                    },
                    color: 'rgba(0, 0, 0, 0)',
                    borderColor: 'rgba(0, 0, 0, 0)',
                    borderWidth: 0
                }
            }

            var data = []
            var color = ['#00ffff', '#00cfff', '#006ced', '#ffe000', '#ffa800']

            for (var i = 0; i < musicData.length; i++) {
                data.push(
                    {
                        value: musicData[i].value,
                        name: musicData[i].name,
                        itemStyle: {
                            normal: {
                                borderWidth: 4,
                                shadowBlur: 200,
                                borderColor: color[i],
                                shadowColor: color[i]
                            }
                        }
                    },
                    {
                        value: 2,
                        name: '',
                        itemStyle: placeHolderStyle
                    }
                )
            }

            var seriesObj = [
                {
                    name: '',
                    type: 'pie',
                    clockWise: false,
                    radius: [100, 200],
                    hoverAnimation: false,
                    itemStyle: {
                        normal: {
                            label: {
                                show: true,
                                position: 'outside',
                                color: '#ddd',
                                formatter: function (params) {
                                    var percent = 0
                                    var total = 0
                                    for (var i = 0; i < musicData.length; i++) {
                                        total += musicData[i].value
                                    }
                                    percent = ((params.value / total) * 100).toFixed(0)
                                    if (params.name !== '') {
                                        return (
                                            params.name +
                                            params.value +
                                            '首' +
                                            '\n{white|' +
                                            '占比' +
                                            percent +
                                            '%}'
                                        )
                                    } else {
                                        return ''
                                    }
                                },
                                rich: rich
                            },
                            labelLine: {
                                length: 30,
                                length2: 100,
                                show: true,
                                color: '#00ffff'
                            }
                        }
                    },
                    data: data
                }
            ]

            var option = {
                backgroundColor: '#04243E',
                tooltip: {
                    show: false
                },
                legend: {
                    show: false
                },
                toolbox: {
                    show: false
                },
                series: seriesObj
            }

            // 应用配置项并渲染图表
            myChart.setOption(option)

            // 自适应大小
            window.addEventListener('resize', () => {
                myChart.resize()
            })
        },
        renderChart2() {
            const chartContainer2 = this.$refs.chartContainer2;
      let myChart2 = echarts.init(chartContainer2);
      const data = [
      {
        name: '歌曲',
        value: 143
      },{
        name: '歌手',
        value: 19
      },{
        name: '专辑',
        value: 3
      },{
        name: '歌单',
        value: 11
      },{
        name: '播放量',
        value: 2000
      }
    ];
    
    // 标题数组和系列数组
    const titleArr= [];
    const seriesArr=[];
    const colors=[['#389af4', '#dfeaff'],['#ff8c37', '#ffdcc3'],['#ffc257', '#ffedcc'], ['#fd6f97', '#fed4e0'],['#a181fc', '#e3d9fe']];
    
    data.forEach(function(item, index){
      titleArr.push({
        text:item.name,
        left: `${index * 20 + 10}%`,
        top: '65%',
        textAlign: 'center',
        textStyle: {
          fontWeight: 'normal',
          fontSize: '16',
          color: colors[index][0],
          textAlign: 'center'
        }
      });
      
      seriesArr.push({
        name: item.name,
        type: 'pie',
        clockWise: false,
        radius: [60, 70],
        itemStyle:  {
          normal: {
            color: colors[index][0],
            shadowColor: colors[index][0],
            shadowBlur: 0,
            label: {
              show: false
            },
            labelLine: {
              show: false
            }
          }
        },
        hoverAnimation: false,
        center: [`${index * 20 + 10}%`, '50%'],
        data: [{
          value: item.value,
          label: {
            normal: {
              formatter: function(params){
                return params.value+'';
              },
              position: 'center',
              show: true,
              textStyle: {
                fontSize: '20',
                fontWeight: 'bold',
                color: colors[index][0]
              }
            }
          },
        }, {
          value: 100-item.value,
          name: 'invisible',
          itemStyle: {
            normal: {
              color: colors[index][1]
            },
            emphasis: {
              color: colors[index][1]
            }
          }
        }]
      });
    });

    const option2 = {
      backgroundColor: "#fff",
      title: titleArr,
      series: seriesArr
    };

      myChart2.setOption(option2);
    },


    }
}
</script>

<style>
.chart-container {
    width: 1000px;
    height: 1400px;
}

.blue-bar {
    background-color: #adadeecb;
    height: 70px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.blue-bars {
    background-color: #4dcaf0cb;
    height: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.title {
    font-size: 20px;
    color: white;
}


.music-statistics {
    width: 100%;
    height: 80%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.el-card {
    width: 1000px;
    height: 700px;
}
.el-card1 {
    width: 1000px;
    height: 500px;
}

.el-header {
    background-color: #c1eeef74;
    color: #070101;
    line-height: 60px;
}

.el-aside {
    color: #110101cc;
}

.user-avator {
    margin-left: 1290px;
    margin-top: -29px;

}

.user-avator img {
    display: block;
    width: 40px;
    height: 40px;
    border-radius: 50%;
}

.header {
    position: relative;
    background-color: #09574e12;
    box-sizing: border-box;
    height: 45px;
    width: 100%;
    font-size: 25px;
    color: #130000;
    align-items: center;
}

.header.logo {
    position: relative;
    float: left;
    line-height: 50px;
    /* padding-top: 10px; */
}

.header-right {
    float: right;
    padding-right: flex;
    height: 50px;
    align-items: center;
}

.collapse-btn {
    float: left;
    padding: 0% 21px;
    cursor: pointer;
    line-height: 60px;
}

.user-name {
    margin-left: 1350px;
    margin-top: -32px;
    font-size: 20px;
}

.right-admin {
    font-size: 20px;
    color: #333;
    padding-left: 20px;

}
</style>