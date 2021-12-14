一、接口说明文档
请访问：
https://docs.apipost.cn/preview/bb8e81a15e48b60f/6bfe45dcd94409ec


二、接口使用说明：

需要node环境 ,所以请务必安装node环境

npm i

node app 


## /注册接口
```text
暂无描述
```
#### 接口状态
> 开发中

#### 接口URL
> http://localhost:3000/register

#### 请求方式
> POST

#### Content-Type
> urlencoded

#### 请求Body参数
参数名 | 示例值 | 参数类型 | 是否必填 | 参数描述
--- | --- | --- | --- | ---
username | 123456 | Text | 是 | 
password | 123456 | Text | 是 | 
#### 预执行脚本
```javascript
暂无预执行脚本
```
#### 后执行脚本
```javascript
暂无后执行脚本
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

#### 接口URL
> http://localhost:3000/login

#### 请求方式
> POST

#### Content-Type
> urlencoded

#### 请求Body参数
参数名 | 示例值 | 参数类型 | 是否必填 | 参数描述
--- | --- | --- | --- | ---
username | 123456 | Text | 是 | 
password | 123456 | Text | 是 | 
#### 预执行脚本
```javascript
暂无预执行脚本
```
#### 后执行脚本
```javascript
暂无后执行脚本
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
参数名 | 示例值 | 参数类型 | 参数描述
--- | --- | --- | ---
message | login failed | Text | 
code | 201 | Text | 
## /用户信息查询接口
```text
根据username 查询用户信息
```
#### 接口状态
> 开发中

#### 接口URL
> http://localhost:3000/user?username=root1

#### 请求方式
> GET

#### Content-Type
> form-data

#### 请求Header参数
参数名 | 示例值 | 参数类型 | 是否必填 | 参数描述
--- | --- | --- | --- | ---
username | lichong | Text | 是 | 
#### 请求Query参数
参数名 | 示例值 | 参数类型 | 是否必填 | 参数描述
--- | --- | --- | --- | ---
username | root1 | Text | 是 | 
#### 请求Body参数
参数名 | 示例值 | 参数类型 | 是否必填 | 参数描述
--- | --- | --- | --- | ---
username | root1 | Text | 是 | 
#### 预执行脚本
```javascript
暂无预执行脚本
```
#### 后执行脚本
```javascript
暂无后执行脚本
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

#### 接口URL
> http://localhost:3000/deluser

#### 请求方式
> POST

#### Content-Type
> urlencoded

#### 请求Body参数
参数名 | 示例值 | 参数类型 | 是否必填 | 参数描述
--- | --- | --- | --- | ---
user_id | 4 | Text | 是 | 
#### 预执行脚本
```javascript
暂无预执行脚本
```
#### 后执行脚本
```javascript
暂无后执行脚本
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

#### 接口URL
> http://localhost:3000/insertpic

#### 请求方式
> POST

#### Content-Type
> urlencoded

#### 请求Body参数
参数名 | 示例值 | 参数类型 | 是否必填 | 参数描述
--- | --- | --- | --- | ---
images | 12321251dsds122.png | Text | 是 | 
#### 预执行脚本
```javascript
暂无预执行脚本
```
#### 后执行脚本
```javascript
暂无后执行脚本
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
