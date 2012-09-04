module ProductsHelper
  def people(zipcode)
    @group_details = Product.all.first
    @group_details.product_groups.each do |each_product_group|
      if each_product_group.zipcode == zipcode
        return each_product_group.members.count 
      end
    end
  end
end
