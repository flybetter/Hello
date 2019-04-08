
drop table if exists sql_cloud_demo;

create tale sql_cloud_demo(
  runoob_id int unsigned auto_increment,
  runoob_title varchar(100) not null,
  runoob_author varchar(40) not null,
  submission date ,
  primary key(runoob_id)
  Index index_name(runoob_id)
)engine=InnoDB charset='utf8';
