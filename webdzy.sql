/*
 Navicat Premium Data Transfer

 Source Server         : LiangnanChen
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : webdzy

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 21/04/2024 23:30:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `bo_id` int(11) NOT NULL AUTO_INCREMENT,
  `bo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bo_number` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bo_price` int(11) NOT NULL,
  `bo_introduction` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bo_recommended` int(11) NOT NULL,
  `bo_photo` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bo_cid` int(11) NOT NULL,
  `bo_inventory` int(11) NOT NULL,
  `bo_salt` int(11) NULL DEFAULT NULL,
  `bo_author` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bo_id`) USING BTREE,
  UNIQUE INDEX `bo_number`(`bo_number` ASC) USING BTREE,
  INDEX `fk_bo_cl`(`bo_cid` ASC) USING BTREE,
  CONSTRAINT `fk_bo_cl` FOREIGN KEY (`bo_cid`) REFERENCES `bookscl` (`cl_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '巴黎圣母院', '0001', 56, '《巴黎圣母院》以离奇和对比手法写了一个发生在15世纪法国的故事：巴黎圣母院副主教克洛德道貌岸然、蛇蝎心肠，先爱后恨，迫害吉ト赛女郎埃斯梅拉达。面目丑陋、心地善良的敲钟人卡西莫多为救女郎舍身。小说揭露了宗教的虚伪，宣告禁欲主义的破产，歌颂了下层劳动人民的善良、友爱、舍己为人，反映了雨果的人道主义思想', -1, '/upload/4ab40c30-290f-4881-a0c9-eaddf3ffb34c.jpg', 1, 10, 128, '维克多.雨果');
INSERT INTO `books` VALUES (2, '夜航船123', '0002', 70, '《夜航船》是明末清初文学家、史学家张岱所著的百科类图书。该书讲述了从三教九流到神仙鬼怪，从政治人事到典章沿革等二十大类125个小类的学科知识。', -1, '/upload/8c31358f-efa0-4290-a898-d35f856eecbe.jpg', 1, 60, 111, '张岱');
INSERT INTO `books` VALUES (3, '王阳明传', '0003', 44, '本书以详实的历史资料，以故事的形式讲述了王阳明的一生：家庭、幼年、游历、应试、被贬、悟道、讲学、剿匪、平逆，等等。在紧凑的阅读体验中让读者全面了解一代传奇圣人的跌宕人生，真正明了阳明心学的精髓——心即理、知行合一、致良知。“真正的伟大，是像王阳明那样的*等人物，我们每个人，都有机会成为这样的人物。”', 1, '/static/img/003.jpg', 1, 78, 26, '孟斜阳');
INSERT INTO `books` VALUES (4, '把生活过成你想要的样子', '0004', 42, '生活有千百种可能，总有一种是你想要的样子。每个人都追求理想的生活，但我们很容易在喧嚣的生活中迷失自己，《把生活过成你想要的样子》精选了林清玄、张晓风、海蓝博士、周国平、马德、王珣、小木头等21位知名作者的30篇原创作品，从多个角度来解读生活，让你迷茫、困惑的你找到自己，从而把生活过成你想要的样子。', -1, '/static/img/004.jpg', 1, 26, 84, '邢群森');
INSERT INTO `books` VALUES (5, '浮生六记', '0005', 25, '《浮生六记》以作者夫妇的生活为主线，叙述了平凡而又充满情趣的居家生活的浪游各地的所见所闻。作品描述了作者和妻子陈芸情投意合，想要过一种布衣蔬食而从事艺术的生活，由于封建礼教的压迫与贫困生活的煎熬，终至理想破灭。该书文字清新真率，无雕琢藻饰痕迹，情节则伉俪情深，至死不渝。', -1, '/static/img/005.jpg', 1, 73, 15, '沈复');
INSERT INTO `books` VALUES (6, '雾都孤儿', '0006', 34, '该作以雾都伦敦为背景，讲述了一个孤儿悲惨的身世及遭遇。主人公奥利弗在孤儿院长大，经历学徒生涯，艰苦逃难，误入贼窝，又被迫与狠毒的凶徒为伍，历尽无数辛酸，最后在善良人的帮助下，查明身世并获得了幸福。 [1] \r\n该书揭露许多当时的社会问题，如救济院、童工、以及帮派吸收青少年参与犯罪等。该书曾多次改编为电影、电视及舞台剧。', 1, '/static/img/006.jpg', 1, 76, 26, '查尔斯.狄更斯');
INSERT INTO `books` VALUES (7, '牛棚杂忆', '0007', 22, '《牛棚杂忆》是1998年中共中央党校出版社出版的书籍，作者是季羡林。该书讲述的不是仇恨的报复，而是一面镜子，从中可以照见恶和善，丑和美，照见绝望和希望。', -1, '/static/img/007.jpg', 2, 99, 1, '季羡林');
INSERT INTO `books` VALUES (8, '窄门', '0008', 20, '小说描写主人公杰罗姆自小爱着表姐阿莉莎，阿莉莎虽然对杰罗姆也怀有同样的感情，但她恪守清教徒的自我约束，把感情深深埋在心底，最后积忧成疾，不幸身亡。\r\n在《窄门》中，纪德将爱情中的神秘主义体验推向极致，讲述了一段纯洁炙热、却又含着无边孤寂和无限辛酸滋味的爱情故事。', -1, '/static/img/008.jpg', 2, 95, 6, '安德烈.纪德');
INSERT INTO `books` VALUES (9, '博弈论', '0009', 33, '《博弈论大全集(超值白金版)》古语有云，世事如棋。生活中每个人如同棋手，其每一个行为如同在一张看不见的棋盘上布一个子，精明慎重的棋手们相互揣摩、相互牵制，人人争赢，下出诸多精彩纷呈、变化多端的棋局。在社会人生的博弈中，人与人之间的对立与斗争会淋漓尽致地呈现出来。博弈论的伟大之处正在于其通过规则、身份、信息、行动、效用、平衡等各种量化概念对人情世事进行了精妙的分析，清晰地揭示了当下社会中人们的各种互动行为、互动关系，为人们正确决策提供了指导。如果将博弈论与下围棋联系在一起，那么博弈论就是研究棋手们“出棋”时理性化、逻辑化的部分，并将其系统化为一门科学。', -1, '/static/img/009.jpg', 2, 98, 4, '刘庆群');
INSERT INTO `books` VALUES (10, '瓦尔登湖', '0010', 22, '《瓦尔登湖》是美国作家梭罗独居瓦尔登湖畔的记录，描绘了他两年多时间里的所见、所闻和所思。该书崇尚简朴生活，热爱大自然的风光，内容丰厚，意义深远，语言生动。\r\n《瓦尔登湖》是美国作家梭罗独居瓦尔登湖畔的记录，描绘了他两年多时间里的所见、所闻和所思。该书崇尚简朴生活，热爱大自然的风光，内容丰厚，意义深远，语言生动。\r\n《瓦尔登湖》是美国作家梭罗独居瓦尔登湖畔的记录，描绘了他两年多时间里的所见、所闻和所思。该书崇尚简朴生活，热爱大自然的风光，内容丰厚，意义深远，语言生动。\r\n《瓦尔登湖》是美国作家梭罗独居瓦尔登湖畔的记录，描绘了他两年多时间里的所见、所闻和所思。该书崇尚简朴生活，热爱大自然的风光，内容丰厚，意义深远，语言生动。\r\n《瓦尔登湖》是美国作家梭罗独居瓦尔登湖畔的记录，描绘了他两年多时间里的所见、所闻和所思。该书崇尚简朴生活，热爱大自然的风光，内容丰厚，意义深远，语言生动。', 1, '/static/img/010.jpg', 2, 97, 5, '埃罗');
INSERT INTO `books` VALUES (27, '狼王梦', '0088', 39, '很好', -1, '/upload/4afd205c-4118-4512-a358-95180ac80367.jpg', 16, 100, 0, '阿里');

-- ----------------------------
-- Table structure for bookscl
-- ----------------------------
DROP TABLE IF EXISTS `bookscl`;
CREATE TABLE `bookscl`  (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `cl_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cl_id`) USING BTREE,
  UNIQUE INDEX `cl_type`(`cl_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookscl
-- ----------------------------
INSERT INTO `bookscl` VALUES (23, '战争');
INSERT INTO `bookscl` VALUES (16, '教辅');
INSERT INTO `bookscl` VALUES (1, '爱情123');
INSERT INTO `bookscl` VALUES (2, '科幻');
INSERT INTO `bookscl` VALUES (22, '科技');

-- ----------------------------
-- Table structure for buyer
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer`  (
  `bu_id` int(11) NOT NULL AUTO_INCREMENT,
  `bu_account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bu_pass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bu_salt` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bu_out` int(11) NOT NULL,
  PRIMARY KEY (`bu_id`) USING BTREE,
  UNIQUE INDEX `bu_account`(`bu_account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES (31, 'admin', '123', NULL, 1);
INSERT INTO `buyer` VALUES (32, 'admin123', '123', NULL, 0);
INSERT INTO `buyer` VALUES (33, 'admin321', '123', NULL, 0);
INSERT INTO `buyer` VALUES (34, 'admin3214', '123', NULL, 0);
INSERT INTO `buyer` VALUES (35, 'chenliangnan', '123', NULL, 0);
INSERT INTO `buyer` VALUES (36, 'chenliangnan111', '123', NULL, 0);

-- ----------------------------
-- Table structure for buyer_address
-- ----------------------------
DROP TABLE IF EXISTS `buyer_address`;
CREATE TABLE `buyer_address`  (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_province` int(11) NOT NULL,
  `ad_city` int(11) NOT NULL,
  `ad_house` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad_buyer` int(11) NOT NULL,
  PRIMARY KEY (`ad_id`) USING BTREE,
  INDEX `cid1`(`ad_province` ASC) USING BTREE,
  INDEX `cid2`(`ad_city` ASC) USING BTREE,
  INDEX `cid3`(`ad_buyer` ASC) USING BTREE,
  CONSTRAINT `cid1` FOREIGN KEY (`ad_province`) REFERENCES `district_province` (`pr_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cid2` FOREIGN KEY (`ad_city`) REFERENCES `district_city` (`ci_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cid3` FOREIGN KEY (`ad_buyer`) REFERENCES `buyer` (`bu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buyer_address
-- ----------------------------
INSERT INTO `buyer_address` VALUES (17, 9, 30, '123', 31);
INSERT INTO `buyer_address` VALUES (23, 3, 154, '123', 36);
INSERT INTO `buyer_address` VALUES (24, 5, 376, '哈哈哈哈', 36);
INSERT INTO `buyer_address` VALUES (25, 7, 536, '哈哈哈哈', 36);

-- ----------------------------
-- Table structure for buyerxx
-- ----------------------------
DROP TABLE IF EXISTS `buyerxx`;
CREATE TABLE `buyerxx`  (
  `xx_id` int(11) NOT NULL AUTO_INCREMENT,
  `xx_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `xx_gender` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `xx_area` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `xx_brief` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cid` int(11) NULL DEFAULT NULL,
  `xx_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`xx_id`) USING BTREE,
  UNIQUE INDEX `cid`(`cid` ASC) USING BTREE,
  CONSTRAINT `fk_bo_xx` FOREIGN KEY (`cid`) REFERENCES `buyer` (`bu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buyerxx
-- ----------------------------
INSERT INTO `buyerxx` VALUES (4, '陈亮男', '女', '大连东软信息', '你好', 31, '/upload/01c14ea2-c1e0-41fb-892f-da504581eeac.jpg');
INSERT INTO `buyerxx` VALUES (5, NULL, NULL, NULL, NULL, 32, '/upload/03.png');
INSERT INTO `buyerxx` VALUES (6, NULL, NULL, NULL, NULL, 33, '/upload/03.png');
INSERT INTO `buyerxx` VALUES (7, NULL, NULL, NULL, NULL, 34, '/upload/03.png');
INSERT INTO `buyerxx` VALUES (8, '', '男', '', '', 35, '/upload/aa20eebb-641d-49ce-965f-6232217cc902.jpg');
INSERT INTO `buyerxx` VALUES (9, '陈亮男', '男', '大连东软信息学院', '111111', 36, '/upload/8a436c4a-ed48-4833-827c-d99e910de859.jpg');

-- ----------------------------
-- Table structure for district_city
-- ----------------------------
DROP TABLE IF EXISTS `district_city`;
CREATE TABLE `district_city`  (
  `ci_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '城市主键',
  `ci_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '城市名称',
  `ci_cid` int(11) NOT NULL COMMENT '外键，城市对应的省',
  PRIMARY KEY (`ci_id`) USING BTREE,
  INDEX `cid`(`ci_cid` ASC) USING BTREE,
  CONSTRAINT `cid` FOREIGN KEY (`ci_cid`) REFERENCES `district_province` (`pr_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 745 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of district_city
-- ----------------------------
INSERT INTO `district_city` VALUES (1, '合肥', 8);
INSERT INTO `district_city` VALUES (2, '宿州', 8);
INSERT INTO `district_city` VALUES (3, '淮北', 8);
INSERT INTO `district_city` VALUES (4, '阜阳', 8);
INSERT INTO `district_city` VALUES (5, '蚌埠', 8);
INSERT INTO `district_city` VALUES (6, '淮南', 8);
INSERT INTO `district_city` VALUES (7, '滁州', 8);
INSERT INTO `district_city` VALUES (8, '马鞍山', 8);
INSERT INTO `district_city` VALUES (9, '芜湖', 8);
INSERT INTO `district_city` VALUES (10, '铜陵', 8);
INSERT INTO `district_city` VALUES (11, '安庆', 8);
INSERT INTO `district_city` VALUES (12, '黄山', 8);
INSERT INTO `district_city` VALUES (13, '六安', 8);
INSERT INTO `district_city` VALUES (14, '池州', 8);
INSERT INTO `district_city` VALUES (15, '宣城', 8);
INSERT INTO `district_city` VALUES (16, '亳州', 8);
INSERT INTO `district_city` VALUES (17, '界首', 8);
INSERT INTO `district_city` VALUES (18, '明光', 8);
INSERT INTO `district_city` VALUES (19, '天长', 8);
INSERT INTO `district_city` VALUES (20, '桐城', 8);
INSERT INTO `district_city` VALUES (21, '宁国', 8);
INSERT INTO `district_city` VALUES (22, '巢湖', 8);
INSERT INTO `district_city` VALUES (23, '厦门', 9);
INSERT INTO `district_city` VALUES (24, '福州', 9);
INSERT INTO `district_city` VALUES (25, '南平', 9);
INSERT INTO `district_city` VALUES (26, '三明', 9);
INSERT INTO `district_city` VALUES (27, '莆田', 9);
INSERT INTO `district_city` VALUES (28, '泉州', 9);
INSERT INTO `district_city` VALUES (29, '漳州', 9);
INSERT INTO `district_city` VALUES (30, '龙岩', 9);
INSERT INTO `district_city` VALUES (31, '宁德', 9);
INSERT INTO `district_city` VALUES (32, '福清', 9);
INSERT INTO `district_city` VALUES (33, '长乐', 9);
INSERT INTO `district_city` VALUES (34, '邵武', 9);
INSERT INTO `district_city` VALUES (35, '武夷山', 9);
INSERT INTO `district_city` VALUES (36, '建瓯', 9);
INSERT INTO `district_city` VALUES (37, '建阳', 9);
INSERT INTO `district_city` VALUES (38, '永安', 9);
INSERT INTO `district_city` VALUES (39, '石狮', 9);
INSERT INTO `district_city` VALUES (40, '晋江', 9);
INSERT INTO `district_city` VALUES (41, '南安', 9);
INSERT INTO `district_city` VALUES (42, '龙海', 9);
INSERT INTO `district_city` VALUES (43, '漳平', 9);
INSERT INTO `district_city` VALUES (44, '福安', 9);
INSERT INTO `district_city` VALUES (45, '福鼎', 9);
INSERT INTO `district_city` VALUES (46, '兰州', 21);
INSERT INTO `district_city` VALUES (47, '嘉峪关', 21);
INSERT INTO `district_city` VALUES (48, '金昌', 21);
INSERT INTO `district_city` VALUES (49, '白银', 21);
INSERT INTO `district_city` VALUES (50, '天水', 21);
INSERT INTO `district_city` VALUES (51, '酒泉', 21);
INSERT INTO `district_city` VALUES (52, '张掖', 21);
INSERT INTO `district_city` VALUES (53, '武威', 21);
INSERT INTO `district_city` VALUES (54, '庆阳', 21);
INSERT INTO `district_city` VALUES (55, '平凉', 21);
INSERT INTO `district_city` VALUES (56, '定西', 21);
INSERT INTO `district_city` VALUES (57, '陇南', 21);
INSERT INTO `district_city` VALUES (58, '玉门', 21);
INSERT INTO `district_city` VALUES (59, '敦煌', 21);
INSERT INTO `district_city` VALUES (60, '临夏', 21);
INSERT INTO `district_city` VALUES (61, '合作', 21);
INSERT INTO `district_city` VALUES (62, '广州', 15);
INSERT INTO `district_city` VALUES (63, '深圳', 15);
INSERT INTO `district_city` VALUES (64, '清远', 15);
INSERT INTO `district_city` VALUES (65, '韶关', 15);
INSERT INTO `district_city` VALUES (66, '河源', 15);
INSERT INTO `district_city` VALUES (67, '梅州', 15);
INSERT INTO `district_city` VALUES (68, '潮州', 15);
INSERT INTO `district_city` VALUES (69, '汕头', 15);
INSERT INTO `district_city` VALUES (70, '揭阳', 15);
INSERT INTO `district_city` VALUES (71, '汕尾', 15);
INSERT INTO `district_city` VALUES (72, '惠州', 15);
INSERT INTO `district_city` VALUES (73, '东莞', 15);
INSERT INTO `district_city` VALUES (74, '珠海', 15);
INSERT INTO `district_city` VALUES (75, '中山', 15);
INSERT INTO `district_city` VALUES (76, '江门', 15);
INSERT INTO `district_city` VALUES (77, '佛山', 15);
INSERT INTO `district_city` VALUES (78, '肇庆', 15);
INSERT INTO `district_city` VALUES (79, '云浮', 15);
INSERT INTO `district_city` VALUES (80, '阳江', 15);
INSERT INTO `district_city` VALUES (81, '茂名', 15);
INSERT INTO `district_city` VALUES (82, '湛江', 15);
INSERT INTO `district_city` VALUES (83, '从化', 15);
INSERT INTO `district_city` VALUES (84, '增城', 15);
INSERT INTO `district_city` VALUES (85, '英德', 15);
INSERT INTO `district_city` VALUES (86, '连州', 15);
INSERT INTO `district_city` VALUES (87, '乐昌', 15);
INSERT INTO `district_city` VALUES (88, '南雄', 15);
INSERT INTO `district_city` VALUES (89, '兴宁', 15);
INSERT INTO `district_city` VALUES (90, '普宁', 15);
INSERT INTO `district_city` VALUES (91, '陆丰', 15);
INSERT INTO `district_city` VALUES (92, '恩平', 15);
INSERT INTO `district_city` VALUES (93, '台山', 15);
INSERT INTO `district_city` VALUES (94, '开平', 15);
INSERT INTO `district_city` VALUES (95, '鹤山', 15);
INSERT INTO `district_city` VALUES (96, '高要', 15);
INSERT INTO `district_city` VALUES (97, '四会', 15);
INSERT INTO `district_city` VALUES (98, '罗定', 15);
INSERT INTO `district_city` VALUES (99, '阳春', 15);
INSERT INTO `district_city` VALUES (100, '化州', 15);
INSERT INTO `district_city` VALUES (101, '信宜', 15);
INSERT INTO `district_city` VALUES (102, '高州', 15);
INSERT INTO `district_city` VALUES (103, '吴川', 15);
INSERT INTO `district_city` VALUES (104, '廉江', 15);
INSERT INTO `district_city` VALUES (105, '雷州', 15);
INSERT INTO `district_city` VALUES (106, '贵阳', 18);
INSERT INTO `district_city` VALUES (107, '六盘水', 18);
INSERT INTO `district_city` VALUES (108, '遵义', 18);
INSERT INTO `district_city` VALUES (109, '安顺', 18);
INSERT INTO `district_city` VALUES (110, '毕节', 18);
INSERT INTO `district_city` VALUES (111, '铜仁', 18);
INSERT INTO `district_city` VALUES (112, '清镇', 18);
INSERT INTO `district_city` VALUES (113, '赤水', 18);
INSERT INTO `district_city` VALUES (114, '仁怀', 18);
INSERT INTO `district_city` VALUES (115, '凯里', 18);
INSERT INTO `district_city` VALUES (116, '都匀', 18);
INSERT INTO `district_city` VALUES (117, '兴义', 18);
INSERT INTO `district_city` VALUES (118, '福泉', 18);
INSERT INTO `district_city` VALUES (119, '石家庄', 1);
INSERT INTO `district_city` VALUES (120, '邯郸', 1);
INSERT INTO `district_city` VALUES (121, '唐山', 1);
INSERT INTO `district_city` VALUES (122, '保定', 1);
INSERT INTO `district_city` VALUES (123, '秦皇岛', 1);
INSERT INTO `district_city` VALUES (124, '邢台', 1);
INSERT INTO `district_city` VALUES (125, '张家口', 1);
INSERT INTO `district_city` VALUES (126, '承德', 1);
INSERT INTO `district_city` VALUES (127, '沧州', 1);
INSERT INTO `district_city` VALUES (128, '廊坊', 1);
INSERT INTO `district_city` VALUES (129, '衡水', 1);
INSERT INTO `district_city` VALUES (130, '辛集', 1);
INSERT INTO `district_city` VALUES (131, '藁城', 1);
INSERT INTO `district_city` VALUES (132, '晋州', 1);
INSERT INTO `district_city` VALUES (133, '新乐', 1);
INSERT INTO `district_city` VALUES (134, '鹿泉', 1);
INSERT INTO `district_city` VALUES (135, '遵化', 1);
INSERT INTO `district_city` VALUES (136, '迁安', 1);
INSERT INTO `district_city` VALUES (137, '霸州', 1);
INSERT INTO `district_city` VALUES (138, '三河', 1);
INSERT INTO `district_city` VALUES (139, '定州', 1);
INSERT INTO `district_city` VALUES (140, '涿州', 1);
INSERT INTO `district_city` VALUES (141, '安国', 1);
INSERT INTO `district_city` VALUES (142, '高碑店', 1);
INSERT INTO `district_city` VALUES (143, '泊头', 1);
INSERT INTO `district_city` VALUES (144, '任丘', 1);
INSERT INTO `district_city` VALUES (145, '黄骅', 1);
INSERT INTO `district_city` VALUES (146, '河间', 1);
INSERT INTO `district_city` VALUES (147, '冀州', 1);
INSERT INTO `district_city` VALUES (148, '深州', 1);
INSERT INTO `district_city` VALUES (149, '南宫', 1);
INSERT INTO `district_city` VALUES (150, '沙河', 1);
INSERT INTO `district_city` VALUES (151, '武安', 1);
INSERT INTO `district_city` VALUES (152, '哈尔滨', 3);
INSERT INTO `district_city` VALUES (153, '齐齐哈尔', 3);
INSERT INTO `district_city` VALUES (154, '黑河', 3);
INSERT INTO `district_city` VALUES (155, '大庆', 3);
INSERT INTO `district_city` VALUES (156, '伊春', 3);
INSERT INTO `district_city` VALUES (157, '鹤岗', 3);
INSERT INTO `district_city` VALUES (158, '佳木斯', 3);
INSERT INTO `district_city` VALUES (159, '双鸭山', 3);
INSERT INTO `district_city` VALUES (160, '七台河', 3);
INSERT INTO `district_city` VALUES (161, '鸡西', 3);
INSERT INTO `district_city` VALUES (162, '牡丹江', 3);
INSERT INTO `district_city` VALUES (163, '绥化', 3);
INSERT INTO `district_city` VALUES (164, '双城', 3);
INSERT INTO `district_city` VALUES (165, '尚志', 3);
INSERT INTO `district_city` VALUES (166, '五常', 3);
INSERT INTO `district_city` VALUES (167, '阿城', 3);
INSERT INTO `district_city` VALUES (168, '讷河', 3);
INSERT INTO `district_city` VALUES (169, '北安', 3);
INSERT INTO `district_city` VALUES (170, '五大连池', 3);
INSERT INTO `district_city` VALUES (171, '铁力', 3);
INSERT INTO `district_city` VALUES (172, '同江', 3);
INSERT INTO `district_city` VALUES (173, '富锦', 3);
INSERT INTO `district_city` VALUES (174, '虎林', 3);
INSERT INTO `district_city` VALUES (175, '密山', 3);
INSERT INTO `district_city` VALUES (176, '绥芬河', 3);
INSERT INTO `district_city` VALUES (177, '海林', 3);
INSERT INTO `district_city` VALUES (178, '宁安', 3);
INSERT INTO `district_city` VALUES (179, '安达', 3);
INSERT INTO `district_city` VALUES (180, '肇东', 3);
INSERT INTO `district_city` VALUES (181, '海伦', 3);
INSERT INTO `district_city` VALUES (182, '郑州', 12);
INSERT INTO `district_city` VALUES (183, '开封', 12);
INSERT INTO `district_city` VALUES (184, '洛阳', 12);
INSERT INTO `district_city` VALUES (185, '平顶山', 12);
INSERT INTO `district_city` VALUES (186, '安阳', 12);
INSERT INTO `district_city` VALUES (187, '鹤壁', 12);
INSERT INTO `district_city` VALUES (188, '新乡', 12);
INSERT INTO `district_city` VALUES (189, '焦作', 12);
INSERT INTO `district_city` VALUES (190, '濮阳', 12);
INSERT INTO `district_city` VALUES (191, '许昌', 12);
INSERT INTO `district_city` VALUES (192, '漯河', 12);
INSERT INTO `district_city` VALUES (193, '三门峡', 12);
INSERT INTO `district_city` VALUES (194, '南阳', 12);
INSERT INTO `district_city` VALUES (195, '商丘', 12);
INSERT INTO `district_city` VALUES (196, '周口', 12);
INSERT INTO `district_city` VALUES (197, '驻马店', 12);
INSERT INTO `district_city` VALUES (198, '信阳', 12);
INSERT INTO `district_city` VALUES (199, '济源', 12);
INSERT INTO `district_city` VALUES (200, '巩义', 12);
INSERT INTO `district_city` VALUES (201, '邓州', 12);
INSERT INTO `district_city` VALUES (202, '永城', 12);
INSERT INTO `district_city` VALUES (203, '汝州', 12);
INSERT INTO `district_city` VALUES (204, '荥阳', 12);
INSERT INTO `district_city` VALUES (205, '新郑', 12);
INSERT INTO `district_city` VALUES (206, '登封', 12);
INSERT INTO `district_city` VALUES (207, '新密', 12);
INSERT INTO `district_city` VALUES (208, '偃师', 12);
INSERT INTO `district_city` VALUES (209, '孟州', 12);
INSERT INTO `district_city` VALUES (210, '沁阳', 12);
INSERT INTO `district_city` VALUES (211, '卫辉', 12);
INSERT INTO `district_city` VALUES (212, '辉县', 12);
INSERT INTO `district_city` VALUES (213, '林州', 12);
INSERT INTO `district_city` VALUES (214, '禹州', 12);
INSERT INTO `district_city` VALUES (215, '长葛', 12);
INSERT INTO `district_city` VALUES (216, '舞钢', 12);
INSERT INTO `district_city` VALUES (217, '义马', 12);
INSERT INTO `district_city` VALUES (218, '灵宝', 12);
INSERT INTO `district_city` VALUES (219, '项城', 12);
INSERT INTO `district_city` VALUES (220, '武汉', 13);
INSERT INTO `district_city` VALUES (221, '十堰', 13);
INSERT INTO `district_city` VALUES (222, '襄樊', 13);
INSERT INTO `district_city` VALUES (223, '荆门', 13);
INSERT INTO `district_city` VALUES (224, '孝感', 13);
INSERT INTO `district_city` VALUES (225, '黄冈', 13);
INSERT INTO `district_city` VALUES (226, '鄂州', 13);
INSERT INTO `district_city` VALUES (227, '黄石', 13);
INSERT INTO `district_city` VALUES (228, '咸宁', 13);
INSERT INTO `district_city` VALUES (229, '荆州', 13);
INSERT INTO `district_city` VALUES (230, '宜昌', 13);
INSERT INTO `district_city` VALUES (231, '随州', 13);
INSERT INTO `district_city` VALUES (232, '仙桃', 13);
INSERT INTO `district_city` VALUES (233, '天门', 13);
INSERT INTO `district_city` VALUES (234, '潜江', 13);
INSERT INTO `district_city` VALUES (235, '丹江口', 13);
INSERT INTO `district_city` VALUES (236, '老河口', 13);
INSERT INTO `district_city` VALUES (237, '枣阳', 13);
INSERT INTO `district_city` VALUES (238, '宜城', 13);
INSERT INTO `district_city` VALUES (239, '钟祥', 13);
INSERT INTO `district_city` VALUES (240, '汉川', 13);
INSERT INTO `district_city` VALUES (241, '应城', 13);
INSERT INTO `district_city` VALUES (242, '安陆', 13);
INSERT INTO `district_city` VALUES (243, '广水', 13);
INSERT INTO `district_city` VALUES (244, '麻城', 13);
INSERT INTO `district_city` VALUES (245, '武穴', 13);
INSERT INTO `district_city` VALUES (246, '大冶', 13);
INSERT INTO `district_city` VALUES (247, '赤壁', 13);
INSERT INTO `district_city` VALUES (248, '石首', 13);
INSERT INTO `district_city` VALUES (249, '洪湖', 13);
INSERT INTO `district_city` VALUES (250, '松滋', 13);
INSERT INTO `district_city` VALUES (251, '宜都', 13);
INSERT INTO `district_city` VALUES (252, '枝江', 13);
INSERT INTO `district_city` VALUES (253, '当阳', 13);
INSERT INTO `district_city` VALUES (254, '恩施', 13);
INSERT INTO `district_city` VALUES (255, '利川', 13);
INSERT INTO `district_city` VALUES (256, '长沙', 14);
INSERT INTO `district_city` VALUES (257, '衡阳', 14);
INSERT INTO `district_city` VALUES (258, '张家界', 14);
INSERT INTO `district_city` VALUES (259, '常德', 14);
INSERT INTO `district_city` VALUES (260, '益阳', 14);
INSERT INTO `district_city` VALUES (261, '岳阳', 14);
INSERT INTO `district_city` VALUES (262, '株洲', 14);
INSERT INTO `district_city` VALUES (263, '湘潭', 14);
INSERT INTO `district_city` VALUES (264, '郴州', 14);
INSERT INTO `district_city` VALUES (265, '永州', 14);
INSERT INTO `district_city` VALUES (266, '邵阳', 14);
INSERT INTO `district_city` VALUES (267, '怀化', 14);
INSERT INTO `district_city` VALUES (268, '娄底', 14);
INSERT INTO `district_city` VALUES (269, '耒阳', 14);
INSERT INTO `district_city` VALUES (270, '常宁', 14);
INSERT INTO `district_city` VALUES (271, '浏阳', 14);
INSERT INTO `district_city` VALUES (272, '津市', 14);
INSERT INTO `district_city` VALUES (273, '沅江', 14);
INSERT INTO `district_city` VALUES (274, '汨罗', 14);
INSERT INTO `district_city` VALUES (275, '临湘', 14);
INSERT INTO `district_city` VALUES (276, '醴陵', 14);
INSERT INTO `district_city` VALUES (277, '湘乡', 14);
INSERT INTO `district_city` VALUES (278, '韶山', 14);
INSERT INTO `district_city` VALUES (279, '资兴', 14);
INSERT INTO `district_city` VALUES (280, '武冈', 14);
INSERT INTO `district_city` VALUES (281, '洪江', 14);
INSERT INTO `district_city` VALUES (282, '冷水江', 14);
INSERT INTO `district_city` VALUES (283, '涟源', 14);
INSERT INTO `district_city` VALUES (284, '吉首', 14);
INSERT INTO `district_city` VALUES (285, '长春', 4);
INSERT INTO `district_city` VALUES (286, '吉林市', 4);
INSERT INTO `district_city` VALUES (287, '白城', 4);
INSERT INTO `district_city` VALUES (288, '松原', 4);
INSERT INTO `district_city` VALUES (289, '四平', 4);
INSERT INTO `district_city` VALUES (290, '辽源', 4);
INSERT INTO `district_city` VALUES (291, '通化', 4);
INSERT INTO `district_city` VALUES (292, '白山', 4);
INSERT INTO `district_city` VALUES (293, '德惠', 4);
INSERT INTO `district_city` VALUES (294, '九台', 4);
INSERT INTO `district_city` VALUES (295, '榆树', 4);
INSERT INTO `district_city` VALUES (296, '磐石', 4);
INSERT INTO `district_city` VALUES (297, '蛟河', 4);
INSERT INTO `district_city` VALUES (298, '桦甸', 4);
INSERT INTO `district_city` VALUES (299, '舒兰', 4);
INSERT INTO `district_city` VALUES (300, '洮南', 4);
INSERT INTO `district_city` VALUES (301, '大安', 4);
INSERT INTO `district_city` VALUES (302, '双辽', 4);
INSERT INTO `district_city` VALUES (303, '公主岭', 4);
INSERT INTO `district_city` VALUES (304, '梅河口', 4);
INSERT INTO `district_city` VALUES (305, '集安', 4);
INSERT INTO `district_city` VALUES (306, '临江', 4);
INSERT INTO `district_city` VALUES (307, '延吉', 4);
INSERT INTO `district_city` VALUES (308, '图们', 4);
INSERT INTO `district_city` VALUES (309, '敦化', 4);
INSERT INTO `district_city` VALUES (310, '珲春', 4);
INSERT INTO `district_city` VALUES (311, '龙井', 4);
INSERT INTO `district_city` VALUES (312, '和龙', 4);
INSERT INTO `district_city` VALUES (313, '南昌', 10);
INSERT INTO `district_city` VALUES (314, '九江', 10);
INSERT INTO `district_city` VALUES (315, '景德镇', 10);
INSERT INTO `district_city` VALUES (316, '鹰潭', 10);
INSERT INTO `district_city` VALUES (317, '新余', 10);
INSERT INTO `district_city` VALUES (318, '萍乡', 10);
INSERT INTO `district_city` VALUES (319, '赣州', 10);
INSERT INTO `district_city` VALUES (320, '上饶', 10);
INSERT INTO `district_city` VALUES (321, '抚州', 10);
INSERT INTO `district_city` VALUES (322, '宜春', 10);
INSERT INTO `district_city` VALUES (323, '吉安', 10);
INSERT INTO `district_city` VALUES (324, '瑞昌', 10);
INSERT INTO `district_city` VALUES (325, '乐平', 10);
INSERT INTO `district_city` VALUES (326, '瑞金', 10);
INSERT INTO `district_city` VALUES (327, '南康', 10);
INSERT INTO `district_city` VALUES (328, '德兴', 10);
INSERT INTO `district_city` VALUES (329, '丰城', 10);
INSERT INTO `district_city` VALUES (330, '樟树', 10);
INSERT INTO `district_city` VALUES (331, '高安', 10);
INSERT INTO `district_city` VALUES (332, '井冈山', 10);
INSERT INTO `district_city` VALUES (333, '贵溪', 10);
INSERT INTO `district_city` VALUES (334, '南京', 6);
INSERT INTO `district_city` VALUES (335, '徐州', 6);
INSERT INTO `district_city` VALUES (336, '连云港', 6);
INSERT INTO `district_city` VALUES (337, '宿迁', 6);
INSERT INTO `district_city` VALUES (338, '淮安', 6);
INSERT INTO `district_city` VALUES (339, '盐城', 6);
INSERT INTO `district_city` VALUES (340, '扬州', 6);
INSERT INTO `district_city` VALUES (341, '泰州', 6);
INSERT INTO `district_city` VALUES (342, '南通', 6);
INSERT INTO `district_city` VALUES (343, '镇江', 6);
INSERT INTO `district_city` VALUES (344, '常州', 6);
INSERT INTO `district_city` VALUES (345, '无锡', 6);
INSERT INTO `district_city` VALUES (346, '苏州', 6);
INSERT INTO `district_city` VALUES (347, '江阴', 6);
INSERT INTO `district_city` VALUES (348, '宜兴', 6);
INSERT INTO `district_city` VALUES (349, '邳州', 6);
INSERT INTO `district_city` VALUES (350, '新沂', 6);
INSERT INTO `district_city` VALUES (351, '金坛', 6);
INSERT INTO `district_city` VALUES (352, '溧阳', 6);
INSERT INTO `district_city` VALUES (353, '常熟', 6);
INSERT INTO `district_city` VALUES (354, '张家港', 6);
INSERT INTO `district_city` VALUES (355, '太仓', 6);
INSERT INTO `district_city` VALUES (356, '昆山', 6);
INSERT INTO `district_city` VALUES (357, '吴江', 6);
INSERT INTO `district_city` VALUES (358, '如皋', 6);
INSERT INTO `district_city` VALUES (359, '海门', 6);
INSERT INTO `district_city` VALUES (360, '启东', 6);
INSERT INTO `district_city` VALUES (361, '大丰', 6);
INSERT INTO `district_city` VALUES (362, '东台', 6);
INSERT INTO `district_city` VALUES (363, '高邮', 6);
INSERT INTO `district_city` VALUES (364, '仪征', 6);
INSERT INTO `district_city` VALUES (365, '扬中', 6);
INSERT INTO `district_city` VALUES (366, '句容', 6);
INSERT INTO `district_city` VALUES (367, '丹阳', 6);
INSERT INTO `district_city` VALUES (368, '兴化', 6);
INSERT INTO `district_city` VALUES (369, '姜堰', 6);
INSERT INTO `district_city` VALUES (370, '泰兴', 6);
INSERT INTO `district_city` VALUES (371, '靖江', 6);
INSERT INTO `district_city` VALUES (372, '沈阳', 5);
INSERT INTO `district_city` VALUES (373, '大连', 5);
INSERT INTO `district_city` VALUES (374, '朝阳', 5);
INSERT INTO `district_city` VALUES (375, '阜新', 5);
INSERT INTO `district_city` VALUES (376, '铁岭', 5);
INSERT INTO `district_city` VALUES (377, '抚顺', 5);
INSERT INTO `district_city` VALUES (378, '本溪', 5);
INSERT INTO `district_city` VALUES (379, '辽阳', 5);
INSERT INTO `district_city` VALUES (380, '鞍山', 5);
INSERT INTO `district_city` VALUES (381, '丹东', 5);
INSERT INTO `district_city` VALUES (382, '营口', 5);
INSERT INTO `district_city` VALUES (383, '盘锦', 5);
INSERT INTO `district_city` VALUES (384, '锦州', 5);
INSERT INTO `district_city` VALUES (385, '葫芦岛', 5);
INSERT INTO `district_city` VALUES (386, '新民', 5);
INSERT INTO `district_city` VALUES (387, '瓦房店', 5);
INSERT INTO `district_city` VALUES (388, '普兰店', 5);
INSERT INTO `district_city` VALUES (389, '庄河', 5);
INSERT INTO `district_city` VALUES (390, '北票', 5);
INSERT INTO `district_city` VALUES (391, '凌源', 5);
INSERT INTO `district_city` VALUES (392, '调兵山', 5);
INSERT INTO `district_city` VALUES (393, '开原', 5);
INSERT INTO `district_city` VALUES (394, '灯塔', 5);
INSERT INTO `district_city` VALUES (395, '海城', 5);
INSERT INTO `district_city` VALUES (396, '凤城', 5);
INSERT INTO `district_city` VALUES (397, '东港', 5);
INSERT INTO `district_city` VALUES (398, '大石桥', 5);
INSERT INTO `district_city` VALUES (399, '盖州', 5);
INSERT INTO `district_city` VALUES (400, '凌海', 5);
INSERT INTO `district_city` VALUES (401, '北宁', 5);
INSERT INTO `district_city` VALUES (402, '兴城', 5);
INSERT INTO `district_city` VALUES (403, '济南', 11);
INSERT INTO `district_city` VALUES (404, '青岛', 11);
INSERT INTO `district_city` VALUES (405, '聊城', 11);
INSERT INTO `district_city` VALUES (406, '德州', 11);
INSERT INTO `district_city` VALUES (407, '东营', 11);
INSERT INTO `district_city` VALUES (408, '淄博', 11);
INSERT INTO `district_city` VALUES (409, '潍坊', 11);
INSERT INTO `district_city` VALUES (410, '烟台', 11);
INSERT INTO `district_city` VALUES (411, '威海', 11);
INSERT INTO `district_city` VALUES (412, '日照', 11);
INSERT INTO `district_city` VALUES (413, '临沂', 11);
INSERT INTO `district_city` VALUES (414, '枣庄', 11);
INSERT INTO `district_city` VALUES (415, '济宁', 11);
INSERT INTO `district_city` VALUES (416, '泰安', 11);
INSERT INTO `district_city` VALUES (417, '莱芜', 11);
INSERT INTO `district_city` VALUES (418, '滨州', 11);
INSERT INTO `district_city` VALUES (419, '菏泽', 11);
INSERT INTO `district_city` VALUES (420, '章丘', 11);
INSERT INTO `district_city` VALUES (421, '胶州', 11);
INSERT INTO `district_city` VALUES (422, '胶南', 11);
INSERT INTO `district_city` VALUES (423, '即墨', 11);
INSERT INTO `district_city` VALUES (424, '平度', 11);
INSERT INTO `district_city` VALUES (425, '莱西', 11);
INSERT INTO `district_city` VALUES (426, '临清', 11);
INSERT INTO `district_city` VALUES (427, '乐陵', 11);
INSERT INTO `district_city` VALUES (428, '禹城', 11);
INSERT INTO `district_city` VALUES (429, '安丘', 11);
INSERT INTO `district_city` VALUES (430, '昌邑', 11);
INSERT INTO `district_city` VALUES (431, '高密', 11);
INSERT INTO `district_city` VALUES (432, '青州', 11);
INSERT INTO `district_city` VALUES (433, '诸城', 11);
INSERT INTO `district_city` VALUES (434, '寿光', 11);
INSERT INTO `district_city` VALUES (435, '栖霞', 11);
INSERT INTO `district_city` VALUES (436, '海阳', 11);
INSERT INTO `district_city` VALUES (437, '龙口', 11);
INSERT INTO `district_city` VALUES (438, '莱阳', 11);
INSERT INTO `district_city` VALUES (439, '莱州', 11);
INSERT INTO `district_city` VALUES (440, '蓬莱', 11);
INSERT INTO `district_city` VALUES (441, '招远', 11);
INSERT INTO `district_city` VALUES (442, '文登', 11);
INSERT INTO `district_city` VALUES (443, '荣成', 11);
INSERT INTO `district_city` VALUES (444, '乳山', 11);
INSERT INTO `district_city` VALUES (445, '滕州', 11);
INSERT INTO `district_city` VALUES (446, '曲阜', 11);
INSERT INTO `district_city` VALUES (447, '兖州', 11);
INSERT INTO `district_city` VALUES (448, '邹城', 11);
INSERT INTO `district_city` VALUES (449, '新泰', 11);
INSERT INTO `district_city` VALUES (450, '肥城', 11);
INSERT INTO `district_city` VALUES (451, '西安', 20);
INSERT INTO `district_city` VALUES (452, '延安', 20);
INSERT INTO `district_city` VALUES (453, '铜川', 20);
INSERT INTO `district_city` VALUES (454, '渭南', 20);
INSERT INTO `district_city` VALUES (455, '咸阳', 20);
INSERT INTO `district_city` VALUES (456, '宝鸡', 20);
INSERT INTO `district_city` VALUES (457, '汉中', 20);
INSERT INTO `district_city` VALUES (458, '榆林', 20);
INSERT INTO `district_city` VALUES (459, '商洛', 20);
INSERT INTO `district_city` VALUES (460, '安康', 20);
INSERT INTO `district_city` VALUES (461, '韩城', 20);
INSERT INTO `district_city` VALUES (462, '华阴', 20);
INSERT INTO `district_city` VALUES (463, '兴平', 20);
INSERT INTO `district_city` VALUES (464, '太原', 2);
INSERT INTO `district_city` VALUES (465, '大同', 2);
INSERT INTO `district_city` VALUES (466, '朔州', 2);
INSERT INTO `district_city` VALUES (467, '阳泉', 2);
INSERT INTO `district_city` VALUES (468, '长治', 2);
INSERT INTO `district_city` VALUES (469, '晋城', 2);
INSERT INTO `district_city` VALUES (470, '忻州', 2);
INSERT INTO `district_city` VALUES (471, '吕梁', 2);
INSERT INTO `district_city` VALUES (472, '晋中', 2);
INSERT INTO `district_city` VALUES (473, '临汾', 2);
INSERT INTO `district_city` VALUES (474, '运城', 2);
INSERT INTO `district_city` VALUES (475, '古交', 2);
INSERT INTO `district_city` VALUES (476, '潞城', 2);
INSERT INTO `district_city` VALUES (477, '高平', 2);
INSERT INTO `district_city` VALUES (478, '原平', 2);
INSERT INTO `district_city` VALUES (479, '孝义', 2);
INSERT INTO `district_city` VALUES (480, '汾阳', 2);
INSERT INTO `district_city` VALUES (481, '介休', 2);
INSERT INTO `district_city` VALUES (482, '侯马', 2);
INSERT INTO `district_city` VALUES (483, '霍州', 2);
INSERT INTO `district_city` VALUES (484, '永济', 2);
INSERT INTO `district_city` VALUES (485, '河津', 2);
INSERT INTO `district_city` VALUES (486, '成都', 17);
INSERT INTO `district_city` VALUES (487, '广元', 17);
INSERT INTO `district_city` VALUES (488, '绵阳', 17);
INSERT INTO `district_city` VALUES (489, '德阳', 17);
INSERT INTO `district_city` VALUES (490, '南充', 17);
INSERT INTO `district_city` VALUES (491, '广安', 17);
INSERT INTO `district_city` VALUES (492, '遂宁', 17);
INSERT INTO `district_city` VALUES (493, '内江', 17);
INSERT INTO `district_city` VALUES (494, '乐山', 17);
INSERT INTO `district_city` VALUES (495, '自贡', 17);
INSERT INTO `district_city` VALUES (496, '泸州', 17);
INSERT INTO `district_city` VALUES (497, '宜宾', 17);
INSERT INTO `district_city` VALUES (498, '攀枝花', 17);
INSERT INTO `district_city` VALUES (499, '巴中', 17);
INSERT INTO `district_city` VALUES (500, '达州', 17);
INSERT INTO `district_city` VALUES (501, '资阳', 17);
INSERT INTO `district_city` VALUES (502, '眉山', 17);
INSERT INTO `district_city` VALUES (503, '雅安', 17);
INSERT INTO `district_city` VALUES (504, '崇州', 17);
INSERT INTO `district_city` VALUES (505, '邛崃', 17);
INSERT INTO `district_city` VALUES (506, '都江堰', 17);
INSERT INTO `district_city` VALUES (507, '彭州', 17);
INSERT INTO `district_city` VALUES (508, '江油', 17);
INSERT INTO `district_city` VALUES (509, '什邡', 17);
INSERT INTO `district_city` VALUES (510, '广汉', 17);
INSERT INTO `district_city` VALUES (511, '绵竹', 17);
INSERT INTO `district_city` VALUES (512, '阆中', 17);
INSERT INTO `district_city` VALUES (513, '华蓥', 17);
INSERT INTO `district_city` VALUES (514, '峨眉山', 17);
INSERT INTO `district_city` VALUES (515, '万源', 17);
INSERT INTO `district_city` VALUES (516, '简阳', 17);
INSERT INTO `district_city` VALUES (517, '西昌', 17);
INSERT INTO `district_city` VALUES (518, '昆明', 19);
INSERT INTO `district_city` VALUES (519, '曲靖', 19);
INSERT INTO `district_city` VALUES (520, '玉溪', 19);
INSERT INTO `district_city` VALUES (521, '丽江', 19);
INSERT INTO `district_city` VALUES (522, '昭通', 19);
INSERT INTO `district_city` VALUES (523, '思茅', 19);
INSERT INTO `district_city` VALUES (524, '临沧', 19);
INSERT INTO `district_city` VALUES (525, '保山', 19);
INSERT INTO `district_city` VALUES (526, '安宁', 19);
INSERT INTO `district_city` VALUES (527, '宣威', 19);
INSERT INTO `district_city` VALUES (528, '芒市', 19);
INSERT INTO `district_city` VALUES (529, '瑞丽', 19);
INSERT INTO `district_city` VALUES (530, '大理', 19);
INSERT INTO `district_city` VALUES (531, '楚雄', 19);
INSERT INTO `district_city` VALUES (532, '个旧', 19);
INSERT INTO `district_city` VALUES (533, '开远', 19);
INSERT INTO `district_city` VALUES (534, '景洪', 19);
INSERT INTO `district_city` VALUES (535, '杭州', 7);
INSERT INTO `district_city` VALUES (536, '宁波', 7);
INSERT INTO `district_city` VALUES (537, '湖州', 7);
INSERT INTO `district_city` VALUES (538, '嘉兴', 7);
INSERT INTO `district_city` VALUES (539, '舟山', 7);
INSERT INTO `district_city` VALUES (540, '绍兴', 7);
INSERT INTO `district_city` VALUES (541, '衢州', 7);
INSERT INTO `district_city` VALUES (542, '金华', 7);
INSERT INTO `district_city` VALUES (543, '台州', 7);
INSERT INTO `district_city` VALUES (544, '温州', 7);
INSERT INTO `district_city` VALUES (545, '丽水', 7);
INSERT INTO `district_city` VALUES (546, '临安', 7);
INSERT INTO `district_city` VALUES (547, '富阳', 7);
INSERT INTO `district_city` VALUES (548, '建德', 7);
INSERT INTO `district_city` VALUES (549, '慈溪', 7);
INSERT INTO `district_city` VALUES (550, '余姚', 7);
INSERT INTO `district_city` VALUES (551, '奉化', 7);
INSERT INTO `district_city` VALUES (552, '平湖', 7);
INSERT INTO `district_city` VALUES (553, '海宁', 7);
INSERT INTO `district_city` VALUES (554, '桐乡', 7);
INSERT INTO `district_city` VALUES (555, '诸暨', 7);
INSERT INTO `district_city` VALUES (556, '上虞', 7);
INSERT INTO `district_city` VALUES (557, '嵊州', 7);
INSERT INTO `district_city` VALUES (558, '江山', 7);
INSERT INTO `district_city` VALUES (559, '兰溪', 7);
INSERT INTO `district_city` VALUES (560, '永康', 7);
INSERT INTO `district_city` VALUES (561, '义乌', 7);
INSERT INTO `district_city` VALUES (562, '东阳', 7);
INSERT INTO `district_city` VALUES (563, '临海', 7);
INSERT INTO `district_city` VALUES (564, '温岭', 7);
INSERT INTO `district_city` VALUES (565, '瑞安', 7);
INSERT INTO `district_city` VALUES (566, '乐清', 7);
INSERT INTO `district_city` VALUES (567, '龙泉', 7);
INSERT INTO `district_city` VALUES (568, '西宁', 22);
INSERT INTO `district_city` VALUES (569, '格尔木', 22);
INSERT INTO `district_city` VALUES (570, '德令哈', 22);
INSERT INTO `district_city` VALUES (571, '海口市', 16);
INSERT INTO `district_city` VALUES (572, '三亚市', 16);
INSERT INTO `district_city` VALUES (573, '文昌市', 16);
INSERT INTO `district_city` VALUES (574, '琼海市', 16);
INSERT INTO `district_city` VALUES (575, '万宁市', 16);
INSERT INTO `district_city` VALUES (576, '东方市', 16);
INSERT INTO `district_city` VALUES (577, '儋州市', 16);
INSERT INTO `district_city` VALUES (578, '五指山市', 16);
INSERT INTO `district_city` VALUES (579, '南宁', 25);
INSERT INTO `district_city` VALUES (580, '桂林', 25);
INSERT INTO `district_city` VALUES (581, '柳州', 25);
INSERT INTO `district_city` VALUES (582, '梧州', 25);
INSERT INTO `district_city` VALUES (583, '贵港', 25);
INSERT INTO `district_city` VALUES (584, '玉林', 25);
INSERT INTO `district_city` VALUES (585, '钦州', 25);
INSERT INTO `district_city` VALUES (586, '北海', 25);
INSERT INTO `district_city` VALUES (587, '防城港', 25);
INSERT INTO `district_city` VALUES (588, '崇左', 25);
INSERT INTO `district_city` VALUES (589, '百色', 25);
INSERT INTO `district_city` VALUES (590, '河池', 25);
INSERT INTO `district_city` VALUES (591, '来宾', 25);
INSERT INTO `district_city` VALUES (592, '贺州', 25);
INSERT INTO `district_city` VALUES (593, '岑溪', 25);
INSERT INTO `district_city` VALUES (594, '桂平', 25);
INSERT INTO `district_city` VALUES (595, '北流', 25);
INSERT INTO `district_city` VALUES (596, '东兴', 25);
INSERT INTO `district_city` VALUES (597, '凭祥', 25);
INSERT INTO `district_city` VALUES (598, '宜州', 25);
INSERT INTO `district_city` VALUES (599, '合山', 25);
INSERT INTO `district_city` VALUES (600, '呼和浩特', 24);
INSERT INTO `district_city` VALUES (601, '包头', 24);
INSERT INTO `district_city` VALUES (602, '乌海', 24);
INSERT INTO `district_city` VALUES (603, '赤峰', 24);
INSERT INTO `district_city` VALUES (604, '呼伦贝尔', 24);
INSERT INTO `district_city` VALUES (605, '通辽', 24);
INSERT INTO `district_city` VALUES (606, '乌兰察布', 24);
INSERT INTO `district_city` VALUES (607, '鄂尔多斯', 24);
INSERT INTO `district_city` VALUES (608, '巴彦淖尔', 24);
INSERT INTO `district_city` VALUES (609, '满洲里', 24);
INSERT INTO `district_city` VALUES (610, '扎兰屯', 24);
INSERT INTO `district_city` VALUES (611, '牙克石', 24);
INSERT INTO `district_city` VALUES (612, '根河', 24);
INSERT INTO `district_city` VALUES (613, '额尔古纳', 24);
INSERT INTO `district_city` VALUES (614, '乌兰浩特', 24);
INSERT INTO `district_city` VALUES (615, '阿尔山', 24);
INSERT INTO `district_city` VALUES (616, '霍林郭勒', 24);
INSERT INTO `district_city` VALUES (617, '锡林浩特', 24);
INSERT INTO `district_city` VALUES (618, '二连浩特', 24);
INSERT INTO `district_city` VALUES (619, '丰镇', 24);
INSERT INTO `district_city` VALUES (620, '银川', 27);
INSERT INTO `district_city` VALUES (621, '石嘴山', 27);
INSERT INTO `district_city` VALUES (622, '吴忠', 27);
INSERT INTO `district_city` VALUES (623, '中卫', 27);
INSERT INTO `district_city` VALUES (624, '固原', 27);
INSERT INTO `district_city` VALUES (625, '灵武', 27);
INSERT INTO `district_city` VALUES (626, '青铜峡', 27);
INSERT INTO `district_city` VALUES (627, '拉萨', 26);
INSERT INTO `district_city` VALUES (628, '日喀则', 26);
INSERT INTO `district_city` VALUES (629, '乌鲁木齐', 28);
INSERT INTO `district_city` VALUES (630, '克拉玛依', 28);
INSERT INTO `district_city` VALUES (631, '石河子', 28);
INSERT INTO `district_city` VALUES (632, '阿拉尔', 28);
INSERT INTO `district_city` VALUES (633, '图木舒克', 28);
INSERT INTO `district_city` VALUES (634, '五家渠', 28);
INSERT INTO `district_city` VALUES (635, '北屯', 28);
INSERT INTO `district_city` VALUES (636, '喀什', 28);
INSERT INTO `district_city` VALUES (637, '阿克苏', 28);
INSERT INTO `district_city` VALUES (638, '和田', 28);
INSERT INTO `district_city` VALUES (639, '吐鲁番', 28);
INSERT INTO `district_city` VALUES (640, '哈密', 28);
INSERT INTO `district_city` VALUES (641, '阿图什', 28);
INSERT INTO `district_city` VALUES (642, '博乐', 28);
INSERT INTO `district_city` VALUES (643, '昌吉', 28);
INSERT INTO `district_city` VALUES (644, '阜康', 28);
INSERT INTO `district_city` VALUES (645, '米泉', 28);
INSERT INTO `district_city` VALUES (646, '库尔勒', 28);
INSERT INTO `district_city` VALUES (647, '伊宁', 28);
INSERT INTO `district_city` VALUES (648, '奎屯', 28);
INSERT INTO `district_city` VALUES (649, '塔城', 28);
INSERT INTO `district_city` VALUES (650, '乌苏', 28);
INSERT INTO `district_city` VALUES (651, '阿勒泰', 28);
INSERT INTO `district_city` VALUES (652, '西城区', 29);
INSERT INTO `district_city` VALUES (653, '朝阳区', 29);
INSERT INTO `district_city` VALUES (654, '丰台区', 29);
INSERT INTO `district_city` VALUES (655, '石景山区', 29);
INSERT INTO `district_city` VALUES (656, '海淀区', 29);
INSERT INTO `district_city` VALUES (657, '顺义区', 29);
INSERT INTO `district_city` VALUES (658, '通州区', 29);
INSERT INTO `district_city` VALUES (659, '大兴区', 29);
INSERT INTO `district_city` VALUES (660, '房山区', 29);
INSERT INTO `district_city` VALUES (661, '门头沟区', 29);
INSERT INTO `district_city` VALUES (662, '昌平区', 29);
INSERT INTO `district_city` VALUES (663, '平谷区', 29);
INSERT INTO `district_city` VALUES (664, '密云区', 29);
INSERT INTO `district_city` VALUES (665, '怀柔区', 29);
INSERT INTO `district_city` VALUES (666, '延庆区', 29);
INSERT INTO `district_city` VALUES (667, '东城区', 29);
INSERT INTO `district_city` VALUES (668, '滨海新区', 30);
INSERT INTO `district_city` VALUES (669, '和平区', 30);
INSERT INTO `district_city` VALUES (670, '河东区', 30);
INSERT INTO `district_city` VALUES (671, '河西区', 30);
INSERT INTO `district_city` VALUES (672, '南开区', 30);
INSERT INTO `district_city` VALUES (673, '河北区', 30);
INSERT INTO `district_city` VALUES (674, '红桥区', 30);
INSERT INTO `district_city` VALUES (675, '东丽区', 30);
INSERT INTO `district_city` VALUES (676, '西青区', 30);
INSERT INTO `district_city` VALUES (677, '津南区', 30);
INSERT INTO `district_city` VALUES (678, '北辰区', 30);
INSERT INTO `district_city` VALUES (679, '武清区', 30);
INSERT INTO `district_city` VALUES (680, '宝坻区', 30);
INSERT INTO `district_city` VALUES (681, '静海区', 30);
INSERT INTO `district_city` VALUES (682, '宁河区', 30);
INSERT INTO `district_city` VALUES (683, '蓟州区', 30);
INSERT INTO `district_city` VALUES (684, '万州区', 32);
INSERT INTO `district_city` VALUES (685, '黔江区', 32);
INSERT INTO `district_city` VALUES (686, '涪陵区', 32);
INSERT INTO `district_city` VALUES (687, '渝中区', 32);
INSERT INTO `district_city` VALUES (688, '大渡口区', 32);
INSERT INTO `district_city` VALUES (689, '江北区', 32);
INSERT INTO `district_city` VALUES (690, '沙坪坝区', 32);
INSERT INTO `district_city` VALUES (691, '九龙坡区', 32);
INSERT INTO `district_city` VALUES (692, '南岸区', 32);
INSERT INTO `district_city` VALUES (693, '北碚区', 32);
INSERT INTO `district_city` VALUES (694, '渝北区', 32);
INSERT INTO `district_city` VALUES (695, '巴南区', 32);
INSERT INTO `district_city` VALUES (696, '长寿区', 32);
INSERT INTO `district_city` VALUES (697, '江津区', 32);
INSERT INTO `district_city` VALUES (698, '合川区', 32);
INSERT INTO `district_city` VALUES (699, '永川区', 32);
INSERT INTO `district_city` VALUES (700, '南川区', 32);
INSERT INTO `district_city` VALUES (701, '綦江区', 32);
INSERT INTO `district_city` VALUES (702, '大足区', 32);
INSERT INTO `district_city` VALUES (703, '璧山区', 32);
INSERT INTO `district_city` VALUES (704, '铜梁区', 32);
INSERT INTO `district_city` VALUES (705, '潼南区', 32);
INSERT INTO `district_city` VALUES (706, '荣昌区', 32);
INSERT INTO `district_city` VALUES (707, '开州区', 32);
INSERT INTO `district_city` VALUES (708, '梁平区', 32);
INSERT INTO `district_city` VALUES (709, '武隆区及', 32);
INSERT INTO `district_city` VALUES (710, '黄浦区', 31);
INSERT INTO `district_city` VALUES (711, '徐汇区', 31);
INSERT INTO `district_city` VALUES (712, '长宁区', 31);
INSERT INTO `district_city` VALUES (713, '静安区', 31);
INSERT INTO `district_city` VALUES (714, '普陀区', 31);
INSERT INTO `district_city` VALUES (715, '虹口区', 31);
INSERT INTO `district_city` VALUES (716, '杨浦区', 31);
INSERT INTO `district_city` VALUES (717, '闵行区', 31);
INSERT INTO `district_city` VALUES (718, '宝山区', 31);
INSERT INTO `district_city` VALUES (719, '嘉定区', 31);
INSERT INTO `district_city` VALUES (720, '浦东新区', 31);
INSERT INTO `district_city` VALUES (721, '金山区', 31);
INSERT INTO `district_city` VALUES (722, '松江区', 31);
INSERT INTO `district_city` VALUES (723, '青浦区', 31);
INSERT INTO `district_city` VALUES (724, '奉贤区', 31);
INSERT INTO `district_city` VALUES (725, '崇明区', 31);
INSERT INTO `district_city` VALUES (726, '花地玛堂区', 34);
INSERT INTO `district_city` VALUES (727, '圣安多尼堂区', 34);
INSERT INTO `district_city` VALUES (728, '大堂区', 34);
INSERT INTO `district_city` VALUES (729, '望德堂区', 34);
INSERT INTO `district_city` VALUES (730, '风顺堂区', 34);
INSERT INTO `district_city` VALUES (731, '嘉模堂区', 34);
INSERT INTO `district_city` VALUES (732, '圣方济各堂区', 34);
INSERT INTO `district_city` VALUES (733, '路氹城', 34);
INSERT INTO `district_city` VALUES (734, '香港岛', 33);
INSERT INTO `district_city` VALUES (735, '九龙半岛', 33);
INSERT INTO `district_city` VALUES (736, '新界', 33);
INSERT INTO `district_city` VALUES (737, '台北市', 23);
INSERT INTO `district_city` VALUES (738, '新北市', 23);
INSERT INTO `district_city` VALUES (739, '桃园市', 23);
INSERT INTO `district_city` VALUES (740, '台中市', 23);
INSERT INTO `district_city` VALUES (741, '台南市', 23);
INSERT INTO `district_city` VALUES (742, '高雄市', 23);
INSERT INTO `district_city` VALUES (743, '基隆市', 23);
INSERT INTO `district_city` VALUES (744, '新竹市', 23);
INSERT INTO `district_city` VALUES (745, '嘉义市', 23);

-- ----------------------------
-- Table structure for district_province
-- ----------------------------
DROP TABLE IF EXISTS `district_province`;
CREATE TABLE `district_province`  (
  `pr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '省的主键',
  `pr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '省的名称',
  PRIMARY KEY (`pr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of district_province
-- ----------------------------
INSERT INTO `district_province` VALUES (1, '河北');
INSERT INTO `district_province` VALUES (2, '山西');
INSERT INTO `district_province` VALUES (3, '黑龙江');
INSERT INTO `district_province` VALUES (4, '吉林');
INSERT INTO `district_province` VALUES (5, '辽宁');
INSERT INTO `district_province` VALUES (6, '江苏');
INSERT INTO `district_province` VALUES (7, '浙江');
INSERT INTO `district_province` VALUES (8, '安徽');
INSERT INTO `district_province` VALUES (9, '福建');
INSERT INTO `district_province` VALUES (10, '江西');
INSERT INTO `district_province` VALUES (11, '山东');
INSERT INTO `district_province` VALUES (12, '河南');
INSERT INTO `district_province` VALUES (13, '湖北');
INSERT INTO `district_province` VALUES (14, '湖南');
INSERT INTO `district_province` VALUES (15, '广东');
INSERT INTO `district_province` VALUES (16, '海南');
INSERT INTO `district_province` VALUES (17, '四川');
INSERT INTO `district_province` VALUES (18, '贵州');
INSERT INTO `district_province` VALUES (19, '云南');
INSERT INTO `district_province` VALUES (20, '陕西');
INSERT INTO `district_province` VALUES (21, '甘肃');
INSERT INTO `district_province` VALUES (22, '青海');
INSERT INTO `district_province` VALUES (23, '台湾省');
INSERT INTO `district_province` VALUES (24, '内蒙古');
INSERT INTO `district_province` VALUES (25, '广西');
INSERT INTO `district_province` VALUES (26, '西藏');
INSERT INTO `district_province` VALUES (27, '宁夏');
INSERT INTO `district_province` VALUES (28, '新疆');
INSERT INTO `district_province` VALUES (29, '北京市');
INSERT INTO `district_province` VALUES (30, '天津市');
INSERT INTO `district_province` VALUES (31, '上海市');
INSERT INTO `district_province` VALUES (32, '重庆市');
INSERT INTO `district_province` VALUES (33, '香港特别行政区');
INSERT INTO `district_province` VALUES (34, '澳门特别行政区');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `or_id` int(11) NOT NULL AUTO_INCREMENT,
  `or_number` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `or_buyid` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `or_num` int(11) NOT NULL,
  `or_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `or_house` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `or_tel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `or_yes` int(1) NOT NULL,
  `or_time` datetime NOT NULL,
  `or_deliver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `or_names` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`or_id`) USING BTREE,
  INDEX `cid9`(`or_house` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (78, '0001', '31', 3, '陈亮男', '黑龙江 黑河 哈哈哈哈', '15940576339', 2, '2023-07-10 14:36:56', '大连市', NULL);
INSERT INTO `orders` VALUES (79, '0003', '31', 3, '陈亮男', '黑龙江 黑河 哈哈哈哈', '15940576339', 2, '2023-07-10 14:48:33', '吉林 长春 1234aaabbb', NULL);
INSERT INTO `orders` VALUES (80, '0002', '31', 1, '陈亮', '黑龙江 黑河 哈哈哈哈', '15940276339', 1, '2023-07-10 14:48:50', '吉林 长春 1234aaabbb', '陈亮男');
INSERT INTO `orders` VALUES (81, '0001', '31', 3, '陈亮男', '黑龙江 黑河 哈哈哈哈', '15940576339', 1, '2023-07-10 15:10:37', NULL, '陈亮男');
INSERT INTO `orders` VALUES (82, '0001', '31', 3, '陈亮男', '黑龙江 鹤岗 哈哈哈哈', '15940576339', 2, '2023-07-10 15:31:42', NULL, NULL);
INSERT INTO `orders` VALUES (83, '0001', '31', 3, '陈亮男', '黑龙江 黑河 哈哈哈哈', '15940576339', 1, '2023-07-11 05:41:49', '吉林 松原 1234', '陈亮男');
INSERT INTO `orders` VALUES (84, '0004', '31', 2, '陈亮男', '福建 龙岩 123', '15940576339', 1, '2023-07-12 05:51:13', '江苏 南京 1234', '陈亮男');
INSERT INTO `orders` VALUES (85, '0002', '36', 2, '陈亮男', '辽宁 大连 大连东软信息学院', '15940576339', 2, '2023-07-12 10:37:32', '安徽 宿州 1234', '陈亮男');
INSERT INTO `orders` VALUES (86, '0003', '36', 3, '陈亮男', '辽宁 大连 大连东软信息学院', '15940276339', 2, '2023-07-12 10:39:02', '江苏 南京 1234', '陈亮男');
INSERT INTO `orders` VALUES (87, '0001', '36', 5, '陈亮男', '黑龙江 黑河 123', '15940576339', 2, '2023-07-12 11:25:29', '江苏 南京 1234', '陈亮男');

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller`  (
  `se_id` int(11) NOT NULL AUTO_INCREMENT,
  `se_account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `se_pass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `se_salt` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `se_ban` int(10) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000000000,
  PRIMARY KEY (`se_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES (1, 'admin', '123', NULL, 0000000000);

-- ----------------------------
-- Table structure for seller_address
-- ----------------------------
DROP TABLE IF EXISTS `seller_address`;
CREATE TABLE `seller_address`  (
  `ads_id` int(11) NOT NULL AUTO_INCREMENT,
  `ads_province` int(11) NOT NULL,
  `ads_city` int(11) NOT NULL,
  `ads_house` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_seller` int(11) NOT NULL,
  PRIMARY KEY (`ads_id`) USING BTREE,
  INDEX `cid5`(`ads_province` ASC) USING BTREE,
  INDEX `cid6`(`ads_city` ASC) USING BTREE,
  INDEX `cid7`(`ads_seller` ASC) USING BTREE,
  CONSTRAINT `cid5` FOREIGN KEY (`ads_province`) REFERENCES `district_province` (`pr_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cid6` FOREIGN KEY (`ads_city`) REFERENCES `district_city` (`ci_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cid7` FOREIGN KEY (`ads_seller`) REFERENCES `seller` (`se_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seller_address
-- ----------------------------
INSERT INTO `seller_address` VALUES (5, 6, 334, '1234', 1);
INSERT INTO `seller_address` VALUES (7, 8, 2, '1234', 1);

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `sh_id` int(11) NOT NULL AUTO_INCREMENT,
  `sh_buyer` int(11) NOT NULL,
  `sh_books` int(11) NOT NULL,
  `sh_num` int(11) NOT NULL,
  `sh_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sh_house` int(11) NOT NULL,
  `sh_tel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sh_yes` int(11) NOT NULL,
  `sh_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sh_boname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sh_price` int(11) NOT NULL,
  PRIMARY KEY (`sh_id`) USING BTREE,
  INDEX `cid10`(`sh_house` ASC) USING BTREE,
  INDEX `fk_bo_sh`(`sh_books` ASC) USING BTREE,
  INDEX `fk_bu_sh`(`sh_buyer` ASC) USING BTREE,
  CONSTRAINT `cid10` FOREIGN KEY (`sh_house`) REFERENCES `buyer_address` (`ad_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bo_sh` FOREIGN KEY (`sh_books`) REFERENCES `books` (`bo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bu_sh` FOREIGN KEY (`sh_buyer`) REFERENCES `buyer` (`bu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop
-- ----------------------------

-- ----------------------------
-- Triggers structure for table buyer
-- ----------------------------
DROP TRIGGER IF EXISTS `aaa`;
delimiter ;;
CREATE TRIGGER `aaa` AFTER INSERT ON `buyer` FOR EACH ROW insert into buyerxx(cid,xx_photo) values(new.bu_id,'/upload/03.png')
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
