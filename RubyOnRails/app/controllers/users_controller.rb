class UsersController < ApplicationController
  before_filter :check_administrator_role,
    :only => [:index, :destroy, :enable]
  before_filter :login_required, :only => [:edit, :update]
  
  def index
    @users = User.find(:all)
  end

  def show
    @user = User.find(params[:id])
  end

  def show_by_username
    @user = User.find_by_username(params[:username])
    render :action => 'show'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      self.logged_in_user = @user
      flash[:notice] = "Your account has been created."
      redirect_to index_url
    else
      render :action => 'new'
    end
  end

  def edit
    @user = logged_in_user
  end

  def update
    @user = User.find(logged_in_user)
    if @user.update_attributes(params[:user])
      flash[:notice] = "User updated"
      redirect_to :action => 'show', :id => logged_in_user
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled, false)
      flash[:notice] = "User disabled"
    else
      flash[:error] = "There was a problem disabling this user."
    end
    redirect_to :action => 'index'
  end

  def enable
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled, true)
      flash[:notice] = "User enabled"
    else
      flash[:error] = "There was a problem enabling this user."
    end
    redirect_to :action => 'index'
  end
end
