
# USERS
have_many :friends, foreign_key: :friend_id, class_name: "Friendship"
have_many :parties
have_many :party_participants, through: :parties

rails g migration CreateUsers email:string password_digest:string

# Update attributes for name:string



# Friendship JOINS
belongs_to :users

rails g migration CreateFriends



# PARTY TABLE

rails g migration CreateParties user:references movie_id:string runtime:string date:string start_time:string

# Update attributes for status:boolean, default=>true

  # Status is a view condition, not a database option
    # Based on user_id
      # User => Dashboard => iterates through user.parties => All these are status: Host
      # User => Dashboard => iterates through Party.all => Any query for participant = user.id is status: Participant

  Party = BulkDiscount and the User/Host = Merchant
    # Boolean (A host can cancel a party without deleting it)
      # User => Dashboard => iterates through user.parties => Display the boolean status as Status:Host or Status:Cancelled
I am a user
I click on new party
I am taken to form
Form has invisible connections to my user_id




# PARTY_PARTICIPANTS JOINS

rails g migration CreatePartyParticipants friends:references party:references status:boolean
