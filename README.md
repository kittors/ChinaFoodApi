一、数据库设计
http://assets.processon.com/chart_image/61bab1427d9c0868e024f96b.png

二、接口说明文档
请访问：
https://docs.apipost.cn/preview/1e0e9d5a5d8eed97/5efaa4d668e3e312

三、接口使用说明：

需要 node 环境 ,所以请务必安装 node 环境

npm i

node app

## /注册接口

```text
注册接口：http://localhost:3000/register
username  varchar(30)  # 30个字符  唯一
password varchar(32) # 32个字符
email varchar(50)  #50个字符
```

#### 接口状态

> 开发中

#### 接口 URL

> http://localhost:3000/register

#### 请求方式

> POST

#### Content-Type

> urlencoded

#### 请求 Body 参数

| 参数名   | 示例值       | 参数类型 | 是否必填 | 参数描述 |
| -------- | ------------ | -------- | -------- | -------- |
| username | lichong      | Text     | 是       |
| password | lichong      | Text     | 是       |
| email    | 12321@qq.com | Text     | 是       |

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

#### 成功响应示例

```javascript
{
	"message": "ok",
	"code": 200
}
```

#### 失败响应示例

```javascript
{
	"message": "user exists",
	"code": 201
}
```

## /登录接口

```text
登录接口：http://localhost:3000/login
username  varchar(30)  # 30个字符  唯一
password varchar(32) # 32个字符

```

#### 接口状态

> 开发中

#### 接口 URL

> http://localhost:3000/login

#### 请求方式

> POST

#### Content-Type

> urlencoded

#### 请求 Body 参数

| 参数名   | 示例值 | 参数类型 | 是否必填 | 参数描述 |
| -------- | ------ | -------- | -------- | -------- |
| username | 123456 | Text     | 是       |
| password | 123456 | Text     | 是       |

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

#### 成功响应示例

```javascript
{
	"message": "ok",
	"code": 200,
	"result": {
		"user_id": 6,
		"username": "123456",
		"password": "e10adc3949ba59abbe56e057f20f883e",
		"email": "",
		"nickname": null,
		"age": 0,
		"pic": "/images/default.jpg",
		"article_number": 0
	}
}
```

#### 失败响应示例

```javascript
{
	"message": "login failed",
	"code": 201
}
```

| 参数名  | 示例值       | 参数类型 | 参数描述 |
| ------- | ------------ | -------- | -------- |
| message | login failed | Text     |
| code    | 201          | Text     |

## /用户信息查询接口

```text
根据username 查询用户信息
```

#### 接口状态

> 开发中

#### 接口 URL

> http://localhost:3000/user?username=root1

#### 请求方式

> GET

#### Content-Type

> form-data

#### 请求 Header 参数

| 参数名   | 示例值  | 参数类型 | 是否必填 | 参数描述 |
| -------- | ------- | -------- | -------- | -------- |
| username | lichong | Text     | 是       |

#### 请求 Query 参数

| 参数名   | 示例值 | 参数类型 | 是否必填 | 参数描述 |
| -------- | ------ | -------- | -------- | -------- |
| username | root1  | Text     | 是       |

#### 请求 Body 参数

| 参数名   | 示例值 | 参数类型 | 是否必填 | 参数描述 |
| -------- | ------ | -------- | -------- | -------- |
| username | root1  | Text     | 是       |

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

#### 成功响应示例

```javascript
{
	"message": "Get Success",
	"code": 200,
	"result": [
		{
			"user_id": 7,
			"username": "lichong",
			"password": "eb3856714b9ecbfa952e01f7992a4f57",
			"email": "",
			"nickname": null,
			"age": 0,
			"pic": "/images/default.jpg",
			"article_number": 0
		}
	]
}
```

#### 失败响应示例

```javascript
{
	"message": "user not exist",
	"code": 201
}
```

## /用户删除接口

```text
暂定是根据user_id来删除用户，所以使用之前需要先去查询下用户的信息
```

#### 接口状态

> 开发中

#### 接口 URL

> http://localhost:3000/deluser

#### 请求方式

> POST

#### Content-Type

> urlencoded

#### 请求 Body 参数

| 参数名  | 示例值 | 参数类型 | 是否必填 | 参数描述 |
| ------- | ------ | -------- | -------- | -------- |
| user_id | 4      | Text     | 是       |

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

#### 成功响应示例

```javascript
{
	"message": "Deleted successfully",
	"code": 200
}
```

#### 失败响应示例

```javascript
{
	"message": "error",
	"code": 201
}
```

## /头像插入接口

```text
暂无描述
```

#### 接口状态

> 开发中

#### 接口 URL

> http://localhost:3000/insertpic

#### 请求方式

> POST

#### Content-Type

> urlencoded

#### 请求 Body 参数

| 参数名 | 示例值              | 参数类型 | 是否必填 | 参数描述 |
| ------ | ------------------- | -------- | -------- | -------- |
| images | 12321251dsds122.png | Text     | 是       |

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

#### 成功响应示例

