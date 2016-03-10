class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    product =  Product.find_by(id: params[:product_id])
    @review.product_id = product.id
    @review.user_id = current_user.id
    @review.save
    # if @review.save
    #   redirect_to action: 'show', controller: 'products'
    # else
      redirect_to product_path(product)
    # end
  end


  private

  def review_params
    params.require(:review).permit(:description, :user_id, :product_id)
  end

end
