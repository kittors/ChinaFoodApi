// 加载Express模块
const express = require('express')

// 加载MySQl模块 
const mysql = require('mysql')

// 加载MD5模块
const md5 = require('md5');


// 创建MySQL连接池
const pool = mysql.createPool({
  host: '127.0.0.1', //MySQL服务器地址
  port: 3306, //MySQL服务器端口号
  user: 'root', //数据库用户的用户名
  password: '', //数据库用户密码
  database: 'ChinaFood', //数据库名称
  connectionLimit: 20, //最大连接数
  charset: 'utf8' //数据库服务器的编码方式
});

// 加载CORS模块
const cors = require('cors');

// 使用CORS中间件
server.use(cors({
  origin: ['http://localhost:8080', 'http://127.0.0.1:8080']
}));

// 创建服务器对象
const server = express();

server.use(bodyParser.urlencoded({
  extended: false
}));

// 用户登录接口
server.post('/login', (req, res) => {
  //获取用户名和密码信息
  let username = req.body.username;
  let password = req.body.password;
  // SQL语句
  let sql = 'SELECT u_id,u_name,u_password,u_email FROM userlsOnline  WHERE u_name=? AND u_password=MD5(?)';
  pool.query(sql, [username, password], (error, results) => {
    if (error) throw error;
    if (results.length == 0) { //登录失败
      res.send({
        message: 'login failed',
        code: 201
      });
    } else { //登录成功
      res.send({
        message: 'ok',
        code: 200,
        result: results[0]
      });
    }
  });

});

//用户注册接口
server.post('/register', (req, res) => {
  //console.log(md5('12345678'));
  // 获取用户名和密码信息
  let username = req.body.username;
  let password = req.body.password;
  //以username为条件进行查找操作，以保证用户名的唯一性
  let sql = 'SELECT COUNT(u_id) AS count FROM userIsOnline WHERE u_name=?';
  pool.query(sql, [username], (error, results) => {
    if (error) throw error;
    let count = results[0].count;
    if (count == 0) {
      // 将用户的相关信息插入到数据表
      sql = 'INSERT userIsOnline(u_name,u_password) VALUES(?,MD5(?))';
      pool.query(sql, [username, password], (error, results) => {
        if (error) throw error;
        res.send({
          message: 'ok',
          code: 200
        });
      })
    } else {
      res.send({
        message: 'user exists',
        code: 201
      });
    }
  });
});