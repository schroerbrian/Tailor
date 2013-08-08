class ItemsController < ApplicationController

  layout false

  def index

    @items = Item.all
    @item = Item.new

    @params = params

    @tag = params[:tag]
    @category=params[:category]
    @gender = params[:gender]

    z = Zapposclient.new({:category => @category, :gender => @gender})
    z.zappos_data
    @zappos_results = z.info

  end

  def new
    @item = Item.new

  end

  def create

    category = Category.find_by_name(params[:item][:category].humanize)
    params[:item].delete(:category)

    binding.pry
    tag_array = []
    params[:item][:tag].each do |t|
      tag_array << Tag.find(t)
    end

    params[:item].delete(:tag)

    @item = Item.new(params[:item])

    if @item.save
      @item.categories << category
      tag_array.each do |t|
        @item.tags << t
      end
      render :text => "saved"
    else
      render :text => "not saved"
    end

  end

end

    # tag = Tag.find_by_name(params[:item][:tag].downcase)