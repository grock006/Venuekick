class ProfileController < ApplicationController



def index
@concerts = Concert.where(save_id: current_user.id)  
end

def create
@remote = Songkickr::Remote.new("0QzVJaHpK8qTeyRY")
@save = @remote.event(params[:id])
     
@concert = Concert.new(name: @save.display_name, venue: @save.venue.display_name, time: @save.start, uri: @save.uri, user_id: current_user.id, save_id: current_user.id)

if @concert.save
      flash[:info] = ["New Concert Added!"]
      redirect_to '/profile'
    else
      flash[:info] = ["Please Create Account To Save Concerts"]
      redirect_to '/signup'
    end
  end

  def destroy
    @concert = Concert.find_by_id(params[:id])
    @concert.destroy
    flash[:info] = ["Concert Deleted!"]
    redirect_to "/profile"
  end

end
