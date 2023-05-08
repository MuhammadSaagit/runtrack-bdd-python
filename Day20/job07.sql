mysql> create table employees(
    -> id int not null auto_increment,
    -> lastname varchar(255) not null,
    -> firstname varchar(255) not null,
    -> salary decimal not null,
    -> service_id int not null,
    -> primary key (id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> select * from employees
    -> where salary > 3000;
    +----+----------+-----------+--------+------------+
| id | lastname | firstname | salary | service_id |
+----+----------+-----------+--------+------------+
|  1 | Dubois   | Jean      |   4500 |          1 |
|  2 | Martin   | Marie     |   3200 |          2 |
|  3 | Benard   | Pierre    |   6700 |          4 |
|  5 | Robert   | Francois  |   5300 |          5 |
|  6 | Richard  | Isabelle  |   7600 |          6 |
|  7 | Petit    | Michel    |   8900 |          7 |
|  9 | Moreau   | Philippe  |   9200 |          9 |
+----+----------+-----------+--------+------------+
7 rows in set (0.00 sec)


mysql> update services
    -> set department = 'X'
    -> where id = X;
Query OK, 1 row affected (0.01 sec)

mysql> insert into services (id,name,department)
    -> values ('1','Jean','Technical Support'),
    -> values ('2','Marie','Network Administration'),
    -> values ('3','Pierre','Database Administration'),
    -> values ('4','Sophie','Sofware Development'),
    -> values ('5','Francois','Web Development'),
    -> values ('6','Isabelle','Information Security'),
    -> values ('7','Michel','Data Analysis'),
    -> values ('8','Nathalie','Project Management'),
    -> values ('9','Philippe','IT Management'),
    -> values ('10','Anne','IT Strategy and Planning')

#sql ^

#python

import mysql.connector


class Database:
    def __init__(self, host, user, password, database):
        self.connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="password",
            database="week5day20",
        )
        self.cursor = self.connection.cursor()

    def create(self, table, data):
        placeholders = ", ".join(["%s"] * len(data))
        columns = ", ".join(data.keys())
        sql = "INSERT INTO %s ( %s ) VALUES ( %s )" % (table, columns, placeholders)
        self.cursor.execute(sql, list(data.values()))
        self.connection.commit()

    def read(self, table, where=None):
        sql = "SELECT * FROM %s" % table
        if where:
            sql += " WHERE " + where
        self.cursor.execute(sql)
        return self.cursor.fetchall()

    def update(self, table, data, where):
        set_values = ", ".join([f"{key} = %s" for key in data.keys()])
        sql = "UPDATE %s SET %s WHERE %s" % (table, set_values, where)
        self.cursor.execute(sql, list(data.values()))
        self.connection.commit()

    def delete(self, table, where):
        sql = "DELETE FROM %s WHERE %s" % (table, where)
        self.cursor.execute(sql)
        self.connection.commit()

db = Database(
    host="localhost",
    user="root",
    password="password",
    database="week5day20",
)

# Create a new record
data = {"name": "Macaron", "age": 30}
db.create("services", data)

# Read all records
records = db.read("services")
print(records)

# Update a record
data = {"age": 31}
db.update("services", data, "name='Macaron'")

# Delete a record
db.delete("services", "name='Macaron'")