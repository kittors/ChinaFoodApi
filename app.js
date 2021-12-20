// 加载Express模块
const express = require("express");

// 加载MySQl模块
const mysql = require("mysql");

// 加载MD5模块
// const md5 = require("md5"); //后台放弃MD5加密 加密已经由数据库自动完成，直接插入数据即可

// 加载CORS模块
const cors = require("cors");

//加载fs模块--通过程序方式实时管理文件
const fs = require("fs");

//拖放文件上传
const multer = require("multer");
//命名随机
const uuid = require("uuid");

//body-parser中间件 express的内置中间件可以用来解析JSON格式 二进制格式 文本格式 文本格式
const bodyParser = require("body-parser");
const {
  resourceLimits
} = require("worker_threads");
const res = require("express/lib/response");

// 创建MySQL连接池
const pool = mysql.createPool({
  host: "127.0.0.1", //MySQL服务器地址
  port: 3306, //MySQL服务器端口号
  user: "root", //数据库用户的用户名
  password: "", //数据库用户密码
  database: "ChinaFood", //数据库名称
  connectionLimit: 20, //最大连接数
  charset: "utf8", //数据库服务器的编码方式
});

// 创建服务器对象
const server = express();

// 使用CORS中间件 解决跨域的问题
server.use(
  cors({
    origin: ["http://127.0.0.1:8080", "http://localhost:8080"],
  })
);

//指定监听端口3000
server.listen(3000, () => {
  console.log("server is running...");
});

//静态资源托管
server.use(express.static("./public"));

server.use(
  bodyParser.urlencoded({
    extended: false, //返回的对象是一个键值对，当extended为false的时候，键值对中的值就为'String'或'Array'形式，为true的时候，则可为任何数据类型。
  })
);

// 用户登录接口
server.post("/login", (req, res) => {
  //获取用户名和密码信息
  let email = req.body.email;
  let username = req.body.username;
  let password = req.body.password;
  // SQL语句
  let sql =
    "SELECT * FROM cfood_user WHERE (username=? or email=?) AND password=MD5(?)";
  pool.query(sql, [username, email, password], (error, results) => {
    if (error) throw error;
    if (results.length == 0) {
      //登录失败
      res.send({
        message: "login failed",
        code: 201,
        result: results[0],
      });
    } else {
      //登录成功
      res.send({
        message: "ok",
        code: 200,
        result: results[0],
      });
    }
  });
});

//用户注册接口
server.post("/register", (req, res) => {
  //console.log(md5('12345678'));
  // 获取用户名和密码信息
  let username = req.body.username;
  let password = req.body.password;
  let email = req.body.email;
  //以username为条件进行查找操作，以保证用户名的唯一性
  let sql = "SELECT COUNT(user_id) AS count FROM cfood_user WHERE username=?";
  pool.query(sql, [username], (error, results) => {
    if (error) throw error;
    let count = results[0].count;
    if (count == 0) {
      // 将用户的相关信息插入到数据表
      sql = "INSERT cfood_user(username,password,email) VALUES(?,MD5(?),?)";
      pool.query(sql, [username, password, email], (error, results) => {
        if (error) throw error;
        res.send({
          message: "ok",
          code: 200,
          results,
        });
      });
    } else {
      res.send({
        message: "user exists",
        code: 201,
      });
    }
  });
});

// 获取用户信息接口
server.get("/user", (req, res) => {
  let username = req.query.username;
  let sql = "SELECT * FROM cfood_user WHERE username=?";
  pool.query(sql, [username], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({
        message: "user not exist",
        code: 201,
      });
    } else {
      res.send({
        message: "Get Success",
        code: 200,
        result: result,
      });
    }
  });
});

// 删除用户接口  给超级管理员用的
server.post("/deluser", (req, res) => {
  let user_id = req.body.user_id;
  console.log(user_id);
  let sql = "DELETE FROM cfood_user WHERE user_id=?";
  pool.query(sql, [user_id], (err, result) => {
    if (err) throw err;
    if (result.affectedRows == 0) {
      res.send({
        message: "error",
        code: 201,
      });
    } else {
      res.send({
        message: "Deleted successfully",
        code: 200,
      });
    }
  });
});

