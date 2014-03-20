# encoding: utf-8
class OrderPdf < Prawn::Document
  def initialize(order, view)
    super(top_margin: 70)
    @order = order
    @view = view
    @company_info = CompanyInfo.first
    font_families.update("simhei" => { :normal =>  "#{Rails.root}/app/assets/font/simhei.ttf", :bold => 
      "#{Rails.root}/app/assets/font/simhei.ttf" }) 
    font "simhei" 
    header
    company_info
    order_id
    order_info
    rectangle [-20, 740], 580, 800
    # No block
    line [-20, 400], [560, 400]
    line [-20, 300], [560, 300]
    stroke
    stroke
    bill_to
    ship_to
    detail
    detail_sec
    detail_third
  end
  
  
  
  def header
    image "#{Rails.root}/app/assets/images/icon.png", :at=>[120,730]
    move_down 50
    text "Invoice ", size: 32, style: :bold, :align=>:center
  end
  
  def company_info
    move_cursor_to 560
    bounding_box([0,560],:width=>200,:height=>150) do
      transparent(0){stroke_bounds}
      text @company_info.name, :align=>:left
      text @company_info.address
      text "Phone:"+@company_info.phone
    end
  end
  
  def order_id
    move_cursor_to 560
    bounding_box([200,560],:width=>200,:height=>150) do
      transparent(0){stroke_bounds}
      text "Invoice Number:  ",style: :bold
      text "Invoice Date: ",style: :bold
      text "Payment Term: ",style: :bold
      text "Due Date: ",style: :bold
    end
  end
  
  def order_info
    move_cursor_to 560
    bounding_box([400,560],:width=>200,:height=>150) do
      transparent(0){stroke_bounds}
      text "#{@order.invoice_number}"
      text "#{ Time.now.strftime('%Y-%m-%d')}"
      text "Due on Receipt" 
      text "#{@order.due_date}" 
    end
  end
  
  def bill_to
    bounding_box([0,426],:width=>200,:height=>150) do
      transparent(0){stroke_bounds}
      text "Bill To", size:28, style: :bold, :align=>:left
      text "#{User.find(@order.user_id).name}" 
      text "#{User.find(@order.user_id).phone}" 
      text "#{User.find(@order.user_id).address}" 
    end
  end
  
  def ship_to
    bounding_box([200,426],:width=>200,:height=>150) do
      transparent(0){stroke_bounds}
      text "Ship To", size:28, style: :bold, :align=>:left
      text "#{Warehouse.find(@order.warehouse_id).name}"
      text "#{Warehouse.find(@order.warehouse_id).phone}"
      text "#{Warehouse.find(@order.warehouse_id).street}"
      text "#{Warehouse.find(@order.warehouse_id).city+" "+Warehouse.find(@order.warehouse_id).state+" "+Warehouse.find(@order.warehouse_id).zip+" "+Warehouse.find(@order.warehouse_id).country}"
    end
  end

  def detail
    bounding_box([0,300],:width=>200,:height=>250) do
      transparent(0){stroke_bounds}
      text "Description", size:16, style: :bold, :align=>:left
      text "Model: #{Manufactory.find(Model.find(@order.model_id).manufactory_id).name } #{Model.find(@order.model_id).name}"
      text "Color: #{@order.color}"
      text "VIN :#{@order.vin}"
      move_down 10
      text "Premium"
      move_down 10
      text "Deposit"
      move_down 10
      text "Transportation"
      move_down 10
      text "Withhold"
      move_down 10
      text "Payment Received"
      move_down 10
      text "Total", size:18
    end
  end
  
  def detail_sec
    bounding_box([200,300],:width=>200,:height=>250) do
      transparent(0){stroke_bounds}
      text "Unit Price()", size:16, style: :bold, :align=>:left
      move_down 10
      text price("#{@order.msrp}")
      move_down 30
      text price("#{@order.premium}")
      move_down 10
      text price("#{@order.deposit}")
      move_down 10
      text price("#{@order.transportation}")
      move_down 10
      text price("#{@order.withhold}")
      move_down 10
      text price("#{@order.paid}")
    end
  end
  
  def detail_third
    bounding_box([330,300],:width=>200,:height=>250) do
      transparent(0){stroke_bounds}
      text "Amount()", size:18, style: :bold, :align=>:left
      move_down 10
      text price("#{@order.msrp}")
      move_down 28
      text price("#{@order.msrp+@order.premium}")
      move_down 10
      text price("#{@order.msrp+@order.premium-@order.deposit}")
      move_down 10
      text price("#{@order.msrp+@order.premium-@order.deposit+@order.transportation}")
      move_down 10
      text price("#{@order.msrp+@order.premium-@order.deposit+@order.transportation+@order.withhold}")
      move_down 10
      text price("#{@order.msrp+@order.premium-@order.deposit+@order.transportation+@order.withhold-@order.paid}")
      move_down 10
      text price("#{@order.msrp+@order.premium-@order.deposit+@order.transportation+@order.withhold-@order.paid}"), :style=>:bold
    end
  end
  
  def price(num)
    @view.number_to_currency(num)
  end
end