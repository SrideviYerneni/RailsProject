module Products
    class ProductsApi < Grape::API
   
      format :json
   
      desc "Product List", {
          :notes => <<-NOTE
          Get All Products
           __________________
          NOTE
      }
   
      get do
        Product.all
      end
   
      desc "Create Product", {
          :notes => <<-NOTE
          Create Product
           __________________
          NOTE
      }
   
      params do
        requires :name, type: String, desc: "Product Name"
        requires :upc, type: String, desc: "UPC"
        requires :available_on, type: String, desc: "Available On"
        requires :property_name, type: String, desc: "Property Name"
        requires :property_value, type: String, desc: "Property Value"
      
      end
   
      post do
        begin
          product =  Product.create({
                                        name: params[:name],
                                        upc: params[:upc],
                                        available_on: params[:available_on],
                                        property_name: params[:property_name],
                                        property_value: params[:property_value]
                                    })
          if product.save
            { status: :success }
          else
            error!({ status: :error}) if product.errors.any?
          end
   
   
        rescue ActiveRecord::RecordNotFound
          error!({ status: :error, message: :not_found }, 404)
        end
      end
    end
  end