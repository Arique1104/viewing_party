PartyParticipant.destroy_all
Party.destroy_all
Friendship.destroy_all
User.destroy_all

@twilight_sparkle = User.create!(name:"Twilight", email:"twilight_sparkle@email.com", password:"User@us3r")

@spike = User.create!(name:"spike", email:"spike@email.com", password:"User@us3r")
@starlight_glimmer = User.create!(name:"Starlight", email:"starlight_glimmer@email.com", password:"User@us3r")
@pinkie_pie = User.create!(name:"pinkie", email:"pinkie_pie@email.com", password:"User@us3r")

@rainbow_dash = User.create!(name:"Rainbow Dash", email:"rainbow_dash1@email.com", password:"User@us3r")

@twilight_sparkle.friendships.create!(friend:@spike)
@spike.friendships.create!(friend:@twilight_sparkle)
@twilight_sparkle.friendships.create!(friend:@starlight_glimmer)
@starlight_glimmer.friendships.create!(friend:@twilight_sparkle)
@rainbow_dash.friendships.create!(friend:@twilight_sparkle)
@twilight_sparkle.friendships.create!(friend:@rainbow_dash)

@invited_party = @rainbow_dash.parties.create!(movie_title: "Monsters, Inc", runtime: 140, date: "10/24/2020", start_time: "18:00")
@invited_party.party_participants.create!(user:@twilight_sparkle)
@my_party = @twilight_sparkle.parties.create!(movie_title: "Enola Holmes", runtime: 160, date: "10/17/2020", start_time: "19:00")
@my_party.party_participants.create!(user:@spike)
@my_party.party_participants.create!(user:@starlight_glimmer)