```javascript
{
	"msg": "success",
	"code": 200
}
```

#### 失败响应示例

```javascript
{
	"msg": "Same pictures exist",
	"code": 201
}
```

## /查询用头像图片地址接口

```text
能够查询所有的图像表数据
```

#### 接口状态

> 开发中

#### 接口 URL

> http://localhost:3000/userpic

#### 请求方式

> GET

#### Content-Type

> form-data

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

#### 成功响应示例

```javascript
{
	"result": [
		{
			"avatar_id": 1,
			"images": "/images/avatar/12321251dsds122.png"
		}
	]
}
```

## /修改（更新）用户的头像的接口

```text
暂无描述
```

#### 接口状态

> 开发中

#### 接口 URL

> x

#### 请求方式

> POST

#### Content-Type

> form-data

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

## /请求轮播图接口

```text
暂无描述
```

#### 接口状态

> 开发中

#### 接口 URL

> http://localhost:3000/carousel

#### 请求方式

> GET

#### Content-Type

> form-data

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

#### 成功响应示例

```javascript
{
	"msg": "get success",
	"code": 200,
	"result": []
}
```

#### 失败响应示例

```javascript
{
	"msg": "fail",
	"code": 201,
}
```

## /关注接口

```text
普通用户关注作者的用户  所以需要两个列 一个是关注者的user_id，
另一个就是被关注者的author_id
```

#### 接口状态

> 开发中

#### 接口 URL

> http://localhost:3000/love

#### 请求方式

> POST

#### Content-Type

> urlencoded

#### 请求 Body 参数

| 参数名    | 示例值 | 参数类型 | 是否必填 | 参数描述 |
| --------- | ------ | -------- | -------- | -------- |
| user_id   | 1      | Text     | 是       |
| author_id | 1      | Text     | 是       |

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

## /插入文章接口

```text
暂无描述
```

#### 接口状态

> 开发中

#### 接口 URL

> 未填写

#### 请求方式

> POST

#### Content-Type

> form-data

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

## /通过菜系名查询菜品信息

```text
暂无描述
```

#### 接口状态

> 开发中

#### 接口 URL

> http://localhost:3000/categorySearch?category_name=菜

#### 请求方式

> GET

#### Content-Type

> form-data

#### 请求 Query 参数

| 参数名        | 示例值 | 参数类型 | 是否必填 | 参数描述 |
| ------------- | ------ | -------- | -------- | -------- |
| category_name | 菜     | Text     | 是       |

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

#### 成功响应示例

