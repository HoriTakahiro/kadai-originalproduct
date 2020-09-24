lang = ['Ruby', 'Phython', 'Java', 'Go', 'Javascript']

(1..5).each do |num|
    user = User.find(num)
    book = user.books.build(name: lang[num - 1] + '入門', author: num.to_s + '郎', description: 'プログラミング言語「' + lang[num - 1] + '」のわかりやすい入門書')
    book.save
end