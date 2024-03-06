<template>
  <div>
    <h1>文件上传</h1>
    <input type="file" ref="fileInput" @change="handleFileChange">
    <button @click="uploadFile">上传</button>
    <p v-if="uploadStatus">{{ uploadMessage }}</p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      file: null,
      uploadStatus: false,
      uploadMessage: ''
    };
  },
  methods: {
    handleFileChange(event) {
      this.file = event.target.files[0];
    },
    uploadFile() {
      if (this.file) {
        const formData = new FormData();
        formData.append('file', this.file);

        axios.post('http://localhost:8083/upload', formData, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        })
        .then(response => {
          this.uploadStatus = true;
          this.uploadMessage = response.data;
        })
        .catch(error => {
          console.error(error.response);
          this.uploadStatus = true;
          if (error.response) {
            this.uploadMessage = error.response.data;
          } else {
            this.uploadMessage = '文件上传失败！';
          }
        });
      }
    }
  }
}
</script>
