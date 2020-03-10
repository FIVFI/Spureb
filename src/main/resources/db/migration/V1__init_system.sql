CREATE DATABASE IF NOT EXISTS a_spureb_box DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_general_ci;

use a_spureb_box;

drop table if exists sys_user;
drop table if exists sys_label;
drop table if exists sys_menu;
drop table if exists sys_team;
drop table if exists link_user_label;
drop table if exists link_user_menu;
drop table if exists link_team_user;

-- 团队
create table sys_team
(
    id             int(10) primary key auto_increment comment '主键',
    team_name   varchar(16)            not null comment '公司名称',
    team_type   tinyint(1)  not null comment '公司类型',
    by_author       varchar(16)            not null comment '创建人',
    team_status      tinyint(1)                      default 1 comment '是否可用 true: 1, false: 0',
    create_date    datetime               not null default current_timestamp comment '创建时间',
    update_date    datetime                        default null on update current_timestamp comment '修改时间',
    unique (team_name, by_author)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '团队信息';

-- 人员
CREATE TABLE sys_user
(
    id            int(10) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    user_account  VARCHAR(16)  NOT NULL COMMENT '账号',
    password VARCHAR(100) NOT NULL COMMENT '密码',
    user_name     varchar(20)  not null comment '姓名',
    user_phone    VARCHAR(11) COMMENT '手机号码',
    user_mail   VARCHAR(30) COMMENT '用户邮箱',
    available     TINYINT(1)            DEFAULT 1 COMMENT '是否可用 true: 1, false: 0',
    can_delete    tinyint(1)            default 1 comment '是否可删 true: 1, false: 0',
    create_date   DATETIME     not null DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_date   DATETIME              DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    UNIQUE (user_account)
) ENGINE = INNODB
  CHARSET utf8mb4
  COLLATE utf8mb4_general_ci COMMENT '人员信息';

-- 角色
create table sys_label
(
    id          int(10) primary key auto_increment comment '主键',
    label_name   varchar(20) not null comment '角色名称',
    label_code   varchar(20) not null comment '角色代号',
    label_seq    int(10)              default 1 comment '角色排序',
    available   tinyint(1)           default 1 comment '是否可用 true: 1, false: 0',
    can_delete  tinyint(1)           default 1 comment '是否可删 true: 1, false: 0',
    create_date datetime    not null default current_timestamp comment '创建时间',
    update_date datetime             default null on update current_timestamp comment '修改时间',
    unique (label_name),
    unique (label_code)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '标签信息信息';

-- 功能菜单
create table sys_menu
(
    id          int(10) primary key auto_increment comment '主键',
    menu_name   varchar(20)             not null comment '菜单名称',
    menu_code   varchar(20)                      comment '菜单代号',
    menu_type   tinyint(1) not null comment '菜单类型',
    menu_url    varchar(100)                     default null comment '菜单地址',
    menu_font   varchar(20)             not null default 'fa fa-bars' comment '菜单图标',
    menu_seq    int(10)                          default 1 comment '菜单排序',
    parent_id   int(10)                          default null comment '父菜单',
    available   tinyint(1)                       default 1 comment '是否可用 true: 1, false: 0',
    can_delete  tinyint(1)                       default 0 comment '是否可删 true: 1, false: 0',
    create_date datetime                not null default current_timestamp comment '创建时间',
    update_date datetime                         default null on update current_timestamp comment '修改时间',
    unique (menu_name),
    unique (menu_code)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '功能菜单信息';

-- 用户角色
create table link_user_label
(
    user_id int(10)  not null comment '用户主键id',
    label_id      int(10)  not null comment '标签主键id',
    create_date  datetime not null default current_timestamp comment '创建时间',
    update_date  datetime          default null on update current_timestamp comment '修改时间',
    unique (user_id, label_id)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '用户标签信息';

-- 角色功能菜单
create table link_user_menu
(
    user_id   int(10)  not null comment '角色主键id',
    menu_id     int(10)  not null comment '功能菜单主键id',
    create_date datetime not null default current_timestamp comment '创建时间',
    update_date datetime          default null on update current_timestamp comment '修改时间',
    unique (user_id, menu_id)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '角色菜单信息';

-- 团队用户信息
create table link_team_user
(
    team_id   int(10)  not null comment '团队id',
    user_id     int(10)  not null comment '功能菜单主键id',
    contribute_num     int(10) default 0 comment '贡献度',
    create_date datetime not null default current_timestamp comment '创建时间',
    update_date datetime          default null on update current_timestamp comment '修改时间',
    unique (user_id, team_id)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '团队用户信息';

insert into sys_team( team_name, team_type, team_status,by_author)
values ( 'FIVFI', 1, 1,1001);

insert into sys_user(id, user_account, password, user_name,user_mail)
values (1001, 'Spureb', '$2a$10$/daxmoyQ3qy2mDu22CN/QeOmb7IxbAxNVF9WsIySQzbo.l6CXpqGS', 'spureb','FIVFIBo@gmail.com'),
       (1002, 'YesionHu', '$2a$10$/daxmoyQ3qy2mDu22CN/QeOmb7IxbAxNVF9WsIySQzbo.l6CXpqGS', 'Yesion Hu',null);

insert into sys_menu(menu_name, menu_type, menu_url, menu_font, menu_seq, parent_id)
values ('团队',1,null,'fa fa-users',1,0)  ,
       ('笔记',1,null,'fa fa-book',2,0)  ,
       ('云',1,null,'fa fa-users',3,0)  ,
       ('设置',1,null,'fa fa-users',4,0)  ,
       ('云集',2,null,'fa fa-book',1,3)  ,
       ('收藏',2,null,'fa fa-book',1,3)  ;

insert into link_user_menu(user_id, menu_id)
values (1001,1)  ,
       (1001,2)  ,
       (1001,3)  ,
       (1001,4)  ,
       (1001,5)  ;

