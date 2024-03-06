<template>
    <div>
        <!-- 编写布局 -->

        <!-- 编写布局 -->
        <!--  <el-header style="height: 60px; ">球球音乐ProMax后台管理</el-header> -->
        <!-- 头部 -->
        <div class="header">
            <div class="logo">
                球球音乐ProMax后台管理
            </div>
            <div class="head-right">
                <div class="user-avator">
                    <img src="../assets/images/background.jpg">
                </div>
                <div class="user-name">
                    admin
                </div>
            </div>
        </div>


        <el-container style="height: 800px; border: 10px solid #eee">
            <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
                <el-menu :default-openeds="['1', '3']">

                    <!--  <el-submenu index="1">
                            <template slot="title"><i class="el-icon-message"></i>球球音乐首页</template>
                            <el-menu-item-group>
                                <el-menu-item index="1-1">
                                    <router-link to="/index" style="text-decoration: none;color: black;">首页</router-link>
                                </el-menu-item>
                            </el-menu-item-group>
                        </el-submenu> -->
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
                <!-- 添加歌曲信息 -->
                <el-button type="danger" @click="deleteSongByIds">删除/批量删除</el-button>
                <el-button type="success" @click="showDialog">添加歌曲</el-button>
                <el-dialog :visible.sync="dialogVisible" title="表单">
                    <el-form ref="userForm" :model="song" label-width="70px">
                        <el-form-item label="歌曲名">
                            <el-input v-model="song.songname"></el-input>
                        </el-form-item>
                        <el-form-item label="作者">
                            <el-input v-model="song.name"></el-input>
                        </el-form-item>
                        <el-form-item label="类型">
                            <el-radio v-model="song.type" label="流行">流行</el-radio>
                            <el-radio v-model="song.type" label="说唱">说唱</el-radio>
                            <el-radio v-model="song.type" label="安静">安静</el-radio>
                            <el-radio v-model="song.type" label="国风">国风</el-radio>
                            <el-radio v-model="song.type" label="摇滚">摇滚</el-radio>
                            <el-radio v-model="song.type" label="轻音乐">轻音乐</el-radio>
                        </el-form-item>
                        <el-form-item label="图片链接">
                            <el-input type="textarea" :rows="4" placeholder="请输入图片链接" v-model="song.image">
                            </el-input>
                        </el-form-item>

                        <el-form-item label="歌曲地址">
                            <el-input type="textarea" :rows="3" placeholder="请输入歌曲地址" v-model="song.url">
                            </el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="addsong">提交</el-button>
                            <el-button  @click="dialogVisible=false">取消</el-button>
                        </el-form-item>
                    </el-form>

                </el-dialog>
                <br>
                <span></span>
                <el-progress :percentage="110" :format="format"></el-progress>

                <!-- 查询 -->
                <el-form :inline="true" :model="song" class="demo-form-inline">
                    <el-form-item label="歌曲名">
                        <el-input v-model="song.songname" placeholder="歌曲名"></el-input>
                    </el-form-item>
                    <el-form-item label="类型">
                        <el-select v-model="song.type" placeholder="性别">
                            <el-option label="流行" value="流行"></el-option>
                            <el-option label="轻音乐" value="轻音乐"></el-option>
                            <el-option label="安静" value="安静"></el-option>
                            <el-option label="摇滚" value="摇滚"></el-option>
                            <el-option label="国风" value="国风"></el-option>
                            <el-option label="说唱" value="说唱"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="作者">
                        <el-input v-model="song.name" placeholder="作者"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="onSubmit">查询</el-button>
                    </el-form-item>
                </el-form>


                <el-table :data="tableData" stripe border @selection-change="handleSelectionChange" >
                    <el-table-column type="selection" width="55" align="center">
                    </el-table-column>
                    <el-table-column type="index" width="50" align="center">
                    </el-table-column>
                    <el-table-column prop="songname" label="歌曲名" width="150" align="center"> </el-table-column>
                    <el-table-column prop="name" label="作者" width="150" align="center"></el-table-column>
                    <el-table-column label="图像" width="150" align="center">
                        <template slot-scope="scope">
                            <img :src="scope.row.image" width="90px" height="100px">
                        </template>
                    </el-table-column>
                    <el-table-column prop="type" label="类型" width="100" align="center"></el-table-column>
                    <el-table-column prop="time" label="播放时长" width="250" align="center"></el-table-column>
                    <el-table-column label="操作" align="center">
                        <el-button type="primary" size="mini">编辑</el-button>
                        <el-button type="danger" size="mini">删除</el-button>
                    </el-table-column>
                </el-table>

                 <!-- 分页条 -->
                 <div class="block">
                    <span class="demonstration"> </span>
                    <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                        :current-page="currentPage" :page-sizes="[5, 10, 15, 20]" :page-size="4"
                        layout="total, sizes, prev, pager, next, jumper" :total="totalcount">
                    </el-pagination>
                </div>
            </el-main>


        </el-container>




    </div>
