# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mitiko = Member.find_or_create_by!(email: "mitiko@example.com") do |member|
  member.name = "みちこ"
  member.password = "password"
  member.self_introduction = "70代後半を迎えましたが、元気にマンションの清掃の仕事を続けられることに感謝しています。日々の楽しみは、中国や韓国のドラマを観たり、読書にふけったりすることです。高血圧があるため、健康に気を配りながら食事にも気をつけています。"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/flower_field.webp"), filename:"チューリップ畑")
end

sirokuma = Member.find_or_create_by!(email: "sirokuma@example.com") do |member|
  member.name = "しろくま"
  member.password = "password"
  member.self_introduction = "母と二人三脚の毎日です。製造業で働きながら、80代後半の母の介護にも向き合っています。週末の釣りが、小さな癒しと元気の源です。"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sakurajima.webp"), filename:"桜島")
end

sa_chin = Member.find_or_create_by!(email: "sa_chin@example.com") do |member|
  member.name = "さっちん"
  member.password = "password"
  member.self_introduction = "息子と娘の母です。落語や歌舞伎を鑑賞すること、カフェ巡りが趣味です。在宅勤務の夫と、父と母との二世帯で暮らしており、とても賑やかで活気のある毎日を過ごしています。"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/french_toast.webp"), filename:"フレンチトースト")
end

a_chan = Member.find_or_create_by!(email: "a_chan@example.com") do |member|
  member.name = "あーちゃん"
  member.password = "password"
  member.self_introduction = "建築関係の激務な夫と、発達障害のある息子との日々に奮闘する中で、そんな日常の記録を綴っています。趣味は、息子と一緒に仮面ライダーを観ることと、家事の合間にVtuberの配信を流し聴きすることです。"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/fuji.webp"), filename:"藤の花")
end

 brother = Member.find_or_create_by!(email: "brother@example.com") do |member|
  member.name = "おにぃ"
  member.password = "password"
  member.self_introduction = "趣味はサッカー、キャンプ、旅行、飲み会など、人との交流や体を動かすことです。最近は、自分の気持ちを整理するために日記を書き始めました。新しい発見もあって、ちょっとした習慣になりそうです。"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/blue_sky.webp"), filename:"青い空")
end

melon_bread = Member.find_or_create_by!(email: "melon_bread@example.com") do |member|
  member.name = "メロンパン"
  member.password = "password"
  member.self_introduction = "食べるのが大好きで、パン屋さん＆ケーキ屋さん巡りがライフワーク🍞✨もらったインスピレーションは、自家製パンやスイーツ作りに活かしてます🧁💡でも最近…健康診断でちょっとひっかかって💦 そこから「健康ごはん」もゆるく始めました🌿"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/orange_flower.webp"), filename:"オレンジ色の花")
end

mitsuya_cider = Member.find_or_create_by!(email: "mitsuya_cider@example.com") do |member|
  member.name = "三ツ矢サイダー"
  member.password = "password"
  member.self_introduction = "70代になってから、デイサービスに通い始めました。ここでは毎回会話がはずみ、とても楽しい時間を過ごしています。趣味は、季節の花を眺めながら散歩に出かけることです。どうぞよろしくお願いします。"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/blue_flower.webp"), filename:"青い花")
end

kazuko = Member.find_or_create_by!(email: "momo@example.com") do |member|
  member.name = "もも"
  member.password = "password"
  member.self_introduction = "娘に勧められてはじめてみました。80代からの新しい挑戦です。携帯の使い方にはまだ慣れず、戸惑うことも多いですが、楽しみながら頑張っていきたいと思います。"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/himawari.webp"), filename:"ひまわり")
end

kame = Member.find_or_create_by!(email: "kame@example.com") do |member|
  member.name = "カメ"
  member.password = "password"
  member.self_introduction = "定年を迎え、第二の人生をのんびり楽しんでいます。最近は、家庭菜園や散歩、たまに釣りに出かけたりと、自然と親しむ時間が増えました。家ではコーヒーをいれて音楽を聴きながら過ごすのが日課です。よろしくお願いします。"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kame.webp"), filename:"亀")
end

 kenjiro = Member.find_or_create_by!(email: "kenjiro@example.com") do |member|
  member.name = "けんじろう"
  member.password = "password"
  member.self_introduction = "三女が手を離れたので、最近は山登り＆温泉にハマり中。お腹の脂肪とは年単位で格闘中。"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/torii.webp"), filename:"鳥居")
end

 shiba = Member.find_or_create_by!(email: "shiba@example.com") do |member|
  member.name = "柴犬"
  member.password = "password"
  member.self_introduction = "ダブルワークの父。妻の病をきっかけに、生活ががらりと変わりました。忙しい日々のなかでも、家族との時間に救われています。誰かの気づきになるような、そんな日常を少しずつ綴っています。"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/dog.webp"), filename:"柴犬")
