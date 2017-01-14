class EventService

  def initialize
  end

  def event_going_reach_count event_going, event_id, user_id
    if event_going.nil? 
      count = 1
      EventGoing.create(event_id: event_id, user_id: user_id, reach_count: count)
    end
  end


  def going_and_may_be_count event_going, params
    if(params[:going_count] == '1')
      event_going.update(going_count: 1 )
      event_going.update(may_be_count: 0 )
      msg = "Your response is recorded !"
    elsif(params[:going_count] == '0')
      event_going.update(may_be_count: 1 )
      event_going.update(going_count: 0 )
      msg = "Your response is recorded !"
    end
    msg
  end
end