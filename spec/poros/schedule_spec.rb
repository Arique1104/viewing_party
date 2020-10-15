require 'rails_helper'

RSpec.describe Schedule do
  it 'exists' do
    pm_attrs = {"movie_title"=>"Enola Holmes", "runtime"=>"160", "day(1i)"=>"2020", "day(2i)"=>"10", "day(3i)"=>"15", "start_time(4i)"=>"19", "start_time(5i)"=>"00"}

    pm_schedule = Schedule.new(pm_attrs)

    am_attrs = {"movie_title"=>"Enola Holmes", "runtime"=>"160", "day(1i)"=>"2020", "day(2i)"=>"10", "day(3i)"=>"15", "start_time(4i)"=>"10", "start_time(5i)"=>"00"}

    am_schedule = Schedule.new(am_attrs)

    expect(pm_schedule).to be_a Schedule
    expect(pm_schedule.date).to eq("10/15/2020")
    expect(pm_schedule.start_time).to eq("7:00 PM")
    expect(am_schedule.start_time).to eq("10:00 AM")
  end
end
