# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([{ name: '展開一場解惑之旅', points: 10, needs: 4, intro: '聽四場「不同主題」的演講，每場演講前為自己設定一個問題，並在聆聽的過程中找到答
  案，須將問題與答案記錄下來。' },
  { name: '站在巨人的肩膀上', points: 10, needs: 2, intro: '試著靜下心來，閱讀兩本書籍，展開屬於自己的閱讀旅行，在書中找到一段自己最有感覺
的文字，並與別人分享。' },
  { name: '傳承手中的火把', points: 10, needs: 1, intro: '找一位一起參與研習的夥伴合作，分享彼此在研習中學到最多最有感覺的一段內容，並
    將這段分享錄成影片上傳至網路。' },
  { name: '留下走過的足跡', points: 10, needs: 1, intro: '時間不斷前進，記憶不斷流逝，試著運用學習力的筆記技巧，記錄一份完整的筆記。(如筆
記頁面太小可翻到本冊後面)' },
  { name: '找回最親近的相處', points: 10, needs: 2, intro: '從小到大，父母(或親近的人)總是盡所能的想多接觸多瞭解我們，但隨著越長越大彼此接
觸時間變短，也越來越不知該如何相處，試著寫一封信給他們，與他們談談自己的心吧!' },
  { name: '有任務的旅行', points: 10, needs: 1, intro: '展開一場未知的旅行，去一個沒有去過的地方，並訪談一位陌生人，記錄他的故事(為自己
留下至少二十張的旅行照片)。' },
  { name: 'Face to Face' , points: 10, needs: 3, intro: '踏出冰冷的網路世界，找出三位好久不見的朋友分別共進早餐、午餐或晚餐，記得這個人
不可以是平常就會一起用餐的朋友喔!(記得來張溫馨的用餐合照)'},
  { name: '再見心中的憾', points: 10, needs: 1, intro: '請你與曾經有誤會、起衝突或一直無法鼓起勇氣約見面的人重新聯絡，讓自己正視這個結
，並努力解開。' },
  { name: '成為聯繫緣分的橋梁', points: 10, needs: 1, intro: '過去到現在參與過許多大大小小的團隊或團體，雖然在一起的時間短暫，但卻留下長遠的
     記憶，試著成為主辦人，辦一場同學會或好友聚會，讓彼此再次聯繫。' },
   { name: '用生命點燃希望', points: 10, needs: 1, intro: '參與一場公益服務，服務對象的類別及服務時間長短皆沒有限制，記得要記錄服務的過程喔！' },
   { name: '將影響從點變成面' , points: 10, needs: 1, intro: '每個人都擁有影響力，別小看自己，試著與人合作舉辦一場「公開」的活動，這個活
動形式不拘，可以是出遊、講座或有目的的聚會。'},
   { name: '寫下你的墓誌銘', points: 10, needs: 1, intro: '如果要為自己寫下墓誌銘，你會寫下什麼？思考一下你希望留下些什麼文字讓後人記住你？請問自己寫一篇墓誌銘' },
  { name: '尋找根本', points: 10, needs: 1, intro: '尋找一位你喜歡或崇拜的對象，並設計訪談內容，找出他/她令你佩服的真正原因。' },
  { name: '大學十全' , points: 10, needs: 1, intro: '請列出大學一定要完成的10件事，並標出每件事情完成的最後底線，寫完後找10
  位親朋好友為你簽名見證。'}])