//插入头像数据接口
server.post("/insertpic", (req, res) => {
  let path = "/images/avatar/" + req.body.images;
  let sql = "INSERT avatar(images) VALUES(?)";
  let sql2 = `Select images from avatar where images = '${path}'`;
  pool.query(sql2, (err, result) => {
    if (err) throw err;
    // console.log(result.length == 0);
    if (result.length == 0) {
      pool.query(sql, [path], (err, result) => {
        if (err) throw err;
        if (result.affectedRows == 1) {
          res.send({
            msg: "success",
            code: 200,
          });
        } else {
          res.send({
            msg: "Fail",
            code: 201,
          });
        }
      });
    } else {
      res.send({
        msg: "Same pictures exist",
        code: 201,
      });
    }
  });
});

// 头像库接口
server.get("/userpic", (req, res) => {
  let sql = "SELECT * FROM avatar";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send({
      result: result,
    });
  });
});

// 修改用户头像接口  用户登录后获取用户的username 后再去查询
server.post("/updatapic", (req, res) => {
  let sql = "update cfood_user set pic=? where username=?";
  pool.query(sql, [req.body.pic, req.body.username], (err, result) => {
    if (err) throw err;
    res.send({
      msg: "头像已修改",
      code: 200,
    });
  });
});

// 轮播图接口
server.get("/carousel", (req, res) => {
  let sql = "SELECT pic FROM banner";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send({
      msg: "get success",
      code: 200,
      result: result,
    });
  });
});

// 插入文章接口
server.post("/insertartile", (req, res) => {
  let title = req.body.title;
  let articlePic = req.body.articlePic;
  let article_content = req.body.article_content;
  let article_date = req.body.article_date;
  let author_id = req.body.author_id;
  let author_name = req.body.author_name;
  let sql =
    "INSERT author(title,articlePic,article_content,article_date,author_id) VALUES(?)";
  pool.query(
    sql,
    [{
      title,
      articlePic,
      article_content,
      article_date,
      author_id,
      author_name,
    }, ],
    (err, result) => {
      if (err) throw err;
      res.send({
        msg: "insert seccuess",
        code: 200,
        result,
      });
    }
  );
});

// 通过文章id查询文章信息
server.get("/getarticle", (req, res) => {
  let article_id = req.body.article_id;
  let sql = "select * from article where article_id = ?";
  pool.query(sql, [article_id], (err, result) => {
    if (err) throw err;
    res.send({
      msg: "get seccuess",
      code: 200,
      result,
    });
  });
});

// 根据文章id为条件修改文章信息接口
server.post("/updatearticle", (req, res) => {
  let title = req.body.title;
  let articlePic = req.body.articlePic;
  let article_content = req.body.article_content;
  let article_date = req.body.article_date;
  let author_id = req.body.author_id;
  let author_name = req.body.author_name;
  let sql =
    "update article set title=?, articlePic=?,article_content=?,article_date=?,author_id=?,author_name=? where username=?";
  pool.query(
    sql,
    [title, articlePic, article_content, article_date, author_id, author_name],
    (err, result) => {
      if (err) throw err;
      res.send({
        msg: "头像已修改",
        code: 200,
        result,
      });
    }
  );
});

//插入作者信息接口
server.post("/insertauthor", (req, res) => {
  let author_name = req.body.author_name;
  let article_id = req.body.article_id;
  let sql = "INSERT author(author_name,article_id) VALUES(?)";
  pool.query(sql, [author_name, article_id], (err, result) => {
    if (err) throw err;
    res.send({
      msg: "insert seccuess",
      code: 200,
      result,
    });
  });
});

// 修改作者信息接口  只有修改作者的名字的功能  作者名字可以随意的修改 作者的名字不是唯一的
server.post("/updateauthor", (req, res) => {
  let author_id = req.body.author_id;
  let sql = "update author set author_name=? where author_id=?";
  pool.query(sql, [author_id], (err, result) => {
    if (err) throw err;
    res.send({
      msg: "update seccuess",
      code: 200,
      result,
    });
  });
});

// 通过作者名字查询作者的所有信息接口
server.get("/getauthor", (req, res) => {
  let author_name = req.body.author_name;
  let sql = "select * from author where author_name=?";
  pool.query(sql, [author_name], (err, result) => {
    if (err) throw err;
    res.send({
      msg: "get seccuess",
      code: 200,
      result,
    });
  });
});

// 通过作者id查询作者的所有信息接口
server.get("/getauthor_0", (req, res) => {
  let author_id = req.body.author_id;
  let sql = "select * from author where author_id";
  pool.query(sql, [author_id], (err, result) => {
    if (err) throw err;
    res.send({
      msg: "get seccuess",
      code: 200,
      result,
    });
  });
});

