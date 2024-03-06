/*
 Navicat MySQL Data Transfer

 Source Server         : 001
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : music

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 12/02/2024 17:29:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (3, 'admin', '123456', '管理员');
INSERT INTO `admin` VALUES (4, 'liu', '8o66V4J3dK', '管理员');
INSERT INTO `admin` VALUES (6, 'peng', 'pZaHgcUomD', '管理员');
INSERT INTO `admin` VALUES (7, 'yi', 'nDOYo31UV9', '管理员');
INSERT INTO `admin` VALUES (8, 'shen', 'rDuhX323LU', '管理员');

-- ----------------------------
-- Table structure for save
-- ----------------------------
DROP TABLE IF EXISTS `save`;
CREATE TABLE `save`  (
  `id` int NOT NULL,
  `user_id` int NULL DEFAULT NULL,
  `style` tinyint(1) NULL DEFAULT NULL COMMENT '如果是0代表收藏歌曲，1代表收藏歌单',
  `song_id` int NULL DEFAULT NULL,
  `menu_id` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of save
-- ----------------------------

-- ----------------------------
-- Table structure for singer
-- ----------------------------
DROP TABLE IF EXISTS `singer`;
CREATE TABLE `singer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of singer
-- ----------------------------
INSERT INTO `singer` VALUES (1, '蔡徐坤', '男', 'https://y.qq.com/music/photo_new/T001R150x150M000002nXp292LIOGV.jpg?max_age=2592000', '及你太美', '蔡徐坤（KUN），1998年8月2日出生于浙江省温州市，户籍湖南省吉首市 [137] ，中国内地男歌手、演员、原创音乐制作人 [1] 、MV导演');
INSERT INTO `singer` VALUES (3, '周杰伦', '男', 'https://y.qq.com/music/photo_new/T001R150x150M0000025NhlN2yWrP4.jpg?max_age=2592000', '青花瓷，稻香，夜曲', '周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，祖籍福建省泉州市永春县，中国台湾流行乐男歌手、音乐人、演员、导演、编剧，毕业于淡江中学。');
INSERT INTO `singer` VALUES (4, '邓紫棋', '女', 'https://y.qq.com/music/photo_new/T001R150x150M000001fNHEf1SFEFN.jpg?max_age=2592000', '光年之外', '香港女歌手\n邓紫棋（G.E.M.），本名邓诗颖，1991年8月16日出生于上海市，中国香港女歌手、词曲作者、音乐制作人。2008年，发行首张录音室EP《G.E.M.》。2011年，成为首位登上香港体育馆开唱的90后女歌手。2013年，凭借专辑《Xposed》入围第24届台湾金曲奖“最佳国语女歌手奖”，并获得IFPI香港唱片销量大奖“全年最高销量女歌手奖”。');
INSERT INTO `singer` VALUES (5, '刘德华', '男', 'https://y.qq.com/music/photo_new/T001R150x150M000003aQYLo2x8izP.jpg?max_age=2592000', '忘情水，冰雨，17岁', '刘德华（Andy Lau），1961年9月27日出生于香港新界大埔镇泰亨村，华语影视男演员、歌手、制片人、作词人。');
INSERT INTO `singer` VALUES (6, '张学友', '男', 'https://y.qq.com/music/photo_new/T001R150x150M000004Be55m1SJaLk.jpg?max_age=2592000', '吻别，遥远的她，如果这都不算爱', '张学友（Jacky Cheung），1961年7月10日出生于香港，中国香港流行乐男歌手、影视演员、作曲人，毕业于香港崇文英文书院。');
INSERT INTO `singer` VALUES (7, '毛不易', '男', 'https://y.qq.com/music/photo_new/T001R150x150M000001BHDR33FZVZ0.jpg?max_age=2592000', '消愁，像我这样的人，牧马城市', '毛不易，本名王维家，1994年10月1日出生于黑龙江省齐齐哈尔市泰来县，中国内地流行乐男歌手，毕业于杭州师范大学护理专业。2017年，参加腾讯视频选秀娱乐节目《明日之子》，获得全国总决赛冠军，从而正式进入演艺圈');
INSERT INTO `singer` VALUES (8, '陈奕迅', '男', 'https://y.qq.com/music/photo_new/T001R150x150M000003Nz2So3XXYek.jpg?max_age=2592000', '富士山下，单车，浮夸，十年，孤勇者', '陈奕迅（Eason Chan），1974年7月27日出生于中国香港，祖籍广东省东莞市 [1] ，华语流行乐男歌手、影视演员、作曲人，英国金斯顿大学荣誉博士学位 [127');
INSERT INTO `singer` VALUES (9, '李荣浩', '男', 'https://y.qq.com/music/photo_new/T001R150x150M000000aHmbL2aPXWH.jpg?max_age=2592000', '麻雀,老街，李白', '李荣浩（Ronghao Li），1985年7月11日出生于安徽省蚌埠市，中国内地流行乐男歌手、音乐人、吉他手、演员');
INSERT INTO `singer` VALUES (10, '薛之谦', '男', 'https://y.qq.com/music/photo_new/T002R300x300M000000QgFcm0v8WaF_1.jpg?max_age=2592000', '丑八怪，演员', '薛之谦（Joker Xue），1983年7月17日出生于上海市，中国内地流行乐男歌手、音乐制作人、影视演员，毕业于格里昂酒店管理学院。');
INSERT INTO `singer` VALUES (11, 'Taylor', '女', 'https://y.qq.com/music/photo_new/T002R300x300M000001AyGiX14GTxQ.jpg?max_age=2592000', '，Love Story', '泰勒·斯威夫特（Taylor Swift），1989年12月13日出生于美国宾夕法尼亚州，美国女歌手、词曲作者、音乐制作人、演员。');
INSERT INTO `singer` VALUES (12, '王力宏', '男', 'https://y.qq.com/music/photo_new/T001R300x300M000001JDzPT3JdvqK_4.jpg?max_age=2592000', '代表作品：《唯一》、《大城小爱》、《我们的歌》、《龙的传人》、《你不知道的事》、《恋爱通告》', '王力宏（Wang Leehom），1976年5月17日出生于美国纽约罗切斯特，祖籍中国浙江义乌，华语流行乐男歌手、音乐制作人、演员、导演，拥有威廉姆斯大学和伯克利音乐学院双荣誉博士的学历。');
INSERT INTO `singer` VALUES (13, '王菲', '女', 'https://y.qq.com/music/photo_new/T001R300x300M000000GDDuQ3sGQiT_2.jpg?max_age=2592000', '《天空》、《红豆》、《流年》、《催眠》、《容易受伤的女人》、《执迷不悔》、《我愿意》、《致青春》、《爱不可及》、《匆匆那年》', '：王菲（Faye Wong），1969年8月8日出生于北京，中国流行乐女歌手、影视演员，中国国家一级演员。');
INSERT INTO `singer` VALUES (14, '林俊杰', '男', 'https://y.qq.com/music/photo_new/T001R300x300M000001BLpXF2DyJe2_13.jpg?max_age=2592000', '《江南》、《曹操》、《发现爱》、《编号89757》等', '林俊杰（JJ Lin），1981年3月27日出生于新加坡，祖籍中国福建省厦门市同安区，华语流行乐男歌手、音乐人、潮牌主理人。');
INSERT INTO `singer` VALUES (15, '张杰', '男', 'https://y.qq.com/music/photo_new/T001R300x300M000002azErJ0UcDN6_2.jpg?max_age=2592000', '《这，就是爱》、《勿忘心安》、《我们都一样》、《明天过后》', '张杰（Jason Zhang），1982年12月20日出生于四川省成都市，中国流行男歌手。');
INSERT INTO `singer` VALUES (16, 'Beyond', '男', 'https://y.qq.com/music/photo_new/T001R300x300M000002pUZT93gF4Cu_3.jpg?max_age=2592000', '《海阔天空》、《光辉岁月》、《真的爱你》、《大地》、《冷雨夜》、《不再犹豫》、《情人》、《谁伴我闯荡》', 'Beyond，中国香港摇滚乐队，由黄家驹、黄贯中、黄家强、叶世荣组成。\r\n\r\n1983年Beyond成立，同年参加“山叶吉他比赛”获得冠军并正式出道。');
INSERT INTO `singer` VALUES (17, '汪苏泷', '男', 'https://y.qq.com/music/photo_new/T001R300x300M000001z2JmX09LLgL_5.jpg?max_age=2592000', '《年轮》、《一笑倾城》、《那个男孩》、《银河》、《小星星》、《有点甜》、《不分手的恋爱》、《风度》、《无名之辈》', '汪苏泷（Silence），毕业于沈阳音乐学院作曲系，中国内地男唱作歌手、音乐人。');
INSERT INTO `singer` VALUES (18, '许嵩', '男', 'https://y.qq.com/music/photo_new/T001R300x300M000000CK5xN3yZDJt_2.jpg?max_age=2592000', '《自定义》、《寻雾启示》、《苏格拉没有底》、《梦游计》', '许嵩（Vae），1986年5月14日生于安徽省合肥市，中国内地创作型男歌手，毕业于安徽医科大学。');
INSERT INTO `singer` VALUES (19, '五月天', '男', 'https://y.qq.com/music/photo_new/T001R300x300M000000Sp0Bz4JXH0o_4.jpg?max_age=2592000', '《志明与春娇》、《爱情万岁》、《温柔》、《倔强》、《知足》、《离开地球表面》、《后青春期的诗》、《第二人生》、《后来的我们》', '五月天，台湾摇滚乐团，由乐队团长兼吉他手怪兽（温尚翊）、主唱阿信（陈信宏）、吉他手石头（石锦航）、贝斯玛莎（蔡升晏）和鼓手冠佑（刘谚明）组成，前身为“So Band”乐团，在1997年3月29日更名为“五月天”。');
INSERT INTO `singer` VALUES (20, '陆通', '男', 'https://y.qq.com/music/photo_new/T001R300x300M000000PSwBY0IuWb1_2.jpg?max_age=2592000', '《she taught me how to yodel》电影《西虹市首富》插曲《膨胀》', '：星座：天枰座，出生地：河北唐山 \r\n\r\n中国约德尔唱法第一人  。');

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `songname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES (1, '群星', 'http://img1.ali213.net/glpic/2022/12/12/584_2022121255651577.png', '0:11', '说唱', '../music/nn.mp3', '那年我双手插兜');
INSERT INTO `song` VALUES (2, '周杰伦', 'https://y.qq.com/music/photo_new/T001R500x500M0000025NhlN2yWrP4.jpg?max_age=2592000', '4:26', '流行', '../music/2.mp3', '我是如此相信');
INSERT INTO `song` VALUES (4, '周杰伦', 'https://img1.baidu.com/it/u=3713962987,2367603707&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=658', '3:43', '说唱', '../music/3.mp3', '稻香');
INSERT INTO `song` VALUES (5, '周杰伦', 'https://img2.baidu.com/it/u=3515918320,4106870013&fm=253&fmt=auto&app=138&f=JPEG?w=535&h=500', '4:23', '流行', '../music/4.mp3', '花海');
INSERT INTO `song` VALUES (6, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '4:14', '国风', '../music/5.mp3', '兰亭序');
INSERT INTO `song` VALUES (7, '周杰伦', 'https://img2.baidu.com/it/u=1699912245,2657907343&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', '4:20', '安静', '../music/6.mp3', '明明就');
INSERT INTO `song` VALUES (8, '周杰伦', 'https://img2.baidu.com/it/u=1495545044,4176718450&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889', '4:07', '轻音乐', '../music/7.mp3', '蒲公英的约定');
INSERT INTO `song` VALUES (9, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '4:59', '摇滚', '../music/8.mp3', '七里香');
INSERT INTO `song` VALUES (10, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '4:28', '流行', '../music/9.mp3', '晴天');
INSERT INTO `song` VALUES (11, '周杰伦', 'https://img0.baidu.com/it/u=788704220,2349783157&fm=253&fmt=auto&app=138&f=JPEG?w=346&h=500', '4:16', '流行', '../music/10.mp3', '说好的幸福呢');
INSERT INTO `song` VALUES (12, '周杰伦', 'https://img2.baidu.com/it/u=953445583,2886335803&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=749', '4:17', '轻音乐', '../music/11.mp3', '我落泪情绪飘零');
INSERT INTO `song` VALUES (13, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '3:46', '安静', '../music/12.mp3', '夜曲');
INSERT INTO `song` VALUES (14, '薛之谦', 'https://y.qq.com/music/photo_new/T002R300x300M000000QgFcm0v8WaF_1.jpg?max_age=2592000', '4:55', '安静', '../music/13.mp3', '崇拜');
INSERT INTO `song` VALUES (15, '薛之谦', 'https://img1.baidu.com/it/u=465209625,1554665801&fm=253&fmt=auto&app=120&f=JPEG?w=889&h=500', '4:10', '流行', '../music/14.mp3', '刚刚好');
INSERT INTO `song` VALUES (16, '薛之谦', 'https://img2.baidu.com/it/u=2391239281,4230063458&fm=253&fmt=auto&app=138&f=JPEG?w=200&h=200', '4:28', '轻音乐', '../music/15.mp3', '那是你离开了北京的生活');
INSERT INTO `song` VALUES (17, '薛之谦', 'https://img0.baidu.com/it/u=306917877,3228079674&fm=253&fmt=auto&app=138&f=JPEG?w=200&h=200', '4:02', '流行', '../music/16.mp3', '其实');
INSERT INTO `song` VALUES (18, '薛之谦', 'https://img2.baidu.com/it/u=3622045754,2219208923&fm=253&fmt=auto&app=138&f=JPEG?w=200&h=200', '4:21', '国风', '../music/17.mp3', '认真的雪');
INSERT INTO `song` VALUES (19, '薛之谦', 'https://img0.baidu.com/it/u=361411962,2658151593&fm=253&fmt=auto&app=138&f=JPEG?w=139&h=220', '4:51', '说唱', '../music/18.mp3', '绅士');
INSERT INTO `song` VALUES (20, '薛之谦', 'https://img2.baidu.com/it/u=3401154174,318383721&fm=253&fmt=auto&app=138&f=JPEG?w=200&h=200', '4:17', '流行', '../music/19.mp3', '天外来物');
INSERT INTO `song` VALUES (21, '薛之谦', 'https://img0.baidu.com/it/u=2480446987,2799517862&fm=253&fmt=auto&app=138&f=JPEG?w=215&h=185', '4:15', '流行', '../music/20.mp3', '像风一样');
INSERT INTO `song` VALUES (22, '薛之谦', 'https://img0.baidu.com/it/u=171078196,549557540&fm=253&fmt=auto&app=138&f=JPEG?w=165&h=220', '4:21', '轻音乐', '../music/21.mp3', '演员');
INSERT INTO `song` VALUES (23, '薛之谦', 'https://img1.baidu.com/it/u=2099829988,966077851&fm=253&fmt=auto&app=138&f=JPG?w=200&h=200', '4:51', '摇滚', '../music/22.mp3', '意外');
INSERT INTO `song` VALUES (24, '邓紫棋', 'https://y.qq.com/music/photo_new/T002R300x300M000003c616O2Zlswm_1.jpg?max_age=2592000', '3:37', '说唱', '../music/24.mp3', '多远都要在一起');
INSERT INTO `song` VALUES (25, '邓紫棋', 'https://img2.baidu.com/it/u=4144858841,2385123839&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=899', '3:55', '流行', '../music/25.mp3', '光年之外');
INSERT INTO `song` VALUES (26, '邓紫棋', 'https://img0.baidu.com/it/u=3723966433,974303197&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=621', '4:05', '摇滚', '../music/26.mp3', '来自天堂的魔鬼');
INSERT INTO `song` VALUES (27, '邓紫棋', 'https://img2.baidu.com/it/u=3396690699,4149833795&fm=253&fmt=auto&app=138&f=JPEG?w=375&h=500', '4:08', '流行', '../music/27.mp3', '龙卷风');
INSERT INTO `song` VALUES (28, '邓紫棋', 'https://img1.baidu.com/it/u=2908757393,1900258333&fm=253&fmt=auto&app=120&f=JPEG?w=1200&h=800', '4:18', '说唱', '../music/28.mp3', '泡沫');
INSERT INTO `song` VALUES (29, '邓紫棋', 'https://img0.baidu.com/it/u=2017778279,558912854&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', '3:39', '国风', '../music/29.mp3', '桃花诺');
INSERT INTO `song` VALUES (30, '邓紫棋', 'https://img0.baidu.com/it/u=3852464407,1163464129&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', '4:12', '安静', '../music/30.mp3', '我的秘密');
INSERT INTO `song` VALUES (31, '邓紫棋', 'https://img1.baidu.com/it/u=3314943215,313549244&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', '3:59', '流行', '../music/31.mp3', '喜欢你');
INSERT INTO `song` VALUES (32, '邓紫棋', 'https://img2.baidu.com/it/u=2784941193,2048889581&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750', '3:26', '安静', '../music/32.mp3', '再见');
INSERT INTO `song` VALUES (33, 'Taylor', 'https://y.qq.com/music/photo_new/T002R300x300M000001AyGiX14GTxQ.jpg?max_age=2592000', '3:51', '流行', '../music/33.mp3', 'Blank Space');
INSERT INTO `song` VALUES (34, 'Taylor', 'https://img1.baidu.com/it/u=1457810927,250778592&fm=253&fmt=auto&app=138&f=JPEG?w=312&h=499', '2:58', '摇滚', '../music/34.mp3', 'Cruel Summer');
INSERT INTO `song` VALUES (35, 'Taylor', 'https://img2.baidu.com/it/u=4085971290,344273773&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=625', '3:24', '说唱', '../music/35.mp3', 'Karma');
INSERT INTO `song` VALUES (36, 'Taylor', 'https://img2.baidu.com/it/u=4096091353,3744993600&fm=253&fmt=auto&app=138&f=JPEG?w=1000&h=500', '3:31', '流行', '../music/36.mp3', 'Look What You Made Me Do');
INSERT INTO `song` VALUES (37, 'Taylor', 'https://y.qq.com/music/photo_new/T002R300x300M000001AyGiX14GTxQ.jpg?max_age=2592000', '3:56', '说唱', '../music/37.mp3', 'Love Story');
INSERT INTO `song` VALUES (38, 'Taylor', 'https://img0.baidu.com/it/u=141572026,2480367463&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=698', '3:41', '流行', '../music/38.mp3', 'Lover');
INSERT INTO `song` VALUES (39, 'Taylor', 'https://img2.baidu.com/it/u=4161198467,2276592554&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=623', '3:51', '摇滚', '../music/39.mp3', 'Style');
INSERT INTO `song` VALUES (40, 'Taylor', 'https://img1.baidu.com/it/u=4161866978,2742425847&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=661', '3:32', '流行', '../music/40.mp3', 'Welcome To New York');
INSERT INTO `song` VALUES (41, 'Taylor', 'https://img1.baidu.com/it/u=3431196804,1243021314&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', '3:52', '安静', '../music/41.mp3', 'You Belong With Me');
INSERT INTO `song` VALUES (42, 'Taylor', 'https://img0.baidu.com/it/u=583340327,3208506076&fm=253&fmt=auto&app=138&f=JPEG?w=524&h=500', '4:45', '说唱', '../music/42.mp3', 'exile');
INSERT INTO `song` VALUES (44, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '5:34', '说唱', '../music/43.mp3', '安静');
INSERT INTO `song` VALUES (45, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '4:31', '流行', '../music/44.mp3', '暗号');
INSERT INTO `song` VALUES (46, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '4:23', '国风', '../music/45.mp3', '彩虹');
INSERT INTO `song` VALUES (47, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '4:13', '安静', '../music/46.mp3', '给我一首歌的时间');
INSERT INTO `song` VALUES (48, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '4:38', '轻音乐', '../music/47.mp3', '霍元甲');
INSERT INTO `song` VALUES (49, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '4:31', '摇滚', '../music/48.mp3', '简单爱');
INSERT INTO `song` VALUES (50, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '4:42', '流行', '../music/49.mp3', '说了再见');
INSERT INTO `song` VALUES (51, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '4:25', '流行', '../music/50.mp3', '听妈妈的话');
INSERT INTO `song` VALUES (52, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '4:48', '轻音乐', '../music/51.mp3', '我不配');
INSERT INTO `song` VALUES (53, '周杰伦', 'https://y.qq.com/music/photo_new/T002R300x300M000002Neh8l0uciQZ_1.jpg?max_age=2592000', '5:19', '安静', '../music/52.mp3', '半岛铁盒');
INSERT INTO `song` VALUES (54, '薛之谦', 'https://img0.baidu.com/it/u=2591937151,1350920026&fm=253&fmt=auto&app=138&f=JPEG?w=165&h=220', '5:12', '安静', '../music/53.mp3', '暧昧');
INSERT INTO `song` VALUES (55, '薛之谦', 'https://img1.baidu.com/it/u=1494800882,2765583095&fm=253&fmt=auto?w=200&h=200', '4:39', '流行', '../music/54.mp3', '变废为宝');
INSERT INTO `song` VALUES (56, '薛之谦', 'https://img2.baidu.com/it/u=1600321035,2478557614&fm=253&fmt=auto&app=138&f=JPEG?w=158&h=208', '4:08', '轻音乐', '../music/55.mp3', '丑八怪');
INSERT INTO `song` VALUES (57, '薛之谦', 'https://img1.baidu.com/it/u=1625527908,1064277161&fm=253&fmt=auto&app=138&f=JPEG?w=200&h=200', '3:50', '流行', '../music/56.mp3', '动物世界');
INSERT INTO `song` VALUES (58, '薛之谦', 'https://img2.baidu.com/it/u=2644281693,1729846061&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667', '4:10', '国风', '../music/57.mp3', '怪咖');
INSERT INTO `song` VALUES (59, '薛之谦', 'https://img2.baidu.com/it/u=399854823,851320807&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667', '4:01', '说唱', '../music/58.mp3', '慢半拍');
INSERT INTO `song` VALUES (60, '薛之谦', 'https://img2.baidu.com/it/u=3130970652,1887977663&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=659', '5:10', '流行', '../music/59.mp3', '你还要我怎样');
INSERT INTO `song` VALUES (61, '薛之谦', 'https://img2.baidu.com/it/u=116513736,170904247&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889', '5:36', '流行', '../music/60.mp3', '违背的青春');
INSERT INTO `song` VALUES (62, '薛之谦', 'https://img2.baidu.com/it/u=3062201727,1858888366&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', '5:05', '轻音乐', '../music/61.mp3', '下雨了');
INSERT INTO `song` VALUES (63, '薛之谦', 'https://img0.baidu.com/it/u=2908510963,3401378065&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500', '4:46', '摇滚', '../music/62.mp3', '一半');
INSERT INTO `song` VALUES (64, '邓紫棋', 'https://img2.baidu.com/it/u=1265274883,2307298775&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=625', '3:50', '流行', '../music/63.mp3', '孤独');
INSERT INTO `song` VALUES (65, '邓紫棋', 'https://img2.baidu.com/it/u=1538878290,3510498811&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750', '3:43', '说唱', '../music/64.mp3', '后会无期');
INSERT INTO `song` VALUES (66, '邓紫棋', 'https://img0.baidu.com/it/u=3003621592,2878054511&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667', '3:53', '流行', '../music/65.mp3', '回忆的沙漏');
INSERT INTO `song` VALUES (67, '邓紫棋', 'https://img0.baidu.com/it/u=2949665454,83134672&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=749', '4:30', '摇滚', '../music/66.mp3', '摩天动物园');
INSERT INTO `song` VALUES (68, '邓紫棋', 'https://img2.baidu.com/it/u=381806733,1414743948&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667', '4:45', '流行', '../music/67.mp3', '你把我灌醉');
INSERT INTO `song` VALUES (69, '邓紫棋', 'https://img2.baidu.com/it/u=4090701472,4210760105&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889', '3:20', '说错', '../music/68.mp3', '你不是第一个离开的人');
INSERT INTO `song` VALUES (70, '邓紫棋', 'https://img2.baidu.com/it/u=2123645532,233802941&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=333', '5:11', '国风', '../music/69.mp3', '你不是真正的快乐');
INSERT INTO `song` VALUES (71, '邓紫棋', 'https://img2.baidu.com/it/u=1583122642,4075774976&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800', '4:39', '安静', '../music/70.mp3', '天空没有极限');
INSERT INTO `song` VALUES (72, '邓紫棋', 'https://img1.baidu.com/it/u=2916957602,4250595058&fm=253&fmt=auto&app=138&f=JPEG?w=333&h=500', '3:37', '流行', '../music/71.mp3', '透明');
INSERT INTO `song` VALUES (73, '邓紫棋', 'https://img0.baidu.com/it/u=4028147215,2591841896&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750', '3:36', '安静', '../music/72.mp3', '新的心跳');
INSERT INTO `song` VALUES (74, 'Taylor', 'https://img1.baidu.com/it/u=1257106882,3645863589&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=672', '4:21', '流行', '../music/73.mp3', 'august');
INSERT INTO `song` VALUES (75, 'Taylor', 'https://img1.baidu.com/it/u=3938706708,698251411&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667', '5:53', '摇滚', '../music/74.mp3', 'Enchanted');
INSERT INTO `song` VALUES (76, 'Taylor', 'https://img2.baidu.com/it/u=2674982425,464745882&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=604', '3:49', '说唱', '../music/75.mp3', 'Gorgeous');
INSERT INTO `song` VALUES (77, 'Taylor', 'https://img1.baidu.com/it/u=4019256319,2702013887&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=563', '3:29', '流行', '../music/76.mp3', 'Last Christmas');
INSERT INTO `song` VALUES (78, 'Taylor', 'https://img0.baidu.com/it/u=555070741,2822080329&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', '3:10', '说唱', '../music/77.mp3', 'London Boy');
INSERT INTO `song` VALUES (79, 'Taylor', 'https://img0.baidu.com/it/u=242095838,2421280680&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', '3:50', '流行', '../music/78.mp3', 'New Romantics');
INSERT INTO `song` VALUES (80, 'Taylor', 'https://img1.baidu.com/it/u=3314529517,695264289&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=549', '3:43', '摇滚', '../music/79.mp3', 'Red');
INSERT INTO `song` VALUES (81, 'Taylor', 'https://y.qq.com/music/photo_new/T002R300x300M000001AyGiX14GTxQ.jpg?max_age=2592000', '3:39', '流行', '../music/80.mp3', 'Shake It Off');
INSERT INTO `song` VALUES (82, 'Taylor', 'https://img1.baidu.com/it/u=1704079506,1522653178&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750', '4:22', '安静', '../music/81.mp3', 'Sparks Fly');
INSERT INTO `song` VALUES (83, 'Taylor', 'https://img0.baidu.com/it/u=3180568854,638123433&fm=253&fmt=auto&app=120&f=JPEG?w=798&h=500', '3:34', '说唱', '../music/82.mp3', 'willow');
INSERT INTO `song` VALUES (84, '蔡徐坤', 'https://img0.baidu.com/it/u=3970852321,844430684&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=654', '2:30', '说唱', '../music/83.mp3', 'Hug me');
INSERT INTO `song` VALUES (85, '蔡徐坤', 'https://img2.baidu.com/it/u=89766439,3789704026&fm=253&fmt=auto&app=138&f=JPEG?w=281&h=500', '3:26', '摇滚', '../music/84.mp3', 'wait wait wait');
INSERT INTO `song` VALUES (86, '蔡徐坤', 'https://img2.baidu.com/it/u=3324610714,3363518549&fm=253&fmt=auto&app=138&f=JPEG?w=333&h=500', '3:45', '安静', '../music/85.mp3', 'YOUNG');
INSERT INTO `song` VALUES (87, '蔡徐坤', 'https://y.qq.com/music/photo_new/T001R150x150M000002nXp292LIOGV.jpg?max_age=2592000', '3:47', '流行', '../music/86.mp3', '迷');
INSERT INTO `song` VALUES (88, '蔡徐坤', 'https://img2.baidu.com/it/u=1585284959,29403329&fm=253&fmt=auto&app=138&f=PNG?w=333&h=500', '3:15', '流行', '../music/87.mp3', '情人');
INSERT INTO `song` VALUES (89, '陈奕迅', 'https://y.qq.com/music/photo_new/T002R300x300M000004S8YQr3UmEbG_1.jpg?max_age=2592000', '4:15', '轻音乐', '../music/88.mp3', '爱情转移');
INSERT INTO `song` VALUES (90, '陈奕迅', 'https://img2.baidu.com/it/u=4002490397,581580513&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=635', '3:31', '流行', '../music/89.mp3', '单车');
INSERT INTO `song` VALUES (91, '陈奕迅', 'https://img0.baidu.com/it/u=3105070657,3924594195&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=723', '4:43', '摇滚', '../music/90.mp3', '浮夸');
INSERT INTO `song` VALUES (92, '陈奕迅', 'https://img2.baidu.com/it/u=1446130876,3660844097&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=757', '4:16', '说唱', '../music/91.mp3', '孤勇者');
INSERT INTO `song` VALUES (93, '陈奕迅', 'https://img1.baidu.com/it/u=2331366012,4167884717&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750', '3:25', '流行', '../music/92.mp3', '十年');
INSERT INTO `song` VALUES (94, '李荣浩', 'https://y.qq.com/music/photo_new/T002R300x300M000002PwL9x3TiVdh_1.jpg?max_age=2592000', '4:53', '流行', '../music/93.mp3', '戒烟');
INSERT INTO `song` VALUES (95, '李荣浩', 'https://img2.baidu.com/it/u=3420860434,1187313529&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750', '5:18', '流行', '../music/94.mp3', '老街');
INSERT INTO `song` VALUES (96, '李荣浩', 'https://img0.baidu.com/it/u=1554711964,327631740&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750', '4:33', '流行', '../music/95.mp3', '李白');
INSERT INTO `song` VALUES (97, '李荣浩', 'https://img1.baidu.com/it/u=4183729863,2851726878&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=751', '4:12', '流行', '../music/96.mp3', '麻雀');
INSERT INTO `song` VALUES (98, '李荣浩', 'https://img0.baidu.com/it/u=2137551777,561539560&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=653', '5:06', '流行', '../music/97.mp3', '模特');
INSERT INTO `song` VALUES (99, '刘德华', 'https://y.qq.com/music/photo_new/T002R300x300M000003I6tYD3eGhER_2.jpg?max_age=2592000', '4:02', '流行', '../music/98.mp3', '17岁');
INSERT INTO `song` VALUES (100, '刘德华', 'https://img0.baidu.com/it/u=1909849556,1327057036&fm=253&fmt=auto&app=138&f=JPEG?w=1000&h=500', '3:50', '流行', '../music/99.mp3', '暗里着迷');
INSERT INTO `song` VALUES (101, '刘德华', 'https://img0.baidu.com/it/u=1585252072,944170332&fm=253&fmt=auto&app=138&f=JPEG?w=612&h=500', '3:48', '流行', '../music/100.mp3', '今天');
INSERT INTO `song` VALUES (102, '刘德华', 'https://img1.baidu.com/it/u=2479656168,2558995948&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500', '4:24', '流行', '../music/101.mp3', '忘情水');
INSERT INTO `song` VALUES (103, '刘德华', 'https://img0.baidu.com/it/u=3471143351,4292100215&fm=253&fmt=auto&app=120&f=BMP?w=500&h=520', '3:55', '流行', '../music/102.mp3', '一起走过的日子');
INSERT INTO `song` VALUES (104, '张学友', 'https://y.qq.com/music/photo_new/T002R300x300M000003UzYQV2CrUc4_2.jpg?max_age=2592000', '5:10', '流行', '../music/103.mp3', '回头太难');
INSERT INTO `song` VALUES (105, '张学友', 'https://img0.baidu.com/it/u=1169029231,2170572022&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500', '4:43', '流行', '../music/104.mp3', '慢慢');
INSERT INTO `song` VALUES (106, '张学友', 'https://img1.baidu.com/it/u=827836531,240632349&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=554', '4:04', '流行', '../music/105.mp3', '情书');
INSERT INTO `song` VALUES (107, '张学友', 'https://img2.baidu.com/it/u=3816163357,4210457363&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500', '5:06', '流行', '../music/106.mp3', '吻别');
INSERT INTO `song` VALUES (108, '张学友', 'https://img2.baidu.com/it/u=3064748153,2787307345&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=500', '5:05', '流行', '../music/107.mp3', '夕阳醉了');
INSERT INTO `song` VALUES (109, 'Beyond', 'https://y.qq.com/music/photo_new/T002R300x300M000002qcJuX3lO3EZ_1.jpg?max_age=2592000', '4:12', '流行', '../music/108.mp3', '不再犹豫');
INSERT INTO `song` VALUES (110, 'Beyond', 'https://img0.baidu.com/it/u=3126888681,3876754675&fm=253&fmt=auto&app=120&f=JPEG?w=1067&h=800', '4:21', '流行', '../music/109.mp3', '大地');
INSERT INTO `song` VALUES (111, 'Beyond', 'https://img1.baidu.com/it/u=344609052,329629217&fm=253&fmt=auto&app=120&f=JPEG?w=1278&h=800', '4:58', '流行', '../music/110.mp3', '光辉岁月');
INSERT INTO `song` VALUES (112, 'Beyond', 'https://y.qq.com/music/photo_new/T002R300x300M000002qcJuX3lO3EZ_1.jpg?max_age=2592000', '5:26', '流行', '../music/111.mp3', '海阔天空');
INSERT INTO `song` VALUES (113, 'Beyond', 'https://img1.baidu.com/it/u=166558203,1498127541&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889', '4:35', '流行', '../music/112.mp3', '真的爱你');
INSERT INTO `song` VALUES (114, '林俊杰', 'https://y.qq.com/music/photo_new/T002R300x300M0000033R2xQ2I0Uyf_2.jpg?max_age=2592000', '3:45', '流行', '../music/113.mp3', 'Always Online');
INSERT INTO `song` VALUES (115, '林俊杰', 'https://y.qq.com/music/photo_new/T002R300x300M0000033R2xQ2I0Uyf_2.jpg?max_age=2592000', '4:28', '民谣', '../music/114.mp3', '江南');
INSERT INTO `song` VALUES (116, '林俊杰', 'https://y.qq.com/music/photo_new/T002R300x300M0000033R2xQ2I0Uyf_2.jpg?max_age=2592000', '4:58', '说唱', '../music/115.mp3', '可惜没如果');
INSERT INTO `song` VALUES (117, '林俊杰', 'https://y.qq.com/music/photo_new/T002R300x300M0000033R2xQ2I0Uyf_2.jpg?max_age=2592000', '5:20', '安静', '../music/116.mp3', '她说');
INSERT INTO `song` VALUES (118, '林俊杰', 'https://y.qq.com/music/photo_new/T002R300x300M0000033R2xQ2I0Uyf_2.jpg?max_age=2592000', '4:47', '说唱', '../music/117.mp3', '修炼爱情');
INSERT INTO `song` VALUES (119, '汪苏泷', 'https://y.qq.com/music/photo_new/T002R300x300M000004NXLBx4K0r87_1.jpg?max_age=2592000', '3:25', '国风', '../music/118.mp3', '不分手的恋爱');
INSERT INTO `song` VALUES (120, '汪苏泷', 'https://y.qq.com/music/photo_new/T002R300x300M000004NXLBx4K0r87_1.jpg?max_age=2592000', '4:29', '安静', '../music/119.mp3', '耿');
INSERT INTO `song` VALUES (121, '汪苏泷', 'https://y.qq.com/music/photo_new/T002R300x300M000004NXLBx4K0r87_1.jpg?max_age=2592000', '3:44', '摇滚', '../music/120.mp3', '我想念');
INSERT INTO `song` VALUES (122, '汪苏泷', 'https://y.qq.com/music/photo_new/T002R300x300M000004NXLBx4K0r87_1.jpg?max_age=2592000', '3:55', '轻音乐', '../music/121.mp3', '有点甜');
INSERT INTO `song` VALUES (123, '汪苏泷', 'https://y.qq.com/music/photo_new/T002R300x300M000004NXLBx4K0r87_1.jpg?max_age=2592000', '3:26', '流行', '../music/122.mp3', '后会无期');
INSERT INTO `song` VALUES (124, '五月天', 'https://y.qq.com/music/photo_new/T002R300x300M000002fRO0N4FftzY_1.jpg?max_age=2592000', '4:33', '说唱', '../music/123.mp3', '步步');
INSERT INTO `song` VALUES (125, '五月天', 'https://y.qq.com/music/photo_new/T002R300x300M000002fRO0N4FftzY_1.jpg?max_age=2592000', '5:46', '安静', '../music/124.mp3', '后来的我们');
INSERT INTO `song` VALUES (126, '五月天', 'https://y.qq.com/music/photo_new/T002R300x300M000002fRO0N4FftzY_1.jpg?max_age=2592000', '4:25', '流行', '../music/125.mp3', '突然好想你');
INSERT INTO `song` VALUES (127, '五月天', 'https://y.qq.com/music/photo_new/T002R300x300M000002fRO0N4FftzY_1.jpg?max_age=2592000', '4:16', '民谣', '../music/126.mp3', '知足');
INSERT INTO `song` VALUES (128, '五月天', 'https://y.qq.com/music/photo_new/T002R300x300M000002fRO0N4FftzY_1.jpg?max_age=2592000', '3:46', '国风', '../music/127.mp3', '私奔到月球');
INSERT INTO `song` VALUES (129, '许嵩', 'https://y.qq.com/music/photo_new/T002R300x300M000002KSDg90IaScI_2.jpg?max_age=2592000', '4:37', '说唱', '../music/128.mp3', '多余的解释');
INSERT INTO `song` VALUES (130, '许嵩', 'https://y.qq.com/music/photo_new/T002R300x300M000002KSDg90IaScI_2.jpg?max_age=2592000', '4:20', '安静', '../music/129.mp3', '玫瑰花的葬礼');
INSERT INTO `song` VALUES (131, '许嵩', 'https://y.qq.com/music/photo_new/T002R300x300M000002KSDg90IaScI_2.jpg?max_age=2592000', '4:09', '说唱', '../music/130.mp3', '雅俗共赏');
INSERT INTO `song` VALUES (132, '许嵩', 'https://y.qq.com/music/photo_new/T002R300x300M000002KSDg90IaScI_2.jpg?max_age=2592000', '401', '流行', '../music/131.mp3', '有何不可');
INSERT INTO `song` VALUES (133, '许嵩', 'https://y.qq.com/music/photo_new/T002R300x300M000002KSDg90IaScI_2.jpg?max_age=2592000', '3:58', '乡村', '../music/132.mp3', '素颜');
INSERT INTO `song` VALUES (134, '王菲', 'https://y.qq.com/music/photo_new/T002R300x300M000001gn7g54ZEIKb_3.jpg?max_age=2592000', '4:56', '安静', '../music/133.mp3', '传奇');
INSERT INTO `song` VALUES (135, '王菲', 'https://y.qq.com/music/photo_new/T002R300x300M000001gn7g54ZEIKb_3.jpg?max_age=2592000', '4:00', '流行', '../music/134.mp3', '匆匆那年');
INSERT INTO `song` VALUES (136, '王菲', 'https://y.qq.com/music/photo_new/T002R300x300M000001gn7g54ZEIKb_3.jpg?max_age=2592000', '4:16', '民谣', '../music/135.mp3', '红豆');
INSERT INTO `song` VALUES (137, '王菲', 'https://y.qq.com/music/photo_new/T002R300x300M000001gn7g54ZEIKb_3.jpg?max_age=2592000', '4:25', '流行', '../music/136.mp3', '如愿');
INSERT INTO `song` VALUES (138, '王菲', 'https://y.qq.com/music/photo_new/T002R300x300M000001gn7g54ZEIKb_3.jpg?max_age=2592000', '3:36', '安静', '../music/137.mp3', '因为爱情');
INSERT INTO `song` VALUES (139, '王力宏', 'https://y.qq.com/music/photo_new/T002R300x300M000001a0Dts37jw2M_1.jpg?max_age=2592000', '3:44', '说唱', '../music/138.mp3', '大城小爱');
INSERT INTO `song` VALUES (140, '王力宏', 'https://y.qq.com/music/photo_new/T002R300x300M000001a0Dts37jw2M_1.jpg?max_age=2592000', '3:15', '流行', '../music/139.mp3', '改变自己');
INSERT INTO `song` VALUES (141, '王力宏', 'https://y.qq.com/music/photo_new/T002R300x300M000001a0Dts37jw2M_1.jpg?max_age=2592000', '4:38', '流行', '../music/140.mp3', '你不知道的事');
INSERT INTO `song` VALUES (142, '王力宏', 'https://y.qq.com/music/photo_new/T002R300x300M000001a0Dts37jw2M_1.jpg?max_age=2592000', '4:07', '轻音乐', '../music/141.mp3', '我们的歌');
INSERT INTO `song` VALUES (143, '王力宏', 'https://y.qq.com/music/photo_new/T002R300x300M000001a0Dts37jw2M_1.jpg?max_age=2592000', '4:11', '安静', '../music/142.mp3', '需要人陪');
INSERT INTO `song` VALUES (144, '张杰', 'https://y.qq.com/music/photo_new/T002R300x300M000000pVkCf3KsUQ9_1.jpg?max_age=2592000', '3:50', '摇滚', '../music/143.mp3', '逆战');
INSERT INTO `song` VALUES (145, '张杰', 'https://y.qq.com/music/photo_new/T002R300x300M000000pVkCf3KsUQ9_1.jpg?max_age=2592000', '3:51', '轻音乐', '../music/144.mp3', '他不懂');
INSERT INTO `song` VALUES (146, '张杰', 'https://y.qq.com/music/photo_new/T002R300x300M000000pVkCf3KsUQ9_1.jpg?max_age=2592000', '3:39', '民谣', '../music/145.mp3', '天下');
INSERT INTO `song` VALUES (147, '张杰', 'https://y.qq.com/music/photo_new/T002R300x300M000000pVkCf3KsUQ9_1.jpg?max_age=2592000', '4:00', '安静', '../music/146.mp3', '万物不如你');
INSERT INTO `song` VALUES (148, '张杰', 'https://y.qq.com/music/photo_new/T002R300x300M000000pVkCf3KsUQ9_1.jpg?max_age=2592000', '4:52', '乡村', '../music/147.mp3', '这就是爱');
INSERT INTO `song` VALUES (149, '陆通', 'https://y.qq.com/music/photo_new/T002R300x300M0000031fnvH4KFRD1_2.jpg?max_age=2592000', '4:52', '乡村', '../music/148.mp3', '美丽的约德尔姑娘');

-- ----------------------------
-- Table structure for songlist
-- ----------------------------
DROP TABLE IF EXISTS `songlist`;
CREATE TABLE `songlist`  (
  `id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `introduce` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `tip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of songlist
-- ----------------------------
INSERT INTO `songlist` VALUES (1, '安静', '国语甜蜜嘻哈', 'Crush降临💗心动说唱表达爱恋', '1728.2万', 'https://qpic.y.qq.com/music_cover/iaVNVUXOg73ua71Z0dtuz7WCXq1FI3YXl0yDpbre245ia5jGG53O2Ptw/600?n=1');
INSERT INTO `songlist` VALUES (2, '国风', '儿时总想着仗剑天涯，那是梦想起航的地方。 现在也一样，不要迷茫，不要气馁，听点国风说唱，让自己想起以前那许下的梦，再次燃起斗志，为你的梦想拼搏吧~', '国风意气事：听说唱与梦想共前行', '345.99万', 'https://qpic.y.qq.com/music_cover/jZJISVNW2fYyjJVRrqTlpg249xgJ7UN8xV32GydFiciajpTVSPmwU9kw/600?n=1');
INSERT INTO `songlist` VALUES (3, '摇滚', '在每个睡眼惺忪的清晨，点开这首歌单吧，让这杯精神冰美式开启你元气满满的一天！', '动感摇滚⚡潮酷Girl必备BGM', '334万', 'https://qpic.y.qq.com/music_cover/iad2xPqpueGwMdmu8XKA4hrybXYCVITDF75fbPVicIbT6YGyY6F9n9onlUxTciaibpQq/600?n=1');
INSERT INTO `songlist` VALUES (4, '说唱', '绝对cool！绝对有料！Rap女嗓已开始接收！是强者就来听！各种女嗓嘻哈说唱，实在巾帼不让须眉，旋律与风格的强烈撞击，连接躁动的脑细胞，你hold住了吗？', '绝对带感！是强者就来听Rap女嗓', '645.2万', 'https://qpic.y.qq.com/music_cover/rw6SicSCQrmeyibTx1UjK5y1qqFMPQRptbicNzCTWNb3fSwicC1y7KqMYg/600?n=1');
INSERT INTO `songlist` VALUES (5, '轻音乐', '伴随着鸟语花香🌸 当我闭上眼的那一刻，我仿佛来到了卡布里的森林仙境，此刻请 合十，放空思绪 静静的感受着，沉淀心灵深处一切的不悦，闻闻大自然清香的空气', '轻音乐☀合十放空思绪，沉淀心灵', '1.4万', 'https://qpic.y.qq.com/music_cover/PiajxSqBRaELq47m5qNXwiaDvnefAlyvbia6FLbV7AKVV8OjDHR6oJPfA/600?n=1');
INSERT INTO `songlist` VALUES (6, '流行', '在一起时没懂得珍惜，只有当一个人终于离开，另一个人才意识到离开的人多么重要，可是这时候ta们再也回不去了，一切再都无法挽回了。', '别用离开教我，失去的人最重要', '22.4万', 'https://qpic.y.qq.com/music_cover/W6MpN4oFIUxIJAn5jGiavOUl3PkJaRJGKMnEq3dHmxZzDWgZznUqH5A/600?n=1');
INSERT INTO `songlist` VALUES (7, '民谣', '整天奔波于城市这座机械工厂中，有时候感觉自己都像是组成这个庞然大物的零件，无论处于城市的哪个时段和角落，身边总是充满着拥挤与喧嚣。自己这颗在工作中已疲惫不堪的心灵任何时候都得悬在空中，注意着周遭的一切。', '伤感民谣丨都市青年深夜自愈法则', '2662.4万', 'https://qpic.y.qq.com/music_cover/hKFribMhwH4ClwNWJxicuCxlFB5K1Lu1rTzUdCgTFAJHH8W4uAffJm9w/600?n=1');
INSERT INTO `songlist` VALUES (8, '乡村', '本期歌单推荐：Bass house（清爽） 酷热的夏日来临，那就来点Bass House清凉一夏。 特点：本歌单的Bass house曲风舒缓，很容易让人脑补到沙滩，海风，椰树。', '仲夏必藏Bass·Max氧气波の电音', '345.2万', 'https://qpic.y.qq.com/music_cover/TF233AumibGJibUBXne2FMrNUyeic0UYpU1QY0YicmEROV6jqPH2h8l3b1NIOrJzdHq9/600?n=1');
INSERT INTO `songlist` VALUES (9, '金属', '柔情金属，以沉重的节奏来表现忧伤动人的旋律，仿佛在抨击着内心。平时嘶吼的重金属听多了，突然听到这种柔情风的，感觉就像一股清流。', '柔情金属：坚硬外壳下的温柔内心', '46.3万', 'https://qpic.y.qq.com/music_cover/OoR5bjGdQ8p5Fpcdu1tdHnywfjY0vDUpMPwD28UswLPtY1HCMJYL1g/600?n=1');
INSERT INTO `songlist` VALUES (10, '爵士', '仲夏的夜晚，结束一天烦闷的工作来小酒馆里听一曲爵士，小酌一杯疏解疲惫的身躯吧。灯光里迷蒙着暖色的浪漫色调，伴着舒缓的爵士乐放松身心，喝一杯让自己沉浸入微醺的最佳状态，呼吸着夏夜特有的惬意味道。', '爵士色调♪微醺醉意弥漫仲夏味道', '123.2', 'https://qpic.y.qq.com/music_cover/hHicAKMRTDqulAh91Pmf7J5bYvmiaJ6jkSzlT2WsEPWsUcd1e6dzicrlA/600?n=1');
INSERT INTO `songlist` VALUES (11, '粤语', '源源不断的好歌涌到大家视线前，耳朵好像都快要听不过来，不如来歌单里听听我们为你收集的粤语好听新曲～', '粤语周速递', '43.3', 'https://qpic.y.qq.com/music_cover/MKjEtF7diatibd6B0iaeF5KgqJ6qHgjPlTk9vs2SzAzBjibq7run0YrBPQ/600?n=1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` tinyint(1) NULL DEFAULT NULL,
  `phone_num` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `birthday` datetime NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
