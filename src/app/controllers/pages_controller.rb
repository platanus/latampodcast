class PagesController < ActionController::Base
  def home
    puts 'indeeeeex'
    @podcasts = Podcast.all
    @sections = [
      {
        title: '¿Qué es un podcast?',
        subtitle: 'Es un programa de conversación preparado para que puedas escuchar en tu teléfono móvil. Son muy populares en Estados Unidos y en Latinoamérica están comenzando a volverse un éxito. La gente suele escucharlos durante el traslado desde su casa al trabajo o la Universidad.',
      },
      {
        title: '¿Cómo puedo tenerlo en mi teléfono?',
        subtitle: 'Hay varias formas pero la forma más sencilla es usando Spotify. Si tienes Spotify en tu teléfono, es tan sencillo como tocar una canción.',
      },
      {
        title: 'Los mejores podcast disponibles en español',
        subtitle: 'Aquí seleccionamos los mejores programas de audio grabados para que escuches en tu teléfono móvil.',
      },
    ]
    @subsections = [
      {
        title: 'Si conoces alguno que merece estar en esta lista, envíalo a podcasts@latampodcast.com',
        subtitle: 'Lo revisaremos y si pasa nuestro filtro de calidad, lo listaremos aquí junto a los demás.',
      },
    ]
    return @podcasts, @sections, @subsections
  end
end
