Podcast.destroy_all
User.destroy_all

admin = User.new(
    :username => 'admin',
    :email                 => "admin@fintual.com",
    :password              => "Hamhamham",
    :password_confirmation => "Hamhamham",
    :admin => true,
)

admin.save!
