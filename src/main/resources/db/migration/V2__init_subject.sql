use a_spureb_box;

drop table if exists sys_resource_folder;
drop table if exists sys_resource_file;
drop table if exists sys_folder_file;
drop table if exists sys_user_folder;


-- 文档资源表格
create table sys_resource_folder
(
    id          int(10) primary key auto_increment comment '主键',
    folder_name varchar(50)             not null comment '文档名称',
    folder_type enum ('t1', 't2') not null comment '文档类型',
    folder_url  varchar(100)                     default null comment '文档地址',
    folder_font varchar(50)             not null default 'fa fa-folder' comment '文档图标',
    seq         int(10)                          default 1 comment '排序',
    parent_id   bigint                           default null comment '父菜单',
    available   tinyint(1)                       default 1 comment '是否隐藏 true: 1, false: 0',
    can_delete  tinyint(1)                       default 0 comment '是否可删 true: 1, false: 0',
    create_date datetime                not null default current_timestamp comment '创建时间',
    update_date datetime                         default null on update current_timestamp comment '修改时间',
    unique (folder_name, parent_id, folder_type)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '文档资源表格';

-- 文件资源表格
create table sys_resource_file
(
    id          int(10) primary key auto_increment comment '主键',
    file_name   varchar(20)             not null comment '文件名称',
    file_type   enum ('t1', 't2') not null comment '文件类型',
    file_url    varchar(100)                     default null comment '文件地址',
    file_font   varchar(20)             not null default 'fa fa-file' comment '文件图标',
    seq         int(10)                          default 1 comment '排序',
    parent_id   bigint                           default null comment '父菜单',
    available   tinyint(1)                       default 1 comment '是否隐藏 true: 1, false: 0',
    can_delete  tinyint(1)                       default 0 comment '是否可删 true: 1, false: 0',
    create_date datetime                not null default current_timestamp comment '创建时间',
    update_date datetime                         default null on update current_timestamp comment '修改时间',
    unique (file_name, parent_id)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '文件资源表格';

-- 文档文件关系
create table sys_folder_file
(
    folder_id   int(10)  not null comment '文档id',
    file_id     int(10)  not null comment '文件id',
    create_date datetime not null default current_timestamp comment '创建时间',
    update_date datetime          default null on update current_timestamp comment '修改时间',
    unique (folder_id, file_id)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '文档文件关系';

-- 用户文档关系
create table sys_user_folder
(
    user_account int(10)  not null comment '用户账号',
    folder_id    int(10)  not null comment '文档id',
    create_date  datetime not null default current_timestamp comment '创建时间',
    update_date  datetime          default null on update current_timestamp comment '修改时间',
    unique (user_account, folder_id)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '用户文档关系';

insert into sys_resource_folder(id, folder_name, folder_type, folder_url)
values (1, 'test1', 't1', '/'),
       (2, 'test1', 't1', '/');
insert into sys_resource_file(id, file_name, file_type, file_url)
values (1, 'file1', 't2', '/'),
       (2, 'file1', 't2', '/'),
       (3, 'file1', 't2', '/');

insert into sys_folder_file(folder_id, file_id)
values (1, 1),
       (1, 2),
       (2, 3);

insert into sys_user_folder(user_account, folder_id)
values (1, 1),
       (1, 2),
       (2, 3);
