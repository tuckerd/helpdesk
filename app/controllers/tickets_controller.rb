class TicketsController < ApplicationController
  before_filter :find_ticket, only: [:show, :edit, :update]

  def index
    @tickets = Ticket.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket has been updated."
      redirect_to @ticket
    else
      flash[:alert] = "Error updating ticket."
      render action: "edit"
    end
  end

  def destroy
    Ticket.find(params[:id]).destroy
    flash[:notice] = "Ticket has been removed."
    redirect_to tickets_path
  end

private
  def find_ticket
    @ticket = Ticket.find(params[:id])
  end
end
