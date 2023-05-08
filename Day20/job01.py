import mysql.connector
import MySQLdb

db = MySQLdb.connect(host="localhost", user="root", passwd="passwd", db="la_plateforme")


cursor = db.cursor()

cursor.execute("SELECT * FROM `etudiants`")
cursor.execute("SELECT * FROM `rooms`")

result = cursor.fetchall()

for row in result:
    print(row)
    print("\n")
