CREATE DATABASE IF NOT EXISTS a_spureb_box DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_general_ci;

use a_spureb_box;


drop table if exists sys_user_role;
drop table if exists sys_role_menu;
drop table if exists sys_user;
drop table if exists sys_role;
drop table if exists sys_menu;
drop table if exists sys_company;


-- 公司
create table sys_company
(
    id             int(10) primary key auto_increment comment '主键',
    company_name   varchar(16)            not null comment '公司名称',
    company_type   enum ('platform', 'it') not null comment '公司类型',
    contacts       varchar(16)            not null comment '联系人账号',
    provinces_name varchar(20)                     default null comment '所在省',
    city_name      varchar(20)                     default null comment '所在城市',
    area_name      varchar(20)                     default null comment '所在地区/县',
    addr           varchar(100)                    default null comment '详细地址',
    parent_id      int(10)                         default null comment '父公司主键id',
    available      tinyint(1)                      default 1 comment '是否可用 true: 1, false: 0',
    can_delete     tinyint(1)                      default 1 comment '是否可删 true: 1, false: 0',
    create_date    datetime               not null default current_timestamp comment '创建时间',
    update_date    datetime                        default null on update current_timestamp comment '修改时间',
    unique (company_name, contacts)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '公司信息';

-- 人员
CREATE TABLE sys_user
(
    id            int(10) PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    user_account  VARCHAR(16)  NOT NULL COMMENT '账号',
    user_password VARCHAR(100) NOT NULL COMMENT '密码',
    user_name     varchar(20)  not null comment '姓名',
    user_phone    VARCHAR(11) COMMENT '手机号码',
    company_id    int(10)               DEFAULT NULL COMMENT '公司id',
    available     TINYINT(1)            DEFAULT 1 COMMENT '是否可用 true: 1, false: 0',
    can_delete    tinyint(1)            default 1 comment '是否可删 true: 1, false: 0',
    create_date   DATETIME     not null DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_date   DATETIME              DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    UNIQUE (user_account)
) ENGINE = INNODB
  CHARSET utf8mb4
  COLLATE utf8mb4_general_ci COMMENT '人员信息';

-- 角色
create table sys_role
(
    id          int(10) primary key auto_increment comment '主键',
    role_name   varchar(20) not null comment '角色名称',
    role_code   varchar(20) not null comment '角色代号',
    role_seq    int(10)              default 1 comment '角色排序',
    available   tinyint(1)           default 1 comment '是否可用 true: 1, false: 0',
    can_delete  tinyint(1)           default 1 comment '是否可删 true: 1, false: 0',
    create_date datetime    not null default current_timestamp comment '创建时间',
    update_date datetime             default null on update current_timestamp comment '修改时间',
    unique (role_name),
    unique (role_code)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '角色信息';

-- 功能菜单
create table sys_menu
(
    id          int(10) primary key auto_increment comment '主键',
    menu_name   varchar(20)             not null comment '菜单名称',
    menu_code   varchar(20)             not null comment '菜单代号',
    menu_type   enum ('menu', 'button') not null comment '菜单类型',
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
create table sys_user_role
(
    user_account int(10)  not null comment '用户主键id',
    role_id      int(10)  not null comment '角色主键id',
    create_date  datetime not null default current_timestamp comment '创建时间',
    update_date  datetime          default null on update current_timestamp comment '修改时间',
    unique (user_account, role_id)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '用户角色信息';

-- 角色功能菜单
create table sys_role_menu
(
    role_id     int(10)  not null comment '角色主键id',
    menu_id     int(10)  not null comment '功能菜单主键id',
    create_date datetime not null default current_timestamp comment '创建时间',
    update_date datetime          default null on update current_timestamp comment '修改时间',
    unique (role_id, menu_id)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '角色功能菜单信息';


insert into sys_company(id, company_name, company_type, contacts)
values (1, 'fivfi', 'platform', 'FIVFI');

insert into sys_user(id, user_account, user_password, user_name, company_id)
values (1, 'FIVFI', '123', 'spureb', 1);
