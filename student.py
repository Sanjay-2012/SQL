import sqlite3

# Connect to database
conn = sqlite3.connect('student.db')
cursor = conn.cursor()

# Create table if not exists
cursor.execute('''
CREATE TABLE IF NOT EXISTS student (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER
)
''')

# Manual insert of students
students = [
    (1, "Sanjay", 20),
    (2, "Sam", 18),
    (3, "Ram", 32),
    (4, "Ragul", 15),  
    (5, "Vikram", 21),
    (6, "Priya", 22),
    (7, "Anu", 18)
]

cursor.executemany("INSERT OR IGNORE INTO student (id, name, age) VALUES (?, ?, ?)", students)
conn.commit()

cursor.execute("UPDATE student SET name=?,age=? where id =?",("Samuel",19,2))

# Show all students
cursor.execute("SELECT * FROM student")
all_students = cursor.fetchall()

print("\n📋 Student List:")
for s in all_students:
    print(f"ID: {s[0]} | Name: {s[1]} | Age: {s[2]}")

cursor.execute("SELECT * FROM student where id = ?",(2,))
students = cursor.fetchone()

if students:
    print(f"\n🎯 Student Found:")
    print(f"ID: {students[0]} | Name: {students[1]} | Age: {students[2]}")
else:
    print("❌ Student not found.")

conn.close()
