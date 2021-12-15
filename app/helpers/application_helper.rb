module ApplicationHelper
  def render_if(condition, record)
    if condition
      render record
    end
  end

  def set_time (time)
    time  = Time.now
  end
end
