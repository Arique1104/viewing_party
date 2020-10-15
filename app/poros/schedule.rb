class Schedule
 attr_reader  :date,
              :start_time
  def initialize(secure_params)
    @secure_params = secure_params
    @date = format_date
    @start_time = format_start_time
  end

  def format_date
    "#{@secure_params['day(2i)']}/#{@secure_params['day(3i)']}/#{@secure_params['day(1i)']}"
  end

  def format_start_time
    hour = "#{@secure_params['start_time(4i)']}"
    minutes = "#{@secure_params['start_time(5i)']}"
    
    if hour.to_i > 12
      "#{hour.to_i - 12}:#{minutes} PM"
    else
      "#{hour}:#{minutes} AM"
    end
  end
end
