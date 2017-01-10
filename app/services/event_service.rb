class EventService

  def initialize
  end

  def event_going_reach_count event_going, event_id, user_id
    if event_going.nil? 
      count = 1
    else
      count = event_going.reach_count + 1
    end 
    if !event_going.nil?
      event_going.update(reach_count: count)
    else
      EventGoing.create(event_id: event_id, user_id: user_id, reach_count: count)
    end
  end


  def going_and_may_be_count event_going, params
   reach_count = event_going.reach_count - 1 # For reducing reach count since it is event going submission
   event_going.update(reach_count: reach_count)

    if((params[:going_count] == '1') && (event_going.going_count == 0) && (event_going.may_be_count == 0))
      event_going.update(going_count: 1 )
      msg = "Your response is recorded !"
    elsif((params[:going_count] == '0') && (event_going.going_count == 0) && (event_going.may_be_count == 0))
      event_going.update(may_be_count: 1 )
      msg = "Your response is recorded !"
    else
      msg = "Your response is already recorded !"
    end
    msg
  end
end