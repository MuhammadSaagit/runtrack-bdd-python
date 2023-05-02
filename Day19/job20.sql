mysql> select count(1)
    -> from etudiants
    -> where age < '18';
+----------+
| count(1) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)