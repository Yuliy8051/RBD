CREATE TABLE my_table
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    data JSON
);

insert into my_table (data)
values ('{
  "name": "Denys",
  "age": 18,
  "city": "Gdańsk"
}'); -- INSERT JSON !!!!!!!!!!!!!--


select json_unquote(json_extract(data, '$.name')) as name,
       json_unquote(json_extract(data, '$.age'))  as age -- SELECT JSON
from my_table;



create table changes_logs
(
    id          bigint auto_increment primary key,
    entity_name varchar(50) not null,
    change_date timestamp   not null default current_timestamp -- CURRENT_TIMESTAMP!!!!!!!!!!!!!!!!!
);


delimiter $$ -- TRIGGER !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
create trigger my_first_trigger
    after update
    on Customers
    for each row
begin
    if old.first_name != new.first_name or old.last_name != new.last_name or old.phone_number != new.phone_number then
        insert into customer_change_history (old_data, new_data, customer_id)
        VALUES (json_object('name', old.first_name, 'surname', old.last_name, 'phone', old.phone_number),
                json_object('name', new.first_name, 'surname', new.last_name, 'phone', new.phone_number),
                new.ID);
    end if;
end $$
