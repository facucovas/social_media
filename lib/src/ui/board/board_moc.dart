
class Comment {

  final int type;
  final int weather;
  final String title;
  final String description;
  final String image;
  final String userName;
  final String userImage;
  final String comments;
  final String timePosted;


  const Comment({
    this.type,
    this.weather,
    this.title,
    this.description, 
    this.image,
    this.userName,
    this.userImage,
    this.comments,
    this.timePosted
  });

}


const comments = [
  Comment (
    type  : 1,
    weather: 1,
    title : 'Para atrás',
    description  : 'Esta es una publicación de prueba, para comprobar el tamaño del texto con muchos caracteres..',
    comments: '10',
    timePosted: 'hace 3 horas',
    image : "",
    userName: 'Facu Covas',
    userImage: "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ),
  Comment (
    type  : 1,
    weather: 1,
    title : 'Por qué pasa esto?',
    description  : 'Hola mundo mediooo como le va a usted señor?',
    comments: '10',
    timePosted: 'hace 1 hora',
    image : "",
    userName: 'Barbara Benitez',
    userImage: "https://images.pexels.com/photos/3727469/pexels-photo-3727469.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ),
  Comment (
    type  : 1,
    weather: 1,
    title : 'Noooo!!!',
    description  : 'Pero qué pasa acá señores?',
    comments: '10',
    timePosted: 'hace 2 horas',
    image : "",
    userName: 'Roberta Lires',
    userImage: "https://images.pexels.com/photos/904276/pexels-photo-904276.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ),
  Comment (
    type  : 2,
    weather: 1,
    title : 'Cosas que pasan...',
    description  : 'Soy solo una publicación mediocre.',
    comments: '10',
    timePosted: 'hace 1 hora',
    image: "",
    userName: 'Carlos Saavedra',
    userImage: "https://images.pexels.com/photos/4584608/pexels-photo-4584608.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ),
  Comment (
    type  : 2,
    weather: 1,
    title : 'El sol siempre sale',
    description  : 'Acá esta la prueba de que las cosas pasan por una razón.',
    comments: '10',
    timePosted: 'hace 5 horas',
    image: "",
    userName: 'Carolina Mickelson',
    userImage: 'https://images.pexels.com/photos/1858175/pexels-photo-1858175.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  ),
  Comment (
    type  : 2,
    weather: 1,
    title : 'Gran estafa',
    description  : 'Esto me pasó por confiar en ese vendedor garka.',
    comments: '10',
    timePosted: 'hace 6 horas',
    image: "",
    userName: 'Royer Rabit',
    userImage: 'https://images.pexels.com/photos/845434/pexels-photo-845434.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  ),

];