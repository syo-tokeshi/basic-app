50.times do |i|
  Post.create(title:"title#{i}",content:"content#{i}")
end
