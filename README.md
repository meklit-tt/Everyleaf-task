
<title>schema</title>
| Tasks |
| ---|
| column | type |
| title  | string |
| detail | string |
| "user_id" | bigint |

| users |
| --- |
|column | type |
| name | string |
| email | string |
| password_digest | string |

| label |
| column |
| name |
| task_id |
| user_id |

| add_foreign_key "tasks", "users" |
