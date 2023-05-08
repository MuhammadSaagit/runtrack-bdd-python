mysql> SELECT CONCAT('The surface area of la_plateforme is:', SUM(Floor_id), ' m2') AS message
    -> from rooms;
+--------------------------------------------+
| message                                    |
+--------------------------------------------+
| The surface area of la_plateforme is:10 m2 |
+--------------------------------------------+
1 row in set (0.00 sec)