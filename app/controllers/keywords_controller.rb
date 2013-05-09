class KeywordsController < ApplicationController
  before_action :set_keyword, only: [:show, :edit, :update, :destroy]

  # GET /keywords
  def index
    @keywords = Keyword.all
  end

  # GET /keywords/1
  def show
  end

  # GET /keywords/new
  def new
    @keyword = Keyword.new(site_id: params[:site_id])
  end

  # GET /keywords/1/edit
  def edit
  end

  # POST /keywords
  def create
    @keyword = Keyword.new(keyword_params)

    if @keyword.save
      redirect_to @keyword.site, notice: 'Keyword was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /keywords/1
  def update
    if @keyword.update(keyword_params)
      redirect_to @keyword, notice: 'Keyword was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /keywords/1
  def destroy
    @keyword.destroy
    redirect_to keywords_url, notice: 'Keyword was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword
      @keyword = Keyword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keyword_params
      params.require(:keyword).permit(:site_id, :word)
    end
end
