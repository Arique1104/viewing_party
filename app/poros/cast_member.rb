class CastMember
  attr_reader  :name,
               :character,
               :order,
               :picture,
               :gender,
               :id
  def initialize(member)
    @name = member[:name]
    @character = member[:character]
    @order = member[:order]
    @picture = member[:profile_path]
    @gender = format_gender(member[:gender])
    @id = member[:id]
  end

  def format_gender(data)
    if data == 1
      'female'
    elsif data == 2
      'male'
    else
      'n/a'
    end
  end
end