```javascript
{
	"code": 1,
	"result": [
		{
			"dishes_id": 6,
			"dishes_name": "耗油冬瓜",
			"dishes_pic": "/public/food/6.jpg",
			"category_name": "川菜",
			"taste": "咸鲜",
			"category": 7,
			"score": 4,
			"Material": "冬瓜,虾皮.耗油,白糖,生抽,老抽.",
			"steps": "1.准备的原料。;2.冬瓜去皮，去籽切厚片。;3.热锅凉油，下入冬瓜煸炒几十秒。;4.加入虾皮，冬瓜，白糖，生抽，老抽，蚝油。;5.翻炒均匀。;6.加半碗清水烧开。;7.盖小火炖五六分钟就可以。;8.蚝油冬瓜完成。"
		},
		{
			"dishes_id": 7,
			"dishes_name": "肉末冬瓜",
			"dishes_pic": "/public/food/7.jpg",
			"category_name": "川菜",
			"taste": "咸鲜",
			"category": 2,
			"score": 5,
			"Material": "冬瓜,肉末.姜末,蒜末.",
			"steps": "1.准备、冬瓜去皮洗净切片;2.锅中倒入适量油、下入肉末炒至变色;3.下入葱姜末炒香;4.下入冬瓜片炒均匀;5.掺入末过冬瓜的水;6.下入盐、煮至冬瓜熟透即可;7.咸香美味的冬瓜就做好啦。"
		},
		{
			"dishes_id": 9,
			"dishes_name": "酱爆洋葱",
			"dishes_pic": "/public/food/[闽菜]---",
			"category_name": "川菜",
			"taste": "咸香",
			"category": 1,
			"score": 5,
			"Material": "冬瓜.大葱,油,水.盐,酱油.蒜香",
			"steps": "1.冬瓜去皮去籽，切条，大蒜一把。;2.热锅温油，蒜瓣炝锅。;3.冬瓜条入锅翻炒，加半杯水，盖盖子焖炖3分钟。;4.喜欢吃冬瓜原味的就加一点儿盐。;5.喜欢带着酱香味的可淋适量酱油。;6.翻拌均匀，出锅装盘，撒少许香葱粒。;7.蒜烧冬瓜条，清淡爽口又开胃！;"
		},
		{
			"dishes_id": 16,
			"dishes_name": "耗油冬瓜",
			"dishes_pic": "/public/food/6.jpg",
			"category_name": "川菜",
			"taste": "咸鲜",
			"category": 7,
			"score": 4,
			"Material": "冬瓜,虾皮.耗油,白糖,生抽,老抽.",
			"steps": "1.准备的原料。;2.冬瓜去皮，去籽切厚片。;3.热锅凉油，下入冬瓜煸炒几十秒。;4.加入虾皮，冬瓜，白糖，生抽，老抽，蚝油。;5.翻炒均匀。;6.加半碗清水烧开。;7.盖小火炖五六分钟就可以。;8.蚝油冬瓜完成。"
		},
		{
			"dishes_id": 17,
			"dishes_name": "肉末冬瓜",
			"dishes_pic": "/public/food/7.jpg",
			"category_name": "川菜",
			"taste": "咸鲜",
			"category": 2,
			"score": 5,
			"Material": "冬瓜,肉末.姜末,蒜末.",
			"steps": "1.准备、冬瓜去皮洗净切片;2.锅中倒入适量油、下入肉末炒至变色;3.下入葱姜末炒香;4.下入冬瓜片炒均匀;5.掺入末过冬瓜的水;6.下入盐、煮至冬瓜熟透即可;7.咸香美味的冬瓜就做好啦。"
		},
		{
			"dishes_id": 19,
			"dishes_name": "酱爆洋葱",
			"dishes_pic": "/public/food/[闽菜]---",
			"category_name": "川菜",
			"taste": "咸香",
			"category": 1,
			"score": 5,
			"Material": "冬瓜.大葱,油,水.盐,酱油.蒜香",
			"steps": "1.冬瓜去皮去籽，切条，大蒜一把。;2.热锅温油，蒜瓣炝锅。;3.冬瓜条入锅翻炒，加半杯水，盖盖子焖炖3分钟。;4.喜欢吃冬瓜原味的就加一点儿盐。;5.喜欢带着酱香味的可淋适量酱油。;6.翻拌均匀，出锅装盘，撒少许香葱粒。;7.蒜烧冬瓜条，清淡爽口又开胃！;"
		},
		{
			"dishes_id": 26,
			"dishes_name": "耗油冬甲鱼炖汤",
			"dishes_pic": "/public/food/16.jpg",
			"category_name": "川菜",
			"taste": "咸鲜",
			"category": 7,
			"score": 4,
			"Material": "冬瓜,虾皮.耗油,白糖,生抽,老抽.",
			"steps": "1.准备的原料。;2.冬瓜去皮，去籽切厚片。;3.热锅凉油，下入冬瓜煸炒几十秒。;4.加入虾皮，冬瓜，白糖，生抽，老抽，蚝油。;5.翻炒均匀。;6.加半碗清水烧开。;7.盖小火炖五六分钟就可以。;8.蚝油冬瓜完成。"
		},
		{
			"dishes_id": 27,
			"dishes_name": "鸡蛋炒鸡蛋",
			"dishes_pic": "/public/food/17.jpg",
			"category_name": "川菜",
			"taste": "咸鲜",
			"category": 2,
			"score": 5,
			"Material": "冬瓜,肉末.姜末,蒜末.",
			"steps": "1.准备、冬瓜去皮洗净切片;2.锅中倒入适量油、下入肉末炒至变色;3.下入葱姜末炒香;4.下入冬瓜片炒均匀;5.掺入末过冬瓜的水;6.下入盐、煮至冬瓜熟透即可;7.咸香美味的冬瓜就做好啦。"
		},
		{
			"dishes_id": 29,
			"dishes_name": "酱油烧猪蹄",
			"dishes_pic": "/public/food/19.jpg",
			"category_name": "川菜",
			"taste": "咸香",
			"category": 1,
			"score": 5,
			"Material": "冬瓜.大葱,油,水.盐,酱油.蒜香",
			"steps": "1.冬瓜去皮去籽，切条，大蒜一把。;2.热锅温油，蒜瓣炝锅。;3.冬瓜条入锅翻炒，加半杯水，盖盖子焖炖3分钟。;4.喜欢吃冬瓜原味的就加一点儿盐。;5.喜欢带着酱香味的可淋适量酱油。;6.翻拌均匀，出锅装盘，撒少许香葱粒。;7.蒜烧冬瓜条，清淡爽口又开胃！;"
		}
	]
}
```

#### 失败响应示例

```javascript
{
	"code": 0,
	"msg": "查询无结果"
}
```

## /通过味道查询菜品信息

```text
暂无描述
```

#### 接口状态

> 开发中

#### 接口 URL

> http://localhost:3000/tasteSearch?taste=咸

#### 请求方式

> GET

#### Content-Type

> form-data

#### 请求 Query 参数

| 参数名 | 示例值 | 参数类型 | 是否必填 | 参数描述 |
| ------ | ------ | -------- | -------- | -------- |
| taste  | 咸     | Text     | 是       |

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

#### 成功响应示例

