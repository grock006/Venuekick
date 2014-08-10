class MapController < ApplicationController
  def index
    @client = Instagram.client
    @image = @client.tag_recent_media('concertphotography')
    @images = @image.first(12)
    @concert = @client.tag_recent_media('concertjunkie')
    @concerts = @concert.first(12)  
  end

  def show
    @remote = Songkickr::Remote.new("0QzVJaHpK8qTeyRY")
    @result = (params[:location]).delete("0123456789")
    @results = @remote.venue_search(@result).results 
    # add conditional to add "state" to search params if nil
    #@results.find do |r|
    #@latitude = r.lat
    #@longitude = r.lng
    #end
  end
  
  def showid
    @remote = Songkickr::Remote.new("0QzVJaHpK8qTeyRY")
    @result = @remote.venue_calendar(params[:venue_id]).results
    @venue = @remote.venue(params[:venue_id])
    
    @client = Instagram.client
    @results = @result
        
    @results.find do |r|
      @names = r.venue.display_name.delete('&').delete(".").delete('!').delete("'").delete(" ").delete("(").delete(")").delete("-").delete(",")
      @name = @names
    end
    
    @image = @client.tag_recent_media(@name)
    @images = @image.first(6)   
    end
  
  def saved
    @remote = Songkickr::Remote.new("0QzVJaHpK8qTeyRY")
    @saved = @remote.event(params[:event_id])
    @results = Savedconcert.new(name: @saved.display_name, venue: @saved.venue.display_name, time: @saved.start, uri: @saved.uri )
    @results.save
    @all = Savedconcert.all
  end
  
  def destroy
    @concert = Savedconcert.find_by_id(params[:concert_id])
    @concert.destroy
    redirect_to "/map/index"
  end
  
end

  