end

Post.find_or_create_by!(title: "今日の練習は生花のスケッチ") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/person-drawing-picture.webp"), filename:"絵を描く高齢者")
  post.body = "最近、絵を描くことを始めました。夫婦で絵画教室に通っています。主人は心疾患を抱えており、医師からは寿命があまり長くないかもしれないと告げられています。だからこそ、残された時間を二人で丁寧に過ごすことを大切にしています。次回の絵画教室では、生花を手本に描く課題が出されており、今日はその練習をしています。教室には私たちと同じ世代のご夫婦が多く、皆さんとの交流のひとときもまた、楽しみの一つになっています。"
  post.member = mitiko
end

Post.find_or_create_by!(title: "暮らしの中の介護") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/doctor-home-visit.webp"), filename:"訪問診療")
  post.body = "母の介護が始まったのは2年前のことです。その時から、訪問診療の先生方にお世話になっています。母は糖尿病の悪化で突然入院し、何もかもが初めてで、当時は右も左もわからない状態でした。入院中、医師や看護師の方々と何度も対話を重ねる中で、母が「自宅で過ごしたい」と強く願っていることを知り、その思いを尊重して在宅医療を選びました。しかし、仕事と介護の両立は想像以上に困難で、毎日が葛藤の連続でした。それまで介護とは無縁だった生活が、ある日を境に一変したのです。この突然の変化と向き合いながら、必死に過ごしてきた日々の軌跡を、ここに記していきたいと思います。同じような状況にある誰かの、ほんの小さな助けになれば幸いです。"
  post.member = sirokuma
end

Post.find_or_create_by!(title: "家族で思い出を楽しむ時間") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/family-looking-photo-album.webp"), filename:"家族でアルバムを鑑賞")
  post.body = '父はこれまでに何度か脳梗塞で倒れています。右半身に麻痺が残っており、ある日「いつもより右腕が上がらない」と訴えて病院を受診したところ、3度目の脳梗塞と判明しました。半年間のリハビリを経て、ようやく自宅に戻ってきたところです。父は明るく前向きな性格で、体力にも自信があり、おしゃべりも好きなので、病院生活もそれなりに楽しんでいた様子でした。そんな父の楽しみは、家族や親戚と一緒に商業施設へ遊びに行くこと。そのための体力づくりとして、今はデイサービスに通って頑張っています。今日は、無事に退院して帰ってきた父と一緒に、前回行った東京ドームでの写真集を家族みんなで楽しんでいます。'
  post.member = sa_chin
end

Post.find_or_create_by!(title: "受け止めるまでの時間") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/family-with-child-in-park.webp"), filename:"子供を連れて家族で公園")
  post.body = "息子はとても手のかかる子で、癇癪は激しく、強いこだわりがあり、興奮しすぎて夜になってもなかなか眠れず、好き嫌いも多く、せっかく作った食事を食べてもらえないことがよくありました。どこかで「もしかしたらADHDなのかもしれない」と思いながらも、検査で現実を突きつけられるのが怖くて、私はずっと目を背けていました。それでも、もうすぐ小学校に上がるというタイミングで支援センターに相談したところ、検査を勧められ、放課後デイサービスなどの利用できる支援についても教えてもらうことができました。もしあのとき、もっと早く検査を受けて、支援に繋がっていたら──。きっと息子も、そして私自身も、もっと心に余裕を持って過ごせていたかもしれません。この経験が、今まさに迷っている誰かの「大丈夫かな」と一歩踏み出すきっかけになればと、心から願っています。"
  post.member = a_chan
end

Post.find_or_create_by!(title: "仕事しか考えられなくなったあの日から") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/writing-diary-person.webp"), filename:"日記を書く人")
  post.body = "社会人一年目、激務に追われるうちに、少しずつ趣味に費やす時間がなくなっていった。気づけば、家と職場を往復するだけの毎日。以前は毎週のように人と交流し、笑って過ごしていたのに、今では数回のLINEのやり取りさえもままならなくなっていた。毎朝ベッドから起き上がるのがつらく、頭の中は仕事のことでいっぱいだった。そんなある日、友人から電話があり、「一度心療内科を受診してみたら？」と勧められた。診断は「適応障害」。まさか自分が――そう思って、現実をうまく受け止めきれなかった。そんな中で出会ったのが、自分の気持ちを日記に書き出す「ジャーナリング」だった。言葉にすることで、少しずつ自分の心の輪郭が見えてきた。今では時間も経ち、仕事も変え、あの頃の自分を乗り越えることができた。それはきっと、現実と向き合おうと決めて綴った、あの日々の日記のおかげだと思っている。"
  post.member = brother
end

