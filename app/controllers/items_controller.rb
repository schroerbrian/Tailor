class ItemsController < ApplicationController

  def index

    @items = Item.all
    @item = Item.new
    @tag = "casual"
    category = 'shoes'
    gender = 'm'

    z = Zappos.new
    z.zap(gender,category)
    @zappos_results = z.info

  end

  def new
    @item = Item.new

    # @tag = "casual"
    # category = 'shoes'
    # gender = 'm'

    # z = Zappos.new
    # z.zap(gender,category)
    # @zappos_results = z.info

    # takes 2 params
    # makes a call to zappos using zappos rb
    # display photos and information on the page
    # each item has a checkbox
    # submit button
    # multiselect to call create methods

    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def multi_create

    render :json => "hahahahaha"
  end


  def create

    @item = Item.new(params[:item])

    if @item.save
      redirect_to '/'
    else
      render :json => "not saved"
    end

    # respond_to do |format|
    #   if @item.save
    #     format.html { redirect_to @item, notice: 'Item was successfully created.' }
    #     format.json { render json: @item, status: :created, location: @item }
    #     format.js
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

end


# # PUT /items/1
# # PUT /items/1.json
# def update
#   @item = Item.find(params[:id])

#   respond_to do |format|
#     if @item.update_attributes(params[:item])
#       format.html { redirect_to @item, notice: 'Item was successfully updated.' }
#       format.json { head :no_content }
#     else
#       format.html { render action: "edit" }
#       format.json { render json: @item.errors, status: :unprocessable_entity }
#     end
#   end
# end

# # DELETE /items/1
# # DELETE /items/1.json
# def destroy
#   @item = Item.find(params[:id])
#   @item.destroy

#   respond_to do |format|
#     format.html { redirect_to items_url }
#     format.json { head :no_content }
#   end
# end
