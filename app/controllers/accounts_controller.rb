class AccountsController < ApplicationController
  
  # TODO: ONLY FORM ADMINS !!
  
  before_action :authenticate_user!
  before_action :set_account, except: [:index, :new, :create]
  
  def index
    @accounts = Account.all
  end

  def show
    @user = @account.user
  end

  def new
    @account = Account.new
    @account.addresses.new
  end


  def edit
    #@account = Account.find(params[:id])
    @user = @account.user
    #Person.create(person_params)
  end
  
  def update
    if @account.update(account_params)
      redirect_to @account, notice: 'Účet byl upraven.' 
    else
      render :edit
    end
  end
  
  private
    
    def full_name
		  self.full_name = [first_name, last_name].join(' ')
	  end
	  
    def set_account
      #@user =    #current_user  #User.find(params[:id])
      #@account = @user.account
      @account = Account.find(params[:id])
      
      #@account = Account.find(params[:id])
      #@user = @account.user
      #@account = Account.where(params[:user_id] = current_user.id)
    end
  
    def account_params
      params.require(:account).permit(:birth_name, :birth_place, :birth_number)
      
    end
end
