<template>
  <div>
    <!-- {{ message }} -->
    <!-- <element-ui-view></element-ui-view> -->

    <!-- 歌手管理 -->
    <!-- <singer-view></singer-view>  -->

    <!-- 登录管理 -->
   <!--  <login-view></login-view> -->
   <router-view></router-view>
  </div>
</template>

<script>
/* import LoginView from './views/login/LoginView.vue' */
/* import SingerView from './views/singerView.vue'  */
/* import ElementUiView from './views/element/ElementUiView.vue' */
export default{
  components: {/* LoginView */ /* SingerView *//* ElementUiView */ },
  data(){
    return{
      message:"你好 Vue！"
    }
  },methods:{

  }
}
</script>

<style>

</style>