// 通过作者id信息查询文章信息表
server.get("/getarticle", (req, res) => {
  let author_id = req.body.author_id;
  let sql = "select * from article where author_id";
  pool.query(sql, [author_id], (err, result) => {
    if (err) throw err;
    res.send({
      msg: "get seccuess",
      code: 200,
      result,
    });
  });
});

// 关注
server.post("/love", (req, res) => {
  let user_id = req.body.user_id;
  let author_id = req.body.author_id;
  let sql = "INSERT INTO follow SET ?";
  pool.query(
    sql,
    [{
      user_id,
      author_id,
    }, ],
    (err, result) => {
      if (err) throw err;
      res.send({
        msg: "关注成功",
        code: 200,
      });
    }
  );
});
// 取消关注
server.post("/dellove", (req, res) => {
  let user_id = req.body.userid;
  let author_id = req.body.authorid;
  let sql = "DELETE FROM follow WHERE user_id=? AND author_id=?";
  pool.query(sql, [user_id, author_id], (err, result) => {
    if (err) throw err;
    res.send({
      msg: "关注已取消",
      code: 200,
    });
  });
});
// 关注与否 --
server.get("/isLove", (req, res) => {
  let user_id = req.body.userid;
  let author_id = req.body.authorid;
  let sql =
    "SELECT id,author_id,user_id FROM follow WHERE user_id=? AND author_id=?";
  pool.query(sql, [user_id, author_id], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({
        code: 201,
        msg: "尚未关注",
      });
    } else {
      res.send({
        code: 200,
        msg: "已关注",
      });
    }
  });
});

// 插入菜品信息
server.post("/insertdishes", (req, res) => {
  let path = "/images/avatar/" + req.body.images;
  let sql =
    "INSERT dishes(dishes_name,dishes_pic,category_name,taste,category,score,steps) VALUES(?,?,?,?,?,?,?,?)";
  pool.query(
    sql,
    [dishes_name, dishes_pic, category_name, taste, category, score, steps],
    (err, result) => {
      if (err) throw err;
      if (result.affectedRows == 1) {
        res.send({
          msg: "success",
          code: 200,
        });
      } else {
        res.send({
          msg: "Fail",
          code: 201,
        });
      }
    }
  );
});

// 根据 菜系 菜品名 菜品类名 菜品味道 菜品评分 模糊搜索搜索菜品信息
server.get("/search", (req, res) => {
  let item = "%" + req.query.item + "%";
  let sql =
    "SELECT * FROM dishes WHERE (category_name LIKE ? or dishes_name LIKE ?  or taste LIKE ? or score LIKE ? or steps LIKE ? or Material LIKE ?) ORDER BY RAND() LIMIT 20";
  pool.query(sql, [item, item, item, item, item, item], (err, result) => {
    if (err) throw err;
    console.log(result, sql);
    if (result.length == 0) {
      res.send({
        code: 0,
        msg: "查询无结果",
      });
    } else {
      res.send({
        code: 1,
        result: result,
      });
    }
  });
});

// 根据 菜系 搜索菜品信息
server.get("/categorySearch", (req, res) => {
  let category_name = "%" + req.query.category_name + "%";
  let sql =
    "SELECT * FROM dishes WHERE category_name LIKE ? ORDER BY RAND() LIMIT 20";
  pool.query(sql, [category_name], (err, result) => {
    if (err) throw err;
    console.log(result, sql);
    if (result.length == 0) {
      res.send({
        code: 0,
        msg: "查询无结果",
      });
    } else {
      res.send({
        code: 1,
        result: result,
      });
    }
  });
});

//根据 菜品名 搜索菜品信息  修改了
server.get("/dishesNameSearch", (req, res) => {
  let dishes_name = "%" + req.query.dishes_name + "%";
  let sql =
    "SELECT * FROM dishes WHERE dishes_name LIKE ? ORDER BY RAND() LIMIT 20";
  pool.query(sql, [dishes_name], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({
        code: 0,
        msg: "查询无结果",
      });
    } else {
      res.send({
        code: 1,
        result: result,
      });
    }
  });
});

//根据 菜品味道 搜索菜品信息
server.get("/tasteSearch", (req, res) => {
  let taste = "%" + req.query.taste + "%";
  let sql = "SELECT * FROM dishes WHERE taste LIKE ? ORDER BY RAND() LIMIT 20";
  pool.query(sql, [taste], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({
        code: 0,
        msg: "查询无结果",
      });
    } else {
      res.send({
        code: 1,
        result: result,
      });
    }
  });
});

