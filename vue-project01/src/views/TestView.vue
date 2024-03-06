<!-- <template>
    <div>
      <form @submit.prevent="handleSubmit" enctype="multipart/form-data">
        <div>
          <label for="name">名称：</label>
          <input type="text" id="name" v-model="formData.name" required>
        </div>
  
        <div>
          <label for="email">邮箱：</label>
          <input type="email" id="email" v-model="formData.email" required>
        </div>
  
        <div>
          <label for="file">文件上传：</label>
          <input type="file" id="file" ref="fileInput" @change="handleFileChange">
        </div>
  
        <button type="submit">提交</button>
      </form>
      <p>{{ responseMessage }}</p>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        formData: {
          name: '',
          email: ''
        },
        file: null,
        responseMessage: ''
      };
    },
    methods: {
      handleFileChange(event) {
        this.file = event.target.files[0];
      },
      handleSubmit() {
        const formData = new FormData();
        formData.append('fileUpload', this.file);
        formData.append('name', this.formData.name);
        formData.append('email', this.formData.email);
  
        axios.post('http://localhost:8080/your-backend-endpoint', formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })
          .then(response => {
            this.responseMessage = response.data;
            console.log('文件上传成功');
            // 处理成功逻辑
          })
          .catch(error => {
            this.responseMessage = '文件上传失败';
            console.error('文件上传失败', error);
            // 处理错误逻辑
          });
      },
    },
  };
  </script>
   -->

<template>
    <div>
    
            <el-form :model="formData" label-width="100px" @submit.native.prevent="handleSubmit"
                enctype="multipart/form-data">
                <el-form-item label="歌曲名" prop="name">
                    <el-input v-model="formData.name" required></el-input>
                </el-form-item>
                <el-form-item label="作者" prop="name">
                    <el-input v-model="formData.name" required></el-input>
                </el-form-item>
                <el-form-item label="歌曲类型" prop="name">
                    <el-input v-model="formData.name" placeholder="摇滚/国风/安静/轻音乐/流行..." required></el-input>
                </el-form-item>
                <el-form-item label="图片连接" prop="name">
                    <el-input v-model="formData.name" placeholder="请输入图片链接" required></el-input>
                </el-form-item>
                <el-form-item label="歌曲地址" prop="name">
                    <el-input v-model="formData.name" placeholder="请确保歌曲路径正确，示例 ../music/80.mp3" required></el-input>
                </el-form-item>

                <el-form-item label="邮箱" prop="email">
                    <el-input type="email" v-model="formData.email" required></el-input>
                </el-form-item>

                <el-form-item label="歌曲文件上传">
                    <el-upload ref="upload" :action="'http://localhost:8080/your-backend-endpoint'"
                        :on-success="handleUploadSuccess" :on-error="handleUploadError" :auto-upload="false"
                        name="fileUpload">
                        <el-button slot="trigger" size="small" type="primary">选择文件</el-button>
                        <div slot="tip" class="el-upload__tip">可以上传任意类型的文件</div>
                    </el-upload>
                </el-form-item>

                <el-form-item>
                    <el-button type="primary" native-type="submit">提交</el-button>
                </el-form-item>
            </el-form>
            <p>{{ responseMessage }}</p>
     
    </div>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            formData: {
                name: '',
                email: ''
            },
            responseMessage: ''
        };
    },
    methods: {
        showDialog() {
            this.dialogVisible = true;
        }, 
        handleSubmit() {
            const formData = new FormData();
            formData.append('name', this.formData.name);
            formData.append('email', this.formData.email);
            formData.append('fileUpload', this.$refs.upload.uploadFiles[0].raw);

            axios.post('http://localhost:8080/your-backend-endpoint', formData)
                .then(response => {
                    this.responseMessage = response.data;
                    console.log('文件上传成功');
                    // 处理成功逻辑
                })
                .catch(error => {
                    this.responseMessage = '文件上传失败';
                    console.error('文件上传失败', error);
                    // 处理错误逻辑
                });
        },
        handleUploadSuccess() {
            // 上传成功回调
        },
        handleUploadError() {
            // 上传失败回调
        },
    },
};
</script>
  