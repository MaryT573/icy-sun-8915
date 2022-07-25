require 'rails_helper'

RSpec.describe Employee do
  it 'can display name, and department' do
    dept1 = Department.create(name: "finance", floor: 3)
    empl1 = dept1.employees.create(name: "George", level: 4)

    visit "/employees/#{empl1.id}"
    expect(current_path).to eq("/employees/#{empl1.id}")

    expect(page).to have_content("George")
    expect(page).to have_content("finance")
  end

  it 'can display all tickets from oldest to youngest, and oldest again seperatly' do
    dept1 = Department.create(name: "finance", floor: 3)
    empl1 = dept1.employees.create(name: "George", level: 4)
    ticket1 = Ticket.create(subject: "log-in", age: 5)
    ticket2 = Ticket.create(subject: "homepage", age: 23)
    ticket3 = Ticket.create(subject: "credentials", age: 7)
    employeeticket1 =EmployeeTicket.create(ticket: ticket1, employee: empl1)
    employeeticket2 =EmployeeTicket.create(ticket: ticket2, employee: empl1)
    employeeticket3 =EmployeeTicket.create(ticket: ticket3, employee: empl1)

    visit "/employees/#{empl1.id}"
    expect(current_path).to eq("/employees/#{empl1.id}")

    expect(ticket2.subject).to appear_before(ticket1.subject)
    expect(ticket2.subject).to appear_before(ticket3.subject)
    expect(ticket3.subject).to appear_before(ticket1.subject)

    expect(page).to have_content("Oldest Ticket: homepage")
  end

  it 'does not show tickets that belong to another employee' do
    dept1 = Department.create(name: "finance", floor: 3)
    empl1 = dept1.employees.create(name: "George", level: 4)
    empl2 = dept1.employees.create(name: "Elizabeth", level: 5)
    ticket1 = Ticket.create(subject: "log-in", age: 5)
    ticket2 = Ticket.create(subject: "homepage", age: 23)
    ticket3 = Ticket.create(subject: "credentials", age: 7)
    employeeticket1 =EmployeeTicket.create(ticket: ticket1, employee: empl1)
    employeeticket2 =EmployeeTicket.create(ticket: ticket2, employee: empl1)
    employeeticket3 =EmployeeTicket.create(ticket: ticket3, employee: empl2)

    visit "/employees/#{empl1.id}"
    expect(current_path).to eq("/employees/#{empl1.id}")

    expect(page).to have_content("log-in")
    expect(page).to have_content("homepage")

    expect(page).to_not have_content("credentials")
  end

  it 'can add new tickets' do
    dept1 = Department.create(name: "finance", floor: 3)
    empl1 = dept1.employees.create(name: "George", level: 4)
    ticket1 = Ticket.create(subject: "log-in", age: 5)
    ticket2 = Ticket.create(subject: "homepage", age: 23)
    ticket3 = Ticket.create(subject: "credentials", age: 7)
    employeeticket1 =EmployeeTicket.create(ticket: ticket1, employee: empl1)
    employeeticket2 =EmployeeTicket.create(ticket: ticket2, employee: empl1)
    employeeticket3 =EmployeeTicket.create(ticket: ticket3, employee: empl1)
    ticket4 = Ticket.create(subject: "internet", age: 1)

    visit "/employees/#{empl1.id}"
    expect(current_path).to eq("/employees/#{empl1.id}")

    expect(page).to_not have_content("internet")

    fill_in 'ticket_id', with: "#{ticket4.id}"
    click_on 'Submit'

    expect(current_path).to eq("/employees/#{empl1.id}")
    expect(page).to have_content("internet")
  end
end
