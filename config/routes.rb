Rails.application.routes.draw do

	resources :products
root 'products#index'

mount Products::ProductsApi => '/api/products'

  get 'products/index'

  get 'products/new'

end