Post.find_or_create_by!(title: "趣味（パン・スイーツ）との付き合い方の工夫") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/cooking-curry-person.webp"), filename:"カレーを作る人")
  post.body = 'いつまでも元気で健康に過ごすために、食生活の改善を始めました。今回作っているのは無水カレー。使っている食材は、スパイスだけが入った赤缶のカレー粉、トマト、ジャガイモ、豚肉、にんじんです。趣味で楽しんでいたパンやスイーツも、食べる回数を週4回から週2回に減らし、その他の食事も少しずつ健康的な内容に変えているところです。実は最近の健康診断で、血糖値と内臓脂肪の数値が上がってきてしまって…！50代という年齢もあり、そろそろ本格的に健康を意識すべきタイミングかなと感じています。'
  post.member = melon_bread
end

Post.find_or_create_by!(title: "神社に通う習慣") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/jinja.webp"), filename:"神社")
  post.body = "近所の神社では、季節ごとにいろんなお花が咲いていて、それを見るのが毎年の楽しみになっています。もともと通いはじめたきっかけは、夫が病気で倒れたときでした。がんは思うようには回復せず、当時は祈るような気持ちで何度も神社に足を運んでいました。そんなとき、ふと目に入った季節の花が、心を少しずつ元気づけてくれたんです。今では、健康のために毎日4,000歩を目標に散歩していて、そのコースの途中にこの神社があります。つらかった時期もあったけれど、この場所に通う習慣が、気づけば自分の健康を支える日課になっていました。これからも、神社に気持ちよく通えるように、元気でいられるように、自分のペースで頑張りたいと思います。"
  post.member = mitsuya_cider
end

Post.find_or_create_by!(title: "ご近所とのゆるやかな交流") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/garden-flowerbed.webp"), filename:"ガーデンフラワー")
  post.body = 'うちの近所には、お花をきれいに育てているお宅がたくさんあります。バラに紫陽花、マリーゴールド……本当にいろいろ咲いていて、歩くのが楽しみになります。「きれいですねぇ」なんて声をかけると、「よかったらどうぞ」とお花を分けてくださる方もいて、それを家に飾って眺めるのも、私のちょっとした楽しみのひとつです。顔見知りも多くて、皆さんと「今日は足が痛いよ」「腰が重くてねぇ」なんて言い合いながら笑っています。でも、そうやって笑い合えることこそ、元気の証なのかもしれませんね。'
  post.member = kazuko
end

Post.find_or_create_by!(title: "笑い合うだけで、今日も健康") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/soccer.webp"), filename:"サッカーグランド")
  post.body = '近くの自然が多い公園で、仲間とサッカーボールを軽く蹴り合うのが、毎朝の楽しみになっています。疲れたらベンチに腰かけて、世間話をひとしきり。これがまた、いい時間なんですよ。なんだかんだ言って、元気のもとはこういう毎日なのかもしれません。テレビで「健康な人は歩くのが速い」なんて言ってましたが、サッカーは足を動かすにはちょうどいい運動でしてね。何より、仲間と顔を合わせて笑い合えるのが一番の薬です。現役の頃は、仕事に追われて気づいたら一日が終わってるような毎日でしたけど、今はこうして体も気にしながら、無理せず、仲間と過ごす時間を大事にしています。'
  post.member = kame
end

Post.find_or_create_by!(title: "60代からの新たな挑戦と趣味") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/mountain-hiking.webp"), filename:"山登り")
  post.body = "娘との旅行で屋久島の縄文杉トレッキングに挑戦。登山グッズ一式を揃えて臨んだが、これが想像以上によかった。自然の中を黙々と歩く時間、そして縄文杉に出会えたときの達成感…なんとも言えないな。山登りを始めたのは60代に入ってからだけど、それ以来すっかりハマって、週末はほぼ山の中。体力づくりと、なかなか落ちないお腹まわり対策にもちょうどいい。これからも無理せず、でもしっかり楽しんでいきたいと思う。"
  post.member = kenjiro
end

Post.find_or_create_by!(title: "妻の突然の病気") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sunrise-scenery.webp"), filename:"朝日")
  post.body = 'ある日、妻が「ちょっとした違和感がある」と話していました。忙しさもあってなかなか病院に行けずにいたのですが、お腹の横にあった柔らかい膨らみが、少しずつ大きくなっていきました。ようやく受診したときには、すでにステージ4の悪性リンパ腫と診断されました。幸いにも、治療との相性が良く、抗がん剤の効果もあり、一命を取り留め、今では少しずつ日常を取り戻せるようになりました。ただ、二人で自宅を購入し、共働きで支え合っていくはずだった生活は、自分ひとりで背負う形になりました。現在は本業に加えて、飲食店でのダブルワークの日々です。そんな中でも、愛する妻と子どもと過ごす時間が、何よりの癒しであり、明日を乗り越える力になっています。少しでも気持ちを整理したくて、そしてどこかで誰かとつながれるかもしれないと思い、この場所での投稿をはじめてみました。'
  post.member = shiba
end



