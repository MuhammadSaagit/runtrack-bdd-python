import mysql.connector
import MySQLdb

db = MySQLdb.connect(host="localhost", user="root",
                     passwd="Frostlike-Gloater-Dingy4-Second", db="la_plateforme")

cursor = db.cursor()

cursor.execute("SELECT * FROM `etudiants`")

result = cursor.fetchall()

for row in result:
    print(row)
    print("\n")
