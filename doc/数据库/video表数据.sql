prompt PL/SQL Developer import file
prompt Created on 2017年5月27日 by Home
set feedback off
set define off
prompt Disabling triggers for T_USER...
alter table T_USER disable all triggers;
prompt Disabling triggers for T_ADMIN...
alter table T_ADMIN disable all triggers;
prompt Disabling triggers for T_TEACHER...
alter table T_TEACHER disable all triggers;
prompt Disabling triggers for T_COURSE...
alter table T_COURSE disable all triggers;
prompt Disabling triggers for T_ANNEX...
alter table T_ANNEX disable all triggers;
prompt Disabling triggers for T_CHAPTER...
alter table T_CHAPTER disable all triggers;
prompt Disabling triggers for T_COMMENT...
alter table T_COMMENT disable all triggers;
prompt Disabling triggers for T_MESSAGE...
alter table T_MESSAGE disable all triggers;
prompt Disabling triggers for T_SUBMESSAGE...
alter table T_SUBMESSAGE disable all triggers;
prompt Disabling triggers for T_TEST...
alter table T_TEST disable all triggers;
prompt Disabling triggers for T_VIDEO...
alter table T_VIDEO disable all triggers;
prompt Disabling foreign key constraints for T_ADMIN...
alter table T_ADMIN disable constraint FK_JW5QVC1119NK1YMLVN40V9OLP;
prompt Disabling foreign key constraints for T_TEACHER...
alter table T_TEACHER disable constraint FK_Q93FLHHM6E18RV3IWBHIOK47M;
prompt Disabling foreign key constraints for T_COURSE...
alter table T_COURSE disable constraint FK_HDSM3C8JMEIXNVDRVDOULN3B0;
prompt Disabling foreign key constraints for T_ANNEX...
alter table T_ANNEX disable constraint FK_IJ9TD2TRLIDD8GQMXV52M6GQU;
prompt Disabling foreign key constraints for T_CHAPTER...
alter table T_CHAPTER disable constraint FK_7N55N49OXECT3PCTRHX6VJE1U;
prompt Disabling foreign key constraints for T_COMMENT...
alter table T_COMMENT disable constraint FK_PWL891WJQNOCA7YU4TQEDG879;
alter table T_COMMENT disable constraint FK_QDNHXFMJ5K9IHV3YS8MDU4O0X;
prompt Disabling foreign key constraints for T_SUBMESSAGE...
alter table T_SUBMESSAGE disable constraint FK_ER5F3BSEV79IL9JDKPTAW3W6F;
prompt Disabling foreign key constraints for T_TEST...
alter table T_TEST disable constraint FK_6606RBP0RWCCBSCWXMEHTB97V;
prompt Disabling foreign key constraints for T_VIDEO...
alter table T_VIDEO disable constraint FK_PD2OYSEEXF6MJ5PRWN87MAN76;
prompt Deleting T_VIDEO...
delete from T_VIDEO;
commit;
prompt Deleting T_TEST...
delete from T_TEST;
commit;
prompt Deleting T_SUBMESSAGE...
delete from T_SUBMESSAGE;
commit;
prompt Deleting T_MESSAGE...
delete from T_MESSAGE;
commit;
prompt Deleting T_COMMENT...
delete from T_COMMENT;
commit;
prompt Deleting T_CHAPTER...
delete from T_CHAPTER;
commit;
prompt Deleting T_ANNEX...
delete from T_ANNEX;
commit;
prompt Deleting T_COURSE...
delete from T_COURSE;
commit;
prompt Deleting T_TEACHER...
delete from T_TEACHER;
commit;
prompt Deleting T_ADMIN...
delete from T_ADMIN;
commit;
prompt Deleting T_USER...
delete from T_USER;
commit;
prompt Loading T_USER...
insert into T_USER (USERID, USERNAME, PASSWORD, SEX, EMAIL, ADDRESS, PHONE, VOCATION, STATUS, INTRO, SCHOOL, IMG)
values (5, 'binjf', 'b', '女', '409169399@qq.com', '集美大学', '15659820138', 'teacher', null, '从事软件开发以及软件教育培训多年，有丰富的企业内训经验，对于软件培训有自己独到的见解。2013年2月任视频教学网校长，2015年6月任职传智播客教育集团运营副总裁；从2015年12月开始，负责公司教学产品研发，分管研究院，任职研究院副总裁', null, null);
insert into T_USER (USERID, USERNAME, PASSWORD, SEX, EMAIL, ADDRESS, PHONE, VOCATION, STATUS, INTRO, SCHOOL, IMG)
values (1, 'admin', 'a', '女', '409169399@admin.com', '平南', '15659820136', 'admin', '在职', '做好管理是我的责任!', '平南大学', null);
insert into T_USER (USERID, USERNAME, PASSWORD, SEX, EMAIL, ADDRESS, PHONE, VOCATION, STATUS, INTRO, SCHOOL, IMG)
values (2, 'teacher', 't', '女', '409169399@teacher.com', '厦门', '15659820137', 'teacher', '在职', '教书育人是我的义务！', '厦门大学', null);
insert into T_USER (USERID, USERNAME, PASSWORD, SEX, EMAIL, ADDRESS, PHONE, VOCATION, STATUS, INTRO, SCHOOL, IMG)
values (3, 'student', 's', '女', '409169399@student.com', '集美', '15659820136', 'student', '在校', '学习是第一要务！', '集美大学', null);
insert into T_USER (USERID, USERNAME, PASSWORD, SEX, EMAIL, ADDRESS, PHONE, VOCATION, STATUS, INTRO, SCHOOL, IMG)
values (6, 'user', 'user', '女', '409169399@qq.com', '南平', null, 'student', '学生', null, null, null);
commit;
prompt 5 records loaded
prompt Loading T_ADMIN...
insert into T_ADMIN (ADMINID, USERID)
values (1, 1);
commit;
prompt 1 records loaded
prompt Loading T_TEACHER...
insert into T_TEACHER (TEACHERID, UNIT, USERID)
values (3, 'a', 5);
insert into T_TEACHER (TEACHERID, UNIT, USERID)
values (1, '教育部', 2);
commit;
prompt 2 records loaded
prompt Loading T_COURSE...
insert into T_COURSE (COURSEID, COURSENAME, INTRO, PERIOD, STATUS, CLASSIFY, UPLOADDATE, REMARK, TEACHERID, CLICKNUM)
values (3, '现代汉语', '现代汉语有广狭二义。广义的现代汉语指现代汉民族使用的语言，它不仅包括现代汉民族的共同语，而且包括现代汉语各方面。狭义的现代汉语只指现代汉民族共同语言——普通话。', '2小时30分', '通过', '文学', to_timestamp('08-05-2017 11:17:54.361000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 1, 12);
insert into T_COURSE (COURSEID, COURSENAME, INTRO, PERIOD, STATUS, CLASSIFY, UPLOADDATE, REMARK, TEACHERID, CLICKNUM)
values (4, 'Java', '欢迎来到精彩的Java编程世界！Java语言已经成为当前软件开发行业中主流的开发语言。本课程将介绍Java环境搭建、工具使用、基础语法。带领大家一步一步的踏入Java达人殿堂！Let’s go!', '3小时20分', '通过', '理工', to_timestamp('27-05-2017 21:24:17.109000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'java后续课程JavaEE', 3, 30);
commit;
prompt 2 records loaded
prompt Loading T_ANNEX...
insert into T_ANNEX (ANNEX, PATH, UPLOADCONTENTTYPE, UPLOADFILENAME, COURSEID)
values (3, 'D:\tomcat7\webapps\video\annex', 'application/octet-stream', '论文检测的相关附件.rar', 3);
insert into T_ANNEX (ANNEX, PATH, UPLOADCONTENTTYPE, UPLOADFILENAME, COURSEID)
values (4, 'D:\tomcat7\webapps\video\annex', 'application/octet-stream', '打印.rar', 4);
commit;
prompt 2 records loaded
prompt Loading T_CHAPTER...
insert into T_CHAPTER (CHAPTERID, CHAPTERNAME, COURSEID)
values (3, '第一章 现在汉语的作用', 3);
insert into T_CHAPTER (CHAPTERID, CHAPTERNAME, COURSEID)
values (4, '第二章 语音方面', 3);
insert into T_CHAPTER (CHAPTERID, CHAPTERNAME, COURSEID)
values (5, '第三章 语法方面', 3);
insert into T_CHAPTER (CHAPTERID, CHAPTERNAME, COURSEID)
values (6, '第一章 环境搭建', 4);
insert into T_CHAPTER (CHAPTERID, CHAPTERNAME, COURSEID)
values (8, '第三章 流程控制', 4);
insert into T_CHAPTER (CHAPTERID, CHAPTERNAME, COURSEID)
values (7, '第二章 变量、常量和运算符', 4);
insert into T_CHAPTER (CHAPTERID, CHAPTERNAME, COURSEID)
values (9, '第四章 类和方法', 4);
commit;
prompt 7 records loaded
prompt Loading T_COMMENT...
insert into T_COMMENT (COMMENTID, CONTENT, MARK, USERID, COURSEID, COMMENTDATE)
values (15, '学了这门语言，对普通话有帮助！', null, 2, 3, to_date('08-05-2017 12:21:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into T_COMMENT (COMMENTID, CONTENT, MARK, USERID, COURSEID, COMMENTDATE)
values (16, '这个入门不错！', null, 3, 4, to_date('27-05-2017 22:03:33', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 2 records loaded
prompt Loading T_MESSAGE...
insert into T_MESSAGE (MESSAGEID, CONTENT, MESSAGEDATE, STATUS, FROMWHO, TOWHO, FLAG)
values (6, '老师，如果我想学更多的课程哪里有资源呢？', to_timestamp('27-05-2017 22:04:39.574000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已读', 'student', 'binjf', null);
insert into T_MESSAGE (MESSAGEID, CONTENT, MESSAGEDATE, STATUS, FROMWHO, TOWHO, FLAG)
values (3, '我会好好学习哦！！！！！！！！！！', to_timestamp('08-05-2017 10:08:05.838000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已读', 'student', 'teacher', '0');
insert into T_MESSAGE (MESSAGEID, CONTENT, MESSAGEDATE, STATUS, FROMWHO, TOWHO, FLAG)
values (5, '教师节快乐！', to_timestamp('08-05-2017 11:12:07.403000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已读', 'student', 'teacher', null);
commit;
prompt 3 records loaded
prompt Loading T_SUBMESSAGE...
insert into T_SUBMESSAGE (SUBMESSAGEID, CONTENT, MESSAGEDATE, STATUS, FROMWHO, TOWHO, MESSAGEID)
values (30, '知道了', to_timestamp('08-05-2017 10:43:37.865000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已读', 'student', 'teacher', 3);
insert into T_SUBMESSAGE (SUBMESSAGEID, CONTENT, MESSAGEDATE, STATUS, FROMWHO, TOWHO, MESSAGEID)
values (33, 'iiiiiiiiiiiiiiiiii', to_timestamp('08-05-2017 11:00:30.136000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已读', 'teacher', 'student', 3);
insert into T_SUBMESSAGE (SUBMESSAGEID, CONTENT, MESSAGEDATE, STATUS, FROMWHO, TOWHO, MESSAGEID)
values (34, '学编程的话尚硅谷不错。', to_timestamp('27-05-2017 22:06:03.900000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已读', 'binjf', 'student', 6);
insert into T_SUBMESSAGE (SUBMESSAGEID, CONTENT, MESSAGEDATE, STATUS, FROMWHO, TOWHO, MESSAGEID)
values (28, '加油哦！', to_timestamp('08-05-2017 10:12:50.028000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已读', 'teacher', 'student', 3);
insert into T_SUBMESSAGE (SUBMESSAGEID, CONTENT, MESSAGEDATE, STATUS, FROMWHO, TOWHO, MESSAGEID)
values (29, '好！', to_timestamp('08-05-2017 10:19:58.060000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已读', 'student', 'teacher', 3);
insert into T_SUBMESSAGE (SUBMESSAGEID, CONTENT, MESSAGEDATE, STATUS, FROMWHO, TOWHO, MESSAGEID)
values (31, '你快毕业了', to_timestamp('08-05-2017 10:55:16.178000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已读', 'teacher', 'student', 3);
insert into T_SUBMESSAGE (SUBMESSAGEID, CONTENT, MESSAGEDATE, STATUS, FROMWHO, TOWHO, MESSAGEID)
values (32, 'ooooooo', to_timestamp('08-05-2017 11:00:11.896000', 'dd-mm-yyyy hh24:mi:ss.ff'), '已读', 'teacher', 'student', 3);
commit;
prompt 7 records loaded
prompt Loading T_TEST...
insert into T_TEST (TESTID, TESTNAME, ITEMA, ITEMB, ITEMC, ITEMD, ANSWER, DETAIL, COURSEID)
values (4, '以下哪个不是官话方言？', '吴语', '闽语', '平话', '哑语', 'D', '哑语不是一门语言', 3);
insert into T_TEST (TESTID, TESTNAME, ITEMA, ITEMB, ITEMC, ITEMD, ANSWER, DETAIL, COURSEID)
values (5, '有一段java 应用程序，它的主类名是a1，那么保存它的源文件名可以是', 'a1.java ', 'a1.class', ' a1', '都对', 'A', null, 4);
insert into T_TEST (TESTID, TESTNAME, ITEMA, ITEMB, ITEMC, ITEMD, ANSWER, DETAIL, COURSEID)
values (6, '整型数据类型中，需要内存空间最少的是', 'short ', 'long ', 'int', 'byte', 'D', 'byte是字节', 4);
commit;
prompt 3 records loaded
prompt Loading T_VIDEO...
insert into T_VIDEO (VIDEOID, TITLE, PATH, UPLOADCONTENTTYPE, UPLOADFILENAME, CHAPTERID)
values (4, '语音方面', 'D:\tomcat7\webapps\video\video', 'video/mp4', '05.mp4', 4);
insert into T_VIDEO (VIDEOID, TITLE, PATH, UPLOADCONTENTTYPE, UPLOADFILENAME, CHAPTERID)
values (5, '语法方面', 'D:\tomcat7\webapps\video\video', 'video/mp4', '06.mp4', 5);
insert into T_VIDEO (VIDEOID, TITLE, PATH, UPLOADCONTENTTYPE, UPLOADFILENAME, CHAPTERID)
values (3, '现在汉语的作用', 'D:\tomcat7\webapps\video\video', 'video/mp4', '04.mp4', 3);
insert into T_VIDEO (VIDEOID, TITLE, PATH, UPLOADCONTENTTYPE, UPLOADFILENAME, CHAPTERID)
values (7, '变量、常量和运算符', 'D:\tomcat7\webapps\video\video', 'video/mp4', '02.mp4', 7);
insert into T_VIDEO (VIDEOID, TITLE, PATH, UPLOADCONTENTTYPE, UPLOADFILENAME, CHAPTERID)
values (8, '流程控制', 'D:\tomcat7\webapps\video\video', 'video/mp4', '03.mp4', 8);
insert into T_VIDEO (VIDEOID, TITLE, PATH, UPLOADCONTENTTYPE, UPLOADFILENAME, CHAPTERID)
values (6, '环境搭建', 'D:\tomcat7\webapps\video\video', 'video/mp4', '01.mp4', 6);
insert into T_VIDEO (VIDEOID, TITLE, PATH, UPLOADCONTENTTYPE, UPLOADFILENAME, CHAPTERID)
values (9, '类和方法', 'D:\tomcat7\webapps\video\video', 'video/mp4', '04.mp4', 9);
commit;
prompt 7 records loaded
prompt Enabling foreign key constraints for T_ADMIN...
alter table T_ADMIN enable constraint FK_JW5QVC1119NK1YMLVN40V9OLP;
prompt Enabling foreign key constraints for T_TEACHER...
alter table T_TEACHER enable constraint FK_Q93FLHHM6E18RV3IWBHIOK47M;
prompt Enabling foreign key constraints for T_COURSE...
alter table T_COURSE enable constraint FK_HDSM3C8JMEIXNVDRVDOULN3B0;
prompt Enabling foreign key constraints for T_ANNEX...
alter table T_ANNEX enable constraint FK_IJ9TD2TRLIDD8GQMXV52M6GQU;
prompt Enabling foreign key constraints for T_CHAPTER...
alter table T_CHAPTER enable constraint FK_7N55N49OXECT3PCTRHX6VJE1U;
prompt Enabling foreign key constraints for T_COMMENT...
alter table T_COMMENT enable constraint FK_PWL891WJQNOCA7YU4TQEDG879;
alter table T_COMMENT enable constraint FK_QDNHXFMJ5K9IHV3YS8MDU4O0X;
prompt Enabling foreign key constraints for T_SUBMESSAGE...
alter table T_SUBMESSAGE enable constraint FK_ER5F3BSEV79IL9JDKPTAW3W6F;
prompt Enabling foreign key constraints for T_TEST...
alter table T_TEST enable constraint FK_6606RBP0RWCCBSCWXMEHTB97V;
prompt Enabling foreign key constraints for T_VIDEO...
alter table T_VIDEO enable constraint FK_PD2OYSEEXF6MJ5PRWN87MAN76;
prompt Enabling triggers for T_USER...
alter table T_USER enable all triggers;
prompt Enabling triggers for T_ADMIN...
alter table T_ADMIN enable all triggers;
prompt Enabling triggers for T_TEACHER...
alter table T_TEACHER enable all triggers;
prompt Enabling triggers for T_COURSE...
alter table T_COURSE enable all triggers;
prompt Enabling triggers for T_ANNEX...
alter table T_ANNEX enable all triggers;
prompt Enabling triggers for T_CHAPTER...
alter table T_CHAPTER enable all triggers;
prompt Enabling triggers for T_COMMENT...
alter table T_COMMENT enable all triggers;
prompt Enabling triggers for T_MESSAGE...
alter table T_MESSAGE enable all triggers;
prompt Enabling triggers for T_SUBMESSAGE...
alter table T_SUBMESSAGE enable all triggers;
prompt Enabling triggers for T_TEST...
alter table T_TEST enable all triggers;
prompt Enabling triggers for T_VIDEO...
alter table T_VIDEO enable all triggers;
set feedback on
set define on
prompt Done.
