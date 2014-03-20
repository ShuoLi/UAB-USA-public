class WarehousesController < InheritedResources::Base
  def index
    @warehouses = Warehouse.all
  end
end
