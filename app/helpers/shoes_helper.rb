module ShoesHelper
    def shoe_price
         if @shoe.price > 50 
            content_tag(:h6, "Shoe Price: #{number_to_currency(@shoe.price)}")
        else 
            content_tag(:h1, "Shoe Price: #{number_to_currency(@shoe.price)}")
        end 
    end

    def index_header_brand 
         if @brand 
            content_tag(:h1, "#{@brand.name} Shoes:")
  
             else 
                content_tag(:h1, "All of the Shoes!!")
         end 
    end

    def new_header_brand 
        if @brand 
           content_tag(:h1, "Create #{@brand.name} Shoes:")
 
            else 
               content_tag(:h1, "Create Shoe: ")
        end 
   end

   def fields_for_brand(f) 
        if @brand 
        f.hidden_field :brand_id, value: @brand.id 
        else 
         render partial: "brand_fields", locals: { f: f } 
        end 
   end
end