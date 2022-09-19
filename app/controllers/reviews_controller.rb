class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product
  
    def create
      @review = @product.reviews.create(review_params)
      @review.user = current_user
  
      if @review.save
        redirect_to product_path(@product), notice: 'Review has been created'
      else
        redirect_to product_path(@product), alert: 'Review has not been created'
      end
    end
  
    def destroy
      @review = @product.reviews.find(params[:id])
      @review.destroy
      redirect_to product_path(@product)
    end
  
    private
  
    def set_product
      @product = Product.friendly.find(params[:product_id])
    end
  
    def review_params
      params.require(:review).permit(:body)
    end
  end