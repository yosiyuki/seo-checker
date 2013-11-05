class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy, :test]

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.order(:name).all
    @days = 30

    date = Date.today - @days
    @logs = SiteLog.after(date).all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @days = 30
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @site }
    end
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, :notice => 'Site was successfully created.' }
        format.json { render :json => @site, :status => :created, :location => @site }
      else
        format.html { render :action => "new" }
        format.json { render :json => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.json
  def update

    respond_to do |format|
      if @site.update_attributes(site_params)
        format.html { redirect_to @site, :notice => 'Site was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.keywords.each{|word| word.destroy }
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :ok }
    end
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:name, :domain, :note)
  end
end
