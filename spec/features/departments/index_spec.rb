require 'rails_helper'

RSpec.describe Department do
  it 'can display name, floor and employees' do
    dept1 = Department.create(name: "finance", floor: 3)
    dept2 = Department.create(name: "customer service", floor: 2)

    empl1 = dept1.employees.create(name: "George", level: 4)
    empl2 = dept1.employees.create(name: "Elizabeth", level: 5)

    empl4 = dept2.employees.create(name: "Arnold", level: 4)
    empl5 = dept2.employees.create(name: "Harris", level: 5)

    visit '/departments'
    expect(current_path).to eq('/departments')

    expect(page).to have_content("finance")
    expect(page).to have_content("customer service")
    expect(page).to have_content(3)
    expect(page).to have_content(2)

    expect(page).to have_content("George")
    expect(page).to have_content("Elizabeth")
    expect(page).to have_content("Arnold")
    expect(page).to have_content("Harris")
  end
end
