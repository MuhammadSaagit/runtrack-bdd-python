import sqlite3


def add_animal():
    conn = sqlite3.connect("zoo.db")
    c = conn.cursor()
    animal_name = input("Enter the name of the animal: ")
    animal_species = input("Enter the species of the animal: ")
    cage_id = input("Enter the cage id where the animal will be placed: ")
    c.execute(
        "INSERT INTO animal (name, species, cage_id) VALUES (?, ?, ?)",
        (animal_name, animal_species, cage_id),
    )
    conn.commit()
    conn.close()
    print("Animal added successfully!")


def remove_animal():
    conn = sqlite3.connect("zoo.db")
    c = conn.cursor()
    animal_id = input("Enter the id of the animal to be removed: ")
    c.execute("DELETE FROM animal WHERE id=?", (animal_id,))
    conn.commit()
    conn.close()
    print("Animal removed successfully!")


def change_cage():
    conn = sqlite3.connect("zoo.db")
    c = conn.cursor()
    animal_id = input("Enter the id of the animal to be moved: ")
    new_cage_id = input("Enter the new cage id where the animal will be moved: ")
    c.execute("UPDATE animal SET cage_id=? WHERE id=?", (new_cage_id, animal_id))
    conn.commit()
    conn.close()
    print("Animal moved successfully!")


def display_animals():
    conn = sqlite3.connect("zoo.db")
    c = conn.cursor()
    c.execute("SELECT * FROM animal")
    animals = c.fetchall()
    for animal in animals:
        print(animal)
    conn.close()


def display_cages():
    conn = sqlite3.connect("zoo.db")
    c = conn.cursor()
    c.execute("SELECT * FROM cage")
    cages = c.fetchall()
    for cage in cages:
        print(cage)
        c.execute("SELECT * FROM animal WHERE cage_id=?", (cage[0],))
        animals_in_cage = c.fetchall()
        for animal in animals_in_cage:
            print(animal)
        print("")
    conn.close()


def calculate_total_area():
    conn = sqlite3.connect("zoo.db")
    c = conn.cursor()
    c.execute("SELECT SUM(area) FROM cage")
    total_area = c.fetchone()[0]
    print(f"The total area of all cages is {total_area} square meters.")
