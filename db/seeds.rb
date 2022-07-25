# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EmployeeTicket.destroy_all
Ticket.destroy_all
Employee.destroy_all
Department.destroy_all

dept1 = Department.create(name: "finance", floor: 3)
dept2 = Department.create(name: "customer service", floor: 2)

empl1 = dept1.employees.create(name: "George", level: 4)
empl2 = dept1.employees.create(name: "Elizabeth", level: 5)
empl3 = dept1.employees.create(name: "Sam", level: 2)

empl4 = dept2.employees.create(name: "Arnold", level: 4)
empl5 = dept2.employees.create(name: "Harris", level: 5)
empl6 = dept2.employees.create(name: "Martha", level: 2)

ticket1 = Ticket.create(subject: "log-in", age: 5)
ticket2 = Ticket.create(subject: "homepage", age: 23)
ticket3 = Ticket.create(subject: "credentials", age: 7)

employeeticket1 =EmployeeTicket.create(ticket: ticket1, employee: empl1)
employeeticket2 =EmployeeTicket.create(ticket: ticket1, employee: empl3)
employeeticket3 =EmployeeTicket.create(ticket: ticket1, employee: empl4)

employeeticket4 =EmployeeTicket.create(ticket: ticket2, employee: empl1)
employeeticket5 =EmployeeTicket.create(ticket: ticket2, employee: empl5)
employeeticket6 =EmployeeTicket.create(ticket: ticket2, employee: empl6)

employeeticket7 =EmployeeTicket.create(ticket: ticket3, employee: empl2)
employeeticket8 =EmployeeTicket.create(ticket: ticket3, employee: empl5)
employeeticket9 =EmployeeTicket.create(ticket: ticket3, employee: empl1)
