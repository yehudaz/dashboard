
users = [{email: 'yehuda@conduit.com', pass: '1234'}, {email: 'moshe.tini@conduit.com', pass: '1234'}, {email: 'avi.kedar@conduit.com', pass: '1234'}]

users.each { | user | User.create(email: user[:email], password: user[:pass], password_confirmation: user[:pass], remember_me: false)}
