class ItemsController < ApplicationController

  layout false

  def index
    sleep 3
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
    tags = params[:item][:tag].scan(/(\d+)/)
    params[:item].delete(:category)
    params[:item].delete(:tag)

    @item = Item.new(params[:item])

    if @item.save
      @item.categories << category
      tags.each do |t|
        tag_object = Tag.find(t[0].to_i)
        @item.tags << tag_object
      end
      render :text => "saved"
    else
      render :text => "not saved"
    end

  end

end

    # tag = Tag.find_by_name(params[:item][:tag].downcase)