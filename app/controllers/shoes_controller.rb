class ShoesController < ApplicationController
     before_action :redirect_if_not_logged_in? 
    layout "shoe" 

    def index  
        if params[:brand_id] &&  @brand = Brand.find_by_id(params[:brand_id])
            @shoes = @brand.shoes
        else
            @shoes = Shoe.all
        end
        
    end

    def show
        @shoe = Shoe.find_by_id(params[:id])
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
        @shoe = Shoe.find_by_id(params[:id])
    end

    def update 
        @shoe = Shoe.find_by_id(params[:id])
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
        @shoe = Shoe.find_by_id(params[:id])
        @shoe.destroy 
        redirect_to shoes_path
    end

    private 

    def shoe_params
        params.require(:shoe).permit(:color, :price, :condition, :brand_id, brand_attributes: [:name, :year_founded])
    end

end