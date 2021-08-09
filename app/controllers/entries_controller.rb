class EntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @company = Company.find(params[:company_id])
    @entry = Entry.new
  end

  def create
    @company = Company.find(params[:company_id])
    @company = @company.supplier

    @entry = Entry.new(
      supplier_id: @company.id,
      user_id: current_user.id
    )
    if @entry.save
      @company.supplier_notifications.create(user: current_user, notification_type: 'entry')
      redirect_to root_path
    else
      render 'new'
    end
  end
end