```javascript
{
	"code": 1,
	"result": [
		{
			"dishes_id": 1,
			"dishes_name": "西兰花虾仁木耳烧豆腐",
			"dishes_pic": "/public/food/1.jpg",
			"category_name": "浙江菜",
			"taste": "咸鲜",
			"category": 7,
			"score": 5,
			"Material": "虾仁,西兰花,黑木耳,胡萝卜,北豆腐.姜,葱白,淀粉,胡椒粉.油,盐,生抽,料酒",
			"steps": "1.虾仁开背，挑去虾线清洗干净，加盐、料酒、胡椒粉、少许淀粉拌匀放置10分钟。;2.西兰花在淡盐水中清洗干净，黑木耳泡发清洗，北豆腐切片，胡萝卜切片，姜片、葱白切好备用。;3.锅中放油，放入虾仁凉面煎制变色盛出。;4.锅中留余油，煸香葱姜后放入胡萝卜翻炒。;5.放入黑木耳、豆腐，盐和生抽翻炒片刻。;6.放入西兰花，加水烧煮5分钟。;7.放入虾仁烧2分钟即可。;8.成品，营养丰富，汤汁鲜美。"
		},
		{
			"dishes_id": 3,
			"dishes_name": "清香爽口的蒜烧冬瓜条",
			"dishes_pic": "/public/food/3.jpg",
			"category_name": "粤菜",
			"taste": "咸味",
			"category": 7,
			"score": 3,
			"Material": "冬瓜.大葱,油,水.盐,酱油.蒜香",
			"steps": "1.冬瓜去皮去籽，切条，大蒜一把。;2.热锅温油，蒜瓣炝锅。;3.冬瓜条入锅翻炒，加半杯水，盖盖子焖炖3分钟。;4.喜欢吃冬瓜原味的就加一点儿盐。;5.喜欢带着酱香味的可淋适量酱油。;6.翻拌均匀，出锅装盘，撒少许香葱粒。;7.蒜烧冬瓜条，清淡爽口又开胃！;"
		},
		{
			"dishes_id": 4,
			"dishes_name": "冬瓜丸子汤",
			"dishes_pic": "/public/food/4.jpg",
			"category_name": "浙江菜",
			"taste": "咸香",
			"category": 3,
			"score": 5,
			"Material": "冬瓜,猪肉馅.玉米巅峰,香葱末,凉水.耗油,盐,白胡椒粉",
			"steps": "1.冬瓜和肉馅准备好.;2.肉馅中倒入适量蚝油，白胡椒粉，这两种调料都有去腥提鲜的效果，无需再放料酒；;3.想要肉丸抱团不松散，放一小勺玉米淀粉起到粘合效果，也可以放半个到一个鸡蛋清；;4.加少许盐，顺着一个方向搅拌；想要肉丸口感嫩，一定要往肉馅里打水；肉的含水量不一样，所以要少量多次的加凉水，搅拌至肉馅能呈现明显的带拉丝状的漩涡就可以了，静置一会儿再使用，使水完全吃进去，肉丸入水就坚挺不趴了；;5.冬瓜去皮、去籽，切细长薄片；;6.入凉水锅中煮开，肉丸入水前将火力调小，保持微沸状态；;7.取一个小勺，蘸点儿水，挖一勺肉馅，在碗里摔打几下，肉丸表面就很光滑了；;8.将肉丸送入水中，重新舀肉丸再摔打，直到肉勺全部入汤；表面变色后转中大火，煮2分钟，肉丸浮在水面即关火，酌情加香油、香葱末、盐。;9.冬瓜丸子汤，鲜美营养又好吃！"
		},
		{
			"dishes_id": 6,
			"dishes_name": "耗油冬瓜",
			"dishes_pic": "/public/food/6.jpg",
			"category_name": "川菜",
			"taste": "咸鲜",
			"category": 7,
			"score": 4,
			"Material": "冬瓜,虾皮.耗油,白糖,生抽,老抽.",
			"steps": "1.准备的原料。;2.冬瓜去皮，去籽切厚片。;3.热锅凉油，下入冬瓜煸炒几十秒。;4.加入虾皮，冬瓜，白糖，生抽，老抽，蚝油。;5.翻炒均匀。;6.加半碗清水烧开。;7.盖小火炖五六分钟就可以。;8.蚝油冬瓜完成。"
		},
		{
			"dishes_id": 7,
			"dishes_name": "肉末冬瓜",
			"dishes_pic": "/public/food/7.jpg",
			"category_name": "川菜",
			"taste": "咸鲜",
			"category": 2,
			"score": 5,
			"Material": "冬瓜,肉末.姜末,蒜末.",
			"steps": "1.准备、冬瓜去皮洗净切片;2.锅中倒入适量油、下入肉末炒至变色;3.下入葱姜末炒香;4.下入冬瓜片炒均匀;5.掺入末过冬瓜的水;6.下入盐、煮至冬瓜熟透即可;7.咸香美味的冬瓜就做好啦。"
		},
		{
			"dishes_id": 9,
			"dishes_name": "酱爆洋葱",
			"dishes_pic": "/public/food/[闽菜]---",
			"category_name": "川菜",
			"taste": "咸香",
			"category": 1,
			"score": 5,
			"Material": "冬瓜.大葱,油,水.盐,酱油.蒜香",
			"steps": "1.冬瓜去皮去籽，切条，大蒜一把。;2.热锅温油，蒜瓣炝锅。;3.冬瓜条入锅翻炒，加半杯水，盖盖子焖炖3分钟。;4.喜欢吃冬瓜原味的就加一点儿盐。;5.喜欢带着酱香味的可淋适量酱油。;6.翻拌均匀，出锅装盘，撒少许香葱粒。;7.蒜烧冬瓜条，清淡爽口又开胃！;"
		},
		{
			"dishes_id": 11,
			"dishes_name": "西兰花虾仁木耳烧豆腐",
			"dishes_pic": "/public/food/1.jpg",
			"category_name": "浙江菜",
			"taste": "咸鲜",
			"category": 7,
			"score": 5,
			"Material": "虾仁,西兰花,黑木耳,胡萝卜,北豆腐.姜,葱白,淀粉,胡椒粉.油,盐,生抽,料酒",
			"steps": "1.虾仁开背，挑去虾线清洗干净，加盐、料酒、胡椒粉、少许淀粉拌匀放置10分钟。;2.西兰花在淡盐水中清洗干净，黑木耳泡发清洗，北豆腐切片，胡萝卜切片，姜片、葱白切好备用。;3.锅中放油，放入虾仁凉面煎制变色盛出。;4.锅中留余油，煸香葱姜后放入胡萝卜翻炒。;5.放入黑木耳、豆腐，盐和生抽翻炒片刻。;6.放入西兰花，加水烧煮5分钟。;7.放入虾仁烧2分钟即可。;8.成品，营养丰富，汤汁鲜美。"
		},
		{
			"dishes_id": 13,
			"dishes_name": "清香爽口的蒜烧冬瓜条",
			"dishes_pic": "/public/food/3.jpg",
			"category_name": "粤菜",
			"taste": "咸味",
			"category": 7,
			"score": 3,
			"Material": "冬瓜.大葱,油,水.盐,酱油.蒜香",
			"steps": "1.冬瓜去皮去籽，切条，大蒜一把。;2.热锅温油，蒜瓣炝锅。;3.冬瓜条入锅翻炒，加半杯水，盖盖子焖炖3分钟。;4.喜欢吃冬瓜原味的就加一点儿盐。;5.喜欢带着酱香味的可淋适量酱油。;6.翻拌均匀，出锅装盘，撒少许香葱粒。;7.蒜烧冬瓜条，清淡爽口又开胃！;"
		},
		{
			"dishes_id": 14,
			"dishes_name": "冬瓜丸子汤",
			"dishes_pic": "/public/food/4.jpg",
			"category_name": "浙江菜",
			"taste": "咸香",
			"category": 3,
			"score": 5,
			"Material": "冬瓜,猪肉馅.玉米巅峰,香葱末,凉水.耗油,盐,白胡椒粉",
			"steps": "1.冬瓜和肉馅准备好.;2.肉馅中倒入适量蚝油，白胡椒粉，这两种调料都有去腥提鲜的效果，无需再放料酒；;3.想要肉丸抱团不松散，放一小勺玉米淀粉起到粘合效果，也可以放半个到一个鸡蛋清；;4.加少许盐，顺着一个方向搅拌；想要肉丸口感嫩，一定要往肉馅里打水；肉的含水量不一样，所以要少量多次的加凉水，搅拌至肉馅能呈现明显的带拉丝状的漩涡就可以了，静置一会儿再使用，使水完全吃进去，肉丸入水就坚挺不趴了；;5.冬瓜去皮、去籽，切细长薄片；;6.入凉水锅中煮开，肉丸入水前将火力调小，保持微沸状态；;7.取一个小勺，蘸点儿水，挖一勺肉馅，在碗里摔打几下，肉丸表面就很光滑了；;8.将肉丸送入水中，重新舀肉丸再摔打，直到肉勺全部入汤；表面变色后转中大火，煮2分钟，肉丸浮在水面即关火，酌情加香油、香葱末、盐。;9.冬瓜丸子汤，鲜美营养又好吃！"
		},
		{
			"dishes_id": 16,
			"dishes_name": "耗油冬瓜",
			"dishes_pic": "/public/food/6.jpg",
			"category_name": "川菜",
			"taste": "咸鲜",
			"category": 7,
			"score": 4,
			"Material": "冬瓜,虾皮.耗油,白糖,生抽,老抽.",
			"steps": "1.准备的原料。;2.冬瓜去皮，去籽切厚片。;3.热锅凉油，下入冬瓜煸炒几十秒。;4.加入虾皮，冬瓜，白糖，生抽，老抽，蚝油。;5.翻炒均匀。;6.加半碗清水烧开。;7.盖小火炖五六分钟就可以。;8.蚝油冬瓜完成。"
		},
		{
			"dishes_id": 17,
			"dishes_name": "肉末冬瓜",
			"dishes_pic": "/public/food/7.jpg",
			"category_name": "川菜",
			"taste": "咸鲜",
			"category": 2,
			"score": 5,
			"Material": "冬瓜,肉末.姜末,蒜末.",
			"steps": "1.准备、冬瓜去皮洗净切片;2.锅中倒入适量油、下入肉末炒至变色;3.下入葱姜末炒香;4.下入冬瓜片炒均匀;5.掺入末过冬瓜的水;6.下入盐、煮至冬瓜熟透即可;7.咸香美味的冬瓜就做好啦。"
		},
		{
			"dishes_id": 19,
			"dishes_name": "酱爆洋葱",
			"dishes_pic": "/public/food/[闽菜]---",
			"category_name": "川菜",
			"taste": "咸香",
			"category": 1,
			"score": 5,
			"Material": "冬瓜.大葱,油,水.盐,酱油.蒜香",
			"steps": "1.冬瓜去皮去籽，切条，大蒜一把。;2.热锅温油，蒜瓣炝锅。;3.冬瓜条入锅翻炒，加半杯水，盖盖子焖炖3分钟。;4.喜欢吃冬瓜原味的就加一点儿盐。;5.喜欢带着酱香味的可淋适量酱油。;6.翻拌均匀，出锅装盘，撒少许香葱粒。;7.蒜烧冬瓜条，清淡爽口又开胃！;"
		}
	]
}
```

