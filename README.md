# CinemaTicketingManagementSystem-Mysql
影院管理系统,为大二时所写，纯粹的使用servlet和jsp，加上ajax，css，js，jdbc，c3p0连接池等常见等技术。

功能说明：
1、放映厅管理
1.1 放映厅信息添加：包括放映厅的名称、类型（普通、3D、IMAX）、座位数量（可以扩展）.... 等。
1.2 放映厅信息修改。
1.3 所有放映厅信息查询以及每个放映厅信息详情，可以查询到三天前至三天后这段时间里各个时间段每个放映厅放映的电影信息。（建议影片上映和售票功能做完以后再做该功能）

2、影片管理
2.1 影片信息添加：包括电影名称、国家、导演、片长（分钟）、语言（中\英\中英）、内容简介、上映时间、下线时间...... （可扩展增加影片的封面海报信息等等）
2.2 影片信息修改：修改影片相关信息
3、影片上映
选择放映厅、选择上映日期、列出可选择上映的电影、选择电影、输入具体开场时间、自动根据影片时长显示放映结束时间、影片语言种类选择、输入票价，点击【增加上映计划】，则保存一个上映计划。
4、售票
4.1自助购票区域：选择日期（近三天）——>列出这三天有上映计划的影片列表——>选择影片——>列出该影片在该日期的上映计划，每个计划的时间都要列出来以供用户进行选择——>选择了计划以后，选择座位，选择购票数量、输入交款金额、出票。
4.2 列出的影片信息应该包括：名称、导演、时长、简介、（封面）等。
4.3 出票的时候显示该票所有信息，包括时间、电影、场次、票价、条码编号等。
5、查询统计
5.1 指定时间段销售明细查询（需分页）
5.2 统计指定月的影院各个放映厅的上座率
5.3 统计指定时间段内卖座率前五位的影片的上座率
5.4 统计指定年份每个月的销售额以及占全年总销售额的比例
5.5 其他相关统计	
6、会员管理
6.1 会员办理、包括用户信息、会员卡号生成、折扣率选择、有效期等
6.2 购票的时候可以通过输入会员卡号，进行折扣购买



以下是系统运行时的截图
![image](https://github.com/johnxue2013/CinemaTicketingManagementSystem-Mysql/blob/master/src/screenshot/1.jpg)
![image](https://github.com/johnxue2013/CinemaTicketingManagementSystem-Mysql/blob/master/src/screenshot/2.jpg)
![image](https://github.com/johnxue2013/CinemaTicketingManagementSystem-Mysql/blob/master/src/screenshot/3.jpg)
![image](https://github.com/johnxue2013/CinemaTicketingManagementSystem-Mysql/blob/master/src/screenshot/4.jpg)
![image](https://github.com/johnxue2013/CinemaTicketingManagementSystem-Mysql/blob/master/src/screenshot/5.jpg)
![image](https://github.com/johnxue2013/CinemaTicketingManagementSystem-Mysql/blob/master/src/screenshot/6.jpg)
![image](https://github.com/johnxue2013/CinemaTicketingManagementSystem-Mysql/blob/master/src/screenshot/7.jpg)
![image](https://github.com/johnxue2013/CinemaTicketingManagementSystem-Mysql/blob/master/src/screenshot/8.jpg)
![image](https://github.com/johnxue2013/CinemaTicketingManagementSystem-Mysql/blob/master/src/screenshot/9.jpg)
![image](https://github.com/johnxue2013/CinemaTicketingManagementSystem-Mysql/blob/master/src/screenshot/10.jpg)
![image](https://github.com/johnxue2013/CinemaTicketingManagementSystem-Mysql/blob/master/src/screenshot/11.jpg)

