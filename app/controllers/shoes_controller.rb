class ShoesController < ApplicationController
     before_action :redirect_if_not_logged_in?
     before_action :find_shoe, only: [:show, :update, :edit, :destroy]
    layout "shoe" 

    def index  
        # @colors = Shoe.all_colors
        if params[:brand_id] &&  @brand = Brand.find_by_id(params[:brand_id])
            @shoes = @brand.shoes.order_by_condition
        else
            @shoes = Shoe.order_by_price.order_by_condition
        end

        # if params[:shoe] && !params[:shoe][:color].blank?
        #     # byebug
        #     @shoes = Shoe.color_selector(params[:shoe][:color])
        # end
        @shoes = Shoe.color_selector(params[:shoe][:color]) if params[:shoe] && !params[:shoe][:color].blank?
        
    end

    def show
      
    end

    def new 
        if params[:brand_id] &&  @brand = Brand.find_by_id(params[:brand_id])
            # @shoe = Shoe.new(brand_id: params[:brand_id])
            @shoe = @brand.shoes.build
        else
            @shoe = Shoe.new
            @shoe.build_brand
        end
    end

    def create 
        @shoe = Shoe.new(shoe_params)
        if params[:brand_id]
            @brand = Brand.find_by_id(params[:brand_id])
        end
        if @shoe.save
            redirect_to shoes_path
        else
            render :new
        end
    end

    def edit 
       
    end

    def update 
       
        @shoe.update(shoe_params)
        if @shoe.valid?
            redirect_to shoe_path(@shoe)
        else
            render :edit
        end
    end

    def most_expensive
        @shoes = Shoe.order_by_price
        render :index, layout: "random"
    end

    def destroy 
    
        @shoe.destroy 
        redirect_to shoes_path
    end

    private 

    def shoe_params
        params.require(:shoe).permit(:color, :price, :condition, :brand_id, brand_attributes: [:name, :year_founded])
    end

    def find_shoe 
        @shoe = Shoe.find_by_id(params[:id])
    end

end