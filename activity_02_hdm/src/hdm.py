"""
CS3810: Principles of Database Systems
Instructor: Thyago Mota
Description: A simple hierarchical db for courses enrollment
"""

import os

class Entity: 
    """
    models an entity's interface with a key
    """

    def get_key(self) -> any:
        """
        defines a method to return an entity's key (used for search purposes)
        """
        pass

class Course(Entity): 
    """
    models a course entity with prefix, code, and description
    """

    def __init__(self, prefix, code, description) -> None:
        self.prefix      = prefix 
        self.code        = code
        self.description = description

    def get_key(self):
        """
        a course's prefix and code are defined as the entity's key
        """
    
        return self.prefix, self.code

    def __str__(self) -> str:
        """
        returns a string representation of a course object in csv style
        """
        return str(self.prefix) + "," + str(self.code) + "," + str(self.description)

class Section(Entity): 
    """
    models a course section entity with course prefix, course code, section number, and instructor name
    """

    def __init__(self, course, year, semester, number, instructor) -> None:
        self.course     = course
        self.year       = year
        self.semester   = semester
        self.number     = number 
        self.instructor = instructor

    def get_key(self): 
        """
        a section's course and number are defined as the entity's key
        """
        return self.course, self.number

    def __str__(self) -> str:
        """
        returns a string representation of a section object in csv style
        """
        return str(self.course) + "," + str(self.year) + "," + str(self.semester) + "," + str(self.number) + "," + str(self.instructor)

class Student(Entity): 
    """
    models a student entity with id and name
    """

    def __init__(self, id, name) -> None:
        self.id   = id
        self.name = name 

    def get_key(self): 
        """
        a student's id is defined as the entity's key
        """
        return self.id

    def __str__(self) -> str:
        """
        returns a string representation of a student object in csv style
        """
        return str(self.id) + "," + str(self.name)

class DB: 

    def list_courses() -> list: 
        """
        TODO #1: list all courses
        """
        list = []
        with open(os.path.join('db', 'courses.csv'), 'r') as file:
            lines = file.readlines()
            for line in lines:
                line = line.strip()
                prefix, code, description = line.split(",")
                code = int(code)
                course = Course(prefix, code, description)
                list.append(course)

        return list

    def list_sections(course) -> list: 
        """
        TODO #2: list all sections of a course
        """
        try:
            list = []
            key = str(course.prefix) + str(course.code)
            courses = DB.list_courses()
            for i in courses:
                if (i.prefix == course.prefix) and (i.code == course.code):
                    course = i
            with open(os.path.join('db', key, 'sections.csv'),'r') as file:
                lines = file.readlines()
                for line in lines:
                    line = line.strip()
                    year, semester, number, instructor = line.split(",")
                    year = int(year)
                    section = Section(course, year, semester, number, instructor)
                    list.append(section)
        finally:
            return list

    def list_students(section) -> list:
        """
        TODO #3: list all students enrolled in a section
        """

        try:
            list = []
            ckey = str(section.course.prefix) + str(section.course.code)
            courses = DB.list_courses()
            for i in courses:
                if (i.prefix == section.course.prefix) and (i.code == section.course.code):
                    course = i
                    break
            sections = DB.list_sections(course)
            for i in sections:
                if (i.year == section.year) and (i.semester == section.semester) and (i.section == section.number):
                    section = i
                    break
            skey = str(section.year) + str(section.semester) + str(section.number)
            with open(os.path.join('db', ckey, skey, 'students.csv'), 'r') as file:
                lines = file.readlines()
                for line in lines:
                    line = line.strip()
                    id, name = line.split(",")
                    id = int(id)
                    student = Student(id, name)
                    list.append(student)
        finally:
            return list

    def list_schedule(id, year, semester) -> list:
        """
        TODO #4: list a student's schedule
        """
        try:
            courses = DB.list_courses()
            sections = []
            for i in courses:
                sections.append(DB.list_sections(i))
            schedule = []
            for i in sections:
                for j in i:
                    if (j.year == year) and (j.semester == semester):
                        students = DB.list_students(j)
                        if len(students) > 0 :
                            for k in students:
                                if k.id == id:
                                    schedule.append(j)  
        finally:
            return schedule

def menu(): 
    print("1. List all courses")
    print("2. List sections of a course")
    print("3. List students enrolled in a course section")
    print("4. List a student schedule")
    print("5. Quit")

if __name__ == "__main__":

    while (True):
        menu()
        option = int(input("? "))
        if option == 1:
            print("\nCourses:")
            for course in DB.list_courses():
                print(course)
                print()
            print()
        elif option == 2:
            prefix = input("prefix? ")
            code = int(input("code? "))
            course = Course(prefix, code, "")
            print("\nSections of " + str(course) + ":")
            if len(DB.list_sections(course)) > 0:
                for section in DB.list_sections(course):
                    print(section)
                    print()
            else:
                print("There are no sections for course " + str(course) + ".\n")
        elif option == 3: 
            prefix = input("prefix? ")
            code = int(input("code? "))
            course = Course(prefix, code, "")
            year = int(input("year? "))
            semester = input("semester? ")
            number = input("number? ")
            section = Section(course, year, semester, number, "")
            print("Students enrolled in " + str(section) + ":")
            if len(DB.list_students(section)) > 0:
                for student in DB.list_students(section):
                    print(student)
                    print()
            else:
                print("There are no students for section" + str(section) + "\n")
        elif option == 4: 
            id = int(input("id? "))
            year = int(input("year? "))
            semester = input("semester? ")
            print("Schedule for student with id " + str(id) + ": ")
            if len(DB.list_schedule(id, year, semester)) > 0:
                for section in DB.list_schedule(id, year, semester):
                    print(section)
                    print()
            else:
                print("This student has not registered for any classes.\n")
        elif option == 5:
            break
        else:
            print("Invalid option!")
    print("Bye!")
