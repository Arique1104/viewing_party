require 'rails_helper'

RSpec.describe CastMember do
  it 'exists' do
    attr = {:cast_id=>1,
            :character=>'Enola Holmes',
            :credit_id=>'5a56461b9251417aa9024829',
            :gender=>1,
            :id=>1356210,
            :name=>'Millie Bobby Brown',
            :order=>0,
            :profile_path=>'/yzfxLMcBMusKzZp9f1Z9Ags8WML.jpg'}
    cast_member = CastMember.new(attr)

    expect(cast_member).to be_a CastMember
    expect(cast_member.name).to eq('Millie Bobby Brown')
    expect(cast_member.character).to eq('Enola Holmes')
    expect(cast_member.order).to eq(0)
    expect(cast_member.picture).to eq('/yzfxLMcBMusKzZp9f1Z9Ags8WML.jpg')
    expect(cast_member.gender).to eq('female')
    expect(cast_member.id).to eq(1356210)
  end
end
