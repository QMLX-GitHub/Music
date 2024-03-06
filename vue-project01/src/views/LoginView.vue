<template>
  <el-container style="height: 790px; border: 10px solid #81d8e9">
    <div class="login-container">
      <div class="title">球球音乐ProMax后台管理</div>
      <div class="login">
        <el-form :model="ruleForm" :rules="rules">
          <el-form-item prop="username">
            <el-input v-model="ruleForm.username" placeholder="用户名"></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input type="password" placeholder="密码" v-model="ruleForm.password"></el-input>
          </el-form-item>
          <div class="">
            <el-button type="primary" class="login-btn">
              <router-link to="/index" style="text-decoration: none; color: black;">登录</router-link>
            </el-button>
          </div>
        </el-form>
      </div>
    </div>

  </el-container>
</template>
  
<script>
export default {
  data() {
    return {
      ruleForm: {
        username: "",
        password: ""
      }
    }
  },
  methods: {
    submitForm() {
      alert("成功提交！")
    }
  }

}

</script>
  
<style scoped>
.login-container {
  position: relative;
  background: url("../assets/images/background.jpg");
  background-attachment: fixed;
  background-position: center;
  background-size: cover;
  width: 100%;
  height: 100%;
}

.title {
  position: absolute;
  left:265px;
  top: 50%;
  width: 100%;
  margin-top: -230px;
  text-align: center;
  font-size: 30px;
  font-weight: 600;
  color: #fff;
}

.login {
  position: absolute;
  left: 975px;
  top: 50%;
  width: 300px;
  margin: -150px 0 0 -190px;
  padding: 40px;
  border-radius: 5px;
  background: #fff;
}

.login-btn {
  width: 300px;
  text-decoration: none;

}
</style>
  