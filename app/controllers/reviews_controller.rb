class ReviewsController < ApplicationController

  def create
    review = Review.new(review_params)
    review.user_id = session[:user_id]
    review.product_id = params[:product_id]
    if review.save
      review.save
      redirect_to "/products/#{params[:product_id]}"
     else
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    respond_to do |format|
    redirect_to "/products/#{params[:product_id]}", notice: 'Review was successfully destroyed.'
    end
  end

  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end

end
