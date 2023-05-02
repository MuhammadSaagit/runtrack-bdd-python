mysql> select count(4)
    -> from etudiants
    -> where age between 18 and 25;
+----------+
| count(4) |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)