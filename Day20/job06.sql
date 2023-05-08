mysql> SELECT CONCAT ('The capacity of all the rooms is:', SUM(capacity)) AS message
    -> from rooms;
+--------------------------------------+
| message                              |
+--------------------------------------+
| The capacity of all the rooms is:244 |
+--------------------------------------+
1 row in set (0.00 sec)