</template>

<script>
import axios from 'axios';
export default {

    data() {
        return {
             //总记录数
             totalcount: 100,
            //当前页码
            currentPage: 1,
            //当前显示总数
            pageSize:4,
            multipleSelection: [],
            tableData: [],
            dialogVisible: false,
            selectionIds: [],
            song: {
                name: '',
                image: '',
                time: '',
                type: '',
                url: '',
                songname: ''
            },
            formInline: {
                user: '',
                region: '',
                around: ''
            }
        }
    },
    async mounted() {
        /* const res = await axios.get('https://mock.apifox.cn/m2/3145965-0-default/102468732');
        console.log(re.this.data);
        this.tableData.push(res.data); */

        //发送异步请求,获取数据
      /*   axios.get("http://localhost:8080/recommend").then((result) => {
            console.log(result);
            this.tableData = result.data.data;
        }); */
        axios.get("http://localhost:8083/SelectByPageSong", {
            params: {
                begin: this.currentPage,
                size: this.pageSize
            }
        }).then((result) => {
            console.log(result);
            this.totalcount=result.data.data.totalCount
            this.tableData = result.data.data.rows;
        });

    },
    methods: { 
         //批量删除歌曲
         deleteSongByIds() {
            console.log(this.multipleSelection)
            //创建一个id数组
            for (let i = 0; i < this.multipleSelection.length; i++) {
                let selectElement = this.multipleSelection[i]
                this.selectionIds[i] = selectElement.id;
            }
            console.log(this.selectionIds)

            //发送ajax请求
            axios.post('http://localhost:8083/deleteSongByIds', this.selectionIds)
                .then(response => {
                    // 处理成功保存用户信息的逻辑
                    console.log(response);
                    this.$message.success('删除成功');
                    //this.dialogVisible=false;
                })
        },
        handleSizeChange(val) {
            console.log(`每页 ${val} 条`);
            this.pageSize=val;
        },
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
            this.currentPage=val;
           this.selectSongs();
        },
        showDialog() {
            this.dialogVisible = true;
        }, 
        handleSelectionChange(val) {
        this.multipleSelection = val;
        },
        addsong() {
            axios.post('http://localhost:8083/saveSong', this.song)
                .then(response => {
                    // 处理成功保存用户信息的逻辑
                    console.log(response);
                    this.$message.success('歌曲信息已成功保存');
                    this.dialogVisible = false;
                })
                .catch(error => {
                    // 处理保存用户信息失败的逻辑
                    console.log(error);
                    this.$message.error('歌曲信息保存失败');
                });
        },
        onSubmit() {
            axios.post("http://localhost:8083/selectSongByPageAndCondition",this.song).then((result) => {
                console.log(result);
                this.totalcount = result.data.data.totalCount;
                this.tableData = result.data.data.rows;
            });

        },
        selectSongs(){
            axios.get("http://localhost:8083/SelectByPageSong", {
            params: {
                begin: this.currentPage,
                size: this.pageSize
            }
        }).then((result) => {
            console.log(result);
            this.totalcount=result.data.data.totalCount
            this.tableData = result.data.data.rows;
        });
        }
    }

}
</script>

<style>
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
} .el-table .warning-row {
    background: oldlace;
  }

  .el-table .success-row {
    background: #f0f9eb;
  }
</style>