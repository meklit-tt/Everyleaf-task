# README

the table schema
user
 name :string
 email :string
 password_digest :string

 Task
  title :string
  detail :string
  bigint :"user_id"

lable
 name :string

add_foreign_key "tasks", "users"
