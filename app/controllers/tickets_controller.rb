class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.create(params[:ticket])
    if @ticket.valid?
      flash[:notice] = "Ticket successfully created."
      TicketMailer.new_ticket(@ticket).deliver
      redirect_to tickets_path 
    else
      flash[:alert] = "Error creating your ticket."
      render action: :new
    end
  end

  def destroy
    Ticket.find(params[:id]).destroy
    flash[:notice] = "Ticket has been removed."
    redirect_to tickets_path
  end
end
