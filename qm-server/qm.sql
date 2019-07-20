#设置客户端连接的编码
SET NAMES UTF8;
#丢弃数据库
DROP DATABASE IF EXISTS qm;
#创建数据库
CREATE DATABASE qm CHARSET=UTF8;
#进入该数据库
USE qm;

#创建保存数据的表
/** 用户信息 **/
CREATE TABLE qm_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(11) NOT NULL,
  upwd VARCHAR(16),
  gender BOOL,
  birthday DATE,
  email VARCHAR(32),
  phone VARCHAR(11),
  user_name VARCHAR(32)   
);

/** 产品品牌 **/
CREATE TABLE qm_brand(
  bid SMALLINT PRIMARY KEY AUTO_INCREMENT,
  bname VARCHAR(12) UNIQUE
);

/** 产品 **/
CREATE TABLE qm_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  ptitle VARCHAR(16),
  pname VARCHAR(64) NOT NULL,
  productId SMALLINT,
  FOREIGN KEY(productId) REFERENCES qm_brand(bid)
);

#插入数据
/** 用户信息 **/
INSERT INTO qm_user VALUES
(NULL,'yiyi','123456',0,'2000-1-20','yiyi@qq.com','18790687250','依依'),
(NULL,'xiao','123456',1,'2000-2-20','xiao@qq.com','18790687251','李晓'),
(NULL,'long','123456',1,'2000-3-20','long@qq.com','18790687252','李龙'),
(NULL,'xixi','123456',0,'2000-4-20','xixi@qq.com','18790687253','兮兮');

/** 产品品牌 **/
INSERT INTO qm_brand VALUES
(1,'珐纯'),
(2,'卡姿兰'),
(3,'Judydoll'),
(4,'自然堂');

/** 产品 **/
INSERT INTO qm_product VALUES
(NULL,'珐纯BB霜','珐纯裸妆粉红BB霜 果妆修颜遮瑕气垫隔离保湿喷雾',1),
(NULL,'珐纯妆前乳','珐纯柔纱矿物质妆前乳 隔离霜保湿防水不脱妆',1),
(NULL,'珐纯隔离霜','珐纯透真隔离霜持久补水保湿控油打底遮瑕平价好用的学生党妆前乳男女',1),
(NULL,'卡姿兰隔离霜','卡姿兰隔离霜女妆前乳妆前打底遮瑕保湿补水滋润平价好用的隔离霜',2),
(NULL,'卡姿兰睫毛膏','卡姿兰睫毛膏防水纤长卷翘不易晕染加长极细持久自然细刷头正品',2),
(NULL,'卡姿兰美妆蛋','卡姿兰美妆蛋彩妆蛋海绵蛋粉扑化妆蛋林允三文鱼粉底扑不吃粉软',2),
(NULL,'Judydoll腮红','Judydoll橘朵单色腮红胭脂显白气质高潮新色高光提亮肤色修容06',3),
(NULL,'JudydoLL唇膏','JudydoLL橘朵恒彩魅泽唇膏灰管口红水润哑光学生712豆沙脏橘南瓜',3),
(NULL,'Judydoll睫毛膏','Judydoll橘朵纤长炫卷翘双头睫毛膏网红防水防汗不晕染网红国货',3),
(NULL,'自然堂冰肌水','自然堂凝时鲜颜冰肌水160ml 滋润型爽肤水补水保湿化妆水专柜正品',4),
(NULL,'自然堂化妆水','自然堂凝时鲜颜冰肌水160ml+60ml淡化细纹补水保湿化妆水滋润爽肤',4),
(NULL,'自然堂乳霜','自然堂凝时休眠霜50g凝时鲜颜肌活霜淡化细纹面乳霜护肤品化妆品',4);