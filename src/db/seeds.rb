Podcast.destroy_all
User.destroy_all

admin = User.new(
    :username => 'admin',
    :email                 => 'admin@fintual.com',
    :password              => 'Hamhamham',
    :password_confirmation => 'Hamhamham',
    :admin => true
)

admin.save!

podcasts = [
  {
    :user_id => admin.id,
    :title => 'El Podcast de Buda.com',
    :description => 'Bitcoin, Blockchain, Criptomonedas e innovación en medios de pago online. El Podcast de Buda.com se desarrolla en torno a conversaciones sobre la revolución que traen las Criptomonedas al mundo.',
    :image_slug => 'buda.webp',
    :url => 'https://open.spotify.com/show/4Xzv0XtBVcK37CpBnO4U5r'
  },
  {
    :user_id => admin.id,
    :title => 'Fintalks by Fintual',
    :description => 'Una conversación semanal sobre finanzas y tecnología con las personas más influyentes de la escena Fintech latinoamericana. Desde Chile, en este podcast desarrollado por Fintual se discute abiertamente cómo la poderosa industria financera está siendo fuertemente revolucionada por la tecnología.',
    :image_slug => 'fintalks.png',
    :url => 'https://open.spotify.com/show/7m8fExrANZeo7qvN3rbbgN'
  },
  {
    :user_id => admin.id,
    :title => 'Podcast de Platanus',
    :description => 'Los ingenieros de software se unen en este podcast de nicho para conversar sobre mejores prácticas de código, estrategias para desarrollar productos, emprendimiento digital e innovación en tecnología e internet. Creado por Platanus, tiene invitados destacados cada semana.',
    :image_slug => 'platanus.webp',
    :url => 'https://open.spotify.com/show/5u5pC2FpCfFPTjkbEmRxkZ'
  }
]

podcasts.each do |podcast|
  Podcast.create(podcast)
end
