require 'rails_helper'

RSpec.describe MovieDetails do
  it 'exists' do
    attrs ={
      :movie_details=> {
        :adult=>false,
        :backdrop_path=>"/kMe4TKMDNXTKptQPAdOF0oZHq3V.jpg",
        :belongs_to_collection=>nil,
        :budget=>21000000,
        :genres=>[{:id=>80, :name=>"Crime"},
                  {:id=>18, :name=>"Drama"},
                  {:id=>9648, :name=>"Mystery"}],
        :homepage=>"https://www.netflix.com/title/81277950",
        :id=>497582,
        :imdb_id=>"tt7846844",
        :original_language=>"en",
        :original_title=>"Enola Holmes",
        :overview=> "While searching for her missing mother, intrepid teen Enola Holmes uses her sleuthing skills to outsmart big brother Sherlock and help a runaway lord.",
        :popularity=>1443.658,
        :poster_path=>"/riYInlsq2kf1AWoGm80JQW5dLKp.jpg",
        :production_companies=> [{
          :id=>121424,
          :logo_path=>nil,
          :name=>"PCMA Productions",
          :origin_country=>""},
          {
          :id=>923,
          :logo_path=>"/5UQsZrfbfG2dYJbx8DxfoTr2Bvu.png",
          :name=>"Legendary Pictures",
          :origin_country=>"US"},
          {
          :id=>174,
          :logo_path=>"/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png",
          :name=>"Warner Bros. Pictures",
          :origin_country=>"US"}],
          :production_countries=> [{
          :iso_3166_1=>"GB",
          :name=>"United Kingdom"},
          {
          :iso_3166_1=>"US",
          :name=>"United States of America"}],
          :release_date=>"2020-09-23",
          :revenue=>0,
          :runtime=>123,
          :spoken_languages=>[{:iso_639_1=>"en", :name=>"English"}],
          :status=>"Released",
          :tagline=>"Mystery runs in the family.",
          :title=>"Enola Holmes",
          :video=>false,
          :vote_average=>7.6,
          :vote_count=>1946},
      :cast_details=> [
        {
        :cast_id=>1,
        :character=>"Enola Holmes",
        :credit_id=>"5a56461b9251417aa9024829",
        :gender=>1,
        :id=>1356210,
        :name=>"Millie Bobby Brown",
        :order=>0,
        :profile_path=>"/yzfxLMcBMusKzZp9f1Z9Ags8WML.jpg"},
        {
        :cast_id=>4,
        :character=>"Sherlock Holmes",
        :credit_id=>"5d152cf6bbd0b00030c263db",
        :gender=>2,
        :id=>73968,
        :name=>"Henry Cavill",
        :order=>1,
        :profile_path=>"/hErUwonrQgY5Y7RfxOfv8Fq11MB.jpg"},
        {
        :cast_id=>9,
        :character=>"Mycroft Holmes",
        :credit_id=>"5d416110b87aec61c23c6440",
        :gender=>2,
        :id=>237455,
        :name=>"Sam Claflin",
        :order=>3,
        :profile_path=>"/5DtmRlRZc7wPbat1INQPqsxaH4a.jpg"},
        {
        :cast_id=>5,
        :character=>"Eudoria Holmes",
        :credit_id=>"5d15319e8b959e0022f3b0aa",
        :gender=>0,
        :id=>1283,
        :name=>"Helena Bonham Carter",
        :order=>4,
        :profile_path=>"/mW1NolxQmPE16Zg6zuWyZlFgOwL.jpg"},
        {
        :cast_id=>14,
        :character=>"Lord Tewkesbury",
        :credit_id=>"5d41615034e1521fb8eb9d4d",
        :gender=>2,
        :id=>1558986,
        :name=>"Louis Partridge",
        :order=>5,
        :profile_path=>"/8IDXypHN4IAvN6RYuvlukyFbcSt.jpg"},
        {
        :cast_id=>10,
        :character=>"Linthorn",
        :credit_id=>"5d41612034e1520791e76b70",
        :gender=>2,
        :id=>39659,
        :name=>"Burn Gorman",
        :order=>6,
        :profile_path=>"/31IjmuR91tpXdBMI714ap1MAVLv.jpg"},
        {
        :cast_id=>11,
        :character=>"Lestrade",
        :credit_id=>"5d41612fb87aec61c23c6460",
        :gender=>2,
        :id=>81840,
        :name=>"Adeel Akhtar",
        :order=>7,
        :profile_path=>"/nNdjhe4t5CSqcFGCa7ERe40OW2o.jpg"},
        {
        :cast_id=>8,
        :character=>"Miss Harrison",
        :credit_id=>"5d167d0dfe63fa00237e0bae",
        :gender=>1,
        :id=>10981,
        :name=>"Fiona Shaw",
        :order=>8,
        :profile_path=>"/tjM74LcxwnYM77Csg1EtlXb1F9a.jpg"},
        {
        :cast_id=>12,
        :character=>"Edith",
        :credit_id=>"5d41613ab87aec23a4393bad",
        :gender=>1,
        :id=>1531926,
        :name=>"Susan Wokoma",
        :order=>9,
        :profile_path=>"/uzcYkQ1KWlNEOrwnklGH8C3qB1Y.jpg"},
        {
        :cast_id=>13,
        :character=>"The Dowager",
        :credit_id=>"5d41614634e1523549e7341b",
        :gender=>1,
        :id=>47468,
        :name=>"Frances de la Tour",
        :order=>10,
        :profile_path=>"/aDSge7DWhUyMyA0rEXEZpGiZzGO.jpg"}],
      :reviews=>{
        :id=>497582,
        :page=>1,
        :results=>[
          {
          :author=>"msbreviews",
          :content=> "If you enjoy reading my Spoiler-Free reviews, please follow my blog @\r\nhttps://www.msbreviews.com\r\n\r\n2020 is unquestionably one of the most challenging years movie theaters ever had to face. The still going global pandemic closed down everything, including my favorite place to spend the most wonderful time. Therefore, the already growing streaming services got a huge bump, earning more and more subscribers during this tough phase in our lives. Netflix has been extremely busy releasing brand-new flicks since the beginning of the year, being The Devil All The Time, I’m Thinking of Ending Things, and Project Power the latest. Some better than others, but I’m still to find a 2020’s original film from the studio that I genuinely dislike. Is Enola Holmes the first one?\r\n\r\nWell, no, far from that. With such a talented cast and high production value, a new take on the classic Sherlock Holmes’ mysteries is certainly welcome, and this is one of my top two compliments. Debutant director Harry Bradbeer and Jack Thorne (His Dark Materials) offer a refreshing twist on the famous detective’s stories, not only by focusing on her less popular sister instead but also by delivering a different Sherlock than the one we’re used to seeing. The editing (Adam Bosman), cinematography (Giles Nuttgens), and score (Daniel Pemberton) contribute to quirky, fun, captivating scenes that help the viewer follow Enola’s assessment of several situations, including her thought process (interpretation of clues, formulating plans), most of the times by breaking the fourth wall.\r\n\r\nThis last aspect takes me to my other top two praise, Millie Bobby Brown. She’s the reason why these sequences work so well. From the moment I first saw her in Stranger Things, I genuinely believed she would be a star. For the past few years, I’ve constantly left in writing that she will break the Oscars’ record for the youngest actress to ever win a Best Actress award. Millie still has a bit more than five years to achieve that, and she’s already leading major blockbusters like Godzilla: King of the Monsters. With this Netflix movie, Millie proves once again her versatility (already portrayed completely different characters in distinct genres), emotional range (effortlessly delivers any type of scene), and mature acting (rarely overacts or doesn’t offer enough, she’s always on point).\r\n\r\nShe incorporates Enola in such a unique manner that I struggle to find a better choice to play this character, who is herself also a standout. Enola’s arc feels genuinely empowering. It doesn’t feel like a forced political statement nor a narratively illogical decision to develop this character in the way Thorne does. Every enigma she tries to decipher, every plan she needs to create to save someone or something, every choice she makes feels earned and justified. Enola doesn’t let herself be restricted by old society’s rules of how the world should work. She wants to be herself without having to answer to nobody. It might be a generic message, but it’s transmitted through seamless execution.\r\n\r\nRegarding the rest of the cast, Henry Cavill is a major surprise as Sherlock, and I won’t be shocked if it generates some controversy (update: it did). It’s a notably different version of the distant, emotionless, overly analytical Sherlock that Robert Downey Jr. and Benedict Cumberbatch interpreted, which I embrace with open arms. I don’t care about rights or origins. A character is what the actor and writer(s) make of it, it doesn’t belong to anyone let alone its “fans”. Cavill shows a cheekier display than what he’s used to presenting, and Thorne adjusted a couple of specific traits from the classic character. Louis Partridge and Sam Claflin are both excellent as Lord Viscount Tewksbury and Mycroft, respectively. The remaining actors all offer decent performances, but the two standouts are undoubtedly Millie and Cavill.\r\n\r\nAs for the film itself, I was ready to write “it’s fine” half an hour before I finished it. Even though it feels unique in several areas, Enola Holmes still follows a pretty generic story, with formulaic plot points and the usual character drama. Sadly, it doesn’t really bring anything new story-wise. It features no surprises, which is not a good attribute for a movie with a central mystery. However, that lack of enthusiasm leads me to a significant issue I didn’t expect to find in the latter half of the film. Its mystery isn’t truly one, and it’s set aside midway through the movie, which is a questionable narrative decision. I don’t remember the last time (if ever) where a film completely discards its main storyline (one that received an entire first act of set up), replacing it with a young-adult romantic endeavor (which is pretty convincing, but not as a main storyline).\r\n\r\nI’m a firm advocate of the trailer-free methodology. Expectations can make or break the viewer’s opinion about a movie, and nowadays, trailers can be deceiving, misleading, and show way too much. I missed everything related to this film, watching it 100% blind. Had I watched Enola Holmes’ official trailer beforehand, I’d definitely be inclined to the negative side of the divisive line I stand on right now. Its trailer focuses on what most people will expect from the movie: the main mystery surrounding Enola’s mother disappearance. Considering how the film actually goes, it’s safe to write that its trailer is a bit deceiving.\r\n\r\nAll in all, Enola Holmes offers a pleasant, refreshing take on a franchise that might have a new future now. Focusing on Sherlock Holmes’ sister, Harry Bradbeer and Jack Thorne deliver a light, fun, entertaining story, packed with action, clues to decipher, and a brilliant cast. Millie Bobby Brown keeps climbing up the stairs of success, demonstrating her versatility, range, and maturity as a young actress. It’s a matter of time until she becomes one of the most coveted actresses in Hollywood. Her chemistry with Henry Cavill and Louis Partridge is phenomenal, and her fourth wall breaks are fascinating. Technically, Enola’s thoughts and feelings are perfectly transmitted to the audience through outstanding editing, cinematography, and score. However, story-wise, it’s as generic as it could be, boasting absolutely no surprises, and a central mystery that’s not quite one. It’s still a fine Saturday night flick to enjoy with family and friends but be advised: its trailer is a tad misleading, so keep your mind open and expectations grounded.\r\n\r\nRating: B-",
          :id=>"5f69e4d0cee2f6003633becf",
          :url=>"https://www.themoviedb.org/review/5f69e4d0cee2f6003633becf"},
          {
          :author=>"Kamurai",
          :content=> "Really good watch, might watch again, and can recommend.\r\n\r\nTo absolutely fair, I'm not sure if this will appeal to Sherlock Holmes fans, but does expand the \"Sherlock-verse\", so make up your own mind.\r\n\r\nI love Millie Bobby Brown (\"Stranger Things\"), and this proves she is quite capable of not only leading a movie, but carrying the entire bloody thing.\r\n\r\nDespite what feels almost a lack of contribution from everyone else in the movie, this actually turns out quite good.  I do wish she didn't do the fourth wall breaks, it really feels like she's either turning to a documentary crew or suddenly updating instagram.  It was a little jarring, and they're clearly referencing Sherlock's \"mind palace\" techniques displayed in the movies, but with a \"twist\".\r\n\r\nI honestly expected someone to ask her if she's okay, like in \"Dora and the Lost City of Gold\".  It would have been equally acceptable to do narration over her actions in the same, but I understand wanting to do something different.\r\n\r\nThe only other people that didn't seem to be phoning it in were Burn Gorman who did quite a good antagonist, and Frances de la Tour who managed to elevate \"concerned grannie\".\r\n\r\nMaybe Sam Claflin did the job perfectly and Mycroft is supposed to be that bland and irritating, but Henry Cavill had an air of being relieved that didn't have to have Sherlock doing any real deductions, he just had to stand there and seem mildly intrigued by things.\r\n\r\nOverall, there is a good movie here in spite of itself, and the sad part is that it could have been great.",
          :id=>"5f6f9d26a6e2d2003a7d4e02",
          :url=>"https://www.themoviedb.org/review/5f6f9d26a6e2d2003a7d4e02"}],
          :total_pages=>1,
          :total_results=>2}}
    movie_details = MovieDetails.new(attrs)

    expect(movie_details).to be_a MovieDetails
    expect(movie_details.title).to eq('Enola Holmes')
    expect(movie_details.vote_average).to eq(7.6)
    expect(movie_details.runtime).to eq({:min=>3, :hr=>2, :total => 123})
    expect(movie_details.genres).to eq(["Crime", "Drama", "Mystery"])
    expect(movie_details.description).to eq("While searching for her missing mother, intrepid teen Enola Holmes uses her sleuthing skills to outsmart big brother Sherlock and help a runaway lord.")
    expect(movie_details.cast_members.count).to eq(10)
    expect(movie_details.cast_members[0]).to be_a CastMember
    expect(movie_details.reviews.count).to eq(2)
    expect(movie_details.reviews[0]).to be_a MovieReview
    expect(movie_details.id).to eq(497582)
  end
end
