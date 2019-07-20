//引入express
const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//创建路由器对象
var router=express.Router();

//1.登陆接口 post
router.post("/login",(req,res)=>{
	var $uname=req.body.uname;
	var $upwd=req.body.upwd;
	if(!$uname){
		res.send("用户名为空");
		return;
	}
	if(!$upwd){
		res.send("密码为空");
		return;
	}
	var sql="select * from qm_user where uname=? and upwd=?";
	pool.query(sql,[$uname,$upwd],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send("登陆成功");
		}else{
			res.send("用户名或密码错误");
		}
	});
});
//2.用户列表接口 userlist  get
router.get("/userlist",(req,res)=>{
	var sql="select * from qm_user";
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send(result);
	});
});

//删除用户 deluser get
router.get("/deluser",(req,res)=>{
	var $uid=req.query.uid;
	console.log($uid);
	if(!$uid){
		res.send("uid不存在");
		return;
	}
	var sql="delete from qm_user where uid=?";
	pool.query(sql,[$uid],(err,result)=>{
		if(err) throw err;
		res.send("1");//1表示删除成功
	});
});

//根据uid查询用户详细信息
router.get("/query",(req,res)=>{
	var $uid=req.query.uid;
	if(!$uid){
		res.send("uid不存在");
		return;
	}
	var sql="select * from qm_user where uid=?";
	pool.query(sql,[$uid],(err,result)=>{
		if(result.length>0){
			res.send(result[0]);
		}else{
			res.send("没有查到用户信息");
		}
	});
});

//修改接口 update post
router.post("/update",(req,res)=>{
	var $uid=req.body.uid;
	var $uname=req.body.uname;
	var $email=req.body.email;
	var $phone=req.body.phone;
	var $user_name=req.body.user_name;
	var $gender=req.body.gender;
	var $upwd=req.body.upwd;
	if(!$uname){res.send("用户名为空");return;}
	if(!$upwd){res.send("密码名为空");return;}
	if(!$gender){res.send("性别名为空");return;}
	if(!$phone){res.send("联系方式为空");return;}
	if(!$email){res.send("邮箱为空");return;}
	if(!$uid){res.send("uid为空");return;}
	if(!$user_name){res.send("真实姓名为空");return;}
	var sql="update qm_user set uname=?,"
	+"upwd=?,email=?,phone=?,user_name=?,"
	+"gender=? where uid=?";
	pool.query(sql,
		[$uname,$upwd,$email,$phone
		,$user_name,$gender,$uid],
		(err,result)=>{
		if(err) throw err;
		//跳转回list页面
		res.send("1");//1就是修改成功
	});
});

//导出路由器
module.exports=router;