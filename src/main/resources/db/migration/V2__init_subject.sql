use a_spureb_box;

drop table if exists folder_resource;
drop table if exists file_resource;
drop table if exists link_folder_file;
drop table if exists link_user_folder;
drop table if exists note_resource;
drop table if exists note_list_resource;



-- 文档资源表格
create table folder_resource
(
    id          int(10) primary key auto_increment comment '主键',
    folder_name varchar(50)       not null comment '文档名称',
    folder_type enum ('t1', 't2') not null comment '文档类型',
    folder_url  varchar(100)               default null comment '文档地址',
    folder_font varchar(50)       not null default 'fa fa-folder' comment '文档图标',
    seq         int(10)                    default 1 comment '排序',
    parent_id   bigint                     default null comment '父菜单',
    available   tinyint(1)                 default 1 comment '是否隐藏 true: 1, false: 0',
    can_delete  tinyint(1)                 default 0 comment '是否可删 true: 1, false: 0',
    create_date datetime          not null default current_timestamp comment '创建时间',
    update_date datetime                   default null on update current_timestamp comment '修改时间',
    unique (folder_name, parent_id, folder_type)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '文档资源表格';

-- 文件资源表格
create table file_resource
(
    id          int(10) primary key auto_increment comment '主键',
    file_name   varchar(20)       not null comment '文件名称',
    file_type   enum ('t1', 't2') not null comment '文件类型',
    file_url    varchar(100)               default null comment '文件地址',
    file_font   varchar(20)       not null default 'fa fa-file' comment '文件图标',
    seq         int(10)                    default 1 comment '排序',
    parent_id   bigint                     default null comment '父菜单',
    available   tinyint(1)                 default 1 comment '是否隐藏 true: 1, false: 0',
    can_delete  tinyint(1)                 default 0 comment '是否可删 true: 1, false: 0',
    create_date datetime          not null default current_timestamp comment '创建时间',
    update_date datetime                   default null on update current_timestamp comment '修改时间',
    unique (file_name, parent_id)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '文件资源表格';

create table note_list_resource
(
    id           int(10) primary key auto_increment comment '主键',
    note_list_title   varchar(20) comment '笔记标题',
    by_author    int(10) comment '作者',
    annotation varchar(100) comment '注释描述',
    support_qty  int(10) comment '支持量',
    resource_type int(10) not null comment '资源类型',
    create_date  datetime not null default current_timestamp comment '创建时间',
    update_date  datetime          default null comment '修改时间'
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '文集资源';

create table note_resource
(
    id           int(10) primary key auto_increment comment '主键',
    note_title   varchar(20) comment '笔记标题',
    by_author    int(10) comment '作者',
    by_note_list    int(10) comment '作者',
    html_content text comment '网页文本类容',
    md_content text comment '网页markdown类容',
    support_qty  int(10) comment '支持量',
    edit_type tinyint(1) not null default 1 comment '1：md、2：html',
    resource_type int(10) not null comment '资源类型',
    create_date  datetime not null default current_timestamp comment '创建时间',
    update_date  datetime          default null comment '修改时间'
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '笔记资源';

-- 文档文件关系
create table link_folder_file
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
create table link_user_folder
(
    user_id int(10)  not null comment '用户账号',
    folder_id    int(10)  not null comment '文档id',
    create_date  datetime not null default current_timestamp comment '创建时间',
    update_date  datetime          default null on update current_timestamp comment '修改时间',
    unique (user_id, folder_id)
) engine = innodb
  charset utf8mb4
  collate utf8mb4_general_ci comment '用户文档关系';

insert into folder_resource(id, folder_name, folder_type, folder_url)
values (1, 'test1', 't1', '/'),
       (2, 'test1', 't1', '/');
insert into file_resource(id, file_name, file_type, file_url)
values (1, 'file1', 't2', '/'),
       (2, 'file1', 't2', '/'),
       (3, 'file1', 't2', '/');

insert into link_folder_file(folder_id, file_id)
values (1, 1),
       (1, 2),
       (2, 3);

insert into link_user_folder(user_id, folder_id)
values (1, 1),
       (1, 2),
       (2, 3);