//根据 菜品评分 搜索菜品信息
server.get("/scoreSearch", (req, res) => {
  let score = req.query.score;
  let sql = "SELECT * FROM dishes WHERE score = ? ORDER BY RAND() LIMIT 20";
  pool.query(sql, [score], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({
        code: 0,
        msg: "查询无结果",
      });
    } else {
      res.send({
        code: 1,
        result: result,
      });
    }
  });
});

// 根据作者的名字搜索文章信息
server.get("/authorArticleSearch", (req, res) => {
  let author_name = "%" + req.query.authorName + "%";
  let sql =
    "SELECT * FROM article WHERE author_name LIKE ? ORDER BY RAND() LIMIT 20";
  pool.query(sql, [author_name], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({
        code: 0,
        msg: "查询无结果",
      });
    } else {
      res.send({
        code: 1,
        result: result,
      });
    }
  });
});

// 根据文章名关键字搜索文章
server.get("/articleSearch", (req, res) => {
  let title = "%" + req.query.title + "%";
  let sql = "SELECT * FROM article WHERE title LIKE ? ORDER BY RAND() LIMIT 20";
  pool.query(sql, [title], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({
        code: 0,
        msg: "查询无结果",
      });
    } else {
      res.send({
        code: 1,
        result: result,
      });
    }
  });
});

// 菜品分类图标表
server.get("/foodCategory", (req, res) => {
  let sql = "SELECT * FROM food_category";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send({
      result: result,
    });
  });
});

// 获取广告信息
server.get("/advertis", (req, res) => {
  let sql = "SELECT * FROM advertis";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send({
      result: result,
    });
  });
});

// 用户发送反馈
server.post("/newFeedback", (req, res) => {
  let details = req.body.details;
  let user_id = req.body.userId;
  let sql = "INSERT INTO feedback SET ?";
  pool.query(
    sql,
    [{
      user_id,
      details,
    }, ],
    (err, result) => {
      if (err) throw err;
      res.send({
        code: 1,
        msg: "ok",
      });
    }
  );
});

// 删除用户反馈
server.post("/delFeedback", (req, res) => {
  let id = req.body.id;
  let sql = "DELETE FROM feedback WHERE id=?";
  pool.query(sql, [id], (err, results) => {
    if (err) throw err;
    res.send({
      code: 1,
      msg: "地址已删除",
    });
  });
});

// 根据用户id查询用户反馈
server.get("/searchFeedback", (req, res) => {
  let id = req.query.userid;
  let sql = "SELECT * FROM feedback WHERE user_id=?";
  pool.query(sql, [id], (err, result) => {
    if (err) throw err;
    res.send({
      result: result,
    });
  });
});

// 推荐页面接口  会将score分数等于5的筛选出来
server.get("/recommend", (req, res) => {
  let sql =
    "SELECT * FROM dishes WHERE score = 5 ORDER BY RAND() LIMIT 20";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({
        code: 0,
        msg: "查询无结果",
      });
    } else {
      res.send({
        code: 1,
        result: result,
      });
    }
  });
});

// 添加用户收藏接口
server.post("/add_collection", (req, res) => {
  let user_id = req.body.user_id;
  let dishes_id = req.body.dishes_id;
  let num = 0
  let sql1 = "select * from dishes where dishes_id = ?"
  let sql2 = "insert into collection set ?";
  let sql3 = "select * from collection where user_id = ? "
  pool.query(sql3, [user_id], (err, result) => {
    if (err) throw err;
    result.forEach(item => {
      if(item.dishes_id == dishes_id){
        num = 1
      }
    })
    if(num){
      res.send({
      msg:"Same dishes exist",
      code:'201'
      })
    }else{
      pool.query(sql1, [dishes_id],(err, result) => {
            if (err) throw err;
            let data = JSON.stringify(result[0])
            console.log(data)
            pool.query(sql2, [{
              dishes_id,
              user_id,
              data
            }], (err, result) => {
              if (err) throw err;
              if (result.affectedRows == 1) {
                res.send({
                  msg: 'ok',
                  code: 200,
                })
              } else {
                res.send({
                  msg: 'fail',
                  code: 201,
                })
              }
            })
          }
        );
    }
  })
  })

// 查询用户收藏的菜品信息 
server.post("/query_user_collection", (req, res) => {
  let user_id = req.body.user_id;
  let sql = "select * from collection where  user_id = ?";
  pool.query(sql, [user_id], (err, result) => {
    if (err) throw err;
    res.send({
      msg: 'success',
      code: 200,
      result
    })
  });
});