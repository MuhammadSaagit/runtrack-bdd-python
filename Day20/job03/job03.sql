mysql> select * from floor;
+----+-----+--------+------+
| id | nom | numero | area |
+----+-----+--------+------+
|  1 | RDC |      0 |  500 |
|  2 | R+1 |      1 |  500 |
+----+-----+--------+------+
2 rows in set (0.00 sec)

mysql> select * from rooms;
+----+--------------+----------+----------+
| Id | Nom          | Floor_id | Capacity |
+----+--------------+----------+----------+
|  1 | Lounge       |        1 |      100 |
|  2 | Studio Son   |        1 |        5 |
|  3 | Broadcasting |        2 |       50 |
|  4 | Bocal pPeda  |        2 |        4 |
|  5 | Coworking    |        2 |       80 |
|  6 | Studio Video |        2 |        5 |
+----+--------------+----------+----------+
6 rows in set (0.00 sec)