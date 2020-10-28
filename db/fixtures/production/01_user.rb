1.upto(20) do |i|
  User.seed(:id) do |u|
    u.id = i
    u.email = "test_#{i}@exapmle.com"
    u.encrypted_password = "$2a$10$JMDTqq8mJPfvmdBZBcbV2u3og.5SQ4BygItc6nzbKDqP094HtiQZG"
    u.username = "test_#{i}"
  end
end