#### 失败响应示例

```javascript
{
	"code": 0,
	"msg": "查询无结果"
}
```

## /通过菜品名字模糊查询

```text
暂无描述
```

#### 接口状态

> 开发中

#### 接口 URL

> http://localhost:3000/dishesNameSearch?dishes_name=啥

#### 请求方式

> GET

#### Content-Type

> form-data

#### 请求 Query 参数

| 参数名      | 示例值 | 参数类型 | 是否必填 | 参数描述 |
| ----------- | ------ | -------- | -------- | -------- |
| dishes_name | 啥     | Text     | 是       |

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

#### 成功响应示例

```javascript
{
	"code": 1,
	"result": [
		{
			"dishes_id": 25,
			"dishes_name": "黄金炸小土豆",
			"dishes_pic": "/public/food/15.jpg",
			"category_name": "徽菜",
			"taste": "清淡",
			"category": 2,
			"score": 5,
			"Material": "海带,冬瓜.味精,大豆油.",
			"steps": "1.冬瓜洗净，去皮，切片。;2.盐渍海带提前浸泡一晚，去掉咸味，洗净，切成和冬瓜差不多的片。;3.炒锅烧热，倒油，放入冬瓜和海带翻炒。;4.加入味增。;5.加入适量水，搅拌均匀。;6.待冬瓜和海带煮熟后，加入葱花，搅拌均匀。"
		}
	]
}
```

