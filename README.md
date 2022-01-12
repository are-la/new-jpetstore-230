# new-jpetstore-230
CSU SE 2006 CM&amp;ZZT&amp;LYX Java Web

## 团队简介
中南大学 软件工程 2006班 


组长CM

组员ZZT、LYX

## 项目简介

petstore

## 团队分工

CM: user

ZZT: cart

LYX: log

## 团队日志

2021.11.1 

ALL:搭建项目框架，实现除购物车之外基本功能。

CM:创建repo，制定规范。

2021.11.2

CM: 
* 确认项目分工。
* 实现购物车功能。

2021.11.4~2021.11.5

CM:
* 完成用户模块
* 完成日志模块
* 更改购物车与订单模块

2022.1.5~2021.1.6

CM:
* 完成账号管理模块：在新建账号和修改账号信息页面上用ajax技术进行表单验证，即“判断用户是否已存在”
* 完成查询商品功能：在主页面右上角的查询商品功能中添加自动补全功能

2022.1.10~2022.1.11
CM:
* 完成代码的融合
* 调试并debug，解决项目现有的问题

## Development environment setup

### Requirements

- JDK 8+
- Tomcat
- MySQL
- Intellij IDEA

### Steps

Install `Smart Tomcat` in IDEA and click edit Run Configuration, add a Tomcat configuration. The `Context Path` must be set to `/`.

Note: If you're using Tomcat 9+, you may get `org.apache.jasper.JasperException` error. You can import JSTL module solve this problem by following this [answer](https://stackoverflow.com/a/4928309/9892882).
The JSTL library for Tomcat 9 is also in the `lib` directory of the project. You can import them on Project Structure.

Create a database names `myjpetstore` in MySQL Client.

```mysql
create database myjpetstore;
```

Import SQL to the database. The SQL file is in the project folder.

```shell
$ mysql -u root myjpetstore < myjpetstore.sql
```

Configure MySQL connection setting in `src/org/mypetstore/persistence/DBUtil.java`.

```java
private static String connectionString = "jdbc:mysql://localhost:3306/myjpetstore?useUnicode=true&characterEncoding=utf8";
private static String username = "root";
private static String password = "";
```

Now you can click the run button in the upper-right corner of the window to start the program. 