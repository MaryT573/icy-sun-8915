class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
    if params[:ticket_id]
      new_ticket = Ticket.find(params[:ticket_id])
      create_ticket = EmployeeTicket.create(ticket: new_ticket, employee: @employee)
    end
  end
end
