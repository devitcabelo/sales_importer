class SalesController < ApplicationController
  before_action :authenticate_user!

  def index
    @total_gross_income = Purchase.all.sum(&:gross_income)
  end

  def import
    import_sales = ImportSalesService.new(params[:sales])
    purchase = import_sales.import
    @gross_income = purchase.gross_income
    @total_gross_income = Purchase.all.sum(&:gross_income)
    
    render :index, notice: "Arquivo importado com sucesso."
  rescue StandardError => exception
    @total_gross_income = Purchase.all.sum(&:gross_income)
    flash[:error] = exception
    render :index, status: :unprocessable_entity 
  end
end
