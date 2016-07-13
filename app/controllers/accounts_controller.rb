class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, except: [:index, :new, :create]
  
  def index
    @accounts = Account.all
  end

  def show
    @user = current_user
  end

  def new
    @account = Account.new
    @account.addresses.new
  end


  def edit
    #Person.create(person_params)
  end
  
  private
  
    def set_account
      #@user =    #current_user  #User.find(params[:id])
      #@account = @user.account
      
      
      #@account = Account.find(params[:id])
      #@user = @account.user
      @account = Account.where(params[:user_id] = current_user.id)
    end
  
  
end
