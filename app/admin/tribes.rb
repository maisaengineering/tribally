ActiveAdmin.register Tribe do
  
  scope :location
  
  index do
    column "Tribe name", :tribe_name
    column :location
    column :category
    default_actions
  end
  
  form do |f|
    f.inputs "Details" do       
      f.input :tribe_name        
      f.input :location
      f.input :category
    end      
    f.buttons
  end
  
  show do
    panel "Product" do
      table_for tribe.products do
        column "product_name"
      end
    end
  end

  
end
