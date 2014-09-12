class TwitsController < ApplicationController
  before_filter :authorize
def index
    @twits = Twit.all.order('created_at DESC').first(10)
  end

  def new
    @twit = Twit.new
  end

  def create
    # @user = User.find(params[:user_id])
    @twit = Twit.create(twit_params)
    if @twit.valid?
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Twitted!" }
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @twit = Twit.find(params[:id])
  end

  def destroy
    @twit = Twit.find(params[:id])
    @twit.destroy
    redirect_to root_path, notice: "Twit Deleted.."
  end

private
  def twit_params
    params.require(:twit).permit(:content, :user_id).merge(:user_id => current_user.id)
  end
end
