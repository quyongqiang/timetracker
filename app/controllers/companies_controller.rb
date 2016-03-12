class CompaniesController < ApplicationController
  def index
    @companies = Company.all 
  end

  def show
   # @companies_id = params[:id]
#    @hello = "hello world!"

    @company = Company.find(params[:id])    
  end
end
