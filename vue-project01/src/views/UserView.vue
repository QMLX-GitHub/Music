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
                <!-- 添加歌手信息 -->
                <el-button type="danger" @click="deleteByIDs">删除/批量删除</el-button>
                <el-button type="primary" @click="showDialog">添加</el-button>
                <el-dialog :visible.sync="dialogVisible" title="表单">
                    <el-form ref="userForm" :model="admin" label-width="70px">
                        <el-form-item label="用户名">
                            <el-input v-model="admin.name"></el-input>
                        </el-form-item>
                        <el-form-item label="密码">
                            <el-input v-model="admin.password"></el-input>
                        </el-form-item>
                        <el-form-item label="类别">
                            <el-radio v-model="admin.type" label="管理员">管理员</el-radio>
                            <el-radio v-model="admin.type" label="普通用户">普通用户</el-radio>
                            <!-- <el-input v-model="user.sex"></el-input> -->
                        </el-form-item>

                        <el-form-item>
                            <el-button type="primary" @click="addAdmin">提交</el-button>
                            <el-button @click="dialogVisible = false">取消</el-button>
                        </el-form-item>
                    </el-form>
                </el-dialog>
                <br>
                <span></span>
                <el-progress :percentage="110" :format="format"></el-progress>
                <!-- 查询 -->

        

                <!-- 获取所有数据 -->
                <el-table :data="tableData" stripe border @selection-change="handleSelectionChange">
                    <el-table-column type="selection" width="55" align="center">
                    </el-table-column>
                    <el-table-column type="index" width="50" align="center">
                    </el-table-column>
                    <!-- <el-table-column prop="id" label="编号" width="100" align="center"></el-table-column> -->
                    <el-table-column prop="name" label="用户名" width="150" align="center"></el-table-column>
                    <el-table-column prop="password" label="密码" width="150" align="center"></el-table-column>
                    <el-table-column prop="type" label="类别" width="150" align="center"> </el-table-column>
                    <el-table-column label="操作" align="center">
                        <el-button type="primary" size="mini">编辑</el-button>
                    </el-table-column>
                </el-table>

                <!-- 分页条 -->
                <div class="block">
                    <span class="demonstration"> </span>
                    <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                        :current-page="1" :page-sizes="[5, 10, 15, 20]" :page-size="8"
                        layout="total, sizes, prev, pager, next, jumper" :total="5">
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
            begin:1,
            size:5,
            //总记录数
            totalcount: 100,
            //当前页码
            currentPage: 1,
            //当前显示总数
            pageSize: 4,
            radio: '1',
            multipleSelection: [],
            tableData: [],
            dialogVisible: false,
            selectionIds: [],
            admin: {
                id: '',
                name: '',
                password: '',
                type: ''
                
            },
            formInline: {
                user: '',
                region: '',
                around: ''
            }
        }
    },
    async mounted() {
        axios.get("http://localhost:8083/selectAllAdmin", {
            params: {
                begin: this.currentPage,
                size: this.pageSize
            }
        }).then((result) => {
            console.log(result);
            this.totalcount = result.data.data.totalCount
            this.tableData = result.data.data
        });

    },
    methods: {
        handleSizeChange(val) {
            console.log(`每页 ${val} 条`);
            this.pageSize = val;
        },
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
            this.currentPage = val;
            this.selectSingers();
        },
        showDialog() {
            this.dialogVisible = true;
        },

        //添加歌手
        addAdmin() {
            axios.post('http://localhost:8083/saveAdmin', this.admin)
                .then(response => {
                    // 处理成功保存用户信息的逻辑
                    console.log(response);
                    this.$message.success('歌手信息已成功保存');
                    this.dialogVisible = false;
                })

        },
        onSubmit() {
            axios.post("http://localhost:8083/selectByPageAndCondition",this.singer).then((result) => {
                console.log(result);
                this.totalcount = result.data.data.totalCount;
                this.tableData = result.data.data.rows;
            });

        },
        handleSelectionChange(val) {
            this.multipleSelection = val;
        },
        //批量删除
        deleteByIDs() {
            console.log(this.multipleSelection)
            //创建一个id数组
            for (let i = 0; i < this.multipleSelection.length; i++) {
                let selectElement = this.multipleSelection[i]
                this.selectionIds[i] = selectElement.id;
            }
            console.log(this.selectionIds)

            //发送ajax请求
            axios.post('http://localhost:8083/deleteByIds', this.selectionIds)
                .then(response => {
                    // 处理成功保存用户信息的逻辑
                    console.log(response);
                    this.$message.success('删除成功');
                    //this.dialogVisible=false;
                })
        },
        selectSingers() {
            axios.get("http://localhost:8083/SelectByPage", {
                params: {
                    begin: this.currentPage,
                    size: this.pageSize
                }
            }).then((result) => {
                console.log(result);
                this.totalcount = result.data.data.totalCount
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
}
</style>