#### 失败响应示例

```javascript
{
	"code": 0,
	"msg": "查询无结果"
}
```

## /通过菜品评分模糊查询

```text
评分的分数 1-5分  5分就是推荐菜品
```

#### 接口状态

> 开发中

#### 接口 URL

> http://localhost:3000/scoreSearch?score=9

#### 请求方式

> GET

#### Content-Type

> form-data

#### 请求 Query 参数

| 参数名 | 示例值 | 参数类型 | 是否必填 | 参数描述 |
| ------ | ------ | -------- | -------- | -------- |
| score  | 9      | Text     | 是       |

#### 预执行脚本

```javascript
暂无预执行脚本;
```

#### 后执行脚本

```javascript
暂无后执行脚本;
```

#### 成功响应示例

```javascript
{
	"code": 1,
	"result": [
		{
			"dishes_id": 1,
			"dishes_name": "西兰花虾仁木耳烧豆腐",
			"dishes_pic": "/public/food/1.jpg",
			"category_name": "浙江菜",
			"taste": "咸鲜",
			"category": 7,
			"score": 5,
			"Material": "虾仁,西兰花,黑木耳,胡萝卜,北豆腐.姜,葱白,淀粉,胡椒粉.油,盐,生抽,料酒",
			"steps": "1.虾仁开背，挑去虾线清洗干净，加盐、料酒、胡椒粉、少许淀粉拌匀放置10分钟。;2.西兰花在淡盐水中清洗干净，黑木耳泡发清洗，北豆腐切片，胡萝卜切片，姜片、葱白切好备用。;3.锅中放油，放入虾仁凉面煎制变色盛出。;4.锅中留余油，煸香葱姜后放入胡萝卜翻炒。;5.放入黑木耳、豆腐，盐和生抽翻炒片刻。;6.放入西兰花，加水烧煮5分钟。;7.放入虾仁烧2分钟即可。;8.成品，营养丰富，汤汁鲜美。"
		},
		{
			"dishes_id": 4,
			"dishes_name": "冬瓜丸子汤",
			"dishes_pic": "/public/food/4.jpg",
			"category_name": "浙江菜",
			"taste": "咸香",
			"category": 3,
			"score": 5,
			"Material": "冬瓜,猪肉馅.玉米巅峰,香葱末,凉水.耗油,盐,白胡椒粉",
			"steps": "1.冬瓜和肉馅准备好.;2.肉馅中倒入适量蚝油，白胡椒粉，这两种调料都有去腥提鲜的效果，无需再放料酒；;3.想要肉丸抱团不松散，放一小勺玉米淀粉起到粘合效果，也可以放半个到一个鸡蛋清；;4.加少许盐，顺着一个方向搅拌；想要肉丸口感嫩，一定要往肉馅里打水；肉的含水量不一样，所以要少量多次的加凉水，搅拌至肉馅能呈现明显的带拉丝状的漩涡就可以了，静置一会儿再使用，使水完全吃进去，肉丸入水就坚挺不趴了；;5.冬瓜去皮、去籽，切细长薄片；;6.入凉水锅中煮开，肉丸入水前将火力调小，保持微沸状态；;7.取一个小勺，蘸点儿水，挖一勺肉馅，在碗里摔打几下，肉丸表面就很光滑了；;8.将肉丸送入水中，重新舀肉丸再摔打，直到肉勺全部入汤；表面变色后转中大火，煮2分钟，肉丸浮在水面即关火，酌情加香油、香葱末、盐。;9.冬瓜丸子汤，鲜美营养又好吃！"
		},
		{
			"dishes_id": 5,
			"dishes_name": "海带冬瓜味增汤",
			"dishes_pic": "/public/food/5.jpg",
			"category_name": "徽菜",
			"taste": "清淡",
			"category": 2,
			"score": 5,
			"Material": "海带,冬瓜.味精,大豆油.",
			"steps": "1.冬瓜洗净，去皮，切片。;2.盐渍海带提前浸泡一晚，去掉咸味，洗净，切成和冬瓜差不多的片。;3.炒锅烧热，倒油，放入冬瓜和海带翻炒。;4.加入味增。;5.加入适量水，搅拌均匀。;6.待冬瓜和海带煮熟后，加入葱花，搅拌均匀。"
		},
		{
			"dishes_id": 7,
			"dishes_name": "肉末冬瓜",
			"dishes_pic": "/public/food/7.jpg",
			"category_name": "川菜",
			"taste": "咸鲜",
			"category": 2,
			"score": 5,
			"Material": "冬瓜,肉末.姜末,蒜末.",
			"steps": "1.准备、冬瓜去皮洗净切片;2.锅中倒入适量油、下入肉末炒至变色;3.下入葱姜末炒香;4.下入冬瓜片炒均匀;5.掺入末过冬瓜的水;6.下入盐、煮至冬瓜熟透即可;7.咸香美味的冬瓜就做好啦。"
		},
		{
			"dishes_id": 8,
			"dishes_name": "茄汁冬瓜",
			"dishes_pic": "/public/food/8.jpg",
			"category_name": "徽菜",
			"taste": "清淡",
			"category": 7,
			"score": 5,
			"Material": "番茄,冬瓜,葱.油,盐,蔬之鲜,水.",
			"steps": "1.所需食材准备就绪;2.冬瓜去皮切块;3.番茄改刀;4.葱切碎备用;5.锅中入油烧热倒入葱爆香;6.加入冬瓜;7.放入番茄加少许蔬之鲜调味;8.加水煮沸转小火煮炖十五分钟;9.加盐调味，入味关火;10.家常低脂菜，美味又健康;11.成品图"
		},
		{
			"dishes_id": 9,
			"dishes_name": "酱爆洋葱",
			"dishes_pic": "/public/food/[闽菜]---",
			"category_name": "川菜",
			"taste": "咸香",
			"category": 1,
			"score": 5,
			"Material": "冬瓜.大葱,油,水.盐,酱油.蒜香",
			"steps": "1.冬瓜去皮去籽，切条，大蒜一把。;2.热锅温油，蒜瓣炝锅。;3.冬瓜条入锅翻炒，加半杯水，盖盖子焖炖3分钟。;4.喜欢吃冬瓜原味的就加一点儿盐。;5.喜欢带着酱香味的可淋适量酱油。;6.翻拌均匀，出锅装盘，撒少许香葱粒。;7.蒜烧冬瓜条，清淡爽口又开胃！;"
		},
		{
			"dishes_id": 10,
			"dishes_name": "妈妈的拿手菜",
			"dishes_pic": "/public/food/【传统闽菜荔枝",
			"category_name": "浙江菜",
			"taste": "清淡",
			"category": 5,
			"score": 5,
			"Material": "冬瓜.大葱,油,水.盐,酱油.蒜香",
			"steps": "1.冬瓜去皮去籽，切条，大蒜一把。;2.热锅温油，蒜瓣炝锅。;3.冬瓜条入锅翻炒，加半杯水，盖盖子焖炖3分钟。;4.喜欢吃冬瓜原味的就加一点儿盐。;5.喜欢带着酱香味的可淋适量酱油。;6.翻拌均匀，出锅装盘，撒少许香葱粒。;7.蒜烧冬瓜条，清淡爽口又开胃！;"
		},
		{
			"dishes_id": 11,
			"dishes_name": "西兰花虾仁木耳烧豆腐",
			"dishes_pic": "/public/food/1.jpg",
			"category_name": "浙江菜",
			"taste": "咸鲜",
			"category": 7,
			"score": 5,
			"Material": "虾仁,西兰花,黑木耳,胡萝卜,北豆腐.姜,葱白,淀粉,胡椒粉.油,盐,生抽,料酒",
			"steps": "1.虾仁开背，挑去虾线清洗干净，加盐、料酒、胡椒粉、少许淀粉拌匀放置10分钟。;2.西兰花在淡盐水中清洗干净，黑木耳泡发清洗，北豆腐切片，胡萝卜切片，姜片、葱白切好备用。;3.锅中放油，放入虾仁凉面煎制变色盛出。;4.锅中留余油，煸香葱姜后放入胡萝卜翻炒。;5.放入黑木耳、豆腐，盐和生抽翻炒片刻。;6.放入西兰花，加水烧煮5分钟。;7.放入虾仁烧2分钟即可。;8.成品，营养丰富，汤汁鲜美。"
		},
		{
			"dishes_id": 14,
			"dishes_name": "冬瓜丸子汤",
			"dishes_pic": "/public/food/4.jpg",
			"category_name": "浙江菜",
			"taste": "咸香",
			"category": 3,
			"score": 5,
			"Material": "冬瓜,猪肉馅.玉米巅峰,香葱末,凉水.耗油,盐,白胡椒粉",
			"steps": "1.冬瓜和肉馅准备好.;2.肉馅中倒入适量蚝油，白胡椒粉，这两种调料都有去腥提鲜的效果，无需再放料酒；;3.想要肉丸抱团不松散，放一小勺玉米淀粉起到粘合效果，也可以放半个到一个鸡蛋清；;4.加少许盐，顺着一个方向搅拌；想要肉丸口感嫩，一定要往肉馅里打水；肉的含水量不一样，所以要少量多次的加凉水，搅拌至肉馅能呈现明显的带拉丝状的漩涡就可以了，静置一会儿再使用，使水完全吃进去，肉丸入水就坚挺不趴了；;5.冬瓜去皮、去籽，切细长薄片；;6.入凉水锅中煮开，肉丸入水前将火力调小，保持微沸状态；;7.取一个小勺，蘸点儿水，挖一勺肉馅，在碗里摔打几下，肉丸表面就很光滑了；;8.将肉丸送入水中，重新舀肉丸再摔打，直到肉勺全部入汤；表面变色后转中大火，煮2分钟，肉丸浮在水面即关火，酌情加香油、香葱末、盐。;9.冬瓜丸子汤，鲜美营养又好吃！"
		},
		{
			"dishes_id": 15,
			"dishes_name": "海带冬瓜味增汤",
			"dishes_pic": "/public/food/5.jpg",
			"category_name": "徽菜",
			"taste": "清淡",
			"category": 2,
			"score": 5,
			"Material": "海带,冬瓜.味精,大豆油.",
			"steps": "1.冬瓜洗净，去皮，切片。;2.盐渍海带提前浸泡一晚，去掉咸味，洗净，切成和冬瓜差不多的片。;3.炒锅烧热，倒油，放入冬瓜和海带翻炒。;4.加入味增。;5.加入适量水，搅拌均匀。;6.待冬瓜和海带煮熟后，加入葱花，搅拌均匀。"
		},
		{
			"dishes_id": 17,
			"dishes_name": "肉末冬瓜",
			"dishes_pic": "/public/food/7.jpg",
			"category_name": "川菜",
			"taste": "咸鲜",
			"category": 2,
			"score": 5,
			"Material": "冬瓜,肉末.姜末,蒜末.",
			"steps": "1.准备、冬瓜去皮洗净切片;2.锅中倒入适量油、下入肉末炒至变色;3.下入葱姜末炒香;4.下入冬瓜片炒均匀;5.掺入末过冬瓜的水;6.下入盐、煮至冬瓜熟透即可;7.咸香美味的冬瓜就做好啦。"
		},
		{
			"dishes_id": 18,
			"dishes_name": "茄汁冬瓜",
			"dishes_pic": "/public/food/8.jpg",
			"category_name": "徽菜",
			"taste": "清淡",
			"category": 7,
			"score": 5,
			"Material": "番茄,冬瓜,葱.油,盐,蔬之鲜,水.",
			"steps": "1.所需食材准备就绪;2.冬瓜去皮切块;3.番茄改刀;4.葱切碎备用;5.锅中入油烧热倒入葱爆香;6.加入冬瓜;7.放入番茄加少许蔬之鲜调味;8.加水煮沸转小火煮炖十五分钟;9.加盐调味，入味关火;10.家常低脂菜，美味又健康;11.成品图"
		}
	]
}
```

#### 失败响应示例

```javascript
{
	"code": 0,
	"msg": "查询无结果"
}
```
