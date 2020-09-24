(1..5).each do |num|
    user = User.new(name: 'test' + num.to_s , email: 'test' + num.to_s + '@gmail.com', password: 'test' + num.to_s)
    user.save
end