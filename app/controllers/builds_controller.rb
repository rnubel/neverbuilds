class BuildsController < ApplicationController
  include Opinio::Controllers::Helpers

  before_filter :authorize, :only => [:create, :update, :new, :delete]

  def index
    @builds   = Build.find(:all, :order => "created_at DESC")
    @featured = Build.where(:type => "featured").limit(5)
  end 

  def destroy
    @build.destroy
    redirect_to "/"
  end

  def update
    updates = params[:build]
    @build.update_attributes(updates)
    render :json => { "status" => "success", "redirect" => build_path(@build)}
  end

  def create
    @build = Build.new(params[:guide])
    @build.user = current_user
    if @build.save
      render :json => { "status" => "success", "redirect" => "/builds/#{@build.id}"}
    else
      render :json => { "status" => "failure", "errors" => @build.errors.full_messages}
    end
  end 

  def pick
    @race = params[:race]
    @class = params[:class]

    respond_to do |format|
      format.js
    end 
  end